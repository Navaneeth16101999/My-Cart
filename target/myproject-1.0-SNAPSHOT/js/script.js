

function add_to_cart(pid, pname, price)
{
    let cart = localStorage.getItem("cart");
    if (cart == null) {
        let products = [];
        let product = {productId: pid, productName: pname, productQuantity: 1, productprice: price};
        //This line adds the newly created product object
        products.push(product);
        //Before storing, the products array is converted to a JSON string
        localStorage.setItem("cart", JSON.stringify(products));

      //  console.log("product is added for the first time")
        showToast("Item is added to the cart")
    } else {
        //JSON-formatted string stored in the variable cart into a array of JS objects.
        let pcart = JSON.parse(cart);
        let oldProduct = pcart.find((item) => item.productId == pid)
        if (oldProduct) {
            //we have to increase the quantity
            oldProduct.productQuantity = oldProduct.productQuantity + 1

//The map method in JavaScript is used to iterate over an array and apply a function
//to each element in the array.

            pcart.map((item) => {
                if (item.productId == oldProduct.productId)
                {
                    item.productQuantity = oldProduct.productQuantity;
                }
            })
            localStorage.setItem("cart", JSON.stringify(pcart))
            //console.log("product quantity increased")
        showToast(oldProduct.productName+"product quantity increased");

        } else {
            //we have to add the product
            let product = {productId: pid, productName: pname, productQuantity: 1, productprice: price};
            pcart.push(product)
            localStorage.setItem("cart", JSON.stringify(pcart))
            //console.log("product is added to cart");
            showToast("Product is added to the cart")


        }
    }
    updateCart();
}

//update cart
function updateCart() {
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    if (cart == null || cart.length == 0) {
        console.log("cart is empty!!");
        $(".cart-items").html("(0)");
        $(".cart-body").html("<h3>Cart does not have any items</h3>");
        $(".checkout-btn").attr('disabled',true);

    } else {
        //there is something in cart to show
        console.log(cart);
        
//        '' is used for embedding the epressions
        $(".cart-items").html(`(${cart.length})`);
        let table = `
        <table class='table'>
             <thead class='thead-light'>
             <tr>
             <th>Item Name</th>
              <th>Price</th>
               <th>Quantity</th>
                <th>Total Price</th>
               <th>Action</th>
   
        </tr>    
        </thead>
        `;
        
        let totalPrice = 0;
        cart.map((item) => {
            table += `
<tr>
            
            <td>${item.productName}</td>
            <td>${item.productprice}</td>
            <td>${item.productQuantity}</td>
            <td>${item.productQuantity * item.productprice}</td>
<td><button onclick='deleteItemFromCart(${item.productId})' class='btn btn-danger btn-sm'>Remove</button></td>
             </tr>
`;

            totalPrice += item.productprice * item.productQuantity;
        });

        table = table + `
                
                <tr><td colspan='5' class='text-right'>Total Price : ${totalPrice}</td></tr>
                </table>`;
        $(".cart-body").html(table);

        $(".checkout-btn").attr('disabled',false);
         console.log("removed");

    }


}
//deleteItem
function deleteItemFromCart(pid){
   let cart= JSON.parse(localStorage.getItem('cart'));
let newCart=cart.filter((item)=>item.productId!=pid);
localStorage.setItem('cart',JSON.stringify(newCart));
updateCart();
        showToast("Item is removed from cart");


}





$(document).ready(function () {
    updateCart();
});


function showToast(content)
{
    $("#toast").addClass("display");
     $("#toast").html(content);
    setTimeout(() => {
    $("#toast").removeClass("display") ;   
    }, 2000);
}
function goToCheckout(){
    
    window.location.href = "checkout.jsp";
}
