% Input: coefficient matrix C of size 4x80
% Output: solution matrix S of size 4x20

function S = red_59x79_unsynch_relpose(C)

    ix = [1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6,6,6,7,7,7,7,7,7,7,7,7,7,7,7,8,8,8,8,8,8,8,8,8,8,8,8,9,9,9,9,9,9,9,9,9,9,9,9,10,10,10,10,10,10,10,10,10,10,10,10,11,11,11,11,11,11,11,11,11,11,11,11,12,12,12,12,12,12,12,12,12,12,12,12,13,13,13,13,13,13,13,13,13,13,13,13,14,14,14,14,14,14,14,14,14,14,14,14,15,15,15,15,15,15,15,15,15,15,15,15,16,16,16,16,16,16,16,16,16,16,16,16,17,17,17,17,17,17,17,17,17,17,17,17,18,18,18,18,18,18,18,18,18,18,18,18,19,19,19,19,19,19,19,19,19,19,19,19,20,20,20,20,20,20,20,20,20,20,20,20,21,21,21,21,21,21,21,21,21,21,21,21,22,22,22,22,22,22,22,22,22,22,22,22,23,23,23,23,23,23,23,23,23,23,23,23,24,24,24,24,24,24,24,24,24,24,24,24,25,25,25,25,25,25,25,25,25,25,25,26,26,26,26,26,26,26,26,26,26,26,26,27,27,27,27,27,27,27,27,27,27,27,27,28,28,28,28,28,28,28,28,28,28,28,28,29,29,29,29,29,29,29,29,29,29,29,29,30,30,30,30,30,30,30,30,30,30,30,30,31,31,31,31,31,31,31,31,31,31,31,31,32,32,32,32,32,32,32,32,32,32,32,32,33,33,33,33,33,33,33,33,33,33,33,33,34,34,34,34,34,34,34,34,34,34,34,34,35,35,35,35,35,35,35,35,35,35,35,35,36,36,36,36,36,36,36,36,36,36,36,36,37,37,37,37,37,37,37,37,37,37,37,37,38,38,38,38,38,38,38,38,38,38,38,38,39,39,39,39,39,39,39,39,39,39,39,39,40,40,40,40,40,40,40,40,40,40,40,40,41,41,41,41,41,41,41,41,41,41,41,41,42,42,42,42,42,42,42,42,42,42,42,42,43,43,43,43,43,43,43,43,43,43,43,43,44,44,44,44,44,44,44,44,44,44,44,44,45,45,45,45,45,45,45,45,45,45,45,46,46,46,46,46,46,46,46,46,46,46,46,47,47,47,47,47,47,47,47,47,47,47,47,48,48,48,48,48,48,48,48,48,48,48,48,49,49,49,49,49,49,49,49,49,49,49,49,50,50,50,50,50,50,50,50,50,50,50,50,51,51,51,51,51,51,51,51,51,51,51,51,52,52,52,52,52,52,52,52,52,52,52,52,53,53,53,53,53,53,53,53,53,53,53,53,54,54,54,54,54,54,54,54,54,54,54,54,55,55,55,55,55,55,55,55,55,55,55,55,56,56,56,56,56,56,56,56,56,56,56,56,57,57,57,57,57,57,57,57,57,57,57,57,58,58,58,58,58,58,58,58,58,58,58,58,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59,59];
    jx = [56,57,58,59,72,73,74,75,76,77,78,79,31,32,34,50,51,53,56,66,67,69,72,75,32,33,35,51,52,54,57,67,68,70,73,76,34,35,36,53,54,55,58,69,70,71,74,77,37,38,39,72,73,74,75,76,77,78,79,11,12,15,27,28,31,40,41,44,50,60,66,13,14,17,29,30,33,42,43,46,52,62,68,18,19,20,36,47,48,49,55,63,64,65,71,12,13,16,28,29,32,41,42,45,51,61,67,15,16,18,34,44,45,47,53,60,61,63,69,16,17,19,35,45,46,48,54,61,62,64,70,21,22,24,31,32,34,37,66,67,69,72,75,1,2,5,11,12,15,21,27,28,31,60,66,22,23,25,32,33,35,38,67,68,70,73,76,3,4,7,13,14,17,23,29,30,33,62,68,24,25,26,34,35,36,39,69,70,71,74,77,8,9,10,18,19,20,26,36,63,64,65,71,2,3,6,12,13,16,22,28,29,32,61,67,5,6,8,15,16,18,24,34,60,61,63,69,6,7,9,16,17,19,25,35,61,62,64,70,56,57,58,59,72,73,74,75,76,77,78,79,31,32,34,50,51,53,56,66,67,69,72,75,32,33,35,51,52,54,57,67,68,70,73,76,34,35,36,53,54,55,58,69,70,71,74,77,37,38,39,72,73,74,75,76,77,78,79,11,12,15,27,28,31,40,41,44,50,60,66,13,14,17,29,30,33,42,43,46,52,62,68,18,19,20,36,47,48,49,55,63,64,65,71,12,13,16,28,29,32,41,42,45,51,61,67,15,16,18,34,44,45,47,53,60,61,63,69,16,17,19,35,45,46,48,54,61,62,64,70,21,22,24,31,32,34,37,66,67,69,72,75,1,2,5,11,12,15,21,27,28,31,60,66,22,23,25,32,33,35,38,67,68,70,73,76,3,4,7,13,14,17,23,29,30,33,62,68,24,25,26,34,35,36,39,69,70,71,74,77,8,9,10,18,19,20,26,36,63,64,65,71,2,3,6,12,13,16,22,28,29,32,61,67,5,6,8,15,16,18,24,34,60,61,63,69,6,7,9,16,17,19,25,35,61,62,64,70,56,57,58,59,72,73,74,75,76,77,78,79,31,32,34,50,51,53,56,66,67,69,72,75,32,33,35,51,52,54,57,67,68,70,73,76,34,35,36,53,54,55,58,69,70,71,74,77,37,38,39,72,73,74,75,76,77,78,79,11,12,15,27,28,31,40,41,44,50,60,66,13,14,17,29,30,33,42,43,46,52,62,68,18,19,20,36,47,48,49,55,63,64,65,71,12,13,16,28,29,32,41,42,45,51,61,67,15,16,18,34,44,45,47,53,60,61,63,69,16,17,19,35,45,46,48,54,61,62,64,70,21,22,24,31,32,34,37,66,67,69,72,75,1,2,5,11,12,15,21,27,28,31,60,66,22,23,25,32,33,35,38,67,68,70,73,76,3,4,7,13,14,17,23,29,30,33,62,68,24,25,26,34,35,36,39,69,70,71,74,77,8,9,10,18,19,20,26,36,63,64,65,71,2,3,6,12,13,16,22,28,29,32,61,67,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79];
    kx = [301,305,309,317,245,249,253,285,289,293,297,313,245,249,253,301,305,309,317,285,289,293,297,313,245,249,253,301,305,309,317,285,289,293,297,313,245,249,253,301,305,309,317,285,289,293,297,313,245,249,253,285,289,293,301,305,309,313,317,245,249,253,285,289,297,301,305,309,317,293,313,245,249,253,285,289,297,301,305,309,317,293,313,245,249,253,297,301,305,309,317,285,289,293,313,245,249,253,285,289,297,301,305,309,317,293,313,245,249,253,297,301,305,309,317,285,289,293,313,245,249,253,297,301,305,309,317,285,289,293,313,245,249,253,285,289,293,297,301,305,309,313,317,245,249,253,285,289,293,297,301,305,313,309,317,245,249,253,285,289,293,297,301,305,309,313,317,245,249,253,285,289,293,297,301,305,313,309,317,245,249,253,285,289,293,297,301,305,309,313,317,245,249,253,285,289,293,297,313,301,305,309,317,245,249,253,285,289,293,297,301,305,313,309,317,245,249,253,285,289,293,297,313,301,305,309,317,245,249,253,285,289,293,297,313,301,305,309,317,302,306,310,318,246,250,254,286,290,294,298,314,246,250,254,302,306,310,318,286,290,294,298,314,246,250,254,302,306,310,318,286,290,294,298,314,246,250,254,302,306,310,318,286,290,294,298,314,246,250,254,286,290,294,302,306,310,314,318,246,250,254,286,290,298,302,306,310,318,294,314,246,250,254,286,290,298,302,306,310,318,294,314,246,250,254,298,302,306,310,318,286,290,294,314,246,250,254,286,290,298,302,306,310,318,294,314,246,250,254,298,302,306,310,318,286,290,294,314,246,250,254,298,302,306,310,318,286,290,294,314,246,250,254,286,290,294,298,302,306,310,314,318,246,250,254,286,290,294,298,302,306,314,310,318,246,250,254,286,290,294,298,302,306,310,314,318,246,250,254,286,290,294,298,302,306,314,310,318,246,250,254,286,290,294,298,302,306,310,314,318,246,250,254,286,290,294,298,314,302,306,310,318,246,250,254,286,290,294,298,302,306,314,310,318,246,250,254,286,290,294,298,314,302,306,310,318,246,250,254,286,290,294,298,314,302,306,310,318,303,307,311,319,247,251,255,287,291,295,299,315,247,251,255,303,307,311,319,287,291,295,299,315,247,251,255,303,307,311,319,287,291,295,299,315,247,251,255,303,307,311,319,287,291,295,299,315,247,251,255,287,291,295,303,307,311,315,319,247,251,255,287,291,299,303,307,311,319,295,315,247,251,255,287,291,299,303,307,311,319,295,315,247,251,255,299,303,307,311,319,287,291,295,315,247,251,255,287,291,299,303,307,311,319,295,315,247,251,255,299,303,307,311,319,287,291,295,315,247,251,255,299,303,307,311,319,287,291,295,315,247,251,255,287,291,295,299,303,307,311,315,319,247,251,255,287,291,295,299,303,307,315,311,319,247,251,255,287,291,295,299,303,307,311,315,319,247,251,255,287,291,295,299,303,307,315,311,319,247,251,255,287,291,295,299,303,307,311,315,319,247,251,255,287,291,295,299,315,303,307,311,319,247,251,255,287,291,295,299,303,307,315,311,319,4,8,12,16,20,24,28,32,36,40,44,48,52,56,60,64,68,72,76,80,84,88,92,96,100,104,108,112,116,120,148,152,156,160,164,168,172,176,180,184,188,192,196,200,204,208,212,216,220,264,268,272,276,280,284,304,308,312,320,124,128,132,136,140,144,224,228,232,236,240,244,248,252,256,288,292,296,300,316];
    M = sparse(ix,jx,C(kx),59,79);

    [L,~,P] = lu(M(:,1:43));
    P = P';
    M = [P*L P(:,44:end)]\M(:,44:end);
    M = M(end-15:end,:);

    T = zeros(20);
    T([1,2,3,4,5,6,7,8,9,10,11,12,16,17,18,20],:) = -M(:,1:16)\M(:,17:end);
    T([313,334,355,399]) = 1;

    [V,~] = eig(T);
    S = V(16:19,:)./repmat(V(20,:),4,1);

    I = ~isnan(S(1,:)) & ~isinf(S(1,:));
    %I = I & ~imag(S(1,:)); % uncomment this line for real roots only
    S = S(:,I);

end