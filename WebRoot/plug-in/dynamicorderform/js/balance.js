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
       
    $("#thisMonthInQuantity").val(prodSubTotal);

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

    
        $(".balanceQuantity").not("#lastMonthBalanceQuantity").each(function(){
        	var b = $(this).parent().prev().find(".balanceQuantity").text()*1;
        	var i = $(this).parent().find(".inQuantity").text()*1;
        	var o = $(this).parent().find(".outQuantity").text()*1;
        	$(this).text(b+i-o);
        
        });  
    
    	$(".balanceWeight").not("#lastMonthBalanceWeight").each(function(){
        	var b = $(this).parent().prev().find(".balanceWeight").text()*1;
        	var i = $(this).parent().find(".inWeight").text()*1;
        	var o = $(this).parent().find(".outWeight").text()*1;
        	$(this).text(b+i-o);
        
        });  
    
    
    	var thisMonthInQuantity = 0;
	    $(".inQuantity").each(function(){	    
	        var valString = $(this).text() || 0;	        
	        thisMonthInQuantity += parseInt(valString);
	                    
	    });
	       
	    $("#thisMonthInQuantity").text(thisMonthInQuantity);
    
    
       var thisMonthInWeight = 0;
	    $(".inWeight").each(function(){	    
	        var valString = $(this).text() || 0;	        
	        thisMonthInWeight += parseInt(valString);
	                    
	    });
	       
	    $("#thisMonthInWeight").text(thisMonthInWeight);
	    
	    var thisMonthOutQuantity = 0;
	    $(".outQuantity").each(function(){	    
	        var valString = $(this).text() || 0;	        
	        thisMonthOutQuantity += parseInt(valString);
	                    
	    });
	       
	    $("#thisMonthOutQuantity").text(thisMonthOutQuantity);
	    
	    
	    var thisMonthOutWeight = 0;
	    $(".outWeight").each(function(){	    
	        var valString = $(this).text() || 0;	        
	        thisMonthOutWeight += parseInt(valString);
	                    
	    });
	       
	    $("#thisMonthOutWeight").text(thisMonthOutWeight);
});