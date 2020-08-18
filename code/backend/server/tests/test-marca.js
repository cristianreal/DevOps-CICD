var assert = require("assert");
var chai = require('chai'),
    chaiHttp = require('chai-http');
var server = require('../server.js'); // my express app
var expect = chai.expect;

chai.use(chaiHttp);

describe("marcas", function() {
    describe("listar", function() {
            it('se verifica si la ruta para listar marcas funciona', done => {
                chai
                    .request(server)
                    .get('/api/marcas')
                    .end((err, res) => {
                        expect(err).to.be.null;
                        expect(res).to.have.status(200);
                        done();
                    })
            });
        }),
        describe("agregar", function() {
            it('se verifica si la ruta para listar marcas funciona', done => {
                chai.request(server)
                    .post('/api/marcas')
                    .send({
                        name: 'marcatest',
                        country: 'Guatemala',
                        webpage: "marcatest.moca.gt"
                    })
                    .end(function(err, res) {
                        expect(err).to.be.null;
                        expect(res).to.have.status(200);
                        done();
                    });
            });
        }),
        describe("ver", function() {
            it('metodo para ver un marcas especifico', done => {
                chai.request(server)
                    .get('/api/marcas/1')
                    .end(function(err, res) {
                        expect(err).to.be.null;
                        expect(res).to.have.status(200);
                        done();
                    });
            });
        })
})