% ME361 rolling extra credit work (varying μ)
% all symbols have the same meaning as given in the notes
% here the only independent parameters are
% R, h0, U and hf; everything else is decided based on their values
% setting independent parameters
R = 10;
h0 = 0.4;
hf = [ h0*0.9 h0*0.8 h0*0.7 h0*0.5 ];
U = 0.4;

figure
for i = 1:length(hf)
    % setting dependent parameters
    cosAlpha = 1-((h0-hf(i))/(2*R));
    Alpha = acos(cosAlpha);
    phi = linspace(Alpha,0,200);
    H = 2*sqrt(R/hf(i))*atan(sqrt(R/hf(i))*phi);
    H0 = H(1);
    L = R*(sin(Alpha)-sin(phi));

    % calculating P (dimensionless) and plotting with respect to L

    p1 = ((hf(i) + R*(phi.*phi))/h0).*exp(U*(H0-H));
    p2 = ((hf(i) + R*(phi.*phi))/hf(i)).*exp(U*H);
    P = [];
    for iter = 1:length(phi)
        P = [P, min(p1(iter), p2(iter))];
    end
    plot(L,P);
    xlabel('L');
    ylabel('P (dimensionless)');
    title('Plot of Pressure vs distance during rolling');
    hold on
end