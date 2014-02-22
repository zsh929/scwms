//横向打印设置 
	function pageprint() { 
	
	   //document.all("print").style.display="none"; 
	   factory.printing.header = ""; 
	   factory.printing.footer = ""; 
	   factory.printing.portrait = true; //portrait是指打印方向，设置为true就是纵向，false就是横向。 
	   factory.printing.leftMargin =8.00;
		
		factory.printing.topMargin =5.00;
	
		factory.printing.rightMargin =0.00;
	
		factory.printing.bottomMargin =0.00;
  		factory.DoPrint(false); //设置为false，直接打印 
	 
   		
	} 
		//打印预览 
		function pagePrintView(){ 
		  // document.all("print").style.display="none"; 
		   
		  	
		   factory.printing.header = ""; 
		   factory.printing.footer = ""; 
		   factory.printing.portrait = true; //portrait是指打印方向，设置为true就是纵向，false就是横向。 
		   factory.printing.leftMargin =8.00;
		
			factory.printing.topMargin =5.00;
			
			factory.printing.rightMargin =0.00;
			
			factory.printing.bottomMargin =0.00;
		   factory.printing.Preview();//打印预览 
		   
		} 
		
		function pagePrintSet(){ 
			factory.printing.leftMargin =0.00;
			
			factory.printing.topMargin =0.00;
			
			factory.printing.rightMargin =0.00;
			
			factory.printing.bottomMargin =0.00;
			 // factory.printing.paperSize ="B5";  
		
		   factory.printing.PageSetup();//打印设置 
		} 

	
		