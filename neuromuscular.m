clear,clc,close all

path = 'C:\Research Quarterly for Exercise and Sport\'; % folder where data is located
sujeito = {'S7'}; % 'S1'; 'S2'; 'S3'; 'S4'; 'S5'; 'S6'; 'S7'; 'S8' 
condicao = {'C2M2'}; % 'C1M1'; 'C1M2'; 'C1M3'; 'C2M1'; 'C2M2'; 'C2M3'
sufix = '.xlsx';

f_peak_total = {[] 'C1M1' 'C1M1' 'C1M1' 'C1M1' 'C1M1' 'C1M1' 'C1M1' 'C1M1' 'C1M1' 'C1M1' 'C1M1' 'C1M1' 'C1M1' 'C1M1' 'C1M1' 'C1M1' 'C1M1' 'C1M1' ...
    'C1M2' 'C1M2' 'C1M2' 'C1M2' 'C1M2' 'C1M2' 'C1M2' 'C1M2' 'C1M2' 'C1M2' 'C1M2' 'C1M2' 'C1M2' 'C1M2' 'C1M2' 'C1M2' 'C1M2' 'C1M2' ...
    'C1M3' 'C1M3' 'C1M3' 'C1M3' 'C1M3' 'C1M3' 'C1M3' 'C1M3' 'C1M3' 'C1M3' 'C1M3' 'C1M3' 'C1M3' 'C1M3' 'C1M3' 'C1M3' 'C1M3' 'C1M3' ...
    'C2M1' 'C2M1' 'C2M1' 'C2M1' 'C2M1' 'C2M1' 'C2M1' 'C2M1' 'C2M1' 'C2M1' 'C2M1' 'C2M1' 'C2M1' 'C2M1' 'C2M1' 'C2M1' 'C2M1' 'C2M1' ...
    'C2M2' 'C2M2' 'C2M2' 'C2M2' 'C2M2' 'C2M2' 'C2M2' 'C2M2' 'C2M2' 'C2M2' 'C2M2' 'C2M2' 'C2M2' 'C2M2' 'C2M2' 'C2M2' 'C2M2' 'C2M2' ...
    'C2M3' 'C2M3' 'C2M3' 'C2M3' 'C2M3' 'C2M3' 'C2M3' 'C2M3' 'C2M3' 'C2M3' 'C2M3' 'C2M3' 'C2M3' 'C2M3' 'C2M3' 'C2M3' 'C2M3' 'C2M3'; ...
    [] 'E1_1' 'E1_2' 'E1_3' 'E2_CVM' 'E2_1' 'E2_duplo1' 'E2_duplo2' 'E2_3' 'E3_CVM' 'E3_1' 'E3_duplo1' 'E3_duplo2' 'E3_3' 'E4_CVM' 'E4_1' 'E4_duplo1' 'E4_duplo2' 'E4_3' ...
    'E1_1' 'E1_2' 'E1_3' 'E2_CVM' 'E2_1' 'E2_duplo1' 'E2_duplo2' 'E2_3' 'E3_CVM' 'E3_1' 'E3_duplo1' 'E3_duplo2' 'E3_3' 'E4_CVM' 'E4_1' 'E4_duplo1' 'E4_duplo2' 'E4_3' ...
    'E1_1' 'E1_2' 'E1_3' 'E2_CVM' 'E2_1' 'E2_duplo1' 'E2_duplo2' 'E2_3' 'E3_CVM' 'E3_1' 'E3_duplo1' 'E3_duplo2' 'E3_3' 'E4_CVM' 'E4_1' 'E4_duplo1' 'E4_duplo2' 'E4_3' ...
    'E1_1' 'E1_2' 'E1_3' 'E2_CVM' 'E2_1' 'E2_duplo1' 'E2_duplo2' 'E2_3' 'E3_CVM' 'E3_1' 'E3_duplo1' 'E3_duplo2' 'E3_3' 'E4_CVM' 'E4_1' 'E4_duplo1' 'E4_duplo2' 'E4_3' ...
    'E1_1' 'E1_2' 'E1_3' 'E2_CVM' 'E2_1' 'E2_duplo1' 'E2_duplo2' 'E2_3' 'E3_CVM' 'E3_1' 'E3_duplo1' 'E3_duplo2' 'E3_3' 'E4_CVM' 'E4_1' 'E4_duplo1' 'E4_duplo2' 'E4_3' ...
    'E1_1' 'E1_2' 'E1_3' 'E2_CVM' 'E2_1' 'E2_duplo1' 'E2_duplo2' 'E2_3' 'E3_CVM' 'E3_1' 'E3_duplo1' 'E3_duplo2' 'E3_3' 'E4_CVM' 'E4_1' 'E4_duplo1' 'E4_duplo2' 'E4_3'};   
for t=1:length(sujeito)
    f_peak_total{t+2,1} = sujeito{t};
end
f_peak_estduplo = f_peak_total;
f_area_total = f_peak_total;
f_area_estduplo = f_peak_total;
f_tempocontr = f_peak_total;
f_temporelax = f_peak_total;
f_tempototal = f_peak_total;
f_peak_cvm = f_peak_total;
f_peak_preCVM = f_peak_total;
f_prodforce = f_peak_total;
f_prodforce_max = f_peak_total;
emg_integral = f_peak_total;
emg_rms = f_peak_total;
emg_rms_norm = f_peak_total;

col_tempo = 1;
col_sinc = 3;
col_ativ = 5;

Freq = 1000;
Fcut_f = 100;
Fcut_emg = [20 400];
[b_f,a_f] = butter(4,Fcut_f/(Freq/2));
[b_emg,a_emg] = butter(4,Fcut_emg/(Freq/2),'bandpass');

for s = 1:length(sujeito)
    for c = 1:length(condicao)
        arquivo = [path char(sujeito(s)) char(condicao(c)) sufix];
        
        if exist(arquivo,'file')
            fclose all;
            
            disp(arquivo)
            [date,txt,raw] = xlsread(arquivo,1);
            
            switch txt{4,2}
                case {'DTS LIN. FORCE 2.2 kN,N'}, col_f = 2; col_emg = 4;
                case {'RT VLO,uV'}, col_f = 4; col_emg = 2;
            end
            
            switch [char(sujeito(s)) char(condicao(c))]
                case {'S3C1M2';'S7C1M1';'S7C2M1'}, date_f = date(4:end,col_f);
                otherwise, date_f = filtfilt(b_f,a_f,date(4:end,col_f));
            end
            date_f_taxa = diffcentral(date_f) * Freq;
            
            date_emg = filtfilt(b_emg,a_emg,date(4:end,col_emg)); % EMG
            date_sinc = date(4:end,col_sinc);
            %                     date_ativ = date(4:end,col_ativ);
            clear date txt raw
            
            %                     figure, plot(date_emg,'k'), title('EMG')
            %                     figure, plot(date_f,'k'),title('Força')
            
            %% Beginning of Stimuli
            [sinc,ind_sinc] = findpeaks(date_sinc,'MinPeakHeight',1.5); ind_sinc = ind_sinc - 4;
            %                     figure, plot(date_sinc,'k'), hold on, plot(ind_sinc,date_sinc(ind_sinc),'ko'), title('Sinc')
            
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %% EMG
%             figure, plot(date_emg,'k'), hold on, plot(ind_sinc,date_emg(ind_sinc),'ko'),title('EMG')           
            
            date_iemg = cumtrapz([1/Freq:1/Freq:length(date_emg)/Freq],abs(date_emg));
%             figure, plot(date_iemg,'k'), hold on,  plot(ind_sinc,date_iemg(ind_sinc),'ko'), title('EMG')

            date_rms = rms_movel(date_emg,0.05*Freq,0.049*Freq,0);
%             figure, plot(date_rms,'k'), hold on, plot(ind_sinc,date_emg(ind_sinc),'ko'),title('EMG')

            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %% Force
%             figure, plot(date_f,'k'), hold on, plot(ind_sinc,date_f(ind_sinc),'kx'),title('Força')
%             figure, plot(date_f_taxa,'k')
                
            for col = 1:length(ind_sinc)
                switch col
                    case {4;9;14} % With voluntary contraction
                        
                        if isempty(findpeaks(date_f(ind_sinc(col):ind_sinc(col)+0.5*Freq),'NPeaks',1,'MinPeakHeight',date_f(ind_sinc(col))+5))
                            f_area_temp(col) = NaN;
                            f_area_1_temp(col) = NaN;
                            f_peak_temp(col) = NaN;
                            f_tempocontr_temp(col) = NaN;
                            f_temporelax_temp(col) = NaN;
                            f_tempototal_temp(col) = NaN;
                            f_peak_cvm_temp(col) = NaN;
                            f_peak_preCVM_temp(col) = NaN;
                            date_iemg_temp(col) = NaN;
                            date_rms_temp(col) = NaN;
                        else
                            
                            [f_peak_temp(col),ind_f_peak(col)] = findpeaks(date_f(ind_sinc(col):ind_sinc(col)+0.5*Freq),'NPeaks',1,'MinPeakHeight',date_f(ind_sinc(col))+5);
                            ind_f_peak(col) = ind_f_peak(col) + ind_sinc(col);
                            
                            ind_f_relax(col) = find(date_f(ind_f_peak(col):end) <= (f_peak_temp(col) - date_f(ind_sinc(col)))/2 + date_f(ind_sinc(col)),1,'first') + ind_f_peak(col);
                            
                            ind_f_final(col) = find(date_f(ind_f_peak(col):end) <= date_f(ind_sinc(col)),1,'first') + ind_f_peak(col);
                            
                            date_f_temp = date_f(ind_sinc(col):ind_f_final(col)) - date_f(ind_sinc(col));
                            f_area_temporario = cumtrapz([1/Freq:1/Freq:length(date_f_temp)/Freq],date_f_temp); clear date_f_temp
                            f_area_temp(col) = f_area_temporario(end); clear f_area_temporario
                            f_area_1_temp(col) = NaN;
                            
                            [f_peak_cvm_temp(col),ind_f_peak_cvm(col)] = max(date_f(ind_f_peak(col):ind_f_peak(col)+6*Freq));
                            ind_f_peak_cvm(col) = ind_f_peak_cvm(col) + ind_f_peak(col);
                            if f_peak_cvm_temp(col) <= f_peak_temp(col), f_peak_cvm_temp(col) = NaN; end
                            
%                             plot(ind_f_peak(col),date_f(ind_f_peak(col)),'ko')
%                             plot(ind_f_relax(col),date_f(ind_f_relax(col)),'ko')
%                             plot(ind_f_final(col),date_f(ind_f_final(col)),'ko')
%                             plot(ind_f_peak_cvm(col),date_f(ind_f_peak_cvm(col)),'ko')
                            
                            f_peak_temp(col) = f_peak_temp(col) - date_f(ind_sinc(col)); % peak do twitch - PT
                            f_peak_1_temp(col) = NaN;
                            f_tempocontr_temp(col) = (ind_f_peak(col) - ind_sinc(col))/Freq; % tempo de contração - CT
                            f_temporelax_temp(col) = (ind_f_relax(col) - ind_f_peak(col))/Freq; % Half-relaxation time - HRT
                            f_tempototal_temp(col) = (ind_f_final(col) - ind_sinc(col))/Freq; % Tempo Total de Força
                            
                            date_iemg_temp(col) = (date_iemg(ind_f_peak(col)+0.250*Freq) - date_iemg(ind_f_peak(col)-0.250*Freq)) / 0.5;
                            date_rms_temp(col) = rms(date_emg(ind_f_peak(col)-0.250*Freq:ind_f_peak(col)+0.250*Freq));
                            
                        end
                        
                        [f_peak_preCVM_temp(col),ind_f_peak_preCVM(col)] = max(date_f(ind_sinc(col)-2*Freq:ind_sinc(col)));
                        ind_f_peak_preCVM(col) = ind_f_peak_preCVM(col) + ind_sinc(col) - 2*Freq;
                        %                             plot(ind_f_peak_preCVM(col),date_f(ind_f_peak_preCVM(col)),'ko')
                        f_peak_preCVM_temp(col) = mean(date_f(ind_f_peak_preCVM(col)-0.05*Freq:ind_f_peak_preCVM(col)+0.05*Freq)) - date_f(ind_sinc(col-1));
%                         plot(ind_f_peak_preCVM(col),date_f(ind_f_peak_preCVM(col)),'ko')

                        
                    case {6;11;16} % Double Stimulus
                        
                        [f_peak_1_temp(col),ind_f_peak(col)] = findpeaks(date_f(ind_sinc(col):ind_sinc(col)+0.5*Freq),'NPeaks',1,'MinPeakHeight',date_f(ind_sinc(col))+5);
                        ind_f_peak(col) = ind_f_peak(col) + ind_sinc(col);
                        
                        if isempty(find(date_f(ind_f_peak(col):end) <= date_f(ind_sinc(col)),1,'first'))
                            ind_f_final(col) = find(date_f(ind_f_peak(col):end) <= mean(date_f(ind_sinc(col)-2*Freq:ind_sinc(col)-1*Freq)),1,'first') + ind_f_peak(col); 
                        else
                            ind_f_final(col) = find(date_f(ind_f_peak(col):end) <= date_f(ind_sinc(col)),1,'first') + ind_f_peak(col);
                        end
                        
                        if ind_sinc(col) < 0, neg = ind_sinc(col); else neg = 0; end
                        date_f_temp = date_f(ind_sinc(col):ind_f_final(col)) - date_f(ind_sinc(col));                      
                        f_area_temporario = cumtrapz([1/Freq:1/Freq:length(date_f_temp)/Freq],date_f_temp); clear date_f_temp
                        f_area_temp(col) = f_area_temporario(end); clear f_area_temporario
                        
                        date_f_temp = date_f(ind_sinc(col):ind_sinc(col+1)) + neg;                       
                        f_area_temporario = cumtrapz([1/Freq:1/Freq:length(date_f_temp)/Freq],date_f_temp); clear date_f_temp
                        f_area_1_temp(col) = f_area_temporario(end); clear f_area_temporario
                        
%                         plot(ind_f_peak(col),date_f(ind_f_peak(col)),'ko')
%                         plot(ind_f_final(col),date_f(ind_f_final(col)),'ko')
                        
                        f_peak_1_temp(col) = f_peak_1_temp(col) - date_f(ind_sinc(col)); % peak do twitch - PT
                        f_tempocontr_temp(col) = (ind_f_peak(col) - ind_sinc(col))/Freq; % tempo de contração - CT
                        f_temporelax_temp(col) = NaN; % Half-relaxation time - HRT
                        f_tempototal_temp(col) = (ind_f_final(col) - - ind_sinc(col))/Freq; % Tempo Total de Força
                        f_peak_cvm_temp(col) = NaN;
                        f_peak_preCVM_temp(col) = NaN;
                        
                        date_iemg_temp(col) = (date_iemg(ind_f_peak(col)+0.250*Freq) - date_iemg(ind_f_peak(col)-0.250*Freq)) / 0.5;
                        date_rms_temp(col) = rms(date_emg(ind_f_peak(col)-0.250*Freq:ind_f_peak(col)+0.250*Freq));
                        
                    case {7;12;17} % Double Stimulus
                        
                        [f_peak_1_temp(col),ind_f_peak(col)] = max(date_f(ind_sinc(col):ind_sinc(col)+0.5*Freq));
                        ind_f_peak(col) = ind_f_peak(col) + ind_sinc(col);
                        
                        ind_f_final(col) = find(date_f(ind_f_peak(col):end) <= date_f(ind_sinc(col)),1,'first') + ind_f_peak(col);
                        
                        if ind_sinc(col-1) < 0, neg = ind_sinc(col-1); else neg = 0; end
                        date_f_temp = date_f(ind_sinc(col):ind_f_final(col)) + neg;
                        f_area_temporario = cumtrapz([1/Freq:1/Freq:length(date_f_temp)/Freq],date_f_temp); clear date_f_temp
                        f_area_1_temp(col) = f_area_temporario(end); clear f_area_temporario
                        f_area_temp(col) = NaN;
                        
%                         plot(ind_f_peak(col),date_f(ind_f_peak(col)),'ko')
%                         plot(ind_f_final(col),date_f(ind_f_final(col)),'ko')
                        
                        f_peak_temp(col) = f_peak_1_temp(col) - date_f(ind_sinc(col-1)); % peak do twitch total - PT
                        f_peak_1_temp(col) = f_peak_1_temp(col) - date_f(ind_sinc(col)); % peak do twitch - PT
                        f_tempocontr_temp(col) = (ind_f_peak(col) - ind_sinc(col))/Freq; % tempo de contração - CT
                        f_temporelax_temp(col) = NaN; % Half-relaxation time - HRT
                        f_tempototal_temp(col) = (ind_f_final(col) - - ind_sinc(col))/Freq; % Tempo Total de Força
                        f_peak_cvm_temp(col) = NaN;
                        f_peak_preCVM_temp(col) = NaN;
                        
                        date_iemg_temp(col) = (date_iemg(ind_f_peak(col)+0.250*Freq) - date_iemg(ind_f_peak(col)-0.250*Freq)) / 0.5;
                        date_rms_temp(col) = rms(date_emg(ind_f_peak(col)-0.250*Freq:ind_f_peak(col)+0.250*Freq));
                        
                        
                    otherwise % No voluntary contraction
                        if ind_sinc(col)+0.5*Freq > length(date_f)
                            final = length(date_f);
                        else
                            final = ind_sinc(col)+0.5*Freq;
                        end
                        [f_peak_temp(col),ind_f_peak(col)] = max(date_f(ind_sinc(col):final));
                        ind_f_peak(col) = ind_f_peak(col) + ind_sinc(col);
                        
                        ind_f_relax(col) = find(date_f(ind_f_peak(col):end) <= (f_peak_temp(col)/2),1,'first') + ind_f_peak(col);

                        if isempty(find(date_f(ind_f_peak(col):end) <= date_f(ind_sinc(col)),1,'first'))
                            ind_f_final(col) = find(date_f(ind_f_peak(col):end) <= mean(date_f(ind_sinc(col)-2*Freq:ind_sinc(col)-1*Freq)),1,'first') + ind_f_peak(col); 
                        else
                            ind_f_final(col) = find(date_f(ind_f_peak(col):end) <= date_f(ind_sinc(col)),1,'first') + ind_f_peak(col);
                        end
                        
                        if ind_sinc(col) < 0, neg = ind_sinc(col); else, neg = 0; end
                        date_f_temp = date_f(ind_sinc(col):ind_f_final(col)) + neg;
                        f_area_temporario = cumtrapz([1/Freq:1/Freq:length(date_f_temp)/Freq],date_f_temp); clear date_f_temp
                        f_area_temp(col) = f_area_temporario(end); clear f_area_temporario
                        f_area_1_temp(col) = NaN;
                        
%                         plot(ind_f_peak(col),date_f(ind_f_peak(col)),'ko')
%                         plot(ind_f_relax(col),date_f(ind_f_relax(col)),'ko')
%                         plot(ind_f_final(col),date_f(ind_f_final(col)),'ko')
                        
                        f_peak_temp(col) = f_peak_temp(col) - date_f(ind_sinc(col)); % peak do twitch - PT
                        f_peak_1_temp(col) = NaN;
                        f_tempocontr_temp(col) = (ind_f_peak(col) - ind_sinc(col))/Freq; % tempo de contração - CT
                        f_temporelax_temp(col) = (ind_f_relax(col) - ind_f_peak(col))/Freq; % Half-relaxation time - HRT
                        f_tempototal_temp(col) = (ind_f_final(col) - ind_sinc(col))/Freq; % Tempo Total de Força
                        f_peak_cvm_temp(col) = NaN;
                        f_peak_preCVM_temp(col) = NaN;
                        
                        date_iemg_temp(col) = (date_iemg(ind_f_peak(col)+0.250*Freq) - date_iemg(ind_f_peak(col)-0.250*Freq)) / 0.5;
                        date_rms_temp(col) = rms(date_emg(ind_f_peak(col)-0.250*Freq:ind_f_peak(col)+0.250*Freq));
                        
                end
                
                % Force Production Rate: 10% to 90% of peak
                switch col
                    case {6;7;11;12;16;17}
                        f_prodforce_temp(col) = NaN;
                        f_prodforce_max_temp(col) = NaN;
                    otherwise
                        if isnan(f_peak_temp(col))
                            f_prodforce_temp(col) = NaN;
                            f_prodforce_max_temp(col) = NaN;
                        else
                            ind_f_010peak(col) = find(date_f(ind_sinc(col):end) >= (0.1 * f_peak_temp(col) + date_f(ind_sinc(col))),1,'first') + ind_sinc(col);
                            ind_f_090peak(col) = find(date_f(ind_sinc(col):end) >= (0.9 * f_peak_temp(col) + date_f(ind_sinc(col))),1,'first') + ind_sinc(col);
%                             plot(ind_f_010peak(col),date_f(ind_f_010peak(col)),'kx'), plot(ind_f_090peak(col),date_f(ind_f_090peak(col)),'kx')
                            f_prodforce_temp(col) = (date_f(ind_f_090peak(col)) - date_f(ind_f_010peak(col))) / ((ind_f_090peak(col) - ind_f_010peak(col))/Freq);
                            f_prodforce_max_temp(col) = max(date_f_taxa(ind_f_010peak(col):ind_f_090peak(col)));
                        end
                end
                
            end
            
            for col = 1:length(ind_sinc)
                date_rms_norm_temp(col) = date_rms_temp(col) / max(date_rms);
            end
            
        else
            disp([arquivo ' does not exist.'])
            f_area_temp = NaN;
            f_area_1_temp = NaN;
            f_peak_temp = NaN;
            f_peak_1_temp = NaN;
            f_tempocontr_temp = NaN;
            f_temporelax_temp = NaN;
            f_tempototal_temp = NaN;
            f_peak_cvm_temp = NaN;
            f_peak_preCVM_temp(col) = NaN;
            date_iemg_temp = NaN;
            date_rms_temp = NaN;
            date_rms_norm_temp = NaN;
            f_prodforce_temp = NaN;
            f_prodforce_max_temp(col) = NaN;
        end
        
        switch char(condicao(c))
            case {'C1M1'}, col_cond = 1;
            case {'C1M2'}, col_cond = 19;
            case {'C1M3'}, col_cond = 37;
            case {'C2M1'}, col_cond = 55;
            case {'C2M2'}, col_cond = 73;
            case {'C2M3'}, col_cond = 91;
        end
        
        for col = 1:length(f_peak_temp)
            f_area_total{s+2,col_cond + col} = f_area_temp(col);
            f_area_estduplo{s+2,col_cond + col} = f_area_1_temp(col);
            f_peak_total{s+2,col_cond + col} = f_peak_temp(col);
            f_peak_estduplo{s+2,col_cond + col} = f_peak_1_temp(col);
            f_tempocontr{s+2,col_cond + col} = f_tempocontr_temp(col);
            f_temporelax{s+2,col_cond + col} = f_temporelax_temp(col);
            f_tempototal{s+2,col_cond + col} = f_tempototal_temp(col);
            f_peak_cvm{s+2,col_cond + col} = f_peak_cvm_temp(col);
            f_peak_preCVM{s+2,col_cond + col} = f_peak_preCVM_temp(col);
            f_prodforce{s+2,col_cond + col} = f_prodforce_temp(col);
            f_prodforce_max{s+2,col_cond + col} = f_prodforce_max_temp(col);
            emg_integral{s+2,col_cond + col} = date_iemg_temp(col);
            emg_rms{s+2,col_cond + col} = date_rms_temp(col);
            emg_rms_norm{s+2,col_cond + col} = date_rms_norm_temp(col);
        end
        
        clear date_f date_f_taxa date_emg date_sinc date_iemg date_rms
        clear f_area_temp f_area_1_temp f_peak_temp f_peak_1_temp f_tempocontr_temp f_temporelax_temp f_tempototal_temp f_peak_cvm_temp date_iemg_temp f_prodforce_temp f_prodforce_max_temp
        clear ind_f_peak ind_sinc ind_f_relax ind_f_final ind_f_relax 
        
    end
end