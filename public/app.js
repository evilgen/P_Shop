function something()
	{
		// получаем значение из LocalStorage
		var x = window.localStorage.getItem('aaa');
		//увеличиваем значение на 1
		x = x*1 + 1;
		//устанавливаем значение ключа равному переменной	
		window.localStorage.setItem('aaa',x);

		alert(x);
		
	}

function add_to_cart(id)
{
	var key = 'product_' + id;
	var x = window.localStorage.getItem(key);
	x = x * 1 + 1;
	window.localStorage.setItem(key, x);
	//вывод количества айтемов
	show_items();
}

function show_items()
{
	var total = 0;
	for (var i = 0; i < localStorage.length; i++){
    	var key = window.localStorage.key(i) // получаем ключ
       	if (key.indexOf('product_')==0) //проверяем ключ на совпадение с нужным product_, если входжение с начала (0 позиция), то ключ наш.
       	{
       		total = total + window.localStorage.getItem(key)*1; //получаем значение их хеша по ключу и наращиваем total
       	}
	}
	document.getElementById("cart").innerHTML = "Your cart contains " + total + " items";
}

function cart_get_orders()
{
	var orders = '';
	for (var i = 0; i < localStorage.length; i++){
    	var key = window.localStorage.key(i) // получаем ключ
    	var value = window.localStorage.getItem(key); //получаем значение
       	if (key.indexOf('product_') == 0) //проверяем ключ на совпадение с нужным product_, если входжение с начала (0 позиция), то ключ наш.
       	{
       		orders = orders + key + '=' + value + ','
       	}
	}
	return orders
}