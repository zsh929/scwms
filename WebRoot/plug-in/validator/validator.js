function validateNotEmpty(validateObjNameArray){
	
	var emptyArray = getEmptyObjNameArray(validateObjNameArray);	
	
	if(emptyArray.length < 1){
		return true;
	}
	
	$(emptyArray).each(function(index) { 
		showErrorMessage(emptyArray[index]);
	});
	return false;
	
}

function validateIsNotAllEmpty(validateObjNameArray){
	var emptyArray = getEmptyObjNameArray(validateObjNameArray);	
	if(validateObjNameArray.length == emptyArray.length){
		
		showErrorMessage(validateObjNameArray[0]);
		return false;
	}
	
	return true;
	
}




function showErrorMessage(validateObjName){
	$("#" + validateObjName + "ErrorMessage").css("display","inline");
}


function getEmptyObjNameArray(validateObjNameArray){
	var resultArray = [];
	
	resultArray = $.grep(validateObjNameArray,function(n,i){
		var validateObj = $("#"+n);
		
		return isNull(validateObj);
	}, false); 
	
	return resultArray;
	
}

function cancelErrorMessage(objNameArray,cancelErrorMessageName){
	
	$(objNameArray).each(function(index) { 
		var errorMessageName = "";
		var bindObjName = objNameArray[index];
		if(cancelErrorMessageName != ""){
			errorMessageName = cancelErrorMessageName;
		}else{
			errorMessageName= bindObjName;
		}
		
		var bindObj = $("#"+bindObjName);
		
		bindObj.bind("propertychange",function(){
			
			var bindObjTagName = bindObj.attr("tagName");
			
			if(bindObjTagName == "INPUT"){
				if(bindObj.val() != ""){
					$("#" + errorMessageName + "ErrorMessage").css("display","none");
				}
				 
			}else if(bindObjTagName == "SELECT"){
				if($(this).val() != "0"){
					$("#" + errorMessageName + "ErrorMessage").css("display","none");
				}
				
			}
		});
	});
	
	
}


function cancelTbodyErrorMessage(objName){
	
	
	$("#" + objName + "ErrorMessage").css("display","none");
	
}

function OnlyAnEmpty(obj){
	$(obj).each(function(index) { 
		var validateObjName = obj[index];
		var validateObj = $("#"+validateObjName);
		
		var validateObjTagName = validateObj.attr("tagName");
	
		if(validateObjTagName == "INPUT"){
			if(validateObj.val() == ""){
				$("#" + validateObjName + "ErrorMessage").css("display","inline");
				validateResult = false;
			}
			 
		}else if(validateObjTagName == "SELECT"){
			if(validateObj.val() == "0"){
				$("#" + validateObjName + "ErrorMessage").css("display","inline");
				validateResult = false;
			}
			
		}else if(validateObjTagName == "TBODY"){
			
			if(validateObj.html() == ""){
				$("#" + validateObjName + "ErrorMessage").css("display","inline");
				validateResult = false;
			}
			
		}
		
	});
	
	
	
	
}

function isNull(validateObj){
	
	var validateResult = false;
	
	var validateObjTagName = validateObj.attr("tagName");
	
	if(validateObjTagName == "INPUT"){
		if(validateObj.val() == ""){
			//$("#" + validateObjName + "ErrorMessage").css("display","inline");
			validateResult = true;
		}
		 
	}else if(validateObjTagName == "SELECT"){
		if(validateObj.val() == "0"){
			//$("#" + validateObjName + "ErrorMessage").css("display","inline");
			validateResult = true;
		}
		
	}else if(validateObjTagName == "TBODY"){
		
		if(validateObj.html() == ""){
			//$("#" + validateObjName + "ErrorMessage").css("display","inline");
			validateResult = true;
		}
		
	}
	
	return validateResult;
}








