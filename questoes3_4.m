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
saveas(gcf,'images/FrequencyResponseAnalog','png')

figure;
zplane(num,den)
title('Filtro Analógico')
saveas(gcf,'images/ZeroPoleAnalog','png')


%%%%% metodo 2 de salvar
freqzDigitalFig = figure;
freqz(numDigital,denDigital,10000)
title('Filtro Digital')
zPlaneDigitalFig = figure;
zplane(numDigital,denDigital)
title('Filtro Digital')


saveas(zPlaneDigitalFig,'images/FrequencyResponseDigital','png')
saveas(freqzDigitalFig,'images/ZeroPoleDigital','png')

% ah = findobj('Type','figure'); % get all figures
% for m=1:numel(ah) % go over all axes
%   set(findall(ah(m),'-property','FontSize'),'FontSize',16)
%    axes_handle = findobj(ah(m),'type','axes');
%    ylabel_handle = get(axes_handle,'ylabel');
%    set(ah(m),'Color','w')
%   % saveas(ah(m),[ylabel_handle.String num2str(m) '.png'])
% end

%% Questão 4
