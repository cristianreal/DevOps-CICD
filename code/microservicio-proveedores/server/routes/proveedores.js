const express = require('express');
const bodyParser = require('body-parser');

const connection = require('../database');

var urlencodedParser = bodyParser.urlencoded({ extended: false })

const router = express.Router();

/**
 * @name getProveedores
 *
 * @httpMethod  GET
 *
 * @return json de todos los proveedores
 */
router.get('/', (req, res) => {
    connection.query('call Proveedor_Listar()', function (err, rows, fields) {
        if (err) throw res.send('error: ' + err)
        res.json(rows)
        //console.log('The solution is: ', rows[0].name)
    });
});

/**
 * @name addProveedor
 *
 * @httpMethod  POST
 *
 * @param {string} nombre
 * @param {string} apellido
 * @param {string} direccion
 * @param {string} telefono
 * @param {string} email
 * @param {int}    genero
 * @param {string} pagina_web
 * @param {string} pais
 * @param {string} ciudad
 *
 * @return "Proveedor added"
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
            objeto[key] = objeto[key].replace("\'", "");
        });
        // Obteniendo los parametros de body
        let { nombre, apellido, direccion, telefono, email, genero, pagina_web, pais, ciudad } = objeto;

        connection.query('call Proveedor_Crear(\'' + nombre + '\',\'' + apellido + '\',\'' + direccion + '\',\'' + telefono + '\',\'' + email + '\',' + genero + ',\'' + pagina_web + '\',\'' + pais + '\',\'' + ciudad + '\')', function (err, rows, fields) {
            if (err) throw res.send('error: ' + err)
            res.send("Proveedor added")
        });
    }
});

/**
 * @name ObtenerDetalleProveedor
 *
 * @httpMethod  GET
 *
 * @param {int} id
 *
 * @return json de la informacion del proveedor con un id especifico
 */
router.get('/:id', (req, res) => {
    let id = req.params.id;
    connection.query('call Proveedor_Buscar_Por_Id(' + id + ')', function (err, rows, fields) {
        if (err) throw res.send('error: ' + err)
        res.json(rows)
    });
});

/**
 * @name UpdateProveedor
 *
 * @httpMethod  PUT
 *
 * @param {string}  nombre
 * @param {string}  apellido
 * @param {string}  direccion
 * @param {string}  telefono
 * @param {string}  email
 * @param {string}  pagina_web
 * @param {string}  pais
 * @param {string}  ciudad
 *
 * @return "Proveedor UPDATED"
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
            objeto[key] = objeto[key].replace("\'", "");
        });
        // Obteniendo los parametros de body
        let { nombre, apellido, direccion, telefono, email, pagina_web, pais, ciudad } = objeto;
        connection.query('call Proveedor_Modificar(' + id + ',\'' + nombre + '\',\'' + apellido + '\',\'' + direccion + '\',\'' + telefono + '\',\'' + email + '\',\'' + pagina_web + '\',\'' + pais + '\',\'' + ciudad + '\')', function (err, rows, fields) {
            if (err) throw res.send('error: ' + err)
            res.send("Proveedor UPDATED")
        });
    }
});


/**
 * @name EliminarProveedor
 *
 * @httpMethod  DELETE
 *
 * @param {int} id
 *
 * @return "proveedor eliminado" luego de eliminar al proveedor
 */
router.delete('/:id', (req, res) => {
    connection.query('call Proveedor_Eliminar(' + req.params.id + ')',
        function (err, rows, fields) {
            if (err) throw res.send('error: ' + err)
            res.send("proveedor eliminado")
        });
});

module.exports = router;