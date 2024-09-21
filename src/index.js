/* console.log('Antes da requisição')

let dadosDaRequisicao;

fetch('https://viacep.com.br/ws/01003000/json/')
.then(response => response.json())
.then(data => {
    dadosDaRequisicao = data
    console.log('Dados da requisição')
})

console.log('Depois da requisição')
console.log(dadosDaRequisicao.cep)

async function request() {
    let requisicao = await fetch('https://viacep.com.br/ws/01003000/json/')
    let data = await requisicao.json()
    console.log(data)
} */

async function soma(a, b){
    return a + b;
}

let somar = soma(2,8);

somar.then(resultado =>{
    console.log(resultado)
})

async function verresultadodasoma(){
    let resultado = await soma(3,3)
    console.log(resultado)
}

verresultadodasoma()
