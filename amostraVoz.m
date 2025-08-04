function amostraVoz(id,tocar)
try
    load database;
    if(duracao<=0)
        error('dura��o inv�lida.');
    end
catch
    duracao = input('Dura��o da grava��o: ');
end

Fs=6800; %frequencia de amostragem do sinal
record = audiorecorder(Fs,16,1,1); %criando o objeto de gravador de �udio a 44,1 kHz e 16 bits por amostra.
disp('Comece a falar!');
recordblocking(record, duracao);
disp('Fim da grava��o...');
y=getaudiodata(record); %Obt�ndo dados de �udio gravados no objeto audiorecord com getaudiodata.
if tocar
    sound(filtrar(y),Fs);
end
    try
        ids = [ids id];
        sons = [sons y];
        save database ids sons duracao;
    catch
        ids = id;
        sons = y;
        save database ids sons duracao;
    end
    treinarClassificador();
end