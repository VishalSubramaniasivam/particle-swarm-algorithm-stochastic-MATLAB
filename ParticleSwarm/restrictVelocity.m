function [velocity] = restrictVelocity(position,velocity,vMax)

    noOfParticles = size(position,1);

    for i=1:noOfParticles
        for j =1:2
            if velocity(i,j)>vMax
                velocity(i,j)=vMax;
            elseif velocity(i,j)<-vMax
                velocity(i,j)= - vMax;
            end
        end
    end

end