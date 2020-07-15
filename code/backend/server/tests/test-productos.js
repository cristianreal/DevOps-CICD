var assert = require("assert");
var chai = require('chai'),
    chaiHttp = require('chai-http');
var server = require('../server.js'); // my express app
var expect = chai.expect;

chai.use(chaiHttp);

describe("marcas", function() {
    describe("listar", function() {
            it('se verifica si la ruta para listar productos funciona', done => {
                chai
                    .request(server)
                    .get('/api/productos')
                    .end((err, res) => {
                        expect(err).to.be.null;
                        expect(res).to.have.status(200);
                        done();
                    })
            });
        }),
        describe("agregar", function() {
            it('metodo para agregar productos', done => {
                chai.request(server)
                    .post('/api/productos')
                    .send({
                        nombre: 'productostest',
                        descripcion: 'este es un producto de ejemplo',
                        precio: "24.36",
                        marca: "1"
                    })
                    .end(function(err, res) {
                        expect(err).to.be.null;
                        expect(res).to.have.status(200);
                        done();
                    });
            });
        }),
        describe("ver", function() {
            it('metodo para ver un producto especifico', done => {
                chai.request(server)
                    .get('/api/productos/1')
                    .end(function(err, res) {
                        expect(err).to.be.null;
                        expect(res).to.have.status(200);
                        done();
                    });
            });
        })
})