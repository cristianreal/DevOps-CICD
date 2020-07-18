var assert = require("assert");
var chai = require('chai'),
    chaiHttp = require('chai-http');
var server = require('../server.js'); // my express app
var expect = chai.expect;

chai.use(chaiHttp);

describe("marcas", function() {
    describe("listar", function() {
            it('se verifica si la ruta para listar vendedores funciona', done => {
                chai
                    .request(server)
                    .get('/api/vendedores')
                    .end((err, res) => {
                        expect(err).to.be.null;
                        expect(res).to.have.status(200);
                        done();
                    })
            });
        }),
        describe("agregar", function() {
            it('se verifica si la ruta para listar vendedores funciona', done => {
                chai.request(server)
                    .post('/api/vendedores')
                    .send({
                        nombre: 'vendedortest',
                        apellido: 'apellidotest',
                        direccion: "12av. 15-24",
                        telefono: "12345678",
                        email: "vendedor@gmail.com",
                        pass: "123456",
                        genero: "1",
                        fecha_nacimiento: "2001-03-16",
                        fecha_vinculacion: "2001-03-16",
                        jornada: "1"
                    })
                    .end(function(err, res) {
                        expect(err).to.be.null;
                        expect(res).to.have.status(200);
                        done();
                    });
            });
        }),
        describe("ver", function() {
            it('metodo para ver un vendedores especifico', done => {
                chai.request(server)
                    .get('/api/vendedores/1')
                    .end(function(err, res) {
                        expect(err).to.be.null;
                        expect(res).to.have.status(200);
                        done();
                    });
            });
        })
})