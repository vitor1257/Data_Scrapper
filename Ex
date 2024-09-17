// Sou o Vitor Castro Dias e este é meu trabalho de Data_Scrapper.
// Para que esse código funcione, deve acessar o site: "https://www.brilhonatural.shop/?srsltid=AfmBOopIS4aaCNl67m95fjIhUxJjMWGNKyIDx9NQ33CWRg0HPXcyScjC#MainContent"

// O que eu quero fazer:

// Eu quero que apareça uma uma quadrado de opção na qual o usuário digite o numero que ele queira executar
//     Caso 1 = Extrair o nome e item de cada produto no Site
//          nome da class onde está o nomes do produto = h4 grid-view-item__title product-card__title
//          nome da class aonde stá os preços = price-item price-item--sale
//     Caso 2 = Mudar a cor da página de fundo e dos preços (Se puder eu gostaria que a pessoa podesse escolher a cor dentre 3 opçoes: Branco, Verde ou Amarelo)
//     Caso 3 = Mudar a imagem dos produtos (Quero que a pessoa escolha a quantidade de imagens que você quer mudar)
//     Caso 4 = Mudar o texto (Para o que a pessoa quiser)
//     Caso 5 = Sair do programa

function Menu(){
    let opcao = prompt(`Digite a opção que você deseja executar:
                       1 - Extrair o nome e preço de Cada Item;
                       2 - Mudar a Cor de fundo da página;
                       3 - Mudar a Imagem dos Produtos;
                       4 - Mudar o texto dos Produtos;
                       5 - Sair do Programa.`);
    
    switch(opcao) {
        case '1':
            ExtrairNomePreco();
            break;
        case '2':
            MudarCor();
            break;
        case '3':
            MudarImg();
            break;
        case '4':
            MudarTxt()
            break;
        case '5':
            alert('Saindo...');
            break;
        default:
            alert('Opção Inválida! Digite novamente');
            Menu();
    }
}

function ExtrairNomePreco(){
    let nomesProd = document.querySelectorAll('.h4.grid-view-item__title.product-card__title');
    let nomesPrec = document.querySelectorAll('.price-item.price-item--sale');

    let resultadosNome = [];
    let resultadosPreco = [];

    for(let i = 0; i < nomesProd.length; i++){
        let texto = nomesProd[i].textContent.trim();
        resultadosNome.push(texto);
    }
    for(let i = 0; i < nomesPrec.length; i++){
        let preco = nomesPrec[i].textContent.trim();
        resultadosPreco.push(preco);
    }

    console.log('Nome dos Produtos: ',resultadosNome);
    console.log('Preço dos Produtos: ',resultadosPreco);
    return Menu();
}

function MudarCor(){
    let NomeProd = document.querySelectorAll('.h4.grid-view-item__title.product-card__title');

    let desc1 = prompt(`Escolha uma dessas três cores para alterar o fundo:
                        1 - Preto
                        2 - Azul 
                        3 - Verde`);

    switch(desc1){
        case '1':
            document.body.style.backgroundColor = "black";
            console.log("Mudou preto");
            break;
        case '2':
            document.body.style.backgroundColor = "blue";
            console.log("Mudou azul");
            break;
        case '3':
            document.body.style.backgroundColor = "#5DFDCB";
            console.log("Mudou verde");
            break;
        };

    let desc2 = prompt(`Escolha uma dessas três cores para alterar a descrição dos produtos:
                        1 - Preto
                        2 - Azul 
                        3 - Verde`);
    
    switch(desc2){
        case '1':
            for(let i = 0; i < NomeProd.length; i++){
                NomeProd[i].style.color = "#ffffff";
                console.log("Mudou branco");
                break;
            }
        case '2':
            for(let i = 0; i < NomeProd.length; i++){
                NomeProd[i].style.color = "#7CC6FE";
                console.log("Mudou azul");
                break;
            }
        case '3':
            for(let i = 0; i < NomeProd.length; i++){
                NomeProd[i].style.color = "#5DFDCB";
                console.log("Mudou verde");
                break;
            }
    }
    return Menu();
}

function MudarImg(){
    let resp = prompt('Digite até que imagem você deseja trocar:');
    resp = parseInt(resp);

    let foto = document.querySelectorAll(".page-width> ul > li >div>div>div>div>img");

    for (let i = 0; i < resp && i < foto.length; i++) {
        foto[i].srcset = 'https://i1.sndcdn.com/artworks-j0qgd3XOzXCWZpRg-t0BE2Q-t500x500.jpg';
    }

    alert("A(s) imagem foi alterada com sucesso!");
    return Menu();
}

function MudarTxt(){
    let novoTexto = prompt('Digite o novo texto para os produtos:');
    let elementos = document.querySelectorAll('.h4.grid-view-item__title.product-card__title');

    for (let i = 0; i < elementos.length; i++) {
        elementos[i].innerHTML = novoTexto;
    }

    alert('Texto dos produtos alterado com sucesso!');
    return Menu();
}
