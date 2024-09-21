const conneciton = require ('../database/conection.js');
const { DataTypes } = require('sequelize');

let UserModel = conneciton.define('UserModel', {
    firstname:{
        type:DataTypes.STRING(50),
        allowNull:false
    },
    surname:{
        type:DataTypes.STRING(50),
        allowNull:false
    },
    username:{
        type:DataTypes.STRING(50),
        allowNull:false
    },
    email:{
        type:DataTypes.STRING(255),
        allowNull:false,
        unique:true
    },
    password:{
        type:DataTypes.STRING(255),
        allowNull:false
    },
},{
    tableName:'users'
});

module.exports = UserModel;