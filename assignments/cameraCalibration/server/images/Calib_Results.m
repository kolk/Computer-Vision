% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 13624.164685916959570 ; 13647.840654587278550 ];

%-- Principal point:
cc = [ 3310.129707376010174 ; 1505.898586006260302 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ 0.220553224921688 ; 1.248984907827513 ; -0.015284516345784 ; 0.026801968248542 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 124.058056418921694 ; 117.093508735928808 ];

%-- Principal point uncertainty:
cc_error = [ 131.794586006672517 ; 87.774027949104777 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.074207385070602 ; 1.835647581340260 ; 0.003924860309751 ; 0.005946585431965 ; 0.000000000000000 ];

%-- Image size:
nx = 5472;
ny = 3648;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 15;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ 2.196381e+00 ; 2.189688e+00 ; 4.017924e-02 ];
Tc_1  = [ -5.085611e+02 ; -2.072489e+02 ; 3.082998e+03 ];
omc_error_1 = [ 7.812502e-03 ; 8.195679e-03 ; 2.019790e-02 ];
Tc_error_1  = [ 2.988222e+01 ; 2.001273e+01 ; 2.725381e+01 ];

%-- Image #2:
omc_2 = [ -2.065554e+00 ; -2.139991e+00 ; 2.474879e-01 ];
Tc_2  = [ -5.015454e+02 ; -1.984118e+02 ; 3.230626e+03 ];
omc_error_2 = [ 6.463124e-03 ; 6.463840e-03 ; 1.561124e-02 ];
Tc_error_2  = [ 3.120173e+01 ; 2.098659e+01 ; 2.692095e+01 ];

%-- Image #3:
omc_3 = [ 2.025695e+00 ; 1.953589e+00 ; 4.084940e-01 ];
Tc_3  = [ -4.475681e+02 ; -1.788635e+02 ; 2.898104e+03 ];
omc_error_3 = [ 5.295497e-03 ; 5.295086e-03 ; 1.426053e-02 ];
Tc_error_3  = [ 2.803636e+01 ; 1.884369e+01 ; 2.548575e+01 ];

%-- Image #4:
omc_4 = [ 1.948626e+00 ; 1.797900e+00 ; 6.127908e-01 ];
Tc_4  = [ -4.101449e+02 ; -1.754690e+02 ; 2.831913e+03 ];
omc_error_4 = [ 5.701434e-03 ; 5.655573e-03 ; 1.303273e-02 ];
Tc_error_4  = [ 2.739834e+01 ; 1.839315e+01 ; 2.544268e+01 ];

%-- Image #5:
omc_5 = [ -1.983148e+00 ; -2.118517e+00 ; 3.149714e-01 ];
Tc_5  = [ -4.748385e+02 ; -2.146318e+02 ; 3.264226e+03 ];
omc_error_5 = [ 6.087258e-03 ; 6.373693e-03 ; 1.469354e-02 ];
Tc_error_5  = [ 3.151487e+01 ; 2.118817e+01 ; 2.685040e+01 ];

%-- Image #6:
omc_6 = [ 1.964126e+00 ; 1.930639e+00 ; -1.039565e-01 ];
Tc_6  = [ -5.084909e+02 ; -1.882169e+02 ; 3.593545e+03 ];
omc_error_6 = [ 3.627478e-03 ; 5.369557e-03 ; 1.471269e-02 ];
Tc_error_6  = [ 3.480959e+01 ; 2.329389e+01 ; 3.093247e+01 ];

%-- Image #7:
omc_7 = [ 1.932979e+00 ; 1.925356e+00 ; 1.858061e-01 ];
Tc_7  = [ -3.530188e+02 ; -2.052186e+02 ; 3.190732e+03 ];
omc_error_7 = [ 4.114410e-03 ; 5.482746e-03 ; 1.436675e-02 ];
Tc_error_7  = [ 3.086909e+01 ; 2.061773e+01 ; 2.755350e+01 ];

%-- Image #8:
omc_8 = [ 2.114401e+00 ; 2.167023e+00 ; 6.134596e-01 ];
Tc_8  = [ -5.584407e+02 ; -1.231314e+02 ; 3.496314e+03 ];
omc_error_8 = [ 7.535671e-03 ; 5.343548e-03 ; 1.519607e-02 ];
Tc_error_8  = [ 3.376460e+01 ; 2.278545e+01 ; 3.190846e+01 ];

%-- Image #9:
omc_9 = [ -1.951124e+00 ; -2.094185e+00 ; -2.472803e-01 ];
Tc_9  = [ -5.255223e+02 ; -1.710121e+02 ; 3.048270e+03 ];
omc_error_9 = [ 5.016287e-03 ; 6.757617e-03 ; 1.486324e-02 ];
Tc_error_9  = [ 2.948899e+01 ; 1.983218e+01 ; 2.721150e+01 ];

%-- Image #10:
omc_10 = [ 2.070789e+00 ; 1.943843e+00 ; 9.497104e-01 ];
Tc_10  = [ -2.112317e+02 ; -1.337655e+02 ; 2.931772e+03 ];
omc_error_10 = [ 8.098009e-03 ; 5.400910e-03 ; 1.378125e-02 ];
Tc_error_10  = [ 2.829777e+01 ; 1.894505e+01 ; 2.657776e+01 ];

%-- Image #11:
omc_11 = [ 2.140369e+00 ; 2.018810e+00 ; 6.656192e-01 ];
Tc_11  = [ -4.620076e+02 ; -9.156880e+01 ; 3.867941e+03 ];
omc_error_11 = [ 7.402783e-03 ; 5.189115e-03 ; 1.497863e-02 ];
Tc_error_11  = [ 3.735170e+01 ; 2.508507e+01 ; 3.487795e+01 ];

%-- Image #12:
omc_12 = [ 2.007861e+00 ; 2.017560e+00 ; 1.839447e-01 ];
Tc_12  = [ -4.114866e+02 ; -1.957757e+02 ; 3.855993e+03 ];
omc_error_12 = [ 4.825789e-03 ; 5.787844e-03 ; 1.607669e-02 ];
Tc_error_12  = [ 3.729944e+01 ; 2.493217e+01 ; 3.340210e+01 ];

%-- Image #13:
omc_13 = [ 1.945022e+00 ; 2.086893e+00 ; -3.984031e-01 ];
Tc_13  = [ -4.191845e+02 ; -2.282052e+02 ; 3.504549e+03 ];
omc_error_13 = [ 3.573155e-03 ; 5.542871e-03 ; 1.518419e-02 ];
Tc_error_13  = [ 3.388473e+01 ; 2.270702e+01 ; 2.930862e+01 ];

%-- Image #14:
omc_14 = [ 1.763693e+00 ; 1.816604e+00 ; 1.019899e-01 ];
Tc_14  = [ -5.112008e+02 ; -2.061709e+02 ; 3.468462e+03 ];
omc_error_14 = [ 3.778291e-03 ; 6.026523e-03 ; 1.264645e-02 ];
Tc_error_14  = [ 3.360736e+01 ; 2.249069e+01 ; 3.019754e+01 ];

%-- Image #15:
omc_15 = [ 1.739694e+00 ; 1.836923e+00 ; -1.654263e-02 ];
Tc_15  = [ -4.441311e+02 ; -2.295420e+02 ; 3.328519e+03 ];
omc_error_15 = [ 3.573573e-03 ; 6.023920e-03 ; 1.277017e-02 ];
Tc_error_15  = [ 3.222957e+01 ; 2.153965e+01 ; 2.865452e+01 ];

