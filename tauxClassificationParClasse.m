function tauxClassificationParClasse(y_pred, yt)
    erreurs = 0;
    erreurs_classe_1 = 0;
    erreurs_classe_2 = 0;
    erreurs_classe_3 = 0;
    erreurs_classe_4 = 0;
    erreurs_classe_5 = 0;
    erreurs_classe_6 = 0;
    erreurs_classe_7 = 0;
    
    for i=1:length(y_pred)
        if y_pred(i)~=yt(i)
            erreurs = erreurs +1;
            
            if yt(i) == 1
                erreurs_classe_1 = erreurs_classe_1 + 1;
            elseif yt(i) ==2
                erreurs_classe_2 = erreurs_classe_2 + 1;
            elseif yt(i) ==3
                erreurs_classe_3 = erreurs_classe_3 + 1;
            elseif yt(i) ==4
                erreurs_classe_4 = erreurs_classe_4 + 1;
            elseif yt(i) ==5
                erreurs_classe_5 = erreurs_classe_5 + 1;
            elseif yt(i) ==6
                erreurs_classe_6 = erreurs_classe_6 + 1;
            elseif yt(i) ==7
                erreurs_classe_7 = erreurs_classe_7 + 1;
            end
    
        end
    end
    
    disp((1-(erreurs/length(y_pred))) * 100)
    
    disp(100 - erreurs_classe_1/length(y_pred)*100)
    disp(100 - erreurs_classe_2/length(y_pred)*100)
    disp(100 - erreurs_classe_3/length(y_pred)*100)
    disp(100 - erreurs_classe_4/length(y_pred)*100)
    disp(100 - erreurs_classe_5/length(y_pred)*100)
    disp(100 - erreurs_classe_6/length(y_pred)*100)
    disp(100 - erreurs_classe_7/length(y_pred)*100)
end
