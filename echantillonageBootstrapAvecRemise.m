function y_pred = echantillonageBootstrapAvecRemise(Xa, ya, Xt, yt, pourcentage_de_tirage)
    % Tirage aléatoire avec remise 
    rng('default')

    valeurs_tirees = [];
   for i=1:pourcentage_de_tirage*length(ya) % On effectue les tirages
        % Tirage d'un nb et insertion dans le vecteur 
        valeurs_tirees = [valeurs_tirees, randi(length(Xa))];        
    end
       
    % On créé la nouvelle matrice d'apprentissage
    Xb = zeros(length(valeurs_tirees), 9); % Initialisation de la matrice d'apprentissage
    yb = zeros(length(valeurs_tirees), 1); % Initialisation du vecteur label d'apprentissage
    for i=1:length(valeurs_tirees)
        Xb(i) = Xa(valeurs_tirees(i)); % Remplissage de la nouvelle matrice
        yb(i) = ya(valeurs_tirees(i)); % Remplissage du nouveau vecteur label
    end

    y_pred = classification(Xt, Xb, yb);
    tauxClassification(y_pred, yt);
end

       


