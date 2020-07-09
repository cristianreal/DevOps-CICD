const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();

//Middleware
app.use(bodyParser.json());
app.use(cors());

const posts = require('./routes/api/posts');

app.use('/api/posts', posts);
app.get('/', function (req, res) {
    res.sendStatus(200)
})

const port = process.env.PORT || 5000;

app.listen(port, () => console.log(`Server started on port ${port}`));