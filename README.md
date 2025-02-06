Задача 2.

Заданы два контейнера:

    std::list<int> const m1 = {7,8,9,4,5,6,1,2,3,4};
    
    std::list<int> const m2 = {-3,-2,-1,0,0,1,2,3,4,5};


Необходимо написать функцию которая принимает контейнер std::list по двум итераторам,
и возвращает вычисленную для него максимальную длину (число элементов) строго возрастающей последовательности.
Результат должен быть для каждого контейнера отдельно.



Задача 3.1.

Есть таблица «nalog_plat», которая содержит 4 поля:
  name – наименование учреждения, character varying;
  head60900 – вид деятельности, character varying;
  head70000 – сумма долга, character varying;
  inn – инн учреждения, character varying;
  
Вычислить сумму долга по учреждениям (расписать запрос и приложить результат)



Задача 3.2.

Есть таблица «nalog_plat_reestr», которая содержит 3 поля:
  inn - инн учреждения, character varying;
  budget - бюджет, character varying;
  status – статус учреждения, character varying;

Выполнить соединение таблиц (расписать запрос и приложить результат)
