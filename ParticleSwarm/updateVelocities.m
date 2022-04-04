function [velocity] = updateVelocities(w,velocity,c1,bestGlobalPosition,dT,position,c2,bestLocalPosition)

    noOfParticles = size(position,1);

    for i=1:noOfParticles
        r = rand;
        q = rand;
        for j =1:2
            temp1 = c1*q*((bestLocalPosition(i,j)-position(i,j))./dT);
            temp2 = c2*r*((bestGlobalPosition(j)-position(i,j))./dT);
            velocity(i,j) = temp1 + temp2 + w*velocity(i,j);
        end
    end

end