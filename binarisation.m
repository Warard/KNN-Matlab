function y_binaire = binarisation(ya)
    y_binaire = []; % Vecteur qui contiendra les classes binaires
    for i=1:length(ya)
        if ya(i) == 1 % classe 1
            y_binaire = [y_binaire, 1];
        else % classe 2, 3, 4, 5, 6, 7
            y_binaire = [y_binaire, 0];
        end
    end
end