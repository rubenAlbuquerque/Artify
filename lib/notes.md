CustomSearchDelegate:

- buildActions(BuildContext context): Esse método é responsável por construir as ações que podem ser realizadas na barra de pesquisa. No exemplo fornecido, é adicionado um IconButton com o ícone de limpar (ícone de um "x"). Quando esse ícone é pressionado, a query de pesquisa é limpa.

- buildLeading(BuildContext context): Esse método é responsável por construir o widget que aparece no início da barra de pesquisa. No exemplo fornecido, é adicionado um IconButton com o ícone de voltar (ícone de uma seta apontando para a esquerda). Quando esse ícone é pressionado, a página de pesquisa é fechada e a navegação volta para a página anterior.

- buildResults(BuildContext context): Esse método é responsável por construir os resultados da pesquisa. No exemplo fornecido, é retornado um Container com cor vermelha e um Text exibindo a query de pesquisa.

- buildSuggestions(BuildContext context): Esse método é responsável por construir as sugestões de pesquisa que aparecem enquanto o usuário digita na barra de pesquisa. No exemplo fornecido, é criada uma lista de sugestões filtrada com base na query digitada. É retornado um ListView.builder que exibe as sugestões de pesquisa em forma de ListTile, sendo possível selecionar uma sugestão para preencher a query de pesquisa e exibir os resultados.



