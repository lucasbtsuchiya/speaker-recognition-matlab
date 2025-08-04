sair = false;
try
    disp('carregando classificador...')
    load cassificador
catch
    disp('O classificador ainda não foi treinado. Adicione um som para treina-lo.');
    pause(2);
end 
while ~sair

    
    
clc;
disp('Sistema de Reconhecimento de Locutor');
disp('');
disp('');
disp('Escolha uma opção: ');
disp('1. Registrar amostra ');
disp('2. Registrar amostra de arquivo ');
disp('3. Reconhecer locutor ');
disp('4. Reconhecer locutor de um arquivo de som ');
disp('5. Treinar/Estatisticas do Classificador');
disp('6. Sair ');
op = input('Opção:');
    if op > 6 || op < 1
        clc;
        disp('Opção Inválida');
        pause(2);
    else
        clc;
        switch op
            case 1
                 disp('Registrar amostra');
                 amostraVoz(input('Id da Classe?:'),true);
            case 2
                 disp('Registrar amostra de arquivo');
                 amostraArquivo(input('Id da Classe?:'),input('Nome do Arquivo *.wav?:','s'),true,true);
            case 3
                 disp('Reconhecer locutor');
                 testarVoz();
                 disp('');
                 input('Aperte Enter para continuar');
             case 4
                 disp('Reconhecer locutor de um arquivo de som');
                 testarArquivo(input('Nome do Arquivo *.wav?:','s'));
                 disp('');
                 input('Aperte Enter para continuar');
           
            case 5
                [trainedClassifier, validationAccuracy]= treinarClassificador();
                disp(strcat('Acuracia do Classfificador: ',num2str(validationAccuracy * 100),'%'));   
                disp('');
                input('Aperte Enter para continuar');
            case 6
                 sair = true;
        end
    end
end
