function y = filtrar(y)
Fs=6800;


%filtro passa-faixas
N = 3;
fc1 = 50; fc2 = 3399.99;
wc = (2 * [fc1 fc2])/Fs;
[P,Q] = butter(N,wc,'bandpass');
y = filter(P,Q,y);

%filtro de ruido
y = denoiseEm(y);


%removedor de silencio
y = cell2mat( detectVoiced(y,Fs));

% %filtro de média móvel
% P = (1/N)*ones(1,N);
% Q = 1;
% y = filter(P,Q,y);
% sound(y,Fs);
% pause(2);


% %filtro envelope rms
% wl = 30;
% [up,down] =envelope(y,wl,'rms');
% sound(up,Fs);
% pause(2);
% 
% 
% y = up;


function y = denoiseEm(x);
% y = denoiseEm(x);
% method to denoise a given signal using wavelets
% x is the input Matlab sound file

%THR is the threshold, SORH is for soft or hard thresholding, KEEPAPP allows you to keep 
%approximation coefficients
[thr,sorh,keepapp]=ddencmp( 'den' , 'wv' ,x);  

% returns a de-noised version xc of input signal x (our one-dimensional speech signal) 
%obtained by wavelet coefficients thresholding using global positive threshold THR
%PERF0 and PERFL2 are L2-norm recovery and compression score in percentage.
[y, cxc, lxc, perf0, perfl2]=wdencmp( 'gbl' ,x, 'db3' ,2,thr,sorh,keepapp);



