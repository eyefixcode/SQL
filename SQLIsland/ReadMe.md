
# SQL Island
Fun game to cover common SQL techniques

## Source Code Solutions for the Game: 

<a>https://sql-island.informatik.uni-kl.de/</a>

```SQL
SELECT * FROM inhabitant;

SELECT * FROM inhabitant WHERE job = 'butcher';

SELECT * FROM inhabitant WHERE state = 'friendly';

SELECT * FROM inhabitant WHERE state = 'friendly' AND job = 'weaponsmith';

SELECT * FROM inhabitant WHERE state = 'friendly' AND job LIKE '%smith';

INSERT INTO inhabitant (name, villageid, gender, job, gold, state) VALUES ('Stranger', 1, '?', '?', 0, '?');

SELECT personid FROM inhabitant WHERE personid = 20;

SELECT gold FROM inhabitant WHERE personid = 20;

SELECT * FROM item WHERE owner IS NULL;

UPDATE item SET owner = 20 WHERE item = 'coffee cup';

SELECT * FROM item WHERE owner = 20;

UPDATE item SET owner = 15 WHERE item = 'ring' OR item = 'teapot';

UPDATE inhabitant SET gold = gold + 120 WHERE personid = 20;

UPDATE inhabitant SET name = 'Bryce' WHERE name = 'Stranger';

SELECT * FROM inhabitant WHERE job = 'baker' ORDER BY gold DESC;

UPDATE inhabitant SET gold = gold + 100 - 150 WHERE personid = 20;

INSERT INTO item (item, owner) VALUES ('sword', 20);

SELECT * FROM inhabitant WHERE job = 'pilot';

SELECT village.name FROM village, inhabitant WHERE village.villageid = inhabitant.villageid AND inhabitant.name = 'Dirty Dieter';

SELECT inhabitant.name FROM village, inhabitant ON village.villageid = inhabitant.villageid WHERE village.name = 'Onionville' AND village.chief = inhabitant.personid;

SELECT COUNT(*) FROM inhabitant, village WHERE village.villageid = inhabitant.villageid AND village.name = 'Onionville';

SELECT COUNT(*) FROM village, inhabitant ON village.villageid = inhabitant.villageid WHERE village.name = 'Onionville' AND inhabitant.gender = 'f';

SELECT inhabitant.name FROM village, inhabitant ON village.villageid = inhabitant.villageid WHERE village.name = 'Onionville' AND inhabitant.gender = 'f';

SELECT SUM(inhabitant.gold) FROM inhabitant, village WHERE village.villageid = inhabitant.villageid AND village.name = 'Cucumbertown';

SELECT SUM(gold) FROM inhabitant WHERE job = 'baker' OR job = 'dealer' OR job = 'merchant';

SELECT job, SUM(inhabitant.gold), AVG(inhabitant.gold) FROM inhabitant GROUP BY job ORDER BY AVG(inhabitant.gold);

SELECT state, AVG(gold) FROM inhabitant GROUP BY state;

DELETE FROM inhabitant WHERE name = 'Dirty Dieter';

DELETE FROM inhabitant WHERE name = 'Dirty Diane';

UPDATE inhabitant SET state = 'friendly' WHERE job = 'pilot';

UPDATE inhabitant SET state = 'emigrated' WHERE personid = 20;

UPDATE inhabitant SET state = 'friendly' WHERE job = 'pilot';
```

