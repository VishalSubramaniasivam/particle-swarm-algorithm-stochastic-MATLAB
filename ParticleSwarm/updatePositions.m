function [positionParticle] = updatePositions(positionParticle,velocityParticle,dT)

    noOfParticles = size(positionParticle,1);

    for i=1:noOfParticles
        for j =1:2
            positionParticle(i,j) = positionParticle(i,j) + (velocityParticle(i,j)*dT);
        end
    end


end