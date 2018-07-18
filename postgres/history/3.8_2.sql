SELECT *
FROM paper
ORDER BY conference;

UPDATE paper SET location = 'Montreal' WHERE id = 34003;

SELECT *
FROM paper
WHERE id = 50001;


INSERT INTO paper VALUES (50001,'Spring the RIPPER!', 'JUG.ru JPOINT', 'Moscow');


SELECT conference FROM paper GROUP BY conference HAVING count(DISTINCT location) > 1 ORDER BY conference;

SELECT conference FROM paper p LEFT JOIN conference c ON p.conference = c.value WHERE c.value is NULL;


(SELECT conference FROM paper GROUP BY conference HAVING count(DISTINCT location) > 1 ORDER BY conference)
UNION
(SELECT conference FROM paper p LEFT JOIN conference c ON p.conference = c.value WHERE c.value is NULL);
