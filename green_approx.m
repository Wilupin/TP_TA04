function G_res = green_approx(x,y,x0,y0,k,theta,omega_theta, phi,omega_phi,L)

r0 = x0 - y0;
normR0 = sqrt(r0*r0');

hank = hankel(L,k*normR0);
vec = zeros(L+1,1);

for p=0:L
    vec(p+1) = (2*p+1)*1i^p;
end 

G_res = 0;

y_diff = (y - y0).';
x_diff = (x - x0).';

for j=1:L+1
      
    s = [sin(theta(j))*cos(phi(:)).'; ...
        sin(theta(j))*sin(phi(:)).' ; ...
        cos(theta(j))*ones(2*L+1,1).'];
    
    leg = my_legendre(L, sum(bsxfun(@times,r0(:),s(:,:)))./normR0);
    
    G = sum(bsxfun(@times,vec(:).*hank(:),leg(:,:))); 
    G = G.*exp(-1i*sum(k*bsxfun(@times,y_diff(:),s(:,:))));  
    G = G.*exp(+1i*sum(k*bsxfun(@times,x_diff(:),s(:,:))));  
    
    G_res = G_res + sum(G(:))*omega_theta(j);
    
end

G_res = G_res*omega_phi*(1i*k/(4*pi));


end

