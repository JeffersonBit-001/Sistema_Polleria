cartItems.forEach(item => {
    const itemElement = document.createElement('div');
    itemElement.innerHTML = `
        <h3>${item.name}</h3>
        <p>Precio: S/${item.price.toFixed(2)}</p>
        <img src="${item.imageUrl}" alt="${item.name}" width="100" height="100"> <!-- Muestra la imagen -->
    `;
    cartContainer.appendChild(itemElement);
    total += parseFloat(item.price) * item.quantity; // Asegúrate de multiplicar por la cantidad
});



/*Actualizar el carrito*/
addToCartButtons.forEach(button => {
    button.addEventListener('click', () => {
        const productName = button.getAttribute('data-name');
        const productPrice = parseFloat(button.getAttribute('data-price'));
        const productImage = button.getAttribute('data-image'); // Captura la URL de la imagen

        const existingProductIndex = cartItems.findIndex(item => item.name === productName);
        if (existingProductIndex > -1) {
            // Si el producto ya está en el carrito, aumentar la cantidad
            cartItems[existingProductIndex].quantity++;
        } else {
            // Si no está, añadirlo al carrito
            cartItems.push({
                name: productName,
                price: productPrice,
                quantity: 1,
                imageUrl: productImage // Almacena la URL de la imagen
            });
        }

        updateCart();
    });
});

