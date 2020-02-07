function Xk=dft_fun(xn,N)
L=length(xn);
if(N<L)
error('N should be greater than L');
end
xn= [xn zeros(1,N-L)]; 
for k=0:N-1
       for n=0:N-1
           wn=exp(-j*2*pi*k*n/N);
           x1(k+1,n+1)=wn;
       end
    end
    Xk=x1*xn'; 
end
