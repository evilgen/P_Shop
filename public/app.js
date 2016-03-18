function add_to_cart(id)
{
	var key = 'product_' + id;
	var x = window.localStorage.getItem(key);
	x = x * 1 + 1;
	window.localStorage.setItem(key, x);
	//вывод количества айтемов
	update_orders();
	update_orders_button();
}

// функция подсчета общего количества единиц заказанных товаров
function show_items()
{
	var total = 0;
	for (var i = 0; i < localStorage.length; i++){
    	var key = window.localStorage.key(i) // получаем ключ
       	if (key.indexOf('product_')==0) //проверяем ключ на совпадение с нужным product_, если входжение с начала (0 позиция), то ключ наш.
       	{
       		total = total + window.localStorage.getItem(key)*1; //получаем значение из хеша по ключу и наращиваем total
       	}
	}
	//document.getElementById("cart").innerHTML = "Your cart contains " + total + " items";
	return total
}

// отображение количества товаров в корзине на кнопке
function update_orders_button()
{
	var text = 'Cart (' + show_items() + ')';
	$('#orders_button').val(text);
}

// запись строки заказа в определенный элемент
function update_orders()
{
	var orders = cart_get_orders();
	$('#orders_input').val(orders);
}

// Формирование строки заказа
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

// очистка корзины заказа с обновлением строки заказа и значения на кнопке
function cancel_order()
{
	window.localStorage.clear();
	
	update_orders();
	update_orders_button();
// отображение уведомления об очистки корзины (localStorage)
	$('#cart').text('Your catr is now epmty.');

	return false;
}