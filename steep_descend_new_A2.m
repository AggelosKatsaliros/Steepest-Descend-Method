n = input( 'Give size:');
format long g
tStart = tic;
a2=zeros(n,n);
for i=1:n;  %kyria diagwnios
  a2(i,i)=7;
endfor
for i=1:n-1;
  a2(i,i+1)=-4;
endfor
for i=2:n;
  a2(i,i-1)=-4;
endfor
for i=1:n-2;
  a2(i,i+2)=1;
endfor
for i=3:n;
  a2(i,i-2)=1;
endfor
b2=ones(n,1);
b2(1)=4;
b2(n)=4;
b2(2)=0;
b2(n-1)=0;
e = 0.00005;
k=0;
xk = 0;
rk = b2;
norma = norm(rk);
while(norma > e)
    k = k + 1;
    for i = 1:n
           res(i,1) = 0;
           if i == 1
               start_step = 1;
               end_step = 3; 
           end 
           if i == 2
               start_step = 1;
               end_step = 4;
           end
           if i == 3
               start_step = 1;
               end_step = 5; 
           end
           if (i >= 4 && i < n-2)
               start_step = i-2;
               end_step = start_step + 4;
           end
           if (i == n-2)
              start_step = i-2;
              end_step = n; 
           end
           if (i == n-1)
              start_step = i-2;
              end_step = n; 
           end
           if (i == n)
              start_step = i-2;
              end_step = n; 
           end
           for j = start_step:end_step
               res(i,1) = res(i,1) + a2(i,j)*rk(j,1);
           end
    end       
    ak = dot(rk,rk)/dot(rk,res);
    xk = xk + ak*rk;
    if(mod(k,10) == 0)
      for i = 1:n
           res(i,1) = 0;
           if i == 1
               start_step = 1;
               end_step = 3; 
           end 
           if i == 2
               start_step = 1;
               end_step = 4;
           end
           if i == 3
               start_step = 1;
               end_step = 5; 
           end
           if (i >= 4 && i < n-2)
               start_step = i-2;
               end_step = start_step + 4;
           end
           if (i == n-2)
              start_step = i-2;
              end_step = n; 
           end
           if (i == n-1)
              start_step = i-2;
              end_step = n; 
           end
           if (i == n)
              start_step = i-2;
              end_step = n; 
           end
           for j = start_step:end_step
               res(i,1) = res(i,1) + a2(i,j)*xk(j,1);
           end
      end 
      rk = b2 - res;
    else

      rk = rk - ak*res;
    endif
    norma = norm(rk);
    
endwhile

disp('Ta pente arxika psifia')
for i=1:5
    xk(i)
end
disp('Ta pente mesaia psifia')
for i=(n/2)-2:(n/2)+2
    xk(i)
end
disp('Ta pente teleutaia psifia')
for i=n-4:n
    xk(i)
end
disp(k);