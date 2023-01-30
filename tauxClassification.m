function tau = tauxClassification(ypred, yt)
    erreurs = 0; % Nombre d'erreurs comises dans la prédiction / à la réalité
    
    for i=1:length(ypred)
        if ypred(i)~=yt(i)
            erreurs = erreurs +1;
        end
    end
    
    tau = (1-(erreurs/length(ypred))) * 100;
    disp(['Performannce : ' num2str(tau) ' %'])
end