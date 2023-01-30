function y_pred = classification2(Xa, Xt, ya, yt)
    t = cputime;

    Xa(:, 10) = ya; % Insertion de la 10ème colonne dans Xa
    % Initialisation d'une matrice paramaètre par classe
    Xa_1 = []; Xa_2 = []; Xa_3 = []; Xa_4 = []; Xa_4 = []; Xa_5 = []; Xa_6 = []; Xa_7 = []; 

    % Remplissage d'une matrice de 9 paramètres par classe 
    for i=1:length(Xa)
        if Xa(i, 10) == 1
            Xa_1 = [Xa_1;Xa(i, 1:9)];      
        elseif Xa(i, 10) == 2
            Xa_2 = [Xa_2; Xa(i, 1:9)];
        elseif Xa(i, 10) == 3
            Xa_3 = [Xa_3; Xa(i, 1:9)]; 
        elseif Xa(i, 10) == 4
            Xa_4 = [Xa_4; Xa(i, 1:9)]; 
        elseif Xa(i, 10) == 5
            Xa_5 = [Xa_5; Xa(i, 1:9)]; 
        elseif Xa(i, 10) == 6
            Xa_6 = [Xa_6; Xa(i, 1:9)]; 
        elseif Xa(i, 10) == 7
            Xa_7 = [Xa_7; Xa(i, 1:9)]; 
        end
    end

    % Vecteur contenant les moyennes des paramètres par classe (7 éléments)
    moy_classes = [mean(mean(Xa_1)), mean(mean(Xa_2)), mean(mean(Xa_3)), mean(mean(Xa_4)), mean(mean(Xa_5)), mean(mean(Xa_6)), mean(mean(Xa_7))];

    y_pred = ones(length(Xt), 1); % vecteurs de 1 (classe par défaut) dans lequel sera stocké le résultat de la classe
    for k=1:length(Xt)
        X = Xt(k, :);
        moy_X = mean(X); % Moyenne de la ligne de test     
        distance_mini = abs(moy_classes(1)-moy_X); % Initialisation d'une distance mini
        
        for i = 1:7
            if not(isnan(moy_classes(i))) % Si certaines classes n'existent pas, moy_classes(i) est de type NaN : On ne calcule donc pas la distance on passe
                distance = abs(moy_classes(i) - moy_X);
                if distance < distance_mini
                    distance_mini = distance;
                    y_pred(k) = i;
                end
            end
        end    
    end

    vrai = 0;
    c1 = 0; c2 = 0; c3=0; c4 = 0; c5=0; c6=0; c7=0;
    cvrai_1 = 0; cvrai_2=0; cvrai_3 = 0; cvrai_4=0; cvrai_5=0; cvrai_6=0; cvrai_7=0;

    for i=1:length(y_pred)
        if yt(i) == 1
            c1 = c1 + 1;
            if y_pred(i) ==1
                cvrai_1 = cvrai_1 + 1;
            end
        elseif yt(i) == 2
            c2 = c2 +1;
            if y_pred(i) ==2
                cvrai_2 = cvrai_2 + 1;
            end
        elseif yt(i) == 3
            c3 = c3 +1;
            if y_pred(i) ==3
                cvrai_3 = cvrai_3 + 1;
            end
        elseif yt(i) == 4
            c4 = c4 +1;
            if y_pred(i) ==5
                cvrai_4 = cvrai_4 + 1;
            end
        elseif yt(i) == 5
            c5 = c5 +1;
            if y_pred(i) ==5
                cvrai_5 = cvrai_5 + 1;
            end
        elseif yt(i) == 6
            c6 = c6 +1;
            if y_pred(i) ==6
                cvrai_6 = cvrai_6 + 1;
            end
        elseif yt(i) == 7
            c7 = c7 +1;
            if y_pred(i) ==7
                cvrai_7 = cvrai_7 + 1;
            end
        end

        if y_pred(i) == yt(i)
            vrai = vrai +1;
        end
    end
    
    disp(['Taux de réussite général (en %) : ' num2str(vrai/length(y_pred) * 100)])
    disp(['Taux de réussite classe 1 : ' num2str(cvrai_1/c1 *100)])
    disp(['Taux de réussite classe 2 : ' num2str(cvrai_2/c2 *100)])
    disp(['Taux de réussite classe 3 : ' num2str(cvrai_3/c3 *100)])
    disp(['Taux de réussite classe 4 : ' num2str(cvrai_4/c4 *100)])
    disp(['Taux de réussite classe 5 : ' num2str(cvrai_5/c5 *100)])
    disp(['Taux de réussite classe 6 : ' num2str(cvrai_6/c6 *100)])
    disp(['Taux de réussite classe 7 : ' num2str(cvrai_7/c7 *100)])

    disp(['Temps (s) ' num2str(cputime - t)])
end