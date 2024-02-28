  let data = [];
  let currentPage = 1;
  const itemsPerPage = 12;
  filteredProducts=[];

fetch("https://api.escuelajs.co/api/v1/categories")
.then((response) => {
  if (!response.ok) {
    throw new Error("Failed to fetch categories.");
  }
  return response.json();
})
.then((categories) => {
  const categorySelect = document.getElementById('category-filter');
  categories.forEach((category) => {
    const option = document.createElement('option');
    option.value = category.name;
    option.textContent = category.name;
    categorySelect.appendChild(option);
  });
})
.catch((error) => {
  console.error(error);
});

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
                data = products;
                filteredProducts= products;
                displayProducts(products);
                renderPagination();
            })
      .catch((err) => {
                console.error(err);
            });

  function displayProducts(products) {
            
            const container = document.getElementById("product-container");
            container.innerHTML = "";

            // Apply sorting
            const sortBy = document.getElementById('sort-select').value;
            if (sortBy === 'price-low-to-high') {
                products.sort((a, b) => a.price - b.price);
            } else if (sortBy === 'price-high-to-low') {
                products.sort((a, b) => b.price - a.price);
            }

            // Apply search filter
            const searchQuery = document.getElementById('search-input').value.trim().toLowerCase();
            const filteredData = products.filter(product => {
                const titleMatch = product.title.toLowerCase().includes(searchQuery);
                const descriptionMatch = product.description.toLowerCase().includes(searchQuery);
                return titleMatch || descriptionMatch;
            });

            const startIndex = (currentPage - 1) * itemsPerPage;
            const endIndex = startIndex + itemsPerPage;
            const displayedProducts = filteredData.slice(startIndex, endIndex);

            displayedProducts.forEach((product) => {
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
                    <button class="btn btn-warning" onclick="editProduct(${product.id})">Edit</button>
                    <button class="btn btn-danger" onclick="deleteProduct(${product.id})">Delete</button>
                `;
                container.appendChild(createDiv);
            });
        }
  
  function editProduct(id){
          console.log(id);
          window.location.href = 'Update/update.html?id=' + id;;
      }

  function deleteProduct(productId) {
            const userResponse = confirm('Do you want to delete');
            if (userResponse) {
                fetch(`https://api.escuelajs.co/api/v1/products/${productId}`, {
                    method: "DELETE"
                })
                .then(response => response.json())
                .then(() => {
                    fetchProduct()
                        .then((products) => {
                            data = products;
                            displayProducts(data);
                            renderPagination();
                        })
                        .catch((err) => {
                            console.error(err);
                        });
                })
                .catch(error => {
                    console.log('Error deleting product:', error);
                });
            }
           
        }

  const sortSelect = document.getElementById('sort-select');
        sortSelect.addEventListener('change', () => {
            currentPage = 1;
            // displayProducts(data);
            displayProducts(filteredProducts);
            renderPagination();
        });

  const searchInput = document.querySelector('#search-input');
        searchInput.addEventListener('input', () => {          
            currentPage = 1;
            // displayProducts(data);
            displayProducts(filteredProducts);
            renderPagination();
        });


  document.getElementById('category-filter').addEventListener('change', function () {

          console.log('filter');
          let categorySelected = document.getElementById('category-filter').value;
      
      
          if (categorySelected !== 'all') {
              // console.log(products)
              console.log(categorySelected)
              
              filteredProducts = data.filter((product) => {
                  return product.category && product.category.name === categorySelected;
              });
              console.log(filteredProducts)
          } else if(categorySelected === 'all') {
            console.log("going")
              filteredProducts = data;
              // displayProducts(filteredProducts);
              // renderPagination();
          }
          currentPage = 1;
          console.log(filteredProducts)
          
          displayProducts(filteredProducts);
          renderPagination();
      });

  function renderPagination() {
            const paginationContainer = document.getElementById('pagination');
            const totalPages = Math.ceil(filteredProducts.length / itemsPerPage);

            const paginationHTML = Array.from({ length: totalPages }, (_, index) => {
                const page = index + 1;
                const activeClass = currentPage === page ? 'active' : '';
                return `<button onclick="changePage(${page})" class="btn btn-primary ${activeClass}" >${page}</button> &nbsp`;
            }).join('');

            paginationContainer.innerHTML = paginationHTML;
        }

  function changePage(page) {
            currentPage = page;
            displayProducts(filteredProducts);
            renderPagination();
        }
