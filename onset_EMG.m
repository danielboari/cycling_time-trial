function ind_data = onset_EMG(data,Freq,value,janela,dur)
% function ind=onset_EMG(data,fq,value)
% This function estimates movement/eletrical muscle activity onset. 
% Movement onset is considered only if values keep higher than threshold 
% for at least dur_ms ms.

% Baseline
data_baseline_mean = mean(data(1:janela*Freq)); %Baseline mean
data_baseline_sd = std(data(1:janela*Freq)); %SD of baseline
data_treshold = data_baseline_mean + value * data_baseline_sd; %Treshold to find the peaks

dur = dur*Freq; %minimum number of frames that has to be above treshold to call it the pertubation onset
fr_end = length(data)-dur;
fr = 0.05*Freq;
count = 0;
while count < 1 && fr <= fr_end
    if data(fr:fr+dur) > data_treshold & isequal(data(fr:fr+dur),sort(data(fr:fr+dur)))
        ind_data = fr;
        count = count + 1;
    else
        count = count;
    end
    fr = fr + 1;
end