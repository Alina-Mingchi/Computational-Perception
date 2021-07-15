%%
% Load the sound file
%trainBird = audioread('sounds.wav');
[trainBird FS] = audioread('sounds.wav');

%%

% Plot of noisy signal
subplot(2, 2, 1);
plot(trainBird);
title('Train and Bird');

% Compute the Fourier transform of sounds
F = fft(trainBird);

% Plot the power spectrum of noisy signal
subplot(2, 2, 2);
plot(abs(F));
title('Train and Bird Power Spectrum');
xlabel('Frequency Index');

% Examine the above plot, what is the range
% of frequencies for train whistle?

filterIndex = ??;
frequencyCount = length(F);

% Filter out bird frequencies -- set certain range of frequency to 0
% and then perform inverse fft.
FBird = F;
FTrain = F;
FTrain(3500:10000) = 0;
train = real(ifft(FTrain));

% Filter out train frequencies -- set certain range of frequency to 0
% and then perform inverse fft.
FBird = F;
FBird(??) = 0;
bird = real(ifft(FBird));

%  listen to the mixed sounds, and the filtered sounds

sound(trainBird);
sound(train);
sound(bird);

% Plot denoised signal and its power spectrum
subplot(2, 2, 3);
plot(train);
title('Denoised train Signal');

subplot(2, 2, 4);
plot(abs(FTrain));
title('Denoised train Power Spectrum');
xlabel('Frequency Index');
