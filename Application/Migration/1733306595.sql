ALTER TABLE posts ADD COLUMN up_vote TEXT NOT NULL;
ALTER TABLE posts ADD COLUMN down_vote TEXT NOT NULL;
ALTER TABLE users ADD COLUMN username TEXT NOT NULL;