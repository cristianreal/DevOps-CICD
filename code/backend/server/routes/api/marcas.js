const express = require('express');
const bodyParser = require('body-parser');

const connection = require('../../database');

var urlencodedParser = bodyParser.urlencoded({ extended: false })

const router = express.Router();
router.get('/', (req, res) => {
    connection.query('call Marca_Listar()', function (err, rows, fields) {
        if (err) throw res.send('error: ' + err)
        res.json(rows)
        //console.log('The solution is: ', rows[0].name)
    });
});

//ADD
router.post('/', urlencodedParser, (req, res) => {
    if(!req.body.name){
        res.status(400)
        res.json({
            error: "Bad Data"
        })
    }else{
        connection.query('call Marca_Crear(\''+req.body.name+'\',\''+req.body.country+'\',\''+req.body.webpage+'\')', function (err, rows, fields) {
            if (err) throw res.send('error: ' + err)
            res.send("name added")
        });
    }
});

//DELETE
router.delete('/:id', (req, res) => {
    connection.query('call Marca_Eliminar('+req.params.id+')', 
    function (err, rows, fields) {
        if (err) throw res.send('error: ' + err)
        res.send("name deleted")
    });
});


module.exports = router;