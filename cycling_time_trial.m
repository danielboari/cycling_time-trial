
clear,clc,close all

path = 'C:\Research Quarterly for Exercise and Sport\'; % folder where data is located
sujeito = {'S2'; 'S3'; 'S4'; 'S5'; 'S8'}; % 'S2'; 'S3'; 'S4'; 'S5'; 'S8' 
condicao = {'C1'; 'C2'}; % 'C1'; 'C2'
sufix = '.xlsx';

tempo_contr = {[] 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' ...
    'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' ...
    'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' ...
    'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' ...
    'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' ...
    'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' ...
    'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' ...
    'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' ...
    'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' ...
    'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2'; ...
    [] '10v-400m' '9v-400m' '8v-400m' '7v-400m' '6v-400m' '5v-400m' '4v-400m' '3v-400m' '2v-400m' '1v-400m' ...
    '10v-800m' '9v-800m' '8v-800m' '7v-800m' '6v-800m' '5v-800m' '4v-800m' '3v-800m' '2v-800m' '1v-800m' ...
    '10v-1200m' '9v-1200m' '8v-1200m' '7v-1200m' '6v-1200m' '5v-1200m' '4v-1200m' '3v-1200m' '2v-1200m' '1v-1200m' ...
    '10v-1600m' '9v-1600m' '8v-1600m' '7v-1600m' '6v-1600m' '5v-1600m' '4v-1600m' '3v-1600m' '2v-1600m' '1v-1600m' ...
    '10v-2000m' '9v-2000m' '8v-2000m' '7v-2000m' '6v-2000m' '5v-2000m' '4v-2000m' '3v-2000m' '2v-2000m' '1v-2000m' ...
    '10v-2400m' '9v-2400m' '8v-2400m' '7v-2400m' '6v-2400m' '5v-2400m' '4v-2400m' '3v-2400m' '2v-2400m' '1v-2400m' ...
    '10v-2800m' '9v-2800m' '8v-2800m' '7v-2800m' '6v-2800m' '5v-2800m' '4v-2800m' '3v-2800m' '2v-2800m' '1v-2800m' ...
    '10v-3200m' '9v-3200m' '8v-3200m' '7v-3200m' '6v-3200m' '5v-3200m' '4v-3200m' '3v-3200m' '2v-3200m' '1v-3200m' ...
    '10v-3600m' '9v-3600m' '8v-3600m' '7v-3600m' '6v-3600m' '5v-3600m' '4v-3600m' '3v-3600m' '2v-3600m' '1v-3600m' ...
    '10v-4000m' '9v-4000m' '8v-4000m' '7v-4000m' '6v-4000m' '5v-4000m' '4v-4000m' '3v-4000m' '2v-4000m' '1v-4000m' ...
    '10v-400m' '9v-400m' '8v-400m' '7v-400m' '6v-400m' '5v-400m' '4v-400m' '3v-400m' '2v-400m' '1v-400m' ...
    '10v-800m' '9v-800m' '8v-800m' '7v-800m' '6v-800m' '5v-800m' '4v-800m' '3v-800m' '2v-800m' '1v-800m' ...
    '10v-1200m' '9v-1200m' '8v-1200m' '7v-1200m' '6v-1200m' '5v-1200m' '4v-1200m' '3v-1200m' '2v-1200m' '1v-1200m' ...
    '10v-1600m' '9v-1600m' '8v-1600m' '7v-1600m' '6v-1600m' '5v-1600m' '4v-1600m' '3v-1600m' '2v-1600m' '1v-1600m' ...
    '10v-2000m' '9v-2000m' '8v-2000m' '7v-2000m' '6v-2000m' '5v-2000m' '4v-2000m' '3v-2000m' '2v-2000m' '1v-2000m' ...
    '10v-2400m' '9v-2400m' '8v-2400m' '7v-2400m' '6v-2400m' '5v-2400m' '4v-2400m' '3v-2400m' '2v-2400m' '1v-2400m' ...
    '10v-2800m' '9v-2800m' '8v-2800m' '7v-2800m' '6v-2800m' '5v-2800m' '4v-2800m' '3v-2800m' '2v-2800m' '1v-2800m' ...
    '10v-3200m' '9v-3200m' '8v-3200m' '7v-3200m' '6v-3200m' '5v-3200m' '4v-3200m' '3v-3200m' '2v-3200m' '1v-3200m' ...
    '10v-3600m' '9v-3600m' '8v-3600m' '7v-3600m' '6v-3600m' '5v-3600m' '4v-3600m' '3v-3600m' '2v-3600m' '1v-3600m' ...
    '10v-4000m' '9v-4000m' '8v-4000m' '7v-4000m' '6v-4000m' '5v-4000m' '4v-4000m' '3v-4000m' '2v-4000m' '1v-4000m'};   
tempo_contr_media = {[] 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C1' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2' 'C2'; ...
    [] '400m' '800m' '1200m' '1600m' '2000m' '2400m' '2800m' '3200m' '3600m' '4000m' ...
    '400m' '800m' '1200m' '1600m' '2000m' '2400m' '2800m' '3200m' '3600m' '4000m'}; 
for t=1:length(sujeito)
    tempo_contr{t+2,1} = sujeito{t};
end
emg_integral = tempo_contr;
emg_rms = tempo_contr;
emg_rms_norm = tempo_contr;

col_tempo = 1;

Freq_emg = 1000;
Fcut_emg = [20 400];
[b_emg,a_emg] = butter(4,Fcut_emg/(Freq_emg/2),'bandpass'); % EMG

for s = 1:length(sujeito)
    for c = 1:length(condicao)
        arquivo = [path char(sujeito(s)) char(condicao(c)) sufix];
        
        switch char(condicao(c))
            case {'C1'}, col = 1;
            case {'C2'}, col = 101;
        end
        
        switch [char(sujeito(s)) char(condicao(c))]
            case {'S2C1';'S2C2'}
                col_emg = 2; col_volta = 5;
            case {'S3C1';'S3C2'}
                col_emg = 4; col_volta = 5;
            otherwise
                col_emg = 4; col_volta = 6;
        end
        
        if exist(arquivo,'file')
            ativ = 1;
            
            disp(arquivo)
            date = xlsread(arquivo);
            
            date_emg = filtfilt(b_emg,a_emg,date(5:end,col_emg)); % EMG
            date_volta = date(5:end,col_volta); % figure, plot(date_volta)
            clear date
            
%             figure, plot(date_emg,'k'), title('EMG')
            
            % 400 m frame
            ind_volta = find(date_volta > 0.5);
            ind_400m = ind_volta(2:2:end);
%             figure, plot(date_volta,'k'), title('Sincronização')
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %% EMG
            date_iemg = cumtrapz([1/Freq_emg:1/Freq_emg:length(date_emg)/Freq_emg],abs(date_emg));
%             figure, plot(date_iemg,'k')
            
            date_rms = rms_movel(date_emg,0.05*Freq_emg,0.049*Freq_emg,0);
%             figure, plot(date_rms,'k'), hold on
            
            switch [char(sujeito(s)) char(condicao(c))]
                case {'S2C1';'S2C2'}, valor = 0.25;
                case {'S4C1'}, valor = 0.10;
                otherwise, valor = 0.15;
            end

            [date_max,ind_date_max,ind_date_015max] = max_movel(date_rms,5*Freq_emg,0,0,valor);
            %                     plot(ind_date_max,date_rms(ind_date_max),'ro')
            ind_onset = diffcentral(ind_date_015max');
            ind_onset = ind_date_015max(ind_onset > 10);
            %                     plot(ind_onset,date_rms(ind_onset),'ro')
            
            
            % 10 contractions before 400 m
            for i = 1:length(ind_400m)
%                 plot([ind_400m(i),ind_400m(i)],[max(date_rms),min(date_rms)],'r')
                % check if the end of the lap occurs in relaxation or muscle contraction
                ind_onset_400m = [find(ind_onset <= ind_400m(i)) find(ind_onset >= ind_400m(i),1,'first')];
                if date_rms(ind_400m(i)) < min(date_rms(ind_onset)) - 10 % relaxamento
                    ind_onset_volta = ind_onset(ind_onset_400m(end-20:end-1));
                else % contraction
                    ind_onset_volta = ind_onset(ind_onset_400m(end-19:end));
                end
                                
%                 plot(ind_onset_volta,date_rms(ind_onset_volta),'ro')
                
                % Values for Normalization
                emg_rms_max = max(date_rms);
                
                for j = 1:2:20
                    tempo_contr{s+2,col+ativ} = (ind_onset_volta(j+1)-ind_onset_volta(j)) / Freq_emg;
                    if tempo_contr{s+2,col+ativ} < 0.1,
                        tempo_contr{s+2,col+ativ} = NaN;
                        emg_integral{s+2,col+ativ} = NaN;
                        emg_rms{s+2,col+ativ} = NaN;
                        emg_rms_norm{s+2,col+ativ} = NaN;
                    else
                        emg_integral{s+2,col+ativ} = (date_iemg(ind_onset_volta(j+1)) - date_iemg(ind_onset_volta(j))) / tempo_contr{s+2,col+ativ};
%                         emg_rms{s+2,col+ativ} = rms(date_emg(ind_onset_volta(j):ind_onset_volta(j+1)));
                        emg_rms{s+2,col+ativ} = max(date_rms(ind_onset_volta(j):ind_onset_volta(j+1)));
                        emg_rms_norm{s+2,col+ativ} = emg_rms{s+2,col+ativ} / emg_rms_max;
                    end
                    
                    ativ = ativ + 1;
                end             
                
            end
            
        else
            disp([arquivo ' does not exist.'])
        end
        
        clear date_emg date_volta date_iemg date_rms
        clear ind_onset_volta ind_onset ind_400m emg_rms_max
        
    end
end