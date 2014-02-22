function IsNumeric(sText)

{
   var ValidChars = "0123456789.";
   var IsNumber=true;
   var Char;

 
   for (i = 0; i < sText.length && IsNumber == true; i++) 
      { 
      Char = sText.charAt(i); 
      if (ValidChars.indexOf(Char) == -1) 
         {
         IsNumber = false;
         }
      }
   return IsNumber;
   
};

function calcProdSubTotal() {
    
    var prodSubTotal = 0;

    $(".totalWeight").each(function(){
    
        var valString = $(this).val() || 0;
        
        prodSubTotal += parseInt(valString);
                    
    });
       
    $("#wholeWeight").val(prodSubTotal);

};

function calcTotalPallets() {

    var totalPallets = 0;

    $(".num-pallets-input").each(function() {
    
        var thisValue = $(this).val();
    
        if ( (IsNumeric(thisValue)) &&  (thisValue != '') ) {
        
            totalPallets += parseInt(thisValue);
        
        };
    
    });
    
    $("#total-pallets-input").val(totalPallets);

};

function calcShippingTotal() {

    var totalPallets = $("#total-pallets-input").val() || 0;
    var shippingRate = $("#shipping-rate").text() || 0;
    var shippingTotal = totalPallets * shippingRate;
    
    $("#shipping-subtotal").val(shippingTotal);

};

function calcOrderTotal() {

    var orderTotal = 0;

    var productSubtotal = $("#product-subtotal").val() || 0;
    var shippingSubtotal = $("#shipping-subtotal").val() || 0;
        
    var orderTotal = parseInt(productSubtotal) + parseInt(shippingSubtotal);
    var orderTotalNice = "$" + orderTotal;
    
    $("#order-total").val(orderTotalNice);
        
};

$(function(){

    $('.quantity,.totalWeight').blur(function(){
    
        var $this = $(this);
    	if($this.attr('class') == 'quantity'){
	        var quantity = $this.val();
	        var weight = $this
	                            .parent().parent()
	                            .find(".weight")
	                            .val();
	        
	        if ( (IsNumeric(quantity)) && (quantity != '') ) {
	            
	            var totalWeight = quantity * weight;
	            
	            $this
	                .css("background-color", "white")
	                .parent().parent()
	                .find(".totalWeight")
	                .val(totalWeight);                    
	            
	        } else {
	        
	            $this.css("background-color", "#ffdcdc"); 
	            $this.parent().parent().find(".totalWeight").val('0'); 
	        };
        }
        calcProdSubTotal();
        
        calcTotalPallets();
        calcShippingTotal();
        calcOrderTotal();
    
    });

});