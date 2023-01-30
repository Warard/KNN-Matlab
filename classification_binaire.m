function classification_binaire(ya, yt, Xt, Xa)
    ya_binaire = binarisation(ya);
    yt_binaire = binarisation(yt);
    y_pred = classification(Xt, Xa, ya_binaire); % Calcul du vecteur prédiction
    
    % Calcul de performance
    erreurs = 0;
    erreurs_classe_0 = 0;
    erreurs_classe_1 = 0;

    for i=1:length(y_pred)
        if y_pred(i)~=yt_binaire(i)
            erreurs = erreurs +1;
            
            if yt_binaire(i) == 0
                erreurs_classe_0 = erreurs_classe_0 + 1;
            else
                erreurs_classe_1 = erreurs_classe_1 + 1;
            end    
        end
    end
    
    disp((1-(erreurs/length(y_pred))) * 100) % perfromance générale
    
    disp(100 - erreurs_classe_0/length(y_pred)*100) % Performance classe 0
    disp(100 - erreurs_classe_1/length(y_pred)*100) % Performance classe 1   

    %selection_dattributs(Xa, Xt, ya_binaire, yt_binaire)
end