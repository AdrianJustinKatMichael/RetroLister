INSERT INTO users (username, email, password, isAdmin)
VALUES ('admin', 'admin@gmail.com', '$2a$12$TX2iOkw3GwM/rI9bf29lRuZ460zaBKaD.XghPjRHSuy2/k3dbd5li', 1),
       ('testuser', 'testing@gmail.com', '$2a$12$oVhUY.VYN3Jc.vH6VpUoJuX7mnUrYONqdelImDfeG79q99.GTomOK', 0),
       ('pcgamer4life', 'pcgamer@gmail.com', '$2a$12$ChylUuw1dilVqAOgQsh3OuCqQ837kVVLA19I494.Gk2SqNc2fmuvq', 0),
       ('xbone', 'xbone@gmail.com', '$2a$12$YRD45k773fm6oGTHBurkBOp56PQQkvYyi7IW6Hux9qZFkse32RzpC', 0);

INSERT INTO ads (user_id, title, console, description, image_url, post_type)
VALUES (1, 'Final Fantasy Crystal Chronicles', 'Gamecube', 'gently used, dm for price', 'https://images.igdb.com/igdb/image/upload/t_cover_big/co1vjk.png', 'selling'),
       (1, 'Spyro the Dragon', 'PlayStation', 'like new condition $50', 'https://images.igdb.com/igdb/image/upload/t_cover_big/co3kmh.png', 'selling'),
       (2, 'Marvel vs. Capcom: Clash of Super Heroes', 'PlayStation', 'open to trade or buy up to $80, dm with offers', 'https://images.igdb.com/igdb/image/upload/t_cover_big/co2s55.png', 'requesting'),
       (2, 'Sonic the Hedgehog', 'Sega Genesis', 'like new', 'https://images.igdb.com/igdb/image/upload/t_cover_big/co1zun.png', 'selling'),
       (3, 'Baldur''s Gate', 'Microsoft Windows', 'like new', 'https://images.igdb.com/igdb/image/upload/t_cover_big/co1s1j.png', 'selling'),
       (3, 'Diablo II', 'Microsoft Windows', 'small scratches on disc but functional', 'https://images.igdb.com/igdb/image/upload/t_cover_big/co1s1j.png', 'selling'),
       (4, 'Kirby Super Star', 'SNES', 'gently used $50', 'https://images.igdb.com/igdb/image/upload/t_cover_big/co3fqp.png', 'selling'),
       (4, 'Pokémon Yellow', 'Game Boy', 'brand new unopened box', 'https://images.igdb.com/igdb/image/upload/t_cover_big/co2sa8.png', 'selling');
