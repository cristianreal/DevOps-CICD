const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();

//Middleware
app.use(bodyParser.json());
app.use(cors());

const vendedores = require('./routes/vendedores');

app.use('/api/vendedores', vendedores);

app.get('/', function (req, res) {
    res.sendStatus(200)
})

const port = process.env.PORT || 5000;

if (!module.parent) {
    app.listen(port, () => console.log(`Server started on port ${port}`));
}

module.exports = app