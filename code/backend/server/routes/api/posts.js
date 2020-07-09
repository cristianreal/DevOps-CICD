const express = require('express');
const bodyParser = require('body-parser');

const connection = require('../../database');

var urlencodedParser = bodyParser.urlencoded({ extended: false })

const router = express.Router();

//GET
router.get('/', (req, res) => {
    connection.query('SELECT * FROM prueba', function (err, rows, fields) {
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
        connection.query('INSERT INTO prueba (name) VALUES (\''+req.body.name+'\')', function (err, rows, fields) {
            if (err) throw res.send('error: ' + err)
            res.send("name added")
        });
    }
});

//DELETE
router.delete('/:id', (req, res) => {
    connection.query('DELETE FROM prueba WHERE id='+req.params.id, 
    function (err, rows, fields) {
        if (err) throw res.send('error: ' + err)
        res.send("name deleted")
    });
});

//UPDATE
router.put('/:id', urlencodedParser, (req, res) => {
    if(!req.body.name){
        res.status(400)
        res.json({
            error: "Bad Data"
        })
    }else{
        connection.query('UPDATE prueba SET name = \''+req.body.name+'\' WHERE id='+req.params.id, 
        function (err, rows, fields) {
            if (err) throw res.send('error: ' + err)
            res.send("name updated")
        });
    }
});

module.exports = router;