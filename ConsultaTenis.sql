use tenis;
#Dejando de lado el problema del cólegio se tiene una tabla con información de 
#jugadores de tenis: PLAYERS(Nombre, Pais, Ranking). Suponga que Ranking es un 
#número de 1 a 100 que es distinto para cada jugador. Si la tabla en un momento 
#dado tiene solo 20 registros, indique cuantos registros tiene la tabla que 
#resulta de la siguiente consulta:

insert into players values
(1, 'a', 'aa', 1),
(2, 'b', 'bb', 2),
(3, 'c', 'cc', 3),
(4, 'd', 'dd', 4),
(5, 'e', 'ee', 5),
(6, 'f', 'ff', 6),
(7, 'g', 'gg', 7),
(8, 'h', 'hh', 8),
(9, 'i', 'ii', 9),
(10, 'j', 'jj', 10),
(11, 'k', 'kk', 11),
(12, 'l', 'll', 12),
(13, 'm', 'mm', 13),
(14, 'n', 'nn', 14),
(15, 'o', 'oo', 15),
(16, 'p', 'pp', 16),
(17, 'q', 'qq', 17),
(18, 'r', 'rr', 18),
(19, 's', 'ss', 19),
(20, 't', 'tt', 20);
SELECT c1.Nombre, c2.Nombre
FROM players c1, players c2
WHERE c1.ranking > c2.ranking;

SELECT count(c1.Nombre)
FROM players c1, players c2
WHERE c1.ranking > c2.ranking;

#Respuesta : 190 resultados