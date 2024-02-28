function addProduct(){
    var formData = {
        // title: $("#title").val(),
        // price: parseFloat($("#price").val()),
        // description: $("#description").val(),
        // categoryId: parseInt($("#categoryId").val()),
        // images: $("#images").val()
        
            title: "latest product again-",
            price: 1000,
            description: "new description",
            categoryId: 1,
            images: ["https://placeimg.com/640/480/any"]
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
    .then((data)=>console.log(data))
    .catch((error)=>console.log(error))
}