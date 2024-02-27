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
   displayProducts(products);
 })
 .catch((err) => {
   console.error(err);
 });

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
function deleteProduct(productId){
  const userResponse=confirm('Do you want to delete');
  if(userResponse){
   fetch(`https://api.escuelajs.co/api/v1/products/${productId}`,{
    method:"DELETE"
   }).then(response=>response.json())
  .then((data)=>console.log(data))
  .catch(error => {
    console.log('Error deleting product:', error);
  });
  }
  displayProducts();
}