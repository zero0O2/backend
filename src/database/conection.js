const { Sequelize } = require('sequelize');

const connection = new Sequelize({
    dialect: 'mysql',
    host: 'localhost',
    port: 3307,
    username: 'root',
    password:'12345678',
    database:'blog'
});

module.exports = connection