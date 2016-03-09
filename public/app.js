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