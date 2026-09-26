USE cdg_hyd_jfs_058;

CREATE TABLE movies (
    movie_id INT NOT NULL AUTO_INCREMENT,
    movie_code VARCHAR(12) NOT NULL,
    title VARCHAR(200) NOT NULL,
    genre VARCHAR(60) NOT NULL,
    original_language VARCHAR(40) NOT NULL,
    release_date DATE,
    duration_minutes SMALLINT NOT NULL,
    director_name VARCHAR(120) NOT NULL,
    age_certificate VARCHAR(20) NOT NULL DEFAULT 'UNRATED',
    audience_rating DECIMAL(3,1),
    production_budget DECIMAL(15,2),
    catalog_status VARCHAR(20) NOT NULL DEFAULT 'UPCOMING',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAM ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT pk_movie_id PRIMARY KEY (movie_id),
    CONSTRAINT uk_movie_code UNIQUE (movie_code),
    CONSTRAINT chk_duration_minutes_greater_than_0 CHECK (duration_minutes > 0),
    CONSTRAINT chk_audience_rating CHECK (audience_rating IS NULL OR audience_rating BETWEEN 0.0 AND 10.0),
    CONSTRAINT chk_production_budget CHECK (production_budget IS NULL OR production_budget >= 0),
    CONSTRAINT chk_age_certificate CHECK (age_certificate IN ('ALL_AGES','PARENTAL_GUIDANCE','ADULT','UNRATED')),
    CONSTRAINT chk_catalog_status CHECK (catalog_status IN ('UPCOMING','RELEASED','ARCHIVED'))
);
INSERT INTO movies
(movie_code,title,genre,original_language,release_date,duration_minutes,director_name,age_certificate,audience_rating,production_budget,catalog_status)
VALUES
('MOV001','Future World','SCI_FI','English',NULL,130,'Arjun Mehta','UNRATED',NULL,NULL,'UPCOMING');
SELECT * FROM movies;
