%% ---- CHARGEMENT DES FICHIERS ----
% Chargement fichier d'apprentissage 
Xa = load('shuttle.trn');
nb_de_test_Xa = 0.2 * length(Xa); % Choix de la quantité de données d'apprentissage
Xa = Xa(1:nb_de_test_Xa, :); % Permet de ne pas prendre toutes les données 

ya = Xa(:, 10:10); % Récupération du vecteur label (10ème colonne)
Xa = Xa(:, 1:9); % Récupération des 9 premières colonnes 

% Chargement fichier de test
Xt = load('shuttle.tst');
nb_de_test_Xt = 0.5 * length(Xt); % Choix de la quantité de données de tests
Xt = Xt(1:nb_de_test_Xt, :); % Permet de ne pas prendre toutes les données

yt = Xt(:, 10:10); % Récupération du vecteur label 
Xt = Xt(:, 1:9); % Récupération des 9 premières colonnes 

%% ---- PRETRAITEMENT ----
Xa = normalize(Xa); % Normalisation 
Xt = normalize(Xt); % Normalisation 