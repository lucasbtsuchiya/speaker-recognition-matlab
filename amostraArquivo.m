function amostraArquivo(id,arquivo,tocar,treinar)
[y,Fs] = audioread(arquivo);%Obténdo dados de áudio gravados no objeto audiorecord com getaudiodata.
if(Fs> 6800)
    newFs = 6800 ;
    [P,Q] = rat(newFs/Fs);
    Fs = newFs;
    y = y(:,1);
    y = resample(y,P,Q);
end
if tocar
    sound(y,Fs);
end
    try
        load databaseArquivo
        ids = [ids id];
        sons = [sons y];
        save databaseArquivo ids sons;
    catch
        ids = id;
        sons = y;
        save databaseArquivo ids sons;
    end
    if treinar
        treinarClassificador();
    end
end
