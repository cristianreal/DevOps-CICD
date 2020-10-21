const express = require('express');
const bodyParser = require('body-parser');

const connection = require('../database');

var urlencodedParser = bodyParser.urlencoded({ extended: false })

const router = express.Router();

/**
 * @name getVendedores
 * 
 * @httpMethod  GET
 * 
 * @return json de todos los vendedores
 */
router.get('/', (req, res) => {
    connection.query('call Vendedor_Listar()', function (err, rows, fields) {
        if (err) throw res.send('error: ' + err)
        res.json(rows)
        //console.log('The solution is: ', rows[0].name)
    });
});

/**
 * @name addVendedor
 * 
 * @httpMethod  POST
 * 
 * @param {string} nombre
 * @param {string} apellido
 * @param {string} direccion
 * @param {string} telefono
 * @param {string} email
 * @param {int}    genero
 * @param {string} fecha_nacimiento
 * @param {string} fecha_vinculacion
 * @param {int}    jornada
 * @param {string} pass
 * 
 * @return "Vendedor added"
 */
router.post('/', urlencodedParser, (req, res) => {
    if (!req.body.nombre) {
        res.status(400)
        res.json({
            error: "Bad Data"
        })
    } else {
        // Quitando las comillas simples de todos los elementos
        let objeto = req.body;
        Object.keys(objeto).map(function (key, index) {
            objeto[key] = String(objeto[key]).replace("\'", "");
        });
        // Obteniendo los parametros de body
        let { nombre, apellido, direccion, telefono, email, genero, fecha_nacimiento, fecha_vinculacion, jornada, pass } = objeto;
        connection.query('call Vendedor_Crear(\'' + nombre + '\',\'' + apellido + '\',\'' + direccion + '\',\'' + telefono + '\',\'' + email + '\',' + genero + ',\'' + fecha_nacimiento + '\',\'' + fecha_vinculacion + '\',' + jornada + ',\'' + pass + '\')', function (err, rows, fields) {
            if (err) throw res.send('error: ' + err)
            res.send("Vendedor added")
        });
    }
});

/**
 * @name login
 *
 * @httpMethod  POST
 * 
 * @param {string}  email
 * @param {string}  password
 *
 * @return json de la informacion del usuario que se esta autenticando
 */
router.post('/login', urlencodedParser, (req, res) => {
    if (!req.body.email) {
        res.status(400)
        res.json({
            error: "Bad Data"
        })
    } else {
        // Quitando las comillas simples de todos los elementos
        let objeto = req.body;
        Object.keys(objeto).map(function (key, index) {
            objeto[key] = String(objeto[key]).replace("\'", "");
        });
        // Obteniendo los parametros de body
        let { email, password } = objeto;
        connection.query('call Vendedor_Login(\'' + email + '\',\'' + password + '\')', function (err, rows, fields) {
            if (err) throw res.send('error: ' + err)
            res.json(rows)
        });
    }
});

/**
 * @name ObtenerDetalleVendedor
 *
 * @httpMethod  GET
 * 
 * @param {int} id
 *
 * @return json de la informacion del vendedor con un id especifico
 */
router.get('/:id', (req, res) => {
    let id = req.params.id;
    connection.query('call Vendedor_Buscar_Por_Id(' + id + ')', function (err, rows, fields) {
        if (err) throw res.send('error: ' + err)
        res.json(rows)
    });
});

/**
 * @name UpdateVendedor
 *
 * @httpMethod  PUT
 *
 * @param {string}  nombre
 * @param {string}  apellido
 * @param {string}  direccion
 * @param {string}  telefono
 * @param {string}  email
 * @param {int}     jornada
 *
 * @return "Vendedores UPDATED"
 */
router.put('/:id', urlencodedParser, (req, res) => {
    if (!req.body.nombre) {
        res.status(400)
        res.json({
            error: "Bad Data"
        })
    } else {
        let id = req.params.id;
        // Quitando las comillas simples de todos los elementos
        let objeto = req.body;
        Object.keys(objeto).map(function (key, index) {
            objeto[key] = String(objeto[key]).replace("\'", "");
        });
        // Obteniendo los parametros de body
        let { nombre, apellido, direccion, telefono, email, jornada } = objeto;
        connection.query('call Vendedor_Modificar(' + id + ',\'' + nombre + '\',\'' + apellido + '\',\'' + direccion + '\',\'' + telefono + '\',\'' + email + '\',' + jornada + ')', function (err, rows, fields) {
            if (err) throw res.send('error: ' + err)
            res.send("Vendedores UPDATED")
        });
    }
});

/**
 * @name EliminarVendedor
 *
 * @httpMethod  DELETE
 *
 * @param {int} id
 *
 * @return "Vendedor eliminado" luego de eliminar al vendedor
 */
router.delete('/:id', (req, res) => {
    connection.query('call Vendedor_Eliminar(' + req.params.id + ')',
        function (err, rows, fields) {
            if (err) throw res.send('error: ' + err)
            res.send("Vendedor eliminado")
        });
});

module.exports = router;