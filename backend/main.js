const express = require('express');
const db = require('./conn'); // Import the database module
const cors = require('cors');

const app = express();
const port = 3000;

app.use(cors());

app.get('/', (req, res) => {

    const message ={
        "msg": "Hello World"
    };

    res.send(JSON.stringify(message));

});

app.get('/testConnection', async (req, res) => {
    try {
        if (!client._connected) {
            await client.connect(); 
        }

        res.send('Database connection successful');
    } catch (error) {
        console.error('Error connecting to the database:', error);
        res.status(500).send('Internal Server Error');
    }
    finally{
        await client.end();
    }
});

// Create a reusable function for handling database queries
const handleDatabaseQuery = async (req, res, query, errorMessage) => {
  try {
    const inputParameter = req.query.email || req.query.specialty; // Use the appropriate query parameter
    const { rows } = await db.query(query, [inputParameter]);

    if (rows.length === 0) {
      res.status(404).json({ error: errorMessage });
    } else {
      res.json(rows[0]);
    }
  } catch (error) {
    console.error('Error querying the database:', error);
    res.status(500).send('Internal Server Error');
  }
};

app.post('/getAllChallengeBenchmarkValues', async (req, res) => {
  const query = 'SELECT * FROM "challengeBenchmarks"';
  const errorMessage = 'Challenge Benchmarks not found';
  handleDatabaseQuery(req, res, query, errorMessage);
});


app.post('/getUserDetails', async (req, res) => {
  const query = 'SELECT * FROM "person" WHERE email = $1';
  const errorMessage = 'Email not found';
  handleDatabaseQuery(req, res, query, errorMessage);
});

app.post('/getMedicalProfessionalVSpecialty', async (req, res) => {
  const query = 'SELECT * FROM "medicalProfessionals" WHERE specialty = $1';
  const errorMessage = 'Medical professional not found';
  handleDatabaseQuery(req, res, query, errorMessage);
});

app.get('/getMedicalProfessionals', async (req, res) => {

    const query = 'SELECT * FROM "medicalProfessionals"';
    const errorMessage = 'Medical professional not found';

    try {
        const { rows } = await db.query(query);

        if (rows.length === 0) {
            res.status(404).json({ error: errorMessage });
        } else {
            res.json(rows);
        }
    } catch (error) {
        console.error('Error querying the database:', error);
        res.status(500).send('Internal Server Error');
    }
});

app.post('/getUserWaterIntake', async (req, res) => {
    const query = 'SELECT "current_water" FROM "person" WHERE email = $1';
    const errorMessage = 'Water intake not found';
    handleDatabaseQuery(req, res, query, errorMessage);
  });

  app.post('/getUserCaloriesConsumed', async (req, res) => {
    const query = 'SELECT "current_food" FROM "person" WHERE email = $1';
    const errorMessage = 'Current food not found';
    handleDatabaseQuery(req, res, query, errorMessage);
  });

  app.post('/getUserCaloriesBurned', async (req, res) => {
    const query = 'SELECT "current_exercise" FROM "person" WHERE email = $1';
    const errorMessage = 'Current exercise not found';
    handleDatabaseQuery(req, res, query, errorMessage);
  });

  app.post('/getUserHoursSlept', async (req, res) => {
    const query = 'SELECT "current_sleep" FROM "person" WHERE email = $1';
    const errorMessage = 'Current sleep not found';
    handleDatabaseQuery(req, res, query, errorMessage);
  });

// Define other routes similarly

// Start the server
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
