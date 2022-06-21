﻿#language: ru
@tree

Функционал: Тестирование Шапки Документа Заказ Клиента

Как тестировщик я хочу
проверить корректное заполнение реквизитоа шапки на форме документа Заказ Клиента
чтобы Менеджер по продажам был уверен в заполнении данных реквизитов

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: _0410_01 Подготовка данных
* Загрузка справочников и регисторов
	Когда Экспорт основных данных для документов продажи	
* Загрузкадокументов
	Когда Экспорт документов продажи
Сценарий: _0410_001 Тестирование Шапки документа
* Закрываю все пользовательские окна
	И Я закрываю все окна клиентского приложения
* Открываю форму списка и провожу экспортированный документ
	Дано Я открываю навигационную ссылку "e1cib/list/Document.SalesOrder"	
	Тогда в таблице "List" я перехожу к строке
		| 'Номер' | 'Партнер'                 |
		| '1'     | 'Клиент 1 (1 соглашение)' |
	И в таблице "List" я нажимаю на кнопку с именем 'ListContextMenuPost'
	Тогда не появилось окно предупреждения системы
* Открываю документ по ссылке
	Дано Я открываю навигационную ссылку "e1cib/data/Document.SalesOrder?ref=bf3f5cf3706d771011ecf0a37f87701c"	
* Разворачиваю Шапку документа
	И я нажимаю на гиперссылку с именем "DecorationGroupTitleCollapsedPicture"
* Удаляю значение в поле партнер и проверяю доступность реквизита Контрагент
	И элемент формы "Контрагент" доступен
	И в поле с именем 'Partner' я ввожу текст ''
	И Проверяю шаги на Исключение:
		|'И элемент формы "Контрагент" доступен'|
	И я нажимаю кнопку выбора у поля с именем "Partner"
	Тогда в таблице "List" я перехожу к строке
		| 'Наименование'                 |
		| 'Клиент 1 (1 соглашение)' |
		И я нажимаю на кнопку с именем 'FormChoose'		
	Попытка	
		Тогда открылось окно 'Табличная часть товаров будет обновлена'
		И я нажимаю на кнопку с именем 'FormOK'
	Исключение	
* Проверяю значение реквизита Соглашение при изменении  партнера
	И элемент формы "Соглашение" доступен
	И элемент формы "Соглашение" стал равен "Соглашение с клиентами (расчет по документам + кредитный лимит)"	
	И я нажимаю кнопку выбора у поля с именем "Partner"
	Тогда в таблице "List" я перехожу к строке
		| 'Наименование'                 |
		| 'Клиент 2 (2 соглашения)' |
	И я нажимаю на кнопку с именем 'FormChoose'
	Попытка
		Тогда открылось окно 'Табличная часть товаров будет обновлена'
		И я нажимаю на кнопку с именем 'FormOK'
	Исключение
	И элемент формы "Соглашение" доступен
	И элемент формы "Соглашение" стал равен ""	
* Закрытие всех окон приложения
	И я закрываю все окна клиентского приложения
