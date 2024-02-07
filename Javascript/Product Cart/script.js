
function increaseQuantity(inputId) {
  const inputElement = document.getElementById(inputId);
  inputElement.value = parseInt(inputElement.value, 10) + 1;
}

function decreaseQuantity(inputId) {
  const inputElement = document.getElementById(inputId);
  const currentValue = parseInt(inputElement.value, 10);
  if (currentValue > 0) {
    inputElement.value = currentValue - 1;
  }
}
  function addToCart() {
    const quantityInputs = document.querySelectorAll('.quantity-input');
    const cartData = {};

    quantityInputs.forEach((input, index) => {
      const productId = "product" + `${index + 1}`;
      const quantity = parseInt(input.value, 10);
      let productDetails=document.getElementById("quantityProduct"+ `${index + 1}`)
      let price=productDetails.getAttribute('price')
      const pricePerUnit = parseInt(price,10);
      const productName=productDetails.getAttribute('name'); 

      const totalAmount = quantity * pricePerUnit;

      cartData[productId] = {
        quantity,
        totalAmount,productName
      };
    });

    localStorage.setItem('cartData', JSON.stringify(cartData));
    updateCartDetails();
  }

