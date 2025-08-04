function [classe,ratio] = reconhecerLocutor(y);
yFeats = features(y);

try
    isempty(trainedClassifier);
catch
try
    load cassificador
catch
    disp('O classificador ainda não foi treinado. Adicione um som para treina-lo.');
    classe = -1;
    ratio = 0.0000001;
    return;
end 
end
%%faz a predicao no classificador
yfit = trainedClassifier.predictFcn(yFeats);

%%conta as ocorrência das classes nas predicoes
[a,b]=hist(yfit,unique(yfit));

%%verifica se a classe com maior quantidade de ocorrencias tem no minimo
%% a razao minima 'R' de ocorrencias em função da quantidade de features;
R = 0.80;
maxA =  max(a);
[lFeats, cFeats] = size(yFeats);
ratio = maxA/lFeats;
if ratio > R
    %%normaliza as ocorrencias no vetor de ocorrencias 'a'
    a = a/max(a);

    %%pega a ocorrencia normalizada à 1 e associa com a posição no vetor de
    %%clases 'b'
    classe = -1;
    for i=1:length(a);
        if(a(i) == 1)
            classe = b(i);
            break;
        end
    end
    %%imprime a saída
    saida = strcat('Classe Identificada: ', num2str(classe));
   
else    
    classe= -1;
    
    saida = strcat('Classe não Identificada!');
    a
    b
end  
 disp(saida);    
saida = strcat('Certeza em relação as características: ', num2str(ratio* 100),'%');
 disp(saida);  
saida = strcat('Acurácia do Classificador: ', num2str(validationAccuracy* 100),'%');
disp(saida);