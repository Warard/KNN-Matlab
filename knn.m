function y_pred = knn(K, Xa, Xt, ya, yt)
    y_pred = []; % Vecteur des prédictions 
    compteur = 1; % Compte le nombre de plus proche voisin
    for k=1:length(Xt)
        disp(k/length(Xt) * 100)
        Xb = Xa;
        yb = ya;
        t = Xt(k, :); % Extraction de la ligne de Xt
        D = []; % Vecteur stockant les distances de chaque voisin
        C = []; % Vecteur stockant les classes de chaque voisin 
        W = []; % Vecteur de 7 éléments calculant les poids de chaque classe 
        compteur = 1;
        while compteur <= K % On cherche K plus proche voisin à t
            indice = 1;
            dmin = norm(Xt(k, :) - Xb(1, :)); % Initialisation de la distance mini
            for l=1:length(Xb)
                a = Xb(l, :); % On extrait une ligne de Xa
                distance = norm(a - t);
                if distance < dmin
                    dmin = distance;
                    indice = l;
                end                
            end

            D = [D, dmin];
            C = [C, yb(indice)];
            compteur = compteur + 1;
            Xb(indice, :) = inf; % On supprime la ligne du voisin dans la matrice d'apprentissage
            yb(indice, :) = 12; % On supprime la ligne du voisin dans la matrice d'apprentissage
        end

        
        compteur1 = 0; W1 = 0;
        compteur2 = 0; W2 = 0;
        compteur3 = 0; W3 = 0;
        compteur4 = 0; W4 = 0;
        compteur5 = 0; W5 = 0;
        compteur6 = 0; W6 = 0;
        compteur7 = 0; W7 = 0;
       
        for u=1:length(C)
            if C(u) ==1
                W1 = W1 + 1/(D(u)^2);
                compteur1 = compteur1 + 1;
            elseif C(u) == 2
                W2 = W2 + 1/(D(u)^2);
                compteur2 = compteur2 + 1;
            elseif C(u) == 3
                W3 = W3 + 1/(D(u)^2);
                compteur3 = compteur3 + 1;
            elseif C(u) == 4
                W4 = W4 + 1/(D(u)^2);
                compteur4 = compteur4 + 1;
            elseif C(u) == 5
                W5 = W5 + 1/(D(u)^2);
                compteur5 = compteur5 + 1;
            elseif C(u) == 6
                W6 = W6 + 1/(D(u)^2);
                compteur6 = compteur6 + 1;
            else
                W7 = W7 + 1/(D(u)^2);
                compteur7 = compteur7 + 1;
            end
        end

        W = [W1/compteur1, W2/compteur2, W3/compteur3, W4/compteur4, W5/compteur5, W6/compteur6, W7/compteur7];

        d_max = W(1);
        indice_du_max = 1;
        for j=1:length(W) % Récupération du max de W  
            if W(j) > d_max
                d_max = W(j);
                indice_du_max = j;
            end
        end
        
        y_pred = [y_pred, indice_du_max];
    end

%     trouve = 0;
%     for i=1:length(y_pred)
%         if y_pred(i) ~=1
%             trouve = trouve + 1;
%         end
%     end
end