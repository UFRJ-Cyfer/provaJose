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

%%%%% metodo 1 de salvar
figure;
freqz(num,den,10000)
title('Filtro Analógico')
saveas(gcf,'images/questao3/FrequencyResponseAnalog','png')

figure;
zplane(num,den)
title('Filtro Analógico')
saveas(gcf,'images/questao3/ZeroPoleAnalog','png')


%%%%% metodo 2 de salvar
freqzDigitalFig = figure;
freqz(numDigital,denDigital,10000)
title('Filtro Digital')
zPlaneDigitalFig = figure;
zplane(numDigital,denDigital)
title('Filtro Digital')


saveas(zPlaneDigitalFig,'images/questao3/FrequencyResponseDigital','png')
saveas(freqzDigitalFig,'images/questao3/ZeroPoleDigital','png')

% ah = findobj('Type','figure'); % get all figures
% for m=1:numel(ah) % go over all axes
%   set(findall(ah(m),'-property','FontSize'),'FontSize',16)
%    axes_handle = findobj(ah(m),'type','axes');
%    ylabel_handle = get(axes_handle,'ylabel');
%    set(ah(m),'Color','w')
%   % saveas(ah(m),[ylabel_handle.String num2str(m) '.png'])
% end

%% Questão 4
nPoints = 128; % nao sei quantos pontos devem ser aqui....
blackmanWindow = blackman(128);

bHamming = fir1(hammingOrder, angularFrequencyHamming);
bBlackman = fir1(blackmanOrder, angularFrequencyBlackman, blackmanWindow);

hammingFig = figure;
freqz(bHamming)
title('Janela de Hamming')

blackmanFig = figure;
freqz(bBlackman)
title('Janela de Blackman')

saveas(hammingFig,'images/questao4/hammingFilter','png')
saveas(blackmanFig,'images/questao4/blackmanFilter','png')
