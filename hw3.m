% a-------
% Loading the image
P = double(rgb2gray(imread('vessel_and_catheter.png')));
imshow(P,[])
title("Phantom Image")
figure()
% b------------
theta=linspace(0,180,1800);
Rb=radon(P,theta);
imshow(Rb,[])
title("2D Radon Transform of Phantom Image with 1800 angles")
figure()
Rbinverse=iradon(Rb,theta);
imshow(Rbinverse,[])
title("Reconstructed Image")
figure()
%c------------
t=linspace(1,993,993);
Rb0=Rb(:,1);
Rb45=Rb(:,451);
Rb90=Rb(:,901);
Rb135=Rb(:,1351);
subplot(2,2,1);
plot(t,Rb0)
title("Projection for 0 degrees")
subplot(2,2,2);
plot(t,Rb45)
title("Projection for 45 degrees")
subplot(2,2,3);
plot(t,Rb90)
title("Projection for 90 degrees")
subplot(2,2,4);
plot(t,Rb135)
title("Projection for 135 degrees")
figure()
% d--------
thetad=linspace(0,180,60);
Rbd=radon(P,thetad);
imshow(Rbd,[])
title("2D Radon Transform of Phantom Image with 60 angles")
figure()
Rbinversed=iradon(Rbd,thetad);


imshow(Rbinversed,[])
title("Reconstruction of Phantom Image with 60 angles")
figure()
% e-----------------
RbInverseHamming=iradon(Rb,theta,'Hamming');
RbInverseNofilter=iradon(Rb,theta,'linear','none');
subplot(1,3,1)
imshow(Rbinverse,[]);
title("Default Filter 1800 projections");
subplot(1,3,2)
imshow(RbInverseHamming,[]);
title("Hamming Filter 1800 projections");
subplot(1,3,3);
imshow(RbInverseNofilter,[])
title("No filter 1800 projections");
figure()
% f---------------------------
RbdInverseHamming=iradon(Rbd,thetad,'Hamming');
RbdInverseNofilter=iradon(Rbd,thetad,'linear','none');
subplot(1,3,1)
imshow(Rbinversed,[]);
title("Default Filter for 60 projections");
subplot(1,3,2)
imshow(RbdInverseHamming,[]);
title("Hamming Filter 60 projections");
subplot(1,3,3);
imshow(RbdInverseNofilter,[])
title("No filter 60 projections");