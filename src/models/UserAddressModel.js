const conneciton = require('../database/conection')
const { DataTypes } = require('sequelize')

const columns = {}

const config = {
    tableName:'user_address'
}

const UserAddressModel = conneciton.define(
    'UserAddressModel',
    columns,
    config

)

 columns = {
    postCode:{
        type:DataTypes.string(255),
        allowNull:false,
        unique:true,
        references:{
            model:{
                tableName:'users',
            },
            key:'id'
            
        },
        ondelete: true,
    }

}