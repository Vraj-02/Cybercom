function generateRandomDog() {
    fetch('https://dog.ceo/api/breeds/image/random')
      .then(response => response.json())
      .then(data => {
        const dogImage = document.getElementById('dogImage');
        dogImage.innerHTML = `<img src="${data.message}" alt="Random Dog" height="30%">`;
      })
      .catch(error => console.error('Error:', error));
  }
  
  function saveImage() {

    const dogImage = document.getElementById('dogImage');
    const imageUrl = dogImage.querySelector('img').src;
    const savedImages = JSON.parse(localStorage.getItem('savedDogImages')) || [];
    const imageId = Date.now().toString(36);
    savedImages.push({ id: imageId, url: imageUrl });
  
    localStorage.setItem('savedDogImages', JSON.stringify(savedImages));
   

    alert('Image saved!');
  }
  console.log("hi")