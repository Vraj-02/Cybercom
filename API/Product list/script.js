
let data = [];

function fetchProduct() {
    return new Promise((resolve, reject) => {
    fetch("https://api.escuelajs.co/api/v1/products")
   .then((res) => res.json())
   .then((products) => {
     console.log(products);
     resolve(products);
   })
   .catch((err) => {
     console.log(err);
   });
});
}
fetchProduct()
 .then((products) => {
   console.log(products);
   data=products;
   displayProducts(products);
 })
 .catch((err) => {
   console.error(err);
 });
// function fetchProduct() {
//   fetch("https://api.escuelajs.co/api/v1/products")
//     .then(response => {
//       if (!response.ok) {
//         throw new Error('Network response was not ok');
//       }
//       return response.json();
//     })
//     .then(products => {
//       data = products; // Store fetched data
//       displayProducts(products); // Render products initially
//     })
//     .catch(error => {
//       console.log('Error fetching data:', error);
//     });
// }

function displayProducts(product){
 const container = document.getElementById("product-container");
 container.innerHTML = "";
 product.forEach((product) => {
 const createDiv = document.createElement("div");
 createDiv.classList.add("card");
 createDiv.innerHTML = `
   <div>${product.title}</div>
   <div class="image-container">
      <img src="${product.images[0]}" alt="image" width="50" />
   </div>
   <div>Rs.${product.price}</div>
   <details><summary>Description</summary>
   ${product.description}<br>

   </details>
   <button onClick="deleteProduct(${product.id})">Delete</button>
   `;
 container.appendChild(createDiv);
});
}


const sortSelect = document.getElementById('sort-select');
sortSelect.addEventListener('change', () => {
  const sortBy = sortSelect.value;
  if (sortBy === 'price-low-to-high') {
      data.sort((a, b) => a.price - b.price);
  } else if (sortBy === 'price-high-to-low') {
      data.sort((a, b) => b.price - a.price);
  }
  displayProducts(data);
});

function deleteProduct(productId){
  const userResponse=confirm('Do you want to delete');
  if(userResponse){
   fetch(`https://api.escuelajs.co/api/v1/products/${productId}`,{
    method:"DELETE"
   }).then(response=>response.json())
  .then((datas)=>console.log(datas))
  .catch(error => {
    console.log('Error deleting product:', error);
  });
  }
  console.log('delete');
  
}
const searchInput = document.querySelector('#search-input');
searchInput.addEventListener('input', () => {
  const searchQuery = searchInput.value.trim().toLowerCase();
  const filteredData = data.filter(product => {
    const titleMatch = product.title.toLowerCase().includes(searchQuery);
    const descriptionMatch = product.description.toLowerCase().includes(searchQuery);
    return titleMatch || descriptionMatch;
  });
  displayProducts(filteredData);
});

