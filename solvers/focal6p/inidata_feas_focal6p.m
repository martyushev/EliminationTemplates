function [data,fgt,Fgt,Egt] = inidata_feas_focal6p(nObs)

    fgt = 5; % focal length
    Kgt = cell([1,2]);
    Kgt{1} = [fgt 0 0; 0 fgt 0; 0 0 1]; % ground truth calibration matrix
    Kgt{2} = Kgt{1};
    Zgt = [0,0]; % radial distortion coefficients

    [Pgt,Fgt,Egt] = synth_cameras(2,Kgt); % ground truth camera matrices
    [data,~] = synth_points(Pgt,nObs,Zgt); % synthetic image points
    
end