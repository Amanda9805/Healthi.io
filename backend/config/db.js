const { Client } = require('pg');

const client = new Client({
    host: '127.0.0.1',
    user: 'postgres',
    password: 'admin',
    port: 5432,
});

const createDatabase = async () => {
    try {
        await client.connect();                            // gets connection
        await client.query('CREATE DATABASE healthiio'); // sends queries
        return true;
    } catch (error) {
        console.error(error.stack);
        return false;
    } finally {
        await client.end();                                // closes connection
    }
};

createDatabase().then((result) => {
    if (result) {
        console.log('Database created');
    }
});






/*
const { Client } = require('pg');

const client = new Client({
    host: '127.0.0.1',
    user: 'postgres',
    database: 'healthiio',
    password: 'admin',
    port: 5432,
});

const execute = async (query) => {
    try {
        await client.connect();     // gets connection
        await client.query(query);  // sends queries
        return true;
    } catch (error) {
        console.error(error.stack);
        return false;
    } finally {
        await client.end();         // closes connection
    }
};

const text = `
    CREATE TABLE IF NOT EXISTS "user" (
	    "id" SERIAL,
	    "fname" VARCHAR(100) NOT NULL,
	    "lname" VARCHAR(100) NOT NULL,
      "age" INT NOT NULL,
      "weight" INT NOT NULL,
      "location" VARCHAR(100) NOT NULL,
	    PRIMARY KEY ("id"),
      FOREIGN KEY(idExercise),
      FOREIGN KEY(idFood),
      FOREIGN KEY(idSleep),
      FOREIGN KEY(idWater)
    );`;

execute(text).then(result => {
    if (result) {
        console.log('Table created');
    }
});
*/
/*
const text = `
    CREATE TABLE IF NOT EXISTS "medicalProfessional" (
	    "idProfessional" SERIAL,
	    "fname" VARCHAR(100) NOT NULL,
	    "lname" VARCHAR(100) NOT NULL,
      "specialty" VARCHAR(100) NOT NULL,
      "location" VARCHAR(100) NOT NULL,
      "cell" int NOT NULL,
	    PRIMARY KEY ("idProfessional")
    );`;

    const text = `
    CREATE TABLE IF NOT EXISTS "waterChallenge" (
	    "idWater" SERIAL,
	    "current_intake" int NOT NULL,
	    PRIMARY KEY ("idWater")
    );`;

    const text = `
    CREATE TABLE IF NOT EXISTS "sleepChallenge" (
	    "idSleep" SERIAL,
	    "current_hours" int NOT NULL,
	    PRIMARY KEY ("idSleep")
    );`;

    const text = `
    CREATE TABLE IF NOT EXISTS "exerciseChallenge" (
	    "idExercise" SERIAL,
	    "current_caloriesBurnt" int NOT NULL,
	    PRIMARY KEY ("idExercise")
    );`;

    const text = `
    CREATE TABLE IF NOT EXISTS "foodChallenge" (
	    "idFood" SERIAL,
	    "current_caloriesConsumed" int NOT NULL,
	    PRIMARY KEY ("idFood"),
    );`;



*/

