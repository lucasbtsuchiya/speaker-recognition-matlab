function [y,Fs] = amostraTeste()
try
    load database;
catch
    duracao = input('Duração da gravação: ');
end

Fs=6800; %frequencia de amostragem do sinal
record = audiorecorder(Fs,16,1,1); %criando o objeto de gravador de áudio a 44,1 kHz e 16 bits por amostra.
disp('Comece a falar!');
recordblocking(record, duracao);
disp('Fim da gravação...');
y=getaudiodata(record); %Obténdo dados de áudio gravados no objeto audiorecord com getaudiodata.
sound(y,Fs);
