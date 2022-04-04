function [position,velocity] = initializing(xMin,xMax,noOfParticles,alpha,dT)

    position = zeros(noOfParticles,2);
    velocity = zeros(noOfParticles,2);

    for i=1:noOfParticles
            r = rand;
            position(i,1) = xMin + r*(xMax-xMin);
            r = rand;
            position(i,2) = xMin + r*(xMax-xMin);
            r = rand;
            velocity(i,1) = (alpha/dT)*((-xMax-xMin)/2+r*(xMax-xMin));
            r = rand;
            velocity(i,2) = (alpha/dT)*((-xMax-xMin)/2+r*(xMax-xMin));
    end

end