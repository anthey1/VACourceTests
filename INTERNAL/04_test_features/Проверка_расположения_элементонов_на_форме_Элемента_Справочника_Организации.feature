#language: ru

@tree

Функционал: Проверка расположения элементонов на форме Элемента Справочника Организации

Как Тестировчик я хочу
Проверить стиль расположения полей на форме элемента справочника Организации
чтобы убедиться, что форма выглядит корректно

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Проверка расположения элементонов на форме Элемента Справочника Организации
* Заполнение полей элемента справочника Организации
	И В командном интерфейсе я выбираю 'Справочники' 'Организации'
	Тогда открылось окно 'Организации'
	И я нажимаю на кнопку с именем 'FormCreate'
	@screenshot
	Тогда открылось окно 'Организация (создание)'
	@screenshot	
	И Я закрываю окно 'Организация (создание)'		
	@screenshot
	Тогда открылось окно 'Организации'
	И я закрываю все окна клиентского приложения	