function y_pred = echantillonageBootstrapSansRemise(Xa, ya, Xt, yt, pourcentage_de_tirage)
    % Tirage aléatoire sans remise 
    valeurs_tirees = [];

    rng('default')

    while length(valeurs_tirees) < pourcentage_de_tirage*length(ya) % Tant que l'on a pas fait tout les tirages
        % Tirage d'un nb
        retirer = false;
        nb_alea = randi(length(Xa));

        % Vérifie que ce nombre n'est pas déjà  tiré   
        for i=1:length(valeurs_tirees)
            % S'il est déjà tiré
            if valeurs_tirees(i) == nb_alea
                retirer = true;
            end
        end
        
        % Si on a pas besoin de retirer
        if retirer==false
            valeurs_tirees= [valeurs_tirees, nb_alea];
        end
    end

       
    % On créé la nouvelle matrice d'apprentissage
    Xb = zeros(length(valeurs_tirees), 9); % Initialisation de la matrice de test
    yb = zeros(length(valeurs_tirees), 1); % Initialisation du vecteur label de test
    for i=1:length(valeurs_tirees)
        Xb(i) = Xa(valeurs_tirees(i)); % Remplissage de la nouvelle matrice
        yb(i) = ya(valeurs_tirees(i)); % Remplissage du nouveau vecteur label
    end

    y_pred = classification(Xt, Xb, yb);
    tauxClassification(y_pred, yt);
end

       


