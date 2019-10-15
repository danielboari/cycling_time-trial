function [data_retif,data_filter2,data_rmsemg,data_iemg] = tratamento_EMG_xcorr(data,Freq,Freqcutenv)

% data = detrend(data);

% retificaçao:
data_retif = abs(data);

% envoltorio por filtragem
[b,a] = butter(4,Freqcutenv/(Freq/2),'low');

data_filt = filtfilt(b,a,data_retif);
data_filter = filter(b,a,data_retif);

% correlação entre os sinais filtrados por filtfilt e filter
correlacao = xcorr(data_filt,data_filter,'coeff');
[data_filt_filter,posicao] = max(correlacao);
data_filt_filter_tempo = (posicao - length(correlacao)/2)/Freq;
data_filter2 = data_filter(round(abs(data_filt_filter_tempo)*Freq):end);

% % baseline removing
% filtro_baseline = mean(data_filter2(1:0.5*Freq));
% filtro = data_filter2 - filtro_baseline;

% % normalização
% filtro = filtro/max_amplitude;

% RMS
data_rmsemg = rms(data);

% Integração
data_iemg = cumtrapz(data_filter2);


function y=rms(x)
y = sqrt(mean(x.^2));