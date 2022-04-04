%Particle swarm optimization for function:

clear 

%constants while initializing
alpha = 1;
dT = 1;
xMin = -5;
xMax = 5;

%constants while updating particle velocity
c1 = 2;
c2 = 2;
w = 1.4;
beta = 0.95;
wMin = 0.35;

%constants while restricitng velocity
vMax = (xMax-xMin)/dT;

%creating vector for best global value and position
bestGlobalPosition = zeros(1,2);
bestGlobalValue = inf; 

numberOfParticles = 50;
numberOfIterations = 10000;

%creating vector for best local value and position
bestLocalPosition = zeros(numberOfParticles,2);
bestLocalValue (1:numberOfParticles,1) = inf;

%Step1 : Initializing velocity and position
[positionParticle,velocityParticle] = initializing(xMin,xMax,numberOfParticles,alpha,dT);

iter=1;

while iter<numberOfIterations
    
    %Step 2 & Step 3: Evaluation of function and updating best local and
    %global position
    functionValue = zeros(numberOfParticles,1);  
    for i=1:numberOfParticles
        functionValue(i) = functionEvaluate(positionParticle(i,1),positionParticle(i,2));
        if functionValue(i)<bestLocalValue(i)
            bestLocalValue(i) = functionValue(i);
            bestLocalPosition(i,:) = positionParticle(i,:);
        end        
        if functionValue(i)<bestGlobalValue
            bestGlobalValue = functionValue(i);
            bestGlobalPosition = positionParticle(i,:);
        end        
    end
    
    %Step 4: Updating particle velocity
    velocityParticle = updateVelocities(w,velocityParticle,c1,bestGlobalPosition,dT,positionParticle,c2,bestLocalPosition);
    
    %Step 5: Restricting Velocity
    velocityParticle = restrictVelocity(positionParticle,velocityParticle,vMax);
    
    %Step 6: Updating Position
    positionParticle = updatePositions(positionParticle,velocityParticle,dT);
    
    %Step 7: Reducing influence of w
    if w>wMin
        w = w*beta;
    end
    
    iter = iter+1;
end

%Plot contour
plotContour()

















