/***
 * The main aim of this script is to populate the database with Mock data
 */

const { Pool, Client } = require('pg');

const client = new Client({
    user: 'postgres',
    host: 'localhost',
    password: 'admin',
    port: 5432,
    database: 'healthiio'
});

(async () => {
    try {
        await client.connect(); 
        
        console.log('Database connection was successful');

        //INSERT INTO cars (brand, model, year)
        //VALUES ('Ford', 'Mustang', 1964);
        
        //populate the people
        await client.query(`

            INSERT INTO person
                (email, fname, lname,age,weight,height,location,current_exercise, current_sleep ,current_food, current_water,weekly_sleeping_hours) 
            VALUES
                ('rashford@gmail.com','Marcus','Rashford',25,75,185,'Manchester, United Kingdom',3000,25,1000,8,ARRAY[6,7.3,6.3,7,6,5,6]);
            
            INSERT INTO person
                (email, fname, lname,age,weight,height,location,current_exercise, current_sleep ,current_food, current_water,weekly_sleeping_hours) 
            VALUES
                ('maguire@gmail.com', 'Harry', 'Macguire',30,76,190,'Sheffield, United Kingdom',4000,50,250,6,ARRAY[8,7,8.3,8,7.3,7,8]);

            INSERT INTO person
                (email, fname, lname,age,weight,height,location,current_exercise, current_sleep ,current_food, current_water,weekly_sleeping_hours) 
            VALUES
                ('jesse@gmail.com', 'Jesse', 'Lingard',30,73,180,'Warrington, United Kingdom',2600,16,2400,3,ARRAY[2,5.3,4.5,8,1.3,3.3,6]);

            INSERT INTO "challengeBenchmarks" VALUES
                (1000,500,25,7);
            
            INSERT INTO "medicalProfessionals"
                (email,fname,lname,specialty,location,cell)
            VALUES
                ('profg@gmail.com','Stephan','Grunner','Physio','Manchester, United Kingdom','072 252 3698'),
                ('jose@gmail.com','Jose', 'Marinho','Psychologist','Warrington, United Kingdom','078 363 9696'),
                ('sky@gmail.com','Pitso','Musimane','Chiropractor','Hatfield, South Africa','081 255 3625');

        `);

        const result = await client.query(`SELECT * FROM person`);

        if(result.rows.length>0)
        {
            console.log("Entries were successfully inserted");
        }
        else
        {
            console.log("Could not insert entries into the database");
        }
        

        
    } catch (error) {
        console.error('Error connecting to the database:', error);
        res.status(500).send('Internal Server Error');
    } finally {
        await client.end();
    }
})();
