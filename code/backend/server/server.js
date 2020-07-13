const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();

//Middleware
app.use(bodyParser.json());
app.use(cors());

const posts = require('./routes/api/posts');
const marcas = require('./routes/api/marcas');
const proveedores = require('./routes/api/proveedores');
const vendedores = require('./routes/api/vendedores');

app.use('/api/posts', posts);
app.use('/api/marcas', marcas);
app.use('/api/proveedores', proveedores);
app.use('/api/vendedores', proveedores);
app.get('/', function (req, res) {
    res.sendStatus(200)
})

const port = process.env.PORT || 5000;

app.listen(port, () => console.log(`Server started on port ${port}`));