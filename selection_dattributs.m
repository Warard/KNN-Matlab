function selection_dattributs(Xa, Xt, ya, yt)
    tau = []; % vecteur dont l'élément i correspond à la performance sans l'attribut i 
    m = size(Xa);
    for i=1:m(2)
        Xb = Xa;
        Xt_prime = Xt;
        Xb(:, i) = []; % Suppresion de la colonne i (=paramètres i)
        Xt_prime(:, i) = []; % Suppresion de la colonne i (=paramètres i)
        y_pred = classification(Xt_prime, Xb, ya); % prediction
        tau = [tau, tauxClassification(y_pred, yt)]; % Calcul de la performance sans la colonne i
    end
    disp(tau)

    % Recherche du paramètre le plus important
    indice_mini = 1;
    mini = tau(1);
    for i=1:length(tau)
        if tau(i) < mini
            indice_mini = i;
            mini = tau(i);
        end
    end

    disp(['Le paramètre ' num2str(indice_mini) ' est le plus important'])
end