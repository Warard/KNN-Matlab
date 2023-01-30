%% ---- CLASSIFICATION PAR 1-NN ----
function y_pred = classification(Xt, Xa, ya) % Retourne un vecteur de prédiction des classes
    t = cputime;
    y_pred = zeros(length(Xt), 1); % Création du vecteur qui contiendra les prédictions de classe
    
    % Parcours de tous les points de Xt
    for i=1:length(Xt)
        X = Xt(i, :); % Donnée de test pour laquelle on va calculer sa distance / à tous les points de Xa
        
        % Recherche du plus proche voisin
        distance_mini = norm(Xt(i, :) - Xa(1, :)); % Initialisation d'une distance minimum
        for j=1:length(Xa)
            distance = norm(X - Xa(j, :));
            if distance < distance_mini
                distance_mini = distance;
                indice_du_plus_proche = j;            
            end
        end

        y_pred(i) = ya(indice_du_plus_proche); % Insertion de la classe du plus proche voisin dans le vecteur
        disp([num2str(round(i/length(Xt)*100, 1)) ' % ']); % Affichage de l'avancée du programme (de 0 à 100%)
    end
    disp(['Temps de classification : ' num2str(round(cputime - t)) ' s']) % Affichage du temps de calcul en s
end