function add_to_cart(pid, pname, price)

{
    var cart = localStorage.getItem("cart");
    if (cart === null)
    {
        //no cart yet
        var products = [];
        var product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price};

        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
      //  console.log("Product is added first time successfully");
        showToast("Item is added to cart");
    } else
    {
        // cart is alredy present

        var pcart = JSON.parse(cart);
        var oldProduct = pcart.find((item) => item.productId === pid);
        if (oldProduct)
        {
            // we have to  increase the qantity 

            oldProduct.productQuantity = oldProduct.productQuantity + 1;
            pcart.map((item) => {
                if (item.productId === oldProduct.productId)
                {
                    item.productQuantity = oldProduct.productQuantity;
                }
            });

            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("Product quantity is increased");
             showToast(oldProduct.productName +" quantity is increased, Quanity= " +oldProduct.productQuantity);

        } else
        {
//we have to add the product
            var product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price};

            pcart.push(product);
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("Product is added ");
            showToast("Product is added to cart");
        }
    }
    updateCart();
}


//update cart
function updateCart()
{
    var cartString = localStorage.getItem("cart");
    var cart = JSON.parse(cartString);
    if (cart === null || cart.length === 0)
    {
        console.log(" cart is empty");
        $(".cart-items").html("(0)");
        $(".cart-body").html("<h3> Cart does not have any items</h3>");
        $(".checkout-btn").attr('disabled', true);
    } else
    {
        ///there is something 
        console.log(cart);
        $(".cart-items").html(`(  ${cart.length} )`);
        var table = `

        <table class='table'>
            <thead class = 'thead-light'>
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
                    <td> ${item.productName} </td>
                    <td> ${item.productPrice} </td>
                    <td> ${item.productQuantity} </td>
                    <td> ${item.productQuantity * item.productPrice} </td>
                    <td><button class='btn btn-danger btn-sm' onclick='deleteItemFromCart(${item.productId})'>Remove</button></td>
                </tr>
            `;
            totalPrice += item.productPrice * item.productQuantity;

        });

        table = table +
                `<tr><td colspan='5' class='text-right font-weight-bold m-5'>Total Price: ${totalPrice}</td></tr>
</table>`;


        $(".cart-body").html(table);
         $(".checkout-btn").attr('disabled', false);
         console.log("removed");
    }


}

// we  are going to delete items 
function deleteItemFromCart(pid)
{
    let cart = JSON.parse(localStorage.getItem('cart'));
    
    let newcart = cart.filter((item)=>item.productId !== pid);
    
    localStorage.setItem('cart', JSON.stringify(newcart));
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
      setTimeout(()=>{
          $("#toast".removeClass("display"));
      },2000);
  }
  
  function goTOCheckout(){
      
      window.location ="checkout.jsp";
  }
  
   function goTOContinueShopping(){
      
      window.location ="index.jsp";
  }