//Tad Tarnawski
//javascript homework

var homework = {};
//problem 1
homework.fibonacci = function(n){
	if(n < 1){
		return 0;
	}
	if(n == 1){
		return 1;
	}
	return homework.fibonacci(n-1)+homework.fibonacci(n-2);
};
//problem 2
homework.sort = function(array) {
	var swap;
	do{
		swap = false;
		for (var i = 0; i < array.length-1; i++) {
			if(array[i]>array[i+1]){
				var temp = array[i];
				array[i] = array[i+1];
				array[i+1] = temp;
				swap = true;
			}
		}
    }while(swap);
	return array;
};
//problem 3
homework.factorial = function(n){
	if(n<2){
		return 1;
	}
	return n*homework.factorial(n-1);
};
//problem 4
homework.rotateLeft = function(array, n) {
	var temp;
	for(var i = 0; i < n; i++){
		temp = array.shift(i);
		array.push(temp);
	}
	return array;
};
//problem 5
homework.balancedBrackets = function(bracketsString){
  var stack = [];
  var open = { '{': '}', '[': ']', '(': ')' };
  
  for (var i = 0; i < bracketsString.length; i++) {
	  if(bracketsString[i] == '(' || bracketsString[i] == '{' || bracketsString[i] == '['){
		stack.push(bracketsString[i]);
	  } else if(bracketsString[i] == ')' || bracketsString[i] == '}' || bracketsString[i] == ']'){
		  var temp = stack.pop();
		  temp = open[temp];
		  if(temp !== bracketsString[i]){
			  return false;
		  }
	  }
  }
  if(stack.length === 0){
	  return true;
  }else{
	  return false;
  }

};

