function [trainedClassifier, validationAccuracy] =  treinarClassificador()

basesFaltantes = 0;

feats = [];
featsRNAReady = [];
classesRNAReady = [];
try
load database
[l,c] = size(sons);


for i=1:c
    som = sons(:,i);
    somFeats = features(som);
    [lFeats,cFeats] = size(somFeats);
    
    id_classe = repmat(ids(i),lFeats,1);
    classe = zeros(1,4);
    classe(ids(i)) = 1;
    classe = repmat(classe,lFeats,1);
    feats = [feats; [id_classe somFeats]];
    featsRNAReady = [featsRNAReady; somFeats];
    classesRNAReady = [classesRNAReady; classe];
%     figure;
%     scatter(somFeats,yFeats);
%     lsline
end
catch
    basesFaltantes = basesFaltantes+1;
end
try
load databaseArquivo
[l,c] = size(sons);

for i=1:c
    som = sons(:,i);
    somFeats = features(som);
    [lFeats,cFeats] = size(somFeats);
    
    id_classe = repmat(ids(i),lFeats,1);
    classe = zeros(1,4);
    classe(ids(i)) = 1;
    classe = repmat(classe,lFeats,1);
    feats = [feats; [id_classe somFeats]];
    featsRNAReady = [featsRNAReady; somFeats];
    classesRNAReady = [classesRNAReady; classe];
%     figure;
%     scatter(somFeats,yFeats);
%     lsline
end
catch
    basesFaltantes = basesFaltantes+1;
end

if(basesFaltantes>1)
    error('Não é possível continuar. As bases de dados estão vazias.');
    return;
end
featsRNAReady = featsRNAReady';
classesRNAReady= classesRNAReady';
save features featsRNAReady classesRNAReady ;

disp('Treinando classificador...');
[trainedClassifier, validationAccuracy] = trainClassifier(feats);
    save cassificador trainedClassifier validationAccuracy

