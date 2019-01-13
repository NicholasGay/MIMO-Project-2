 P = [0;0];
 load('exampleMAC')
 epsilon = 10^(-4);
 [Q,Csum,Rsum] = iterWaterfill(H,P,epsilon);
 
 