clear;
clc;
format('compact');

n = input('Dwse to n: ');
k = input('Dwse to k: ');



%Epilogi provlimatos
fprintf('Epilogi problimatos\n');
fprintf('1. Gramika diaxorisimes\n');
fprintf('2. Mi gramika diaxorisimes 1\n');
fprintf('3. Mi gramika diaxorisimes 2\n');
fprintf('4. Mi gramika diaxorisimes 3 - xor\n');
fprintf('5. Telos\n\n');
epil = input('Dwse epilogi 1-5: ');


%kataskeui protipon

switch(epil)
    case 1
        fprintf('Gramika diaxorisimes\n')
         %x(1:n/2, 1:2) = 0.4 * rand(n/2,1) + 0;%Protypa class A
           %  x(n/2+1:n, 1:2) = 0.4 * rand(n/2,1) + 0.5;%Protypa class B
             
        x=rand(n/2,1)*0.4;
        y=rand(n/2,1)*0.4;
     class0=[x,y];
        x=0.5+ rand(n/2,1)*0.4;
        y=0.5+ rand(n/2,1)*0.4;
        class1=[x,y];

        pats=[class0;class1];
        
    case 2
        fprintf('Mi gramika diaxorisimes 1\n')
        
        x=rand(n/2,1)*0.6;
        y=rand(n/2,1)*0.6;
        class0=[x,y];

        x=0.5+ rand(n/2,1)*0.4;
        y=0.5+ rand(n/2,1)*0.4;
        class1=[x,y];

        pats=[class0;class1];
        
    case 3
        fprintf('Mi gramika diaxorisimes 2\n')
   
            
            
        x=rand(n/2,1)*0.4;
        y=rand(n/2,1)*0.4;
        class0=[x,y];

        x=rand(n/4,1)*0.9;
        y=0.4+rand(n/4,1)*0.5;
        class1=[x,y];
        
        x=0.5+rand(n/4,1)*0.4;
        y=rand(n/4,1)*0.5;
        class3=[x,y];

        pats=[class0;class1;class3];
         
    case 4
        fprintf('Mi gramika diaxorisimes 3 - xor\n')
        
        x=rand(n/4,1)*0.4;
        y=rand(n/4,1)*0.4;
        class0=[x,y];
        
        x=0.5+rand(n/4,1)*0.4;
        y=0.5+rand(n/4,1)*0.4;
        class1=[x,y];
        
        x=0.5+rand(n/4,1)*0.4;
        y=rand(n/4,1)*0.4;
        class2=[x,y];
        
        x=rand(n/4,1)*0.4;
        y=0.5+rand(n/4,1)*0.4;
        class3=[x,y];
        
        pats=[class0;class1;class2;class3];
        
    case 5
         fprintf('Telos\n');
         break;
    otherwise
         fprintf('Error!!!\n');
end;% switch
x(:,k+1)=-1;
    %for j=1:k+1
    w1=randn(k+1,1)
    %end
    
    w2=randn(k,1)
     
     
    d(1,1:n/2)=-1;
    d(1,(n/2)+1:n)=1;
     
    
    figure(1);
    
    subplot(1,1,1);
    hold on;
    plot(pats(1:(n/2),1),pats(1:(n/2),2),'r+');
    plot(pats((n/2)+1:n,1),pats((n/2)+1:n,2),'bo');
   pause;
            hold off;
            
              p1 = 0; 
            r1 = 0.9;
           c    = (r1 -   p1)*rand(k,2) + p1;   %dhmiourgw ta kentra gia eykolia otan thelw na allaksw kati xrishmopoiw ts metavlites a b
           
            
            c_old=zeros(k,2);
           epochs=0;
           cnt=zeros(1,k);
           
           
            while  (norm(c-c_old)>0) % c_old~=c %
    cnt=zeros(1,k);
   c_old=c;
 
    for i=1:n
       
        for j=1:k
        apost(j)=norm(pats(i,:)-c(j,:))^2;
       
        end
       
             [m theseis(i)]=min(apost);
       
        
    end
    
    for i=1:n
        c(theseis(i),1:2)=c(theseis(i),1:2)+pats(i,1:2);
        cnt(theseis(i))=cnt(theseis(i))+1;
    end
    cnt
    for j=1:k
        if (cnt(j)~=0)
           c(j,:)=c(j,:)/cnt(j); 
     
        end % end if
    
    end %end for
    epochs=epochs+1;
             figure(2);
    subplot(1,1,1);
    plot(pats(:,1),pats(:,2),'r+');
    hold on;
plot(c(:,1),c(:,2),'go','MarkerSize',30);
pause(0.1);
hold off;
end %end while


for j=1:k
    for i=1:k
    apostash( j ) = norm( c( i,:)-c( j,:))^2;
    end
    max_d(j)=max(apostash(j));
    
    sigma(j)=max_d(j)/sqrt(2*n);
end


%Epilogi provlimatos
fprintf('Epilogi Synartisis RBF\n');
fprintf('1. e^((x-c)^2/c^2)\n');
fprintf('2. sqrt((x-c)^2+c^2) 1\n');
fprintf('3. 1/(ò*((x-c)^2+c^2))\n');
fprintf('4. Telos\n\n');
epil = input('Dwse epilogi 1-4: ');

switch(epil)
    case 1
      for i=1:n
        prot(i)=exp((((pats(i)-c(theseis(i)))^2)/c(theseis(i)).^2)/n)
      end
        
    case 2
        
        
    case 3
       
         
    case 4
      
         fprintf('Telos\n');
         break;
    otherwise
         fprintf('Error!!!\n');
end;% switch

%bima 11

for i=1:n
    for j=1:k
    end
end

epochs=0;
beta = input('Dwse to sintelesti ekpaideusis: ');
max_num_epochs = input('Dwse to megisto arithmo epanalipseon : ');
mmse= input('Dwse to Elaxisto Meso Tetragoniko Sfalma: ');

 u = zeros(n,1);
    v = zeros(n,1);
error=1;
   % mse=0;
    %changes=1;
    
    while ((error>mmse) && (epochs<max_num_epochs))
          for i=1:n
        %u(i) = prot(i,1:2)*w1(1:2,1);
        
         %v(i) = u(i);
          
         %w1(1:2,1) = w1(1:2,1) + beta*(d(i) - v(i))*prot(i);
        end %end for
        
        
    end %end of while
