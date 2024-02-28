fetch("https://api.escuelajs.co/api/v1/categories")
.then((response) => {
  if (!response.ok) {
    throw new Error("Failed to fetch categories.");
  }
  return response.json();
})
.then((categories) => {
  const categorySelect = document.getElementById('categorySelect');
  categories.forEach((category) => {
    const option = document.createElement('option');
    option.value = category.id;
    option.textContent = category.name;
    categorySelect.appendChild(option);
  });
})
.catch((error) => {
  console.error(error);
});


function addProduct(){
    const productTitle=document.getElementById('title').value;
    const productPrice=document.getElementById('price').value;
    const productDescription=document.getElementById('description').value;
    const productCategoryId= document.getElementById('categorySelect').value;
    const productImage=document.getElementById('images').value;
    if(productTitle || productPrice || productDescription || productCategoryId || productImage){
    var formData = {
        title: productTitle,
        price: parseFloat(productPrice),
        description: productDescription,
        categoryId: parseInt(productCategoryId),
        images: productImage.split(",")
        .map((url) => url.trim())
        
            // title: "latest product again-",
            // price: 1000,
            // description: "new description",
            // categoryId: 1,
            // images: ["https://placeimg.com/640/480/any"]
      };
    fetch("https://api.escuelajs.co/api/v1/products/",{
        method: "POST",
        headers: {
            "Content-Type": "application/json",
          },
        body: JSON.stringify(formData)
    } 
    )
    .then((response)=> response.json())
    .then(data => {
        console.log(data);
        alert('Product added succefully...!!');
    })
    .catch((error)=>console.log(error))
}
else{
    alert("Enter all details");
}
}

