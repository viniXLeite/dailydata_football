CREATE TABLE football_teams (
    id INT PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    short_name VARCHAR(20) NOT NULL,
    tla VARCHAR(10) NOT NULL,
    crest_url VARCHAR(60),
    updated_at DATE
);

CREATE TABLE competitions (
    id INT PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    code VARCHAR(10) NOT NULL,
    area_name VARCHAR(20) NOT NULL
);

CREATE TABLE matches (
    id INT PRIMARY KEY,
    competition_id INT NOT NULL,
    home_team_id INT NOT NULL,
    away_team_id INT NOT NULL,
    utc_date DATE NOT NULL,
    status ENUM('SCHEDULED', 'IN_PLAY', 'FINISHED', 'POSTPONED'),
    stage VARCHAR(30),
    match_day INT NOT NULL,
    score_home_fulltime INT,
    score_away_fulltime INT,
    score_home_halftime INT,
    score_away_halftime INT,
    winner ENUM('Home_team', 'Away_team', 'Draw', 'Suspended')
    FOREIGN KEY(competition_id) REFERENCES competitions(id),
    FOREIGN KEY(home_team_id) REFERENCES football_teams(id),
    FOREIGN KEY(away_team_id) REFERENCES football_teams(id),
);

CREATE TABLE predictions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    match_id INT NOT NULL,
    prob_home_win FLOAT NOT NULL,
    prob_draw FLOAT NOT NULL,
    prob_away_win FLOAT NOT NULL,
    model VARCHAR(60) NOT NULL,
    calculated_date DATE NOT NULL,
    FOREIGN KEY(partida_id) REFERENCES matches("id")
);