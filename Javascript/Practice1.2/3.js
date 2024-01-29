let obj=[
    {
        product: a,
        price: 10
    },
    {
        product: b,
        price: 20
    },
    {
        product: c,
        price: 30
    }
]
for(i=0;i<obj.length;i++){
    console.log(i+1);
    console.log('product: ',obj.product[i]);
    console.log('price: ',obj.price[i]);
}