function C = coefs_4pra(data)

    x1 = data{1};
    x2 = data{2};
    s = data{3};

    B = zeros(4, 35);
    ss = s^2;
    t = ss - 0.5;

    kk = [2, 3, 4, 1];
    ii = [3, 4, 1, 2];
    jj = [4, 1, 2, 3];

    for l = 1:4
        i = ii(l); j = jj(l); k = kk(l);
    
        U1 = [-x1(3, i) * x1(2, j) + x1(2, i) * x1(3, j) x1(3, i) * x1(1, j) - x1(1, i) * x1(3, j) -x1(2, i) * x1(1, j) + x1(1, i) * x1(2, j)];
        U2 = [-x2(3, i) * x2(2, j) + x2(2, i) * x2(3, j) x2(3, i) * x2(1, j) - x2(1, i) * x2(3, j) -x2(2, i) * x2(1, j) + x2(1, i) * x2(2, j)];
        U3 = [-x1(2, k) * x1(3, i) + x1(3, k) * x1(2, i) x1(1, k) * x1(3, i) - x1(3, k) * x1(1, i) -x1(1, k) * x1(2, i) + x1(2, k) * x1(1, i)];
        U4 = [-x2(2, k) * x2(3, i) + x2(3, k) * x2(2, i) x2(1, k) * x2(3, i) - x2(3, k) * x2(1, i) -x2(1, k) * x2(2, i) + x2(2, k) * x2(1, i)];
    
        S1 = U2(1) * x1(1, j);
        S2 = x2(1, j) * U1(1);
        S3 = U4(1) * x1(1, k);
        S4 = x2(1, k) * U3(1);
        S5 = U2(2) * x1(1, j) + U2(1) * x1(2, j);
        S6 = x2(2, j) * U1(1) + x2(1, j) * U1(2);
        S7 = U4(2) * x1(1, k) + U4(1) * x1(2, k);
        S8 = x2(2, k) * U3(1) + x2(1, k) * U3(2);
        S9 = U2(2) * x1(2, j);
        S10 = x2(2, j) * U1(2);
        S11 = U4(2) * x1(2, k);
        S12 = x2(2, k) * U3(2);
        S13 = U2(3) * x1(1, j) + U2(1) * x1(3, j);
        S14 = x2(3, j) * U1(1) + x2(1, j) * U1(3);
        S15 = U4(3) * x1(1, k) + U4(1) * x1(3, k);
        S16 = x2(3, k) * U3(1) + x2(1, k) * U3(3);
        S17 = U2(3) * x1(2, j) + U2(2) * x1(3, j);
        S18 = x2(3, j) * U1(2) + x2(2, j) * U1(3);
        S19 = U4(3) * x1(2, k) + U4(2) * x1(3, k);
        S20 = x2(3, k) * U3(2) + x2(2, k) * U3(3);
        S21 = U2(3) * x1(3, j);
        S22 = x2(3, j) * U1(3);
        S23 = U4(3) * x1(3, k);
        S24 = x2(3, k) * U3(3);
        S25 = -s * (U2(3) * x1(2, j) - U2(2) * x1(3, j));
        S26 = -s * (x2(3, j) * U1(2) - U1(3) * x2(2, j));
        S27 = s * (U4(2) * x1(3, k) - x1(2, k) * U4(3));
        S28 = s * (x2(2, k) * U3(3) - U3(2) * x2(3, k));
        S29 = s * (U2(3) * x1(1, j) - x1(3, j) * U2(1));
        S30 = s * (x2(3, j) * U1(1) - U1(3) * x2(1, j));
        S31 = s * (x1(1, k) * U4(3) - U4(1) * x1(3, k));
        S32 = s * (U3(1) * x2(3, k) - x2(1, k) * U3(3));
        S33 = -s * (U2(2) * x1(1, j) - U2(1) * x1(2, j));
        S34 = -s * (x2(2, j) * U1(1) - x2(1, j) * U1(2));
        S35 = -s * (U4(2) * x1(1, k) - U4(1) * x1(2, k));
        S36 = -s * (x2(2, k) * U3(1) - x2(1, k) * U3(2));
        S37 = t * (U2(3) * x1(3, j) + U2(2) * x1(2, j) + x1(1, j) * U2(1));
        S38 = t * (x2(3, j) * U1(3) + x2(2, j) * U1(2) + U1(1) * x2(1, j));
        S39 = t * (U4(2) * x1(2, k) + x1(1, k) * U4(1) + U4(3) * x1(3, k));
        S40 = t * (x2(2, k) * U3(2) + U3(1) * x2(1, k) + x2(3, k) * U3(3));
        
        B(l,1) = S1 * S4 - S3 * S2;
        B(l,2) = S1 * S8 - S7 * S2 - S6 * S3 + S4 * S5;
        B(l,3) = S1 * S12 - S3 * S10 - S2 * S11 + S4 * S9 + S5 * S8 - S7 * S6;
        B(l,4) = -S7 * S10 - S6 * S11 + S12 * S5 + S8 * S9;
        B(l,5) = -S10 * S11 + S12 * S9;
        B(l,6) = S1 * S16 + S13 * S4 - S14 * S3 - S15 * S2;
        B(l,7) = S1 * S20 + S13 * S8 - S14 * S7 - S15 * S6 + S16 * S5 + S17 * S4 - S18 * S3 - S19 * S2;
        B(l,8) = -S10 * S15 - S11 * S14 + S12 * S13 + S16 * S9 + S17 * S8 - S18 * S7 - S19 * S6 + S20 * S5;
        B(l,9) = -S10 * S19 - S11 * S18 + S12 * S17 + S20 * S9;
        B(l,10) = S1 * S24 + S13 * S16 - S14 * S15 - S2 * S23 + S21 * S4 - S22 * S3;
        B(l,11) = S13 * S20 - S14 * S19 - S15 * S18 + S16 * S17 + S21 * S8 - S22 * S7 - S23 * S6 + S24 * S5;
        B(l,12) = -S10 * S23 - S11 * S22 + S12 * S21 + S17 * S20 - S18 * S19 + S24 * S9;
        B(l,13) = S13 * S24 - S14 * S23 - S15 * S22 + S16 * S21;
        B(l,14) = S17 * S24 - S18 * S23 - S19 * S22 + S20 * S21;
        B(l,15) = S21 * S24 - S22 * S23;
        B(l,16) = S1 * S28 - S2 * S27 + S25 * S4 - S26 * S3;
        B(l,17) = S1 * S32 - S2 * S31 + S25 * S8 - S26 * S7 - S27 * S6 + S28 * S5 + S29 * S4 - S3 * S30;
        B(l,18) = -S10 * S27 - S11 * S26 + S12 * S25 + S28 * S9 + S29 * S8 - S30 * S7 - S31 * S6 + S32 * S5;
        B(l,19) = -S10 * S31 - S11 * S30 + S12 * S29 + S32 * S9;
        B(l,20) = S1 * S36 + S13 * S28 - S14 * S27 - S15 * S26 + S16 * S25 - S2 * S35 - S3 * S34 + S33 * S4;
        B(l,21) = S13 * S32 - S14 * S31 - S15 * S30 + S16 * S29 + S17 * S28 - S18 * S27 - S19 * S26 + S20 * S25 + S33 * S8 - S34 * S7 - S35 * S6 + S36 * S5;
        B(l,22) = -S10 * S35 - S11 * S34 + S12 * S33 + S17 * S32 - S18 * S31 - S19 * S30 + S20 * S29 + S36 * S9;
        B(l,23) = S13 * S36 - S14 * S35 - S15 * S34 + S16 * S33 + S21 * S28 - S22 * S27 - S23 * S26 + S24 * S25;
        B(l,24) = S17 * S36 - S18 * S35 - S19 * S34 + S20 * S33 + S21 * S32 - S22 * S31 - S23 * S30 + S24 * S29;
        B(l,25) = S21 * S36 - S22 * S35 - S23 * S34 + S24 * S33;
        B(l,26) = S1 * S40 - S2 * S39 + S25 * S28 - S26 * S27 - S3 * S38 + S37 * S4;
        B(l,27) = S25 * S32 - S26 * S31 - S27 * S30 + S28 * S29 + S37 * S8 - S38 * S7 - S39 * S6 + S40 * S5;
        B(l,28) = -S10 * S39 - S11 * S38 + S12 * S37 + S29 * S32 - S30 * S31 + S40 * S9;
        B(l,29) = S13 * S40 - S14 * S39 - S15 * S38 + S16 * S37 + S25 * S36 - S26 * S35 - S27 * S34 + S28 * S33;
        B(l,30) = S17 * S40 - S18 * S39 - S19 * S38 + S20 * S37 + S29 * S36 - S30 * S35 - S31 * S34 + S32 * S33;
        B(l,31) = S21 * S40 - S22 * S39 - S23 * S38 + S24 * S37 + S33 * S36 - S34 * S35;
        B(l,32) = S25 * S40 - S26 * S39 - S27 * S38 + S28 * S37;
        B(l,33) = S29 * S40 - S30 * S39 - S31 * S38 + S32 * S37;
        B(l,34) = S33 * S40 - S34 * S39 - S35 * S38 + S36 * S37;
        B(l,35) = S37 * S40 - S38 * S39;
    
    end

    r = ss - 1;
    rr = r^2;

    C = [B(1, 1) - B(1, 5) - B(1, 10) + B(1, 12) B(1, 2) - B(1, 4) B(1, 12) - 2 * B(1, 5) + B(1, 3) - B(1, 10) B(1, 6) - B(1, 8) -B(1, 7) + B(1, 9) B(1, 4) - B(1, 11) B(1, 14) - B(1, 7) B(1, 8) - B(1, 13) B(1, 15) + B(1, 5) - B(1, 12) B(1, 4) - B(1, 11) B(1, 8) - B(1, 13) B(1, 16) - B(1, 23) B(1, 17) - B(1, 24) B(1, 18) - B(1, 23) B(1, 19) - B(1, 24) B(1, 20) - B(1, 25) B(1, 21) B(1, 22) - B(1, 25) 0 0 -B(1, 10) * r - 2 * B(1, 5) * r + 2 * B(1, 12) * r - B(1, 31) + B(1, 26) B(1, 27) - 2 * B(1, 4) * r + B(1, 11) * r B(1, 28) - 2 * B(1, 5) * r + B(1, 12) * r - B(1, 31) r * (-B(1, 4) + B(1, 11)) B(1, 29) - 2 * B(1, 8) * r + B(1, 13) * r -B(1, 7) * r + B(1, 30) r * (-B(1, 8) + B(1, 13)) B(1, 32) - B(1, 23) * r B(1, 33) - B(1, 24) * r 0 B(1, 34) - B(1, 25) * r 0 -B(1, 5) * rr + B(1, 12) * rr - B(1, 31) * r + B(1, 35) rr * (-B(1, 4) + B(1, 11)) rr * (-B(1, 8) + B(1, 13)) 0; 
        -B(1, 4) + B(1, 11) B(1, 1) - B(1, 3) + B(1, 5) B(1, 2) - 2 * B(1, 4) + B(1, 11) -B(1, 7) + B(1, 9) B(1, 8) - B(1, 6) B(1, 12) - 2 * B(1, 5) + B(1, 3) - B(1, 10) B(1, 13) - B(1, 6) B(1, 14) - 2 * B(1, 9) + B(1, 7) B(1, 4) - B(1, 11) B(1, 15) + B(1, 3) - B(1, 5) - B(1, 10) B(1, 7) - B(1, 9) -B(1, 19) + B(1, 24) B(1, 16) - B(1, 23) B(1, 17) - 2 * B(1, 19) + B(1, 24) B(1, 18) - B(1, 23) 0 B(1, 20) - B(1, 22) B(1, 21) B(1, 25) - B(1, 22) B(1, 19) - B(1, 24) 2 * r * (-B(1, 4) + B(1, 11)) -2 * B(1, 3) * r + B(1, 10) * r + 2 * B(1, 5) * r - B(1, 31) + B(1, 26) B(1, 27) - 2 * B(1, 4) * r + B(1, 11) * r B(1, 28) - B(1, 3) * r + B(1, 10) * r - B(1, 31) 2 * r * (-B(1, 7) + B(1, 9)) B(1, 29) - B(1, 6) * r -B(1, 7) * r + B(1, 30) -2 * (B(1, 19) - B(1, 24)) * r B(1, 32) - B(1, 23) * r B(1, 33) - 2 * B(1, 19) * r + B(1, 24) * r 0 -B(1, 22) * r + B(1, 34) rr * (-B(1, 4) + B(1, 11)) -B(1, 3) * rr + B(1, 10) * rr + B(1, 5) * rr - B(1, 31) * r + B(1, 35) rr * (-B(1, 7) + B(1, 9)) -rr * (B(1, 19) - B(1, 24));
        B(1, 8) - B(1, 6) 0 B(1, 8) - B(1, 6) B(1, 1) - B(1, 3) + B(1, 5) B(1, 4) - B(1, 2) -B(1, 7) + B(1, 9) B(1, 11) - B(1, 2) B(1, 12) - 2 * B(1, 5) + B(1, 3) - B(1, 10) -B(1, 8) + B(1, 13) B(1, 14) - B(1, 7) B(1, 15) + B(1, 3) - B(1, 5) - B(1, 10) -B(1, 20) + B(1, 22) -B(1, 21) -B(1, 20) + B(1, 22) -B(1, 21) B(1, 16) - B(1, 23) B(1, 17) - B(1, 19) B(1, 18) - B(1, 23) -B(1, 19) + B(1, 24) B(1, 25) - B(1, 22) -B(1, 6) * r + 2 * B(1, 8) * r - B(1, 29) B(1, 7) * r - B(1, 30) B(1, 8) * r - B(1, 29) B(1, 7) * r - B(1, 30) -2 * B(1, 3) * r + B(1, 10) * r + 2 * B(1, 5) * r - B(1, 31) + B(1, 26) B(1, 27) - B(1, 2) * r B(1, 28) - B(1, 3) * r + B(1, 10) * r - B(1, 31) 2 * B(1, 22) * r - r * B(1, 20) - B(1, 34) -B(1, 21) * r B(1, 22) * r - B(1, 34) B(1, 32) - B(1, 23) * r B(1, 33) - B(1, 19) * r -(-B(1, 8) * r + B(1, 29)) * r -(-B(1, 7) * r + B(1, 30)) * r -B(1, 3) * rr + B(1, 10) * rr + B(1, 5) * rr - B(1, 31) * r + B(1, 35) (B(1, 22) * r - B(1, 34)) * r; 
        0 0 0 0 0 0 0 0 0 0 0 B(1, 1) - B(1, 5) - B(1, 10) + B(1, 12) B(1, 2) - B(1, 11) B(1, 12) - 2 * B(1, 5) + B(1, 3) - B(1, 10) B(1, 4) - B(1, 11) B(1, 6) - B(1, 13) B(1, 7) - B(1, 9) B(1, 8) - B(1, 13) B(1, 14) - B(1, 9) B(1, 15) + B(1, 5) - B(1, 12) B(1, 16) - B(1, 23) B(1, 17) - B(1, 24) B(1, 18) - B(1, 23) B(1, 19) - B(1, 24) B(1, 20) - B(1, 25) B(1, 21) B(1, 22) - B(1, 25) -B(1, 10) * r - 2 * B(1, 5) * r + 2 * B(1, 12) * r - B(1, 31) + B(1, 26) B(1, 27) - B(1, 11) * r B(1, 28) - 2 * B(1, 5) * r + B(1, 12) * r - B(1, 31) B(1, 29) - B(1, 13) * r B(1, 30) - B(1, 9) * r B(1, 32) - B(1, 23) * r B(1, 33) - B(1, 24) * r B(1, 34) - B(1, 25) * r -B(1, 5) * rr + B(1, 12) * rr - B(1, 31) * r + B(1, 35); 
        B(2, 1) - B(2, 5) - B(2, 10) + B(2, 12) B(2, 2) - B(2, 4) B(2, 12) - 2 * B(2, 5) + B(2, 3) - B(2, 10) B(2, 6) - B(2, 8) -B(2, 7) + B(2, 9) B(2, 4) - B(2, 11) B(2, 14) - B(2, 7) B(2, 8) - B(2, 13) B(2, 15) + B(2, 5) - B(2, 12) B(2, 4) - B(2, 11) B(2, 8) - B(2, 13) B(2, 16) - B(2, 23) B(2, 17) - B(2, 24) B(2, 18) - B(2, 23) B(2, 19) - B(2, 24) B(2, 20) - B(2, 25) B(2, 21) B(2, 22) - B(2, 25) 0 0 2 * B(2, 12) * r - B(2, 10) * r - 2 * B(2, 5) * r - B(2, 31) + B(2, 26) B(2, 27) - 2 * B(2, 4) * r + B(2, 11) * r B(2, 28) - 2 * B(2, 5) * r + B(2, 12) * r - B(2, 31) r * (-B(2, 4) + B(2, 11)) B(2, 29) - 2 * B(2, 8) * r + B(2, 13) * r -B(2, 7) * r + B(2, 30) -r * (B(2, 8) - B(2, 13)) B(2, 32) - B(2, 23) * r B(2, 33) - B(2, 24) * r 0 B(2, 34) - B(2, 25) * r 0 B(2, 12) * rr - B(2, 5) * rr - B(2, 31) * r + B(2, 35) rr * (-B(2, 4) + B(2, 11)) -rr * (B(2, 8) - B(2, 13)) 0; 
        -B(2, 4) + B(2, 11) B(2, 1) - B(2, 3) + B(2, 5) B(2, 2) - 2 * B(2, 4) + B(2, 11) -B(2, 7) + B(2, 9) B(2, 8) - B(2, 6) B(2, 12) - 2 * B(2, 5) + B(2, 3) - B(2, 10) B(2, 13) - B(2, 6) B(2, 14) - 2 * B(2, 9) + B(2, 7) B(2, 4) - B(2, 11) B(2, 15) + B(2, 3) - B(2, 5) - B(2, 10) B(2, 7) - B(2, 9) -B(2, 19) + B(2, 24) B(2, 16) - B(2, 23) B(2, 17) - 2 * B(2, 19) + B(2, 24) B(2, 18) - B(2, 23) 0 B(2, 20) - B(2, 22) B(2, 21) B(2, 25) - B(2, 22) B(2, 19) - B(2, 24) 2 * r * (-B(2, 4) + B(2, 11)) B(2, 10) * r - 2 * B(2, 3) * r + 2 * B(2, 5) * r - B(2, 31) + B(2, 26) B(2, 27) - 2 * B(2, 4) * r + B(2, 11) * r B(2, 28) - B(2, 3) * r + B(2, 10) * r - B(2, 31) -2 * (B(2, 7) - B(2, 9)) * r B(2, 29) - B(2, 6) * r -B(2, 7) * r + B(2, 30) -2 * (B(2, 19) - B(2, 24)) * r B(2, 32) - B(2, 23) * r B(2, 33) - 2 * B(2, 19) * r + B(2, 24) * r 0 -B(2, 22) * r + B(2, 34) rr * (-B(2, 4) + B(2, 11)) B(2, 10) * rr - B(2, 3) * rr + B(2, 5) * rr - B(2, 31) * r + B(2, 35) -rr * (B(2, 7) - B(2, 9)) -rr * (B(2, 19) - B(2, 24));
        B(2, 8) - B(2, 6) 0 B(2, 8) - B(2, 6) B(2, 1) - B(2, 3) + B(2, 5) B(2, 4) - B(2, 2) -B(2, 7) + B(2, 9) B(2, 11) - B(2, 2) B(2, 12) - 2 * B(2, 5) + B(2, 3) - B(2, 10) -B(2, 8) + B(2, 13) B(2, 14) - B(2, 7) B(2, 15) + B(2, 3) - B(2, 5) - B(2, 10) -B(2, 20) + B(2, 22) -B(2, 21) -B(2, 20) + B(2, 22) -B(2, 21) B(2, 16) - B(2, 23) B(2, 17) - B(2, 19) B(2, 18) - B(2, 23) -B(2, 19) + B(2, 24) B(2, 25) - B(2, 22) -B(2, 6) * r + 2 * B(2, 8) * r - B(2, 29) B(2, 7) * r - B(2, 30) B(2, 8) * r - B(2, 29) B(2, 7) * r - B(2, 30) B(2, 10) * r - 2 * B(2, 3) * r + 2 * B(2, 5) * r - B(2, 31) + B(2, 26) B(2, 27) - B(2, 2) * r B(2, 28) - B(2, 3) * r + B(2, 10) * r - B(2, 31) 2 * B(2, 22) * r - r * B(2, 20) - B(2, 34) -B(2, 21) * r B(2, 22) * r - B(2, 34) B(2, 32) - B(2, 23) * r B(2, 33) - B(2, 19) * r -(-B(2, 8) * r + B(2, 29)) * r -(-B(2, 7) * r + B(2, 30)) * r B(2, 10) * rr - B(2, 3) * rr + B(2, 5) * rr - B(2, 31) * r + B(2, 35) (B(2, 22) * r - B(2, 34)) * r; 
        0 0 0 0 0 0 0 0 0 0 0 B(2, 1) - B(2, 5) - B(2, 10) + B(2, 12) B(2, 2) - B(2, 11) B(2, 12) - 2 * B(2, 5) + B(2, 3) - B(2, 10) B(2, 4) - B(2, 11) B(2, 6) - B(2, 13) B(2, 7) - B(2, 9) B(2, 8) - B(2, 13) B(2, 14) - B(2, 9) B(2, 15) + B(2, 5) - B(2, 12) B(2, 16) - B(2, 23) B(2, 17) - B(2, 24) B(2, 18) - B(2, 23) B(2, 19) - B(2, 24) B(2, 20) - B(2, 25) B(2, 21) B(2, 22) - B(2, 25) 2 * B(2, 12) * r - B(2, 10) * r - 2 * B(2, 5) * r - B(2, 31) + B(2, 26) B(2, 27) - B(2, 11) * r B(2, 28) - 2 * B(2, 5) * r + B(2, 12) * r - B(2, 31) B(2, 29) - B(2, 13) * r B(2, 30) - B(2, 9) * r B(2, 32) - B(2, 23) * r B(2, 33) - B(2, 24) * r B(2, 34) - B(2, 25) * r B(2, 12) * rr - B(2, 5) * rr - B(2, 31) * r + B(2, 35);
        B(3, 1) - B(3, 5) - B(3, 10) + B(3, 12) B(3, 2) - B(3, 4) B(3, 12) - 2 * B(3, 5) + B(3, 3) - B(3, 10) B(3, 6) - B(3, 8) -B(3, 7) + B(3, 9) B(3, 4) - B(3, 11) B(3, 14) - B(3, 7) B(3, 8) - B(3, 13) B(3, 15) + B(3, 5) - B(3, 12) B(3, 4) - B(3, 11) B(3, 8) - B(3, 13) B(3, 16) - B(3, 23) B(3, 17) - B(3, 24) B(3, 18) - B(3, 23) B(3, 19) - B(3, 24) B(3, 20) - B(3, 25) B(3, 21) B(3, 22) - B(3, 25) 0 0 -B(3, 10) * r + 2 * B(3, 12) * r - 2 * B(3, 5) * r + B(3, 26) - B(3, 31) B(3, 27) - 2 * B(3, 4) * r + B(3, 11) * r B(3, 28) - 2 * B(3, 5) * r + B(3, 12) * r - B(3, 31) r * (-B(3, 4) + B(3, 11)) B(3, 29) - 2 * B(3, 8) * r + B(3, 13) * r -B(3, 7) * r + B(3, 30) r * (-B(3, 8) + B(3, 13)) B(3, 32) - B(3, 23) * r B(3, 33) - B(3, 24) * r 0 B(3, 34) - B(3, 25) * r 0 B(3, 12) * rr - B(3, 5) * rr - B(3, 31) * r + B(3, 35) rr * (-B(3, 4) + B(3, 11)) rr * (-B(3, 8) + B(3, 13)) 0; 
        -B(3, 4) + B(3, 11) B(3, 1) - B(3, 3) + B(3, 5) B(3, 2) - 2 * B(3, 4) + B(3, 11) -B(3, 7) + B(3, 9) B(3, 8) - B(3, 6) B(3, 12) - 2 * B(3, 5) + B(3, 3) - B(3, 10) B(3, 13) - B(3, 6) B(3, 14) - 2 * B(3, 9) + B(3, 7) B(3, 4) - B(3, 11) B(3, 15) + B(3, 3) - B(3, 5) - B(3, 10) B(3, 7) - B(3, 9) -B(3, 19) + B(3, 24) B(3, 16) - B(3, 23) B(3, 17) - 2 * B(3, 19) + B(3, 24) B(3, 18) - B(3, 23) 0 B(3, 20) - B(3, 22) B(3, 21) B(3, 25) - B(3, 22) B(3, 19) - B(3, 24) 2 * r * (-B(3, 4) + B(3, 11)) B(3, 10) * r - 2 * B(3, 3) * r + 2 * B(3, 5) * r + B(3, 26) - B(3, 31) B(3, 27) - 2 * B(3, 4) * r + B(3, 11) * r B(3, 28) - B(3, 3) * r + B(3, 10) * r - B(3, 31) -2 * (B(3, 7) - B(3, 9)) * r B(3, 29) - B(3, 6) * r -B(3, 7) * r + B(3, 30) 2 * r * (-B(3, 19) + B(3, 24)) B(3, 32) - B(3, 23) * r B(3, 33) - 2 * B(3, 19) * r + B(3, 24) * r 0 -B(3, 22) * r + B(3, 34) rr * (-B(3, 4) + B(3, 11)) B(3, 10) * rr - B(3, 3) * rr + B(3, 5) * rr - B(3, 31) * r + B(3, 35) -rr * (B(3, 7) - B(3, 9)) rr * (-B(3, 19) + B(3, 24));
        B(3, 8) - B(3, 6) 0 B(3, 8) - B(3, 6) B(3, 1) - B(3, 3) + B(3, 5) B(3, 4) - B(3, 2) -B(3, 7) + B(3, 9) B(3, 11) - B(3, 2) B(3, 12) - 2 * B(3, 5) + B(3, 3) - B(3, 10) -B(3, 8) + B(3, 13) B(3, 14) - B(3, 7) B(3, 15) + B(3, 3) - B(3, 5) - B(3, 10) -B(3, 20) + B(3, 22) -B(3, 21) -B(3, 20) + B(3, 22) -B(3, 21) B(3, 16) - B(3, 23) B(3, 17) - B(3, 19) B(3, 18) - B(3, 23) -B(3, 19) + B(3, 24) B(3, 25) - B(3, 22) -B(3, 6) * r + 2 * B(3, 8) * r - B(3, 29) B(3, 7) * r - B(3, 30) B(3, 8) * r - B(3, 29) B(3, 7) * r - B(3, 30) B(3, 10) * r - 2 * B(3, 3) * r + 2 * B(3, 5) * r + B(3, 26) - B(3, 31) B(3, 27) - B(3, 2) * r B(3, 28) - B(3, 3) * r + B(3, 10) * r - B(3, 31) -r * B(3, 20) + 2 * B(3, 22) * r - B(3, 34) -B(3, 21) * r B(3, 22) * r - B(3, 34) B(3, 32) - B(3, 23) * r B(3, 33) - B(3, 19) * r -(-B(3, 8) * r + B(3, 29)) * r -(-B(3, 7) * r + B(3, 30)) * r B(3, 10) * rr - B(3, 3) * rr + B(3, 5) * rr - B(3, 31) * r + B(3, 35) (B(3, 22) * r - B(3, 34)) * r; 
        0 0 0 0 0 0 0 0 0 0 0 B(3, 1) - B(3, 5) - B(3, 10) + B(3, 12) B(3, 2) - B(3, 11) B(3, 12) - 2 * B(3, 5) + B(3, 3) - B(3, 10) B(3, 4) - B(3, 11) B(3, 6) - B(3, 13) B(3, 7) - B(3, 9) B(3, 8) - B(3, 13) B(3, 14) - B(3, 9) B(3, 15) + B(3, 5) - B(3, 12) B(3, 16) - B(3, 23) B(3, 17) - B(3, 24) B(3, 18) - B(3, 23) B(3, 19) - B(3, 24) B(3, 20) - B(3, 25) B(3, 21) B(3, 22) - B(3, 25) -B(3, 10) * r + 2 * B(3, 12) * r - 2 * B(3, 5) * r + B(3, 26) - B(3, 31) B(3, 27) - B(3, 11) * r B(3, 28) - 2 * B(3, 5) * r + B(3, 12) * r - B(3, 31) B(3, 29) - B(3, 13) * r B(3, 30) - B(3, 9) * r B(3, 32) - B(3, 23) * r B(3, 33) - B(3, 24) * r B(3, 34) - B(3, 25) * r B(3, 12) * rr - B(3, 5) * rr - B(3, 31) * r + B(3, 35);
        B(4, 1) - B(4, 5) - B(4, 10) + B(4, 12) B(4, 2) - B(4, 4) B(4, 12) - 2 * B(4, 5) + B(4, 3) - B(4, 10) B(4, 6) - B(4, 8) -B(4, 7) + B(4, 9) B(4, 4) - B(4, 11) B(4, 14) - B(4, 7) B(4, 8) - B(4, 13) B(4, 15) + B(4, 5) - B(4, 12) B(4, 4) - B(4, 11) B(4, 8) - B(4, 13) B(4, 16) - B(4, 23) B(4, 17) - B(4, 24) B(4, 18) - B(4, 23) B(4, 19) - B(4, 24) B(4, 20) - B(4, 25) B(4, 21) B(4, 22) - B(4, 25) 0 0 2 * B(4, 12) * r - 2 * B(4, 5) * r - B(4, 10) * r - B(4, 31) + B(4, 26) B(4, 27) - 2 * B(4, 4) * r + B(4, 11) * r B(4, 28) - 2 * B(4, 5) * r + B(4, 12) * r - B(4, 31) r * (-B(4, 4) + B(4, 11)) B(4, 29) - 2 * B(4, 8) * r + B(4, 13) * r -B(4, 7) * r + B(4, 30) -r * (B(4, 8) - B(4, 13)) B(4, 32) - B(4, 23) * r B(4, 33) - B(4, 24) * r 0 B(4, 34) - B(4, 25) * r 0 B(4, 12) * rr - B(4, 5) * rr - B(4, 31) * r + B(4, 35) rr * (-B(4, 4) + B(4, 11)) -rr * (B(4, 8) - B(4, 13)) 0; 
        -B(4, 4) + B(4, 11) B(4, 1) - B(4, 3) + B(4, 5) B(4, 2) - 2 * B(4, 4) + B(4, 11) -B(4, 7) + B(4, 9) B(4, 8) - B(4, 6) B(4, 12) - 2 * B(4, 5) + B(4, 3) - B(4, 10) B(4, 13) - B(4, 6) B(4, 14) - 2 * B(4, 9) + B(4, 7) B(4, 4) - B(4, 11) B(4, 15) + B(4, 3) - B(4, 5) - B(4, 10) B(4, 7) - B(4, 9) -B(4, 19) + B(4, 24) B(4, 16) - B(4, 23) B(4, 17) - 2 * B(4, 19) + B(4, 24) B(4, 18) - B(4, 23) 0 B(4, 20) - B(4, 22) B(4, 21) B(4, 25) - B(4, 22) B(4, 19) - B(4, 24) 2 * r * (-B(4, 4) + B(4, 11)) -2 * B(4, 3) * r + 2 * B(4, 5) * r + B(4, 10) * r - B(4, 31) + B(4, 26) B(4, 27) - 2 * B(4, 4) * r + B(4, 11) * r B(4, 28) - B(4, 3) * r + B(4, 10) * r - B(4, 31) 2 * r * (-B(4, 7) + B(4, 9)) B(4, 29) - B(4, 6) * r -B(4, 7) * r + B(4, 30) -2 * (B(4, 19) - B(4, 24)) * r B(4, 32) - B(4, 23) * r B(4, 33) - 2 * B(4, 19) * r + B(4, 24) * r 0 -B(4, 22) * r + B(4, 34) rr * (-B(4, 4) + B(4, 11)) -B(4, 3) * rr + B(4, 5) * rr + B(4, 10) * rr - B(4, 31) * r + B(4, 35) rr * (-B(4, 7) + B(4, 9)) -rr * (B(4, 19) - B(4, 24));
        B(4, 8) - B(4, 6) 0 B(4, 8) - B(4, 6) B(4, 1) - B(4, 3) + B(4, 5) B(4, 4) - B(4, 2) -B(4, 7) + B(4, 9) B(4, 11) - B(4, 2) B(4, 12) - 2 * B(4, 5) + B(4, 3) - B(4, 10) -B(4, 8) + B(4, 13) B(4, 14) - B(4, 7) B(4, 15) + B(4, 3) - B(4, 5) - B(4, 10) -B(4, 20) + B(4, 22) -B(4, 21) -B(4, 20) + B(4, 22) -B(4, 21) B(4, 16) - B(4, 23) B(4, 17) - B(4, 19) B(4, 18) - B(4, 23) -B(4, 19) + B(4, 24) B(4, 25) - B(4, 22) -B(4, 6) * r + 2 * B(4, 8) * r - B(4, 29) B(4, 7) * r - B(4, 30) B(4, 8) * r - B(4, 29) B(4, 7) * r - B(4, 30) -2 * B(4, 3) * r + 2 * B(4, 5) * r + B(4, 10) * r - B(4, 31) + B(4, 26) B(4, 27) - B(4, 2) * r B(4, 28) - B(4, 3) * r + B(4, 10) * r - B(4, 31) 2 * B(4, 22) * r - r * B(4, 20) - B(4, 34) -B(4, 21) * r B(4, 22) * r - B(4, 34) B(4, 32) - B(4, 23) * r B(4, 33) - B(4, 19) * r -(-B(4, 8) * r + B(4, 29)) * r -(-B(4, 7) * r + B(4, 30)) * r -B(4, 3) * rr + B(4, 5) * rr + B(4, 10) * rr - B(4, 31) * r + B(4, 35) -(-B(4, 22) * r + B(4, 34)) * r; 
        0 0 0 0 0 0 0 0 0 0 0 B(4, 1) - B(4, 5) - B(4, 10) + B(4, 12) B(4, 2) - B(4, 11) B(4, 12) - 2 * B(4, 5) + B(4, 3) - B(4, 10) B(4, 4) - B(4, 11) B(4, 6) - B(4, 13) B(4, 7) - B(4, 9) B(4, 8) - B(4, 13) B(4, 14) - B(4, 9) B(4, 15) + B(4, 5) - B(4, 12) B(4, 16) - B(4, 23) B(4, 17) - B(4, 24) B(4, 18) - B(4, 23) B(4, 19) - B(4, 24) B(4, 20) - B(4, 25) B(4, 21) B(4, 22) - B(4, 25) 2 * B(4, 12) * r - 2 * B(4, 5) * r - B(4, 10) * r - B(4, 31) + B(4, 26) B(4, 27) - B(4, 11) * r B(4, 28) - 2 * B(4, 5) * r + B(4, 12) * r - B(4, 31) B(4, 29) - B(4, 13) * r B(4, 30) - B(4, 9) * r B(4, 32) - B(4, 23) * r B(4, 33) - B(4, 24) * r B(4, 34) - B(4, 25) * r B(4, 12) * rr - B(4, 5) * rr - B(4, 31) * r + B(4, 35)];
    
    C = C./(sqrt(sum(C.^2,2))*ones(1,size(C,2)));

end