clear all
%%em desuso
return;
try
    load database;
    if(duracao<=0)
        error('duração inválida.');
    end
catch
    duracao = input('Duração da gravação: ');
    save database duracao;
end

Fs=6800; %frequencia de amostragem do sinal
record = audiorecorder(Fs,16,1,1); %criando o objeto de gravador de áudio a 44,1 kHz e 16 bits por amostra.
disp('Comece a falar!');
recordblocking(record, duracao);
disp('Fim da gravação...');
y=getaudiodata(record); %Obténdo dados de áudio gravados no objeto audiorecord com getaudiodata.
sound(y,Fs);
in = input('Gravar no banco?[s/n]:','s');
if in=='s'
    in = input('Id da Classe?:');
    try
        ids = [ids in];
        sons = [sons y];
        save database ids sons duracao;
    catch
        ids = in;
        sons = y;
        save database ids sons duracao;
    end
end
