function C = coefs_l2_3view_triang(data)

    E12 = data{1};
    E23 = data{2};
    u = data{3};

    C = zeros(8,25);

    C([129,138,147,156,165,174]) = 2;
    C(193) = -2*u(1);
    C(194) = -2*u(2);
    C(195) = -2*u(3);
    C(196) = -2*u(4);
    C(197) = -2*u(5);
    C(198) = -2*u(6);
    C([7,67,81]) = E12(1);
    C([15,75,82]) = E12(2);
    C([151,179]) = E12(3);
    C([23,68,89]) = E12(4);
    C([31,76,90]) = E12(5);
    C([159,180]) = E12(6);
    C([135,177]) = E12(7);
    C([143,178]) = E12(8);
    C(199) = E12(9);
    C([40,101,115]) = E23(1);
    C([48,109,116]) = E23(2);
    C([168,189]) = E23(3);
    C([56,102,123]) = E23(4);
    C([64,110,124]) = E23(5);
    C([176,190]) = E23(6);
    C([152,187]) = E23(7);
    C([160,188]) = E23(8);
    C(200) = E23(9);

    C = C./repmat(sqrt(sum(C.^2,2)),1,size(C,2));

end