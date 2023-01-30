function affichage(Xt, yt, nb_de_points)
    
    para1 = Xt(1:nb_de_points, 2); % Extraction du paramètre 1
    para2 = Xt(1:nb_de_points, 3); % Extraction du paramètre 2
    hold on

    for i=1:nb_de_points
        if yt(i) == 0
            scatter(para1(i), para2(i), 'red')
        else
            scatter(para1(i), para2(i), 'green')
        end
        disp(['Avancée : ' num2str(i/nb_de_points * 100) ' % '])
    end
    disp('Chargement du graphique...')
    legend('Classe 0')
    xlabel('Paramètre 2')
    ylabel('Paramètre 3')
    hold off
end