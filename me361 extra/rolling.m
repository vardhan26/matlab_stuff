% ME361 rolling extra credit work (varying μ)
% all symbols have the same meaning as given in the notes
% here the only independent parameters are
% R, h0 and hf; everything else is decided based on their values
% setting independent parameters
R = 10;
h0 = 0.4;
hf = 0.2;

% setting dependent parameters
cosalpha = 1-((h0-hf)/(2*R));
alpha = acos(cosalpha);
phi = linspace(alpha,0,200);
H = 2*sqrt(R/hf)*atan(sqrt(R/hf)*phi);
H0 = H(1);
L = R*(sin(alpha)-sin(phi));
U = [ 0.075 0.1 0.15 0.2 0.3 0.4];

% calculating P (dimensionless) and plotting with respect to L
figure
for u = 1:length(U)
    p1 = ((hf + R*(phi.*phi))/h0).*exp(U(u)*(H0-H));
    p2 = ((hf + R*(phi.*phi))/hf).*exp(U(u)*H);
    P = [];
    for i = 1:length(phi)
        P = [P, min(p1(i), p2(i))];
    end
    plot(L,P);
    xlabel('L');
    ylabel('P (dimensionless)');
    title('Plot of Pressure vs distance during rolling');
    hold on
end

