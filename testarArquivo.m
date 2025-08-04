function classe = testarArquivo(arquivo)
%%captura som de cada amostra e coloca no banco de dados junto com o id da classe
%Fs à 2x 3400Hz

%%Quando for tentar identificar uma pessoa:
%%Obter uma amostra de áudio
%Fs à 2x 3400Hz
%% aplica filtro passa faixas de 50Hz à 3400Hz
%%obter 16 caracteristicas de energia no sinal em uma determinada janela e
%%insere em um vetor A

%%para cada som no banco de dados aplica filtro passa faixas de 50Hz à 3400Hz
%%obtem 16 caracteristicas de energia no sinal em uma determinada janela
%%relaciona o id da amostra e suas 16 caracteristicas em um vetor e o
%%adiciona em uma matriz;

%%usando um cassificador
%%para cada vetor da matriz, calcula a aproximação das caracteristicas registradas e da atual entre as
%%caracteristicas do vetor A e as caracteristicas do vetor da matriz.


%busca a menor distancia na matriz e retorna a classe encontrada;
%//////////////////////////////////////////////////////////////////////////
continuar = true;
try
    if(isempty(arquivo))
        continuar = false;
    end
catch
    continuar = false;
end
if ~continuar
    disp('O arquivo não pode ser vazio.');
    classe = -1;
    return;
end
[y,Fs] = audioread(arquivo);
classe = reconhecerLocutor(y);

end
