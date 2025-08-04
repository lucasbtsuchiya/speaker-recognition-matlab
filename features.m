function f = features(x)
x = filtrar(x);
winsize = 2^9;
wininc = 2^4;
J = 4;%% 16 folhas no nivel mais baixo da arvore
toolbox = 'matlab';
f = getmswpfeat(x,winsize,wininc,J,toolbox);
f = f(:,1:16);
[l,c] = size(f);
fa = f(1:round(l/2),:);

