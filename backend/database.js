const { Pool, Client } = require('pg');

const client = new Client({
    user: 'postgres',
    host: 'localhost',
    password: 'admin',
    port: 5432
});

(async () => {
    try {
        await client.connect();

        // Check if the database already exists
        const result = await client.query(
            `SELECT datname FROM pg_database WHERE datname = 'healthiio'`
        );

        if (result.rows.length > 0) {

            console.log('The database "healthiio" exists.');

            await client.query(`
                -- Drop the tables in reverse order of creation
                DROP TABLE IF EXISTS challengeBenchmarks;
                DROP TABLE IF EXISTS medicalProfessional;
                DROP TABLE IF EXISTS person;
            `);

            client.end();
        } 
        else 
        {
            console.log('The database "healthiio" does not exist.');
            console.log('Creating database healthiio..........');

            await client.query('CREATE DATABASE healthiio');

            client.end();
        }

        const clientNew = new Client({
            user: 'postgres',
            host: 'localhost',
            password: 'admin',
            port: 5432,
            database:'healthiio'
        });

        await clientNew.connect();

        // Now you can create tables or perform other operations in the database
        // Example: create a 'users' table
        await clientNew.query(`
            CREATE TABLE IF NOT EXISTS "medicalProfessionals" (
                idProfessional SERIAL PRIMARY KEY,
                email VARCHAR(60),
                fname VARCHAR(100),
                lname VARCHAR(100),
                specialty VARCHAR(100),
                location VARCHAR(100),
                cell VARCHAR(15)
            );

            CREATE TABLE IF NOT EXISTS "challengeBenchmarks" (
                calories_burnt_benchmark INT,
                calories_consumed_benchmark INT,
                water_intake_benchmark INT,
                sleep_hours_benchmark INT
            );

            CREATE TABLE IF NOT EXISTS "person" (
                id SERIAL PRIMARY KEY,
                email VARCHAR(60),
                fname VARCHAR(100),
                lname VARCHAR(100),
                age INT,
                weight FLOAT,
                height INT,
                location VARCHAR(100),
                current_exercise INT,
                current_sleep INT,
                current_food INT,
                current_water INT,
                weekly_sleeping_hours numeric[]
            );
            

            
        `);

        const results=await clientNew.query('SELECT * FROM person');

        if(results)
        {
            console.log('Database and tables created successfully.');
            clientNew.end();
        }
        else
        {
            console.log('Database and tables installation unsuccessful.');
        }

        
    } catch (error) {
        console.error('Error:', error);
    } 
})();

/*
const { Pool, Client } = require('pg');

const client = new Client({
    user: 'postgres',
    host: 'localhost',
    password: 'admin',
    port: 5432,
});

(async () => {
    try {
        // Check if the database already exists
        const databaseExists = await client.query(
            `SELECT 1 FROM pg_database WHERE datname = 'healthiio'`
        );

        if (!databaseExists.rows.length) {
            // Create the database if it doesn't exist
            await client.query(
                `CREATE DATABASE healthiio`
            );
            console.log('Database "healthiio" created successfully.');
        }

        await client.connect();

        // Drop tables if they exist
        await client.query(`
            DROP TABLE IF EXISTS "medicalProfessional";
            DROP TABLE IF EXISTS "foodChallenge";
            DROP TABLE IF EXISTS "waterChallenge";
            DROP TABLE IF EXISTS "exerciseChallenge";
            DROP TABLE IF EXISTS "sleepChallenge";
            DROP TABLE IF EXISTS "challengeBenchmark";
            DROP TABLE IF EXISTS "user";
        `);

        // Now you can create tables or perform other operations in the database
        // Example: create a 'users' table
        await client.query(`
            CREATE TABLE IF NOT EXISTS "medicalProfessional" (
                idProfessional SERIAL PRIMARY KEY,
                fname VARCHAR(100),
                lname VARCHAR(100),
                specialty VARCHAR(100),
                location VARCHAR(100),
                cell INT
            );

            CREATE TABLE IF NOT EXISTS "foodChallenge" (
                idFood SERIAL PRIMARY KEY,
                current_calories_consumed INT
            );
            
            CREATE TABLE IF NOT EXISTS "waterChallenge" (
                idWater SERIAL PRIMARY KEY,
                current_intake INT
            );

            CREATE TABLE IF NOT EXISTS "exerciseChallenge" (
                idExercise SERIAL PRIMARY KEY,
                current_calories_burnt INT
            );

            CREATE TABLE IF NOT EXISTS "sleepChallenge" (
                idSleep SERIAL PRIMARY KEY,
                current_hours INT
            );

            CREATE TABLE IF NOT EXISTS challengeBenchmarks (
                calories_burnt_benchmark INT,
                calories_consumed_benchmark INT,
                water_intake_benchmark INT,
                sleep_hours_benchmark INT
            );

            CREATE TABLE "user" (
                id SERIAL PRIMARY KEY,
                fname VARCHAR(100),
                lname VARCHAR(100),
                age INT,
                weight INT,
                location VARCHAR(100),
                FOREIGN KEY (id) REFERENCES "exerciseChallenge"(idExercise),
                FOREIGN KEY (id) REFERENCES "sleepChallenge"(idSleep),
                FOREIGN KEY (id) REFERENCES "foodChallenge"(idFood),
                FOREIGN KEY (id) REFERENCES "waterChallenge"(idWater)
            );

            
        `);

        console.log('Database and tables created successfully.');

    } catch (error) {
        console.error('Error:', error);
    } finally {
        await client.end();
    }
})();

 */
