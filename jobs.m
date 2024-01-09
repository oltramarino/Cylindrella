function A= jobs
%% A function named jobs which is used to generate the trajectory for the slot-milling process %%
% INPUT(S):  NIL
% OUTPUT(S): A: A vector which consists of the milling coordinates
%%
    % Dimensions of the trajectory
    Length= 78;
    Width= 68;
    Depth=15;

    %Sequences along length
    seq1= 5;
    depart= [-12,25,20]; % Departure point- can be modified however must be within WS

    for i= 1:seq1
            a= rem(i,2);
            if a==1
                A(2*i-1,1:3)= [0,0+17*(i-1),0]+depart;
                A(2*i,1:3)= [-Length,0+17*(i-1),0]+depart;
            elseif a==0
                A(2*i-1,1:3)= [-Length,0+17*(i-1),0]+depart;
                A(2*i,1:3)= [0,0+17*(i-1),0]+depart;
            end
    end
    m1=A;
    m2=flip(A);
    for i = 1
        a= rem(i,2);
        if a==1
            A1= m2 + [0,0,-5*i];
        elseif a==0
            A1= m1 + [0,0,-5*i];
        end
        A= [A;A1];
    end

    % Plotting the trajectory
    for i = 1 : length(A)-1

        plot3([A(i,1),A(i+1,1)],[A(i,2),A(i+1,2)],[A(i,3),A(i+1,3)],'k--');
        hold on;
    end        

end