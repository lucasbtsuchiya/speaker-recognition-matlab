function classe = testarVoz()
%%captura som de cada amostra e coloca no banco de dados junto com o id da classe
%Fs � 2x 3400Hz

%%Quando for tentar identificar uma pessoa:
%%Obter uma amostra de �udio
%Fs � 2x 3400Hz
%% aplica filtro passa faixas de 50Hz � 3400Hz
%%obter 16 caracteristicas de energia no sinal em uma determinada janela e
%%insere em um vetor A

%%para cada som no banco de dados aplica filtro passa faixas de 50Hz � 3400Hz
%%obtem 16 caracteristicas de energia no sinal em uma determinada janela
%%relaciona o id da amostra e suas 16 caracteristicas em um vetor e o
%%adiciona em uma matriz;

%%usando um cassificador
%%para cada vetor da matriz, calcula a aproxima��o das caracteristicas registradas e da atual entre as
%%caracteristicas do vetor A e as caracteristicas do vetor da matriz.


%busca a menor distancia na matriz e retorna a classe encontrada;
%//////////////////////////////////////////////////////////////////////////

basesFaltantes = 0;

feats = [];
y = amostraTeste();
classe = reconhecerLocutor(y);

end







