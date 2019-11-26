classdef AFE4400 < handle
    
    properties 
        serialPort;
        registers;
        nSamples;
        led1;
        led2;
        aled1;
        aled2;
        led1_aled1;
        led2_aled2;
    end
    
    methods
        function obj = AFE4400(comPort)
            obj.serialPort = serial(comPort);
            obj.serialPort.BaudRate = 230400;
            %obj.serialPort.TimeOut = 1000;
            obj.serialPort.InputBufferSize = 512;
            
            obj.registers = RegistersAFE4400();
        end
        
        function init(obj)
            fopen(obj.serialPort);
            
            % get device information
            fwrite(obj.serialPort, hex2dec({'04', '0D'}));
            device = fread(obj.serialPort);
            disp( sprintf('Device Information: AFE%s\n', device(3:6, 1)') );
            
            % get firmware information
            fwrite(obj.serialPort, hex2dec({'07','0D'}));
            firmwareVersion = fread(obj.serialPort);
            %disp( sprintf('Firmware Version: %d.%d\n', firmwareVersion(3, 1), firmwareVersion(4, 1)) );
            
         %SET EVM DEFAULT
         fwrite(obj.serialPort, hex2dec({'02', '32', '30', '30', '30', '30', '30', '30', '30', '0D'})); 
         fwrite(obj.serialPort, hex2dec({'02', '30', '30', '30', '30', '30', '30', '30', '38', '0D'})); 
         fwrite(obj.serialPort, hex2dec({'02', '30', '30', '30', '30', '30', '30', '30', '30', '0D'})); 
         fwrite(obj.serialPort, hex2dec({'02', '30', '30', '30', '30', '30', '30', '30', '38', '0D'})); 
         fwrite(obj.serialPort, hex2dec({'02', '30', '30', '30', '30', '30', '30', '30', '30', '0D'})); 
         fwrite(obj.serialPort, hex2dec({'02', '30', '31', '30', '30', '31', '37', '43', '30', '0D'})); 
         fwrite(obj.serialPort, hex2dec({'02', '30', '32', '30', '30', '31', '46', '33', '45', '0D'})); 
         fwrite(obj.serialPort, hex2dec({'0', '30', '33', '30', '30', '31', '37', '37', '30', '0D'})); 
         fwrite(obj.serialPort, hex2dec({'02', '30', '34', '30', '30', '31', '46', '33', '46', '0D'})); 
         fwrite(obj.serialPort, hex2dec({'02', '30', '35', '30', '30', '30', '30', '35', '30', '0D'})); 
         fwrite(obj.serialPort, hex2dec({'02', '30', '36', '30', '30', '30', '37', '43', '45', '0D'})); 
         fwrite(obj.serialPort, hex2dec({'02', '30', '37', '30', '30', '30', '38', '32', '30', '0D'})); 
         fwrite(obj.serialPort, hex2dec({'02', '30', '38', '30', '30', '30', '46', '39', '45', '0D'})); 
         fwrite(obj.serialPort, hex2dec({'02', '30', '39', '30', '30', '30', '37', '44', '30', '0D'})); 
         fwrite(obj.serialPort, hex2dec({'02', '30', '41', '30', '30', '30', '46', '39', '46', '0D'})); 
         fwrite(obj.serialPort, hex2dec({'02', '30', '42', '30', '30', '30', '46', '46', '30', '0D'})); 
         fwrite(obj.serialPort, hex2dec({'02', '30', '43', '30', '30', '31', '37', '36', '45', '0D'})); 
         fwrite(obj.serialPort, hex2dec({'02', '30', '44', '30', '30', '30', '30', '30', '36', '0D'})); 
         fwrite(obj.serialPort, hex2dec({'02', '30', '45', '30', '30', '30', '37', '43', '46', '0D'})); 
         fwrite(obj.serialPort, hex2dec({'02', '30', '46', '30', '30', '30', '37', '44', '36', '0D'})); 
         fwrite(obj.serialPort, hex2dec({'02', '31', '30', '30', '30', '30', '46', '39', '46', '0D'})); 
         fwrite(obj.serialPort, hex2dec({'02', '31', '31', '30', '30', '30', '46', '41', '36', '0D'})); 
         fwrite(obj.serialPort, hex2dec({'02', '31', '32', '30', '30', '31', '37', '36', '46', '0D'})); 
         fwrite(obj.serialPort, hex2dec({'02', '31', '33', '30', '30', '31', '37', '37', '36', '0D'})); 
         fwrite(obj.serialPort, hex2dec({'02', '31', '34', '30', '30', '31', '46', '33', '46', '0D'})); 
         fwrite(obj.serialPort, hex2dec({'02', '31', '36', '30', '30', '30', '30', '30', '35', '0D'})); 
         fwrite(obj.serialPort, hex2dec({'02', '31', '37', '30', '30', '30', '37', '44', '30', '0D'})); 
         fwrite(obj.serialPort, hex2dec({'02', '31', '38', '30', '30', '30', '37', '44', '35', '0D'})); 
         fwrite(obj.serialPort, hex2dec({'02', '31', '39', '30', '30', '30', '46', '41', '30', '0D'})); 
         fwrite(obj.serialPort, hex2dec({'02', '31', '41', '30', '30', '30', '46', '41', '35', '0D'})); 
         fwrite(obj.serialPort, hex2dec({'02', '31', '42', '30', '30', '31', '37', '37', '30', '0D'})); 
         fwrite(obj.serialPort, hex2dec({'02', '31', '43', '30', '30', '31', '37', '37', '35', '0D'})); 
         fwrite(obj.serialPort, hex2dec({'02', '31', '44', '30', '30', '31', '46', '33', '46', '0D'})); 
         fwrite(obj.serialPort, hex2dec({'02', '31', '45', '30', '30', '30', '31', '30', '31', '0D'})); 
         fwrite(obj.serialPort, hex2dec({'02', '32', '32', '30', '31', '31', '34', '31', '34', '0D'})); 
         fwrite(obj.serialPort, hex2dec({'02', '32', '30', '30', '30', '30', '30', '30', '30', '0D'})); 
         %Corrente do Led1
         fwrite(obj.serialPort, hex2dec({'02', '32', '32', '30', '31', '32', '42', '31', '34', '0D'}));
         
        end
        
        function close(obj)
            fclose(obj.serialPort);
        end
        
function [frequencia SDNN SDANN SDNNindex RMSSD SDSD] = calculateCardFrequency(obj)         

%******************Determinação dos Picos - 10s***************************%
PRF = 500;
s_10 = obj.led1_aled1(1:5000);
t_10 = [0:1/PRF:(1/PRF)*5000];
t_10(1) = [];
[amp_pico,pos_pico] = findpeaks(s_10,'MinPeakHeight',mean(s_10),'MinPeakDistance',220);
%********************** Tempo dos Picos - 10s ****************************%
timeP = t_10(pos_pico);          
timeP_1 = [0 timeP];
timeP_2 = [timeP 0];
timeP = timeP_2 - timeP_1;
timeP(1) = [];
timeP(size(timeP, 2)) = [];            
            
%******************** Cálculos Iniciais - 10s *****************************%
md_10 = mean(timeP);       % Cálculo da média dos 10s
std_10 = std(timeP);       % Cálculo do desvio Padrão dos 10s
h1 = md_10 - 2*(std_10);   % Limiar inferior
h2 = md_10 + 2*(std_10);   % Limiar superior            
            

%****************** Sinal Total - Detecção de Picos **********************%
y = abs(obj.led1_aled1).^2;
tempo_t = [0:1/PRF:(1/PRF)*obj.nSamples];
[peaks,locs] = findpeaks(y,'MinPeakHeight',mean(s_10),'MinPeakDistance',220);
            
%********************* Tempo dos Picos - Total ***************************%
val_temp = tempo_t(locs);
timePeaks_1 = [0 val_temp];
timePeaks_2 = [val_temp 0];
timePeaks = timePeaks_2 - timePeaks_1;
timePeaks(1) = [];
timePeaks(size(timePeaks, 2)) = [];            
            
%*********************** Batimentos Ectópicos ****************************%
i = 1;
for k=1:length(timePeaks)-1
        if(timePeaks(k) > h1)
        if(timePeaks(k) < h2)
           dif_temp(i) = timePeaks(k+1); 
           pos_temp(i) = locs(k+1);
           amp(i) = peaks(k+1);
           val_t(i) = val_temp(k+1);
           i=i+1;
           if(mod(i,5)==0)
           md_1 = mean(dif_temp);      % Cálculo da média após 5 leituras
           std_1 = std(dif_temp);      % Cálculo do desvio após 5 leituras
           h1 = md_1 - 3*(std_1);      % Limiar inferior
           h2 = md_1 + 3*(std_1);      % Limiar superior 
           end
        end
    end  
end            
            
frequencia = 60/mean(dif_temp); 

%*********************** Variáveis Estatísticas **************************%
NN = dif_temp; %Batimentos Normais NN - RR
Med_NN = mean(NN);
Qnn = length(NN);

%SDNNN
aux_1 = 0;
for k=1:Qnn
aux_1 = aux_1 + (NN(k) - Med_NN)^2;
end
SDNN = sqrt((1/Qnn)*aux_1);
             
%SDANN
aux_2=0;
y5 = zeros (2, Qnn/2);
med_y5 = zeros(1,2);
y5(1,:) = NN(1:Qnn/2);
y5(2,:) = NN((Qnn/2 + 1):Qnn);

for r=1:2
med_y5(r) = mean(y5(r,:));
end
med_t5 = mean(med_y5);
for l=1:2
aux_2 = aux_2 + (med_y5(l) - med_t5)^2;
end
SDANN = sqrt(1/2*aux_2);


%SDNN_index
SDNNi = zeros(1,2);
for p=1:2
for r=1:Qnn/2
SDNNi(p) = SDNNi(p)+(y5(p,r) - med_y5(p))^2;
end
end
SDNNi(1) = sqrt(1/(Qnn/2)*SDNNi(1));
SDNNi(2) = sqrt(1/(Qnn/2)*SDNNi(2));
SDNNindex = mean(SDNNi);

%RMSSD
aux_4=0;
for j=1:Qnn-1
aux_4 = aux_4 + (NN(j+1) - NN(j))^2;
NNd(j) = abs(NN(j+1) - NN(j));
end
RMSSD = sqrt(1/(Qnn-1)*aux_4);

%SDSD
Md_NNd = mean(NNd);
aux_5 = 0;
for k=1:Qnn-1
aux_5 = aux_5 + (NNd(k) - Md_NNd)^2;
end
SDSD = sqrt(1/(Qnn-1)*aux_5);
    end

       function readAdcData(obj, nSamples, plotData, handles)
            
            flushinput(obj.serialPort); %limpa o buffer
            
            % rejeita as 1000 primeiras amostras
            rejectedSamples = 1000;
            
            % set spi_read
            fwrite(obj.serialPort, hex2dec({'02','30','30','30','30','30','30','30','31','0D'}));
            
            % read samples
            word = sprintf('hex2dec({''01'',''2A'',''%02x'', ''%02x'', ''%02x'', ''%02x'', ''%02x'', ''%02x'', ''%02x'', ''%02x'', ''0D''})', sprintf('%08x', (nSamples + rejectedSamples)));
            fwrite(obj.serialPort, eval(word));
            
            for(i = 1 : rejectedSamples)
                dt = fread(obj.serialPort, 22);
            end
            
            obj.nSamples = nSamples;
            obj.led1 = [];
            obj.led2 = [];
            obj.aled1 = [];
            obj.aled2 = [];
            obj.led1_aled1 = [];
            obj.led2_aled2 = [];
            for(i = 1 : nSamples)
                dt = fread(obj.serialPort, 22);
                package = sprintf('''%02x'',', dt);
                package(end)=[];
                package = eval(strcat('{', package ,'}'));
                obj.led2(i) = hex2dec(strcat(package{5}, package{4}, package{3})) * 5.722676248*(10^(-7));
                obj.aled2(i) = hex2dec(strcat(package{8}, package{7}, package{6})) * 5.722676248*(10^(-7));
                obj.led1(i) = hex2dec(strcat(package{11}, package{10}, package{9})) * 5.722676248*(10^(-7));
                obj.aled1(i) = hex2dec(strcat(package{14}, package{13}, package{12})) * 5.722676248*(10^(-7));
                obj.led2_aled2(i) = hex2dec(strcat(package{17}, package{16}, package{15})) * 5.722676248*(10^(-7));
                obj.led1_aled1(i) = hex2dec(strcat(package{20}, package{19}, package{18})) * 5.722676248*(10^(-7));
            
                if(mod(i, 700) == 0 & i > 0)
                    PRF = 500;
                    %tempo em s da relação da quantidade de amostras -
                    %plotar com os Leds.
                    x = [0:1/PRF:(1/PRF) * size(obj.led1_aled1, 2)]; 
                    x(1) = []; %retira o zero

                    %[thr,sorh,keepapp] = ddencmp('den','wv',obj.led1_aled1); % Den = Decomposição do Sinal; WV = Transf. Wavelet
                    %y = wdencmp('gbl',obj.led1_aled1,'db5',5,thr,sorh,keepapp); % retira ruído
                    %[amp_pico,pos_pico] = findpeaks(y,'MINPEAKHEIGHT',0.043,'MinPeakDistance', 250);
                    [amp_pico,pos_pico] = findpeaks(obj.led1_aled1,'MinPeakDistance', 250);

                    timePeaks = x(pos_pico);
                    timePeaks_1 = [0 timePeaks];
                    timePeaks_2 = [ timePeaks 0];
                    timePeaks = timePeaks_2 - timePeaks_1;
                    timePeaks(1) = [];
                    timePeaks(size(timePeaks, 2)) = [];
                    
                    frequencia = 60/mean(timePeaks);
                    %mostra frequencia parciais no axes
                    plot(handles.axes13, obj.led1_aled1(1, [length(obj.led1_aled1) - 600 : length(obj.led1_aled1)]))
                    xlim([0 600]);
                    pause(1e-5);
                    set(handles.vfc_inst, 'String', sprintf('%.1f', frequencia));
                 end
            end
            
            flushinput(obj.serialPort); %limpa o buffer
            fwrite(obj.serialPort, hex2dec({'06','0D'}));
            
            
         end
     end
    
end
