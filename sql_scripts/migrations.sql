-- p_citizenship
INSERT INTO hotel.p_citizenship (id, citizenship) VALUES (1, 'UK');
INSERT INTO hotel.p_citizenship (id, citizenship) VALUES (2, 'RUSSIA');
INSERT INTO hotel.p_citizenship (id, citizenship) VALUES (3, 'GERMANY');
INSERT INTO hotel.p_citizenship (id, citizenship) VALUES (4, 'USA');
INSERT INTO hotel.p_citizenship (id, citizenship) VALUES (5, 'JAPAN');
-- c_profiles
INSERT INTO hotel.c_profiles (id, client, status, person) VALUES (2, 1, 'vip', 1);
INSERT INTO hotel.c_profiles (id, client, status, person) VALUES (3, 2, 'standart', 2);
INSERT INTO hotel.c_profiles (id, client, status, person) VALUES (6, 5, 'standart', 5);
INSERT INTO hotel.c_profiles (id, client, status, person) VALUES (8, 6, 'standart', 7);
INSERT INTO hotel.c_profiles (id, client, status, person) VALUES (9, 8, 'standart', 9);
INSERT INTO hotel.c_profiles (id, client, status, person) VALUES (10, 9, 'vip', 10);
INSERT INTO hotel.c_profiles (id, client, status, person) VALUES (11, 7, 'standart', 8);
INSERT INTO hotel.c_profiles (id, client, status, person) VALUES (5, 11, 'standart', 4);
INSERT INTO hotel.c_profiles (id, client, status, person) VALUES (4, 10, 'standart', 11);
INSERT INTO hotel.c_profiles (id, client, status, person) VALUES (7, 3, 'vip', 6);
-- clients
INSERT INTO hotel.clients (id, login) VALUES (1, 'alex_nabb_1960');
INSERT INTO hotel.clients (id, login) VALUES (2, 'alyona_petrova_1992');
INSERT INTO hotel.clients (id, login) VALUES (3, 'poll_sanders_1956');
INSERT INTO hotel.clients (id, login) VALUES (4, 'john_parker_1968');
INSERT INTO hotel.clients (id, login) VALUES (5, 'lea_horrm_1940');
INSERT INTO hotel.clients (id, login) VALUES (6, 'summer_grov_1994');
INSERT INTO hotel.clients (id, login) VALUES (7, 'natalya_strelnikova_1984');
INSERT INTO hotel.clients (id, login) VALUES (8, 'rob_raus_1974');
INSERT INTO hotel.clients (id, login) VALUES (9, 'boris_strelnikov_2000');
INSERT INTO hotel.clients (id, login) VALUES (10, 'tanya_zagorodskay_1971');
INSERT INTO hotel.clients (id, login) VALUES (11, 'dee_seelt_1930');
-- companies
INSERT INTO hotel.companies (id, legal_name, legal_address, ppc, inn) VALUES (1, 'Saratov State University', 'Astrakhanskaya ul., 83, Saratov, Saratovskaya oblast'', 410012
', 102030405, 121234152);
INSERT INTO hotel.companies (id, legal_name, legal_address, ppc, inn) VALUES (2, 'Upravleniye razvitiya potrebitelskogo rynka i zashchity prav potrebiteley Administratsii munitsipalnogo obrazovaniya "Gorod Saratov"', 'ul. Pervomayskaya, 76, Saratov, Saratovskaya oblast'', 410000', 201430405, 203040501);
INSERT INTO hotel.companies (id, legal_name, legal_address, ppc, inn) VALUES (3, 'Control center in crisis situations Saratov region', 'ul. imeni Kutyakova I.S., 1, Saratov, Saratovskaya oblast'', 410000
', 309930417, 881723940);
INSERT INTO hotel.companies (id, legal_name, legal_address, ppc, inn) VALUES (4, 'ZAGS po Zavodskomu rayonu g. Saratov', 'Kavkazskaya ul., 11, Saratov, Saratovskaya oblast'', 410049', 102023210, 726591721);
INSERT INTO hotel.companies (id, legal_name, legal_address, ppc, inn) VALUES (5, 'Vershina-Saratov', 'БЦ "Дикомп", ul. Tankistov, 37, Saratov, Saratov Oblast, 410019', 335313646, 144383759);
INSERT INTO hotel.companies (id, legal_name, legal_address, ppc, inn) VALUES (6, 'Spiritual Administration of Muslims of Saratov Cathedral Mosque', 'ul. Valovaya, Saratov, Saratovskaya oblast'', 410031', 953736019, 893707168);
INSERT INTO hotel.companies (id, legal_name, legal_address, ppc, inn) VALUES (7, 'International Organisation For Migration ', '11 Belgrave Rd, Pimlico, London SW1V 1TU, UK', 273191799, 587323213);
INSERT INTO hotel.companies (id, legal_name, legal_address, ppc, inn) VALUES (8, 'Citizens UK', '112 Cavell St, Whitechapel, London E1 2JA, UK', 276095325, 483316876);
INSERT INTO hotel.companies (id, legal_name, legal_address, ppc, inn) VALUES (9, 'Una-USA', '801 2nd Ave #2, New York, NY 10017, USA', 692755160, 451512127);
INSERT INTO hotel.companies (id, legal_name, legal_address, ppc, inn) VALUES (10, 'United States Olympic Committee', '1 Olympic Plaza, Colorado Springs, CO 80909, USA', 373161861, 933473045);
INSERT INTO hotel.companies (id, legal_name, legal_address, ppc, inn) VALUES (11, 'Care USA', '32 W 39th St #3, New York, NY 10018, USA
', 255212625, 829907571);
INSERT INTO hotel.companies (id, legal_name, legal_address, ppc, inn) VALUES (12, 'Shotokan World Organization', 'Święty Marcin 28, 61-805 Poznań, Poland', 323262172, 399453114);
INSERT INTO hotel.companies (id, legal_name, legal_address, ppc, inn) VALUES (13, 'World Health Organization Office in The People''s Republic of China', '23 Dongzhimen Outer St, Chaoyang Qu, Beijing Shi, China, 100600', 248112966, 491680623);
-- co_phones
INSERT INTO hotel.co_phones (id, company, type, phone) VALUES (12, 1, 2, '88452261696');
INSERT INTO hotel.co_phones (id, company, type, phone) VALUES (13, 2, 2, '88452260897');
INSERT INTO hotel.co_phones (id, company, type, phone) VALUES (14, 3, 2, '88452263173');
INSERT INTO hotel.co_phones (id, company, type, phone) VALUES (15, 4, 2, '88452966019');
INSERT INTO hotel.co_phones (id, company, type, phone) VALUES (16, 5, 2, '89179870741');
INSERT INTO hotel.co_phones (id, company, type, phone) VALUES (17, 6, 2, '88452281441');
INSERT INTO hotel.co_phones (id, company, type, phone) VALUES (18, 7, 2, '442078116000');
INSERT INTO hotel.co_phones (id, company, type, phone) VALUES (19, 8, 2, '442070439881');
INSERT INTO hotel.co_phones (id, company, type, phone) VALUES (20, 9, 2, '12129071300');
INSERT INTO hotel.co_phones (id, company, type, phone) VALUES (21, 10, 2, '17196325551');
INSERT INTO hotel.co_phones (id, company, type, phone) VALUES (22, 11, 2,'12124534647');
INSERT INTO hotel.co_phones (id, company, type, phone) VALUES (23, 12, 2, '48886702701');
INSERT INTO hotel.co_phones (id, company, type, phone) VALUES (24, 13, 2, '861065327189');
INSERT INTO hotel.co_phones (id, company, type, phone) VALUES (25, 1, 2, '88452261696');
INSERT INTO hotel.co_phones (id, company, type, phone) VALUES (26, 4, 2, '78452966019');
-- employers
INSERT INTO hotel.employers (id, login) VALUES (1, 'john_gramm_1980');
INSERT INTO hotel.employers (id, login) VALUES (2, 'sara_kott_1992');
INSERT INTO hotel.employers (id, login) VALUES (3, 'raimon_jis_1979');
INSERT INTO hotel.employers (id, login) VALUES (4, 'ray_klaymon_1991');
INSERT INTO hotel.employers (id, login) VALUES (5, 'bobby_doo_1972');
-- e_schedule
INSERT INTO hotel.e_schedule (id, description) VALUES (1, null);
INSERT INTO hotel.e_schedule (id, description) VALUES (3, null);
INSERT INTO hotel.e_schedule (id, description) VALUES (2, '8-16');
-- orders
INSERT INTO hotel.orders (id, service, client, employee, invoice, quantity, date) VALUES (1, 1, 1, null, null, null, '2017-04-07');
INSERT INTO hotel.orders (id, service, client, employee, invoice, quantity, date) VALUES (3, 3, 3, null, null, null, '2017-04-07');
INSERT INTO hotel.orders (id, service, client, employee, invoice, quantity, date) VALUES (4, 4, 4, null, null, null, '2017-04-07');
INSERT INTO hotel.orders (id, service, client, employee, invoice, quantity, date) VALUES (6, 6, 6, null, null, null, '2017-04-07');
INSERT INTO hotel.orders (id, service, client, employee, invoice, quantity, date) VALUES (8, 8, 8, null, null, null, '2017-04-07');
INSERT INTO hotel.orders (id, service, client, employee, invoice, quantity, date) VALUES (10, 9, 10, null, null, null, '2017-04-07');
INSERT INTO hotel.orders (id, service, client, employee, invoice, quantity, date) VALUES (2, 2, 2, null, null, null, '2015-04-16');
INSERT INTO hotel.orders (id, service, client, employee, invoice, quantity, date) VALUES (5, 5, 5, null, null, null, '2017-04-09');
INSERT INTO hotel.orders (id, service, client, employee, invoice, quantity, date) VALUES (7, 7, 7, null, null, null, '2017-04-10');
INSERT INTO hotel.orders (id, service, client, employee, invoice, quantity, date) VALUES (9, 9, 9, null, null, null, '2007-04-18');
INSERT INTO hotel.orders (id, service, client, employee, invoice, quantity, date) VALUES (11, 9, 11, null, null, null, '2017-04-30');
-- p_passport
INSERT INTO hotel.p_passport (id, passport_series, passport_id, data_on_passport) VALUES (1, '6315', '345233', '1985-03-20');
INSERT INTO hotel.p_passport (id, passport_series, passport_id, data_on_passport) VALUES (2, '6420', '652354', '1970-09-20');
INSERT INTO hotel.p_passport (id, passport_series, passport_id, data_on_passport) VALUES (3, '6617', '644321', '2000-10-21');
INSERT INTO hotel.p_passport (id, passport_series, passport_id, data_on_passport) VALUES (4, '6310', '232152', '1990-01-01');
INSERT INTO hotel.p_passport (id, passport_series, passport_id, data_on_passport) VALUES (5, '6315', '652334', '1960-02-29');
INSERT INTO hotel.p_passport (id, passport_series, passport_id, data_on_passport) VALUES (6, '6310', '825123', '1989-01-20');
INSERT INTO hotel.p_passport (id, passport_series, passport_id, data_on_passport) VALUES (7, '6122', '234164', '1952-02-09');
INSERT INTO hotel.p_passport (id, passport_series, passport_id, data_on_passport) VALUES (9, '6510', '512364', '1995-12-30');
INSERT INTO hotel.p_passport (id, passport_series, passport_id, data_on_passport) VALUES (10, '6110', '912362', '1996-02-22');
INSERT INTO hotel.p_passport (id, passport_series, passport_id, data_on_passport) VALUES (8, '6510', '812634', '1990-03-20');
INSERT INTO hotel.p_passport (id, passport_series, passport_id, data_on_passport) VALUES (11, '1251', '231320', '1930-03-13');
INSERT INTO hotel.p_passport (id, passport_series, passport_id, data_on_passport) VALUES (12, '1235', '261262', '1990-06-05');
INSERT INTO hotel.p_passport (id, passport_series, passport_id, data_on_passport) VALUES (13, '1523', '721362', '1990-06-05');
INSERT INTO hotel.p_passport (id, passport_series, passport_id, data_on_passport) VALUES (14, '2321', '123724', '1990-06-05');
INSERT INTO hotel.p_passport (id, passport_series, passport_id, data_on_passport) VALUES (15, '2321', '641921', '1990-06-05');
INSERT INTO hotel.p_passport (id, passport_series, passport_id, data_on_passport) VALUES (16, '8231', '125322', '1990-06-05');
INSERT INTO hotel.p_passport (id, passport_series, passport_id, data_on_passport) VALUES (17, '2332', '812352', '1990-06-05');
-- person
INSERT INTO hotel.person (id, first_name, last_name, middle_name, sex, birthday, passport, marital_status, children) VALUES (1, 'Alex', 'Nabb', null, 'male', '1960-03-15', 1, 'unmarried', false);
INSERT INTO hotel.person (id, first_name, last_name, middle_name, sex, birthday, passport, marital_status, children) VALUES (2, 'Alyona', 'Petrova', 'Vasilievna', 'female', '1992-12-15', 10, 'married', true);
INSERT INTO hotel.person (id, first_name, last_name, middle_name, sex, birthday, passport, marital_status, children) VALUES (3, 'John', 'Parker', null, 'male', '1968-10-27', 8, 'unmarried', false);
INSERT INTO hotel.person (id, first_name, last_name, middle_name, sex, birthday, passport, marital_status, children) VALUES (6, 'Poll', 'Sanders', null, 'male', '1956-01-05', 2, 'unmarried', false);
INSERT INTO hotel.person (id, first_name, last_name, middle_name, sex, birthday, passport, marital_status, children) VALUES (4, 'Dee', 'Seelt', null, 'male', '1930-04-04', 7, 'married', true);
INSERT INTO hotel.person (id, first_name, last_name, middle_name, sex, birthday, passport, marital_status, children) VALUES (5, 'Lea', 'Horrm', null, 'female', '1940-05-08', 9, 'unmarried', false);
INSERT INTO hotel.person (id, first_name, last_name, middle_name, sex, birthday, passport, marital_status, children) VALUES (7, 'Summer', 'Grov', null, 'female', '1994-09-17', 3, 'unmarried', false);
INSERT INTO hotel.person (id, first_name, last_name, middle_name, sex, birthday, passport, marital_status, children) VALUES (8, 'Natalya', 'Strelnikova', 'Borisovna', 'female', '1984-02-19', 4, 'married', true);
INSERT INTO hotel.person (id, first_name, last_name, middle_name, sex, birthday, passport, marital_status, children) VALUES (9, 'Rob', 'Raus', null, 'male', '1974-09-17', 5, 'unmarried', false);
INSERT INTO hotel.person (id, first_name, last_name, middle_name, sex, birthday, passport, marital_status, children) VALUES (11, 'Tanya', 'Zagorodskay', 'Gregorieva', 'female', '1971-10-07', 6, 'unmarried', false);
INSERT INTO hotel.person (id, first_name, last_name, middle_name, sex, birthday, passport, marital_status, children) VALUES (10, 'Boris', 'Strelnikov', 'Pavlovich', 'male', '1988-01-02', 11, 'married', true);
INSERT INTO hotel.person (id, first_name, last_name, middle_name, sex, birthday, passport, marital_status, children) VALUES (14, 'John', 'Gramm', null, 'male', '1980-03-18', 12, 'unmarried', false);
INSERT INTO hotel.person (id, first_name, last_name, middle_name, sex, birthday, passport, marital_status, children) VALUES (15, 'Raimon', 'Jis', null, 'male', '1979-11-04', 13, 'unmarried', false);
INSERT INTO hotel.person (id, first_name, last_name, middle_name, sex, birthday, passport, marital_status, children) VALUES (16, 'Ray', 'Klaymon', null, 'male', '1991-10-26', 14, 'married', true);
INSERT INTO hotel.person (id, first_name, last_name, middle_name, sex, birthday, passport, marital_status, children) VALUES (17, 'Bobby', 'Doo', null, 'male', '1972-06-06', 15, 'married', true);
INSERT INTO hotel.person (id, first_name, last_name, middle_name, sex, birthday, passport, marital_status, children) VALUES (13, 'Sara', 'Kott', null, 'female', '1992-03-31', 16, 'married', true);
-- e_position
INSERT INTO hotel.e_position (id, title) VALUES (1, 'Operations Manager');
INSERT INTO hotel.e_position (id, title) VALUES (2, 'Restaurant Manager');
INSERT INTO hotel.e_position (id, title) VALUES (3, 'General Manager');
INSERT INTO hotel.e_position (id, title) VALUES (4, 'Manager of Security');
INSERT INTO hotel.e_position (id, title) VALUES (5, 'Director of Banquets');
INSERT INTO hotel.e_position (id, title) VALUES (6, 'Director of Finance');
INSERT INTO hotel.e_position (id, title) VALUES (7, 'Security');
-- r_types
INSERT INTO hotel.r_types (id, type, price) VALUES (1, 'standart', $50.00);
INSERT INTO hotel.r_types (id, type, price) VALUES (2, 'vip', $400.00);
INSERT INTO hotel.r_types (id, type, price) VALUES (3, 'Penthouse', $460.00);
-- rooms
INSERT INTO hotel.rooms (id, room, floor, type, status) VALUES (1, '1', 1, 1, false);
INSERT INTO hotel.rooms (id, room, floor, type, status) VALUES (2, '2', 1, 1, true);
INSERT INTO hotel.rooms (id, room, floor, type, status) VALUES (5, '5', 2, 1, true);
INSERT INTO hotel.rooms (id, room, floor, type, status) VALUES (8, '8', 2, 1, true);
INSERT INTO hotel.rooms (id, room, floor, type, status) VALUES (10, '10', 3, 2, true);
INSERT INTO hotel.rooms (id, room, floor, type, status) VALUES (12, '101', 10, 3, true);
INSERT INTO hotel.rooms (id, room, floor, type, status) VALUES (13, '102', 10, 3, true);
INSERT INTO hotel.rooms (id, room, floor, type, status) VALUES (3, '3', 1, 1, false);
INSERT INTO hotel.rooms (id, room, floor, type, status) VALUES (4, '4', 1, 1, false);
INSERT INTO hotel.rooms (id, room, floor, type, status) VALUES (6, '6', 2, 1, false);
INSERT INTO hotel.rooms (id, room, floor, type, status) VALUES (7, '7', 2, 1, false);
INSERT INTO hotel.rooms (id, room, floor, type, status) VALUES (9, '9', 3, 2, false);
INSERT INTO hotel.rooms (id, room, floor, type, status) VALUES (11, '11', 3, 2, false);
INSERT INTO hotel.rooms (id, room, floor, type, status) VALUES (14, '103', 10, 3, false);
-- service_price
INSERT INTO hotel.service_price (id, service, price) VALUES (1, 1, 5);
INSERT INTO hotel.service_price (id, service, price) VALUES (2, 2, 10);
INSERT INTO hotel.service_price (id, service, price) VALUES (3, 3, 30);
INSERT INTO hotel.service_price (id, service, price) VALUES (4, 4, 10);
INSERT INTO hotel.service_price (id, service, price) VALUES (5, 5, 5);
INSERT INTO hotel.service_price (id, service, price) VALUES (6, 6, 5);
INSERT INTO hotel.service_price (id, service, price) VALUES (8, 8, 1);
INSERT INTO hotel.service_price (id, service, price) VALUES (9, 9, 15);
INSERT INTO hotel.service_price (id, service, price) VALUES (10, 10, 15);
INSERT INTO hotel.service_price (id, service, price) VALUES (11, 11, 0);
INSERT INTO hotel.service_price (id, service, price) VALUES (12, 12, 10);
INSERT INTO hotel.service_price (id, service, price) VALUES (7, 7, 0);
-- service_types
INSERT INTO hotel.service_types (id, title, description) VALUES (1, 'Room service
', null);
INSERT INTO hotel.service_types (id, title, description) VALUES (2, 'Fitness Center', null);
INSERT INTO hotel.service_types (id, title, description) VALUES (3, 'Bar', null);
INSERT INTO hotel.service_types (id, title, description) VALUES (4, 'Dinner', 'from 17.30 to 22.30');
INSERT INTO hotel.service_types (id, title, description) VALUES (5, 'Breakfast buffet
', 'from 06.30-10.30');
INSERT INTO hotel.service_types (id, title, description) VALUES (6, 'Lunch', 'from 11.00 to 15.00');
INSERT INTO hotel.service_types (id, title, description) VALUES (7, 'Allergy friendly rooms', null);
INSERT INTO hotel.service_types (id, title, description) VALUES (8, 'Option to borrow a fridge for the room
', null);
INSERT INTO hotel.service_types (id, title, description) VALUES (9, 'Lounge with open fire
', null);
INSERT INTO hotel.service_types (id, title, description) VALUES (10, 'Wake-up call
', null);
INSERT INTO hotel.service_types (id, title, description) VALUES (11, 'Sightseeing', null);
INSERT INTO hotel.service_types (id, title, description) VALUES (12, 'Car hire
', null);
