CREATE (pigs1:Song{name:"Pigs on the wing 1", length: time("1:25")})
CREATE (dogs:Song{name:"Dogs", length: time("17:04")})
CREATE (pigstdo:Song{name:"Pigs (Three Different Ones)", length: time("11:22")})
CREATE (sheep:Song{name: "Sheep", length: time("10:24")})
CREATE (pigs2:Song{name: "Pigs on the wing 2", length: time("1:25")})

CREATE (animals:Release {name:"Animals", year: 1977})

CREATE (pigs1)-[:APPEARS_ON {song_nr: 1}]->(animals)
CREATE (dogs)-[:APPEARS_ON {song_nr: 2}]->(animals)
CREATE (pigstdo)-[:APPEARS_ON {song_nr: 3}]->(animals)
CREATE (sheep)-[:APPEARS_ON {song_nr: 4}]->(animals);


MATCH(s:Song {name: "Pigs on the wing 2"})
MATCH(r:Release {name: "Animals"})
CREATE(s)-[:APPEARS_ON {song_nr: 5}]->(r);


CREATE (s:Song {name:"I", length: time("21:04")})-[a:APPEARS_ON {song_nr: 1}]->(r:Release {name:"I", year: 2004})
RETURN s, a, r;


MATCH(s:Song)-[a:APPEARS_ON]->(r:Release) DELETE s,a,r;
