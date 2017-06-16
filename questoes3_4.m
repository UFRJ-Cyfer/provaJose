%% Questão 3

fs = 1e5; % Hz
fBandPass = 15e3; % Hz
attBandPass = 0.3; % dB
attBandRej = 42; % dB
fc = 25e3; % Hz

Wp = fBandPass/(fs/2);
Ws = fc/(fs/2);


%%% letra A
[n,Wn] = buttord(Wp,Ws,attBandPass,attBandRej,'s')

%%% letra B
[num, den] = butter(n,Wn);


%%% letra C
[nDigital,WnDigital] = buttord(Wp,Ws,attBandPass,attBandRej)
[numDigital, denDigital] = butter(nDigital,WnDigital);


%%% letra D
figure;
freqz(num,den,10000)
title('Filtro Analógico')

figure;
zplane(num,den)
title('Filtro Analógico')

figure;
freqz(numDigital,denDigital,10000)
title('Filtro Digital')

figure;
zplane(numDigital,denDigital)
title('Filtro Digital')

%% Questão 4
