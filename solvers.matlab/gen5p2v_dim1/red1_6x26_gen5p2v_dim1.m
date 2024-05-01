% Input: cell array CC of 6 coefficient matrices of size 4x20
% Output: cell arrays TT0 and TT1, each containing 6 matrices of size 20x20

function [TT0,TT1] = red1_6x26_gen5p2v_dim1(CC)

    MM = cell([1,6]);
    MM{1} = sparse([1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6],[2,3,4,5,6,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,2,3,4,5,6,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,2,3,4,5,6,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,1,2,3,4,5,7,8,9,10,11,12,13,14,15,17,18,19,21,22,24,2,3,4,5,6,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,1,2,3,4,5,7,8,9,10,11,12,13,14,15,17,18,19,21,22,24],CC{1}([21,41,57,69,77,1,5,9,13,17,25,29,33,37,45,49,53,61,65,73,22,42,58,70,78,2,6,10,14,18,26,30,34,38,46,50,54,62,66,74,23,43,59,71,79,3,7,11,15,19,27,31,35,39,47,51,55,63,67,75,23,43,59,71,79,3,7,11,15,19,27,31,35,39,47,51,55,63,67,75,24,44,60,72,80,4,8,12,16,20,28,32,36,40,48,52,56,64,68,76,24,44,60,72,80,4,8,12,16,20,28,32,36,40,48,52,56,64,68,76]),6,26);
    MM{2} = sparse([1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6],[2,3,4,5,6,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,2,3,4,5,6,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,2,3,4,5,6,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,1,2,3,4,5,7,8,9,10,11,12,13,14,15,17,18,19,21,22,24,2,3,4,5,6,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,1,2,3,4,5,7,8,9,10,11,12,13,14,15,17,18,19,21,22,24],CC{2}([21,41,57,69,77,1,5,9,13,17,25,29,33,37,45,49,53,61,65,73,22,42,58,70,78,2,6,10,14,18,26,30,34,38,46,50,54,62,66,74,23,43,59,71,79,3,7,11,15,19,27,31,35,39,47,51,55,63,67,75,23,43,59,71,79,3,7,11,15,19,27,31,35,39,47,51,55,63,67,75,24,44,60,72,80,4,8,12,16,20,28,32,36,40,48,52,56,64,68,76,24,44,60,72,80,4,8,12,16,20,28,32,36,40,48,52,56,64,68,76]),6,26);
    MM{3} = sparse([1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6,6,6,6,6],[2,3,4,5,12,13,14,15,17,18,19,21,22,24,2,3,4,5,12,13,14,15,17,18,19,21,22,24,2,3,4,5,12,13,14,15,17,18,19,21,22,24,1,2,3,4,7,8,9,10,12,13,14,17,18,21,2,3,4,5,12,13,14,15,17,18,19,21,22,24,1,2,3,4,7,8,9,10,12,13,14,17,18,21],CC{3}([21,41,57,69,1,5,9,13,25,29,33,45,49,61,22,42,58,70,2,6,10,14,26,30,34,46,50,62,23,43,59,71,3,7,11,15,27,31,35,47,51,63,23,43,59,71,3,7,11,15,27,31,35,47,51,63,24,44,60,72,4,8,12,16,28,32,36,48,52,64,24,44,60,72,4,8,12,16,28,32,36,48,52,64]),6,26);
    MM{4} = sparse([1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6],[2,3,4,12,13,14,17,18,21,2,3,4,12,13,14,17,18,21,2,3,4,12,13,14,17,18,21,1,2,3,7,8,9,12,13,17,2,3,4,12,13,14,17,18,21,1,2,3,7,8,9,12,13,17],CC{4}([21,41,57,1,5,9,25,29,45,22,42,58,2,6,10,26,30,46,23,43,59,3,7,11,27,31,47,23,43,59,3,7,11,27,31,47,24,44,60,4,8,12,28,32,48,24,44,60,4,8,12,28,32,48]),6,26);
    MM{5} = sparse([1,1,1,1,1,2,2,2,2,2,3,3,3,3,3,4,4,4,4,4,5,5,5,5,5,6,6,6,6,6],[2,3,12,13,17,2,3,12,13,17,2,3,12,13,17,1,2,7,8,12,2,3,12,13,17,1,2,7,8,12],CC{5}([21,41,1,5,25,22,42,2,6,26,23,43,3,7,27,23,43,3,7,27,24,44,4,8,28,24,44,4,8,28]),6,26);
    MM{6} = sparse([1,1,2,2,3,3,4,4,5,5,6,6],[2,12,2,12,2,12,1,7,2,12,1,7],CC{6}([21,1,22,2,23,3,23,3,24,4,24,4]),6,26);

    TT0 = mat2cell(repmat(zeros(20),1,6),20,repmat(20,1,6));
    TT1 = mat2cell(repmat(zeros(20),1,6),20,repmat(20,1,6));
    TT0{1}([102,123,144,165,207,228,249,270,292,313,334,356,377,399]) = 1;
    TT1{1}([22,43,64,85,127,148,169,190,232,253,274,316,337,379]) = 1;
    [L,~,P] = lu(MM{1}(:,1:0));
    P = P';
    P = [P*L P(:,1:end)];
    for i = 1:6
        M = P\MM{i}(:,1:end);
        M = M(end-5:end,:);
        TT0{i}([1,6,11,15,18,20],:) = -M(:,7:end);
        TT1{i}([1,6,11,15,18,20],[1,6,11,15,18,20]) = M(:,1:6);
    end

end