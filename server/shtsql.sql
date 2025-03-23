-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               9.1.0 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.10.0.7000
-- --------------------------------------------------------
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;
/*!40101 SET NAMES utf8 */
;
/*!50503 SET NAMES utf8mb4 */
;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */
;
/*!40103 SET TIME_ZONE='+00:00' */
;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */
;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */
;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */
;
-- Dumping database structure for sht
CREATE DATABASE IF NOT EXISTS `sht`
/*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */
/*!80016 DEFAULT ENCRYPTION='N' */
;
USE `sht`;
-- Dumping structure for table sht.help_resources
CREATE TABLE IF NOT EXISTS `help_resources` (
	`resourceId` int NOT NULL AUTO_INCREMENT,
	`issue_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
	`resource_type` tinyint NOT NULL,
	`resource_info` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
	`description` text COLLATE utf8mb4_general_ci,
	PRIMARY KEY (`resourceId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;
-- Dumping data for table sht.help_resources: ~0 rows (approximately)
INSERT IGNORE INTO `help_resources` (
		`resourceId`,
		`issue_name`,
		`resource_type`,
		`resource_info`,
		`description`
	)
VALUES (
		1,
		'Anxiety',
		1,
		'1-800-555-ANXIETY',
		'National Anxiety Helpline, available 24/7'
	),
	(
		2,
		'Anxiety',
		2,
		'anxiety@helpline.com',
		'Email support for anxiety-related concerns'
	),
	(
		3,
		'Anxiety',
		3,
		'http://www.anxietyrelief.com',
		'A website offering resources, exercises, and articles to relieve anxiety'
	),
	(
		4,
		'Anxiety',
		4,
		'http://www.anxietysupportgroup.com',
		'An online, anonymous support group for people experiencing anxiety'
	),
	(
		5,
		'Depression',
		1,
		'1-800-273-TALK',
		'National Suicide Prevention Lifeline for those in distress'
	),
	(
		6,
		'Depression',
		2,
		'support@depressionsupport.com',
		'Email support for people dealing with depression'
	),
	(
		7,
		'Depression',
		3,
		'http://www.depressionsupport.org',
		'A website providing therapy, support, and advice for those suffering from depression'
	),
	(
		8,
		'Depression',
		4,
		'http://www.depressionsupportgroup.com',
		'An online support group for people struggling with depression'
	),
	(
		9,
		'PTSD',
		1,
		'1-800-555-PTSD',
		'Veterans Crisis Line providing 24/7 support for PTSD-related issues'
	),
	(
		10,
		'PTSD',
		2,
		'ptsd@helpline.com',
		'Email support for individuals experiencing PTSD'
	),
	(
		11,
		'PTSD',
		3,
		'http://www.ptsdhelp.org',
		'A website providing resources, support, and advice for PTSD sufferers'
	),
	(
		12,
		'PTSD',
		4,
		'http://www.ptsdpeerhelp.com',
		'An anonymous support group for people coping with PTSD'
	),
	(
		13,
		'Eating Disorders',
		1,
		'1-800-555-EDHELP',
		'Hotline for individuals struggling with eating disorders'
	),
	(
		14,
		'Eating Disorders',
		2,
		'support@eatingdisordersupport.com',
		'Email support for individuals dealing with eating disorders'
	),
	(
		15,
		'Eating Disorders',
		3,
		'http://www.eatingdisordersupport.org',
		'A website offering resources and articles for overcoming eating disorders'
	),
	(
		16,
		'Eating Disorders',
		4,
		'http://www.eatingdisordersanonymous.com',
		'An online support group for people with eating disorders'
	);
-- Dumping structure for table sht.professionals
CREATE TABLE IF NOT EXISTS `professionals` (
	`professionalId` int NOT NULL AUTO_INCREMENT,
	`name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
	`location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
	`availability` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
	`phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
	`email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
	`website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
	`profession` tinyint NOT NULL,
	`description` text COLLATE utf8mb4_general_ci NOT NULL,
	PRIMARY KEY (`professionalId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 182 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;
-- Dumping data for table sht.professionals: ~0 rows (approximately)
INSERT IGNORE INTO `professionals` (
		`professionalId`,
		`name`,
		`location`,
		`availability`,
		`phone`,
		`email`,
		`website`,
		`profession`,
		`description`
	)
VALUES (
		131,
		'Dr. Alice Smith',
		'Couch, USA',
		'Mon-Sun 12:00AM-11:59PM',
		'(123) 456-7890',
		'alice.smith@procrastinate.com',
		'www.dralicesmithbinges.com',
		2,
		'Dr. Smith helps clients embrace the beauty of \'just one more episode\' while navigating the delicate balance of snacks and naps.'
	),
	(
		132,
		'Dr. John Doe',
		'Inbox, USA',
		'Mon-Fri 09:00AM-05:00PM',
		'(234) 567-8901',
		'john.doe@inboxpanic.com',
		'www.drjohndoeavoids.com',
		2,
		'Dr. Doe specializes in minimizing the existential dread of unread emails and teaching the fine art of the polite ghost.'
	),
	(
		133,
		'Dr. Emily Johnson',
		'Mind Palace, USA',
		'Mon-Fri 10:00PM-02:00AM',
		'(345) 678-9012',
		'emily.johnson@whatif.com',
		'www.dremilyjohnsonspirals.com',
		2,
		'Dr. Johnson guides clients through endless hypothetical scenarios with a compassionate eye roll and a cup of herbal tea.'
	),
	(
		134,
		'Dr. Michael Brown',
		'Browser Tabs, USA',
		'Mon-Fri 09:00AM-09:00PM',
		'(456) 789-0123',
		'michael.brown@retailtherapy.com',
		'www.drmichaelbrowncarts.com',
		2,
		'Dr. Brown offers expert strategies in guilt-free shopping, from selective splurges to strategic cart abandonment.'
	),
	(
		135,
		'Dr. Sarah Wilson',
		'Living Room, USA',
		'Mon-Sun 08:00AM-08:00PM',
		'(567) 890-1234',
		'sarah.wilson@meowmail.com',
		'www.drsarahwilsonpurrs.com',
		2,
		'Dr. Wilson translates complex feline emotions, like \'feed me\' and \'no, not that food,\' for perplexed humans.'
	),
	(
		136,
		'Dr. Robert Martinez',
		'Scrolling Abyss, USA',
		'Mon-Fri 09:00AM-05:00PM',
		'(678) 901-2345',
		'robert.martinez@doomscroll.com',
		'www.drrobertmartinezmemes.com',
		2,
		'Dr. Martinez provides relief for meme-fatigue sufferers, encouraging offline giggles and retro memes.'
	),
	(
		137,
		'Dr. Jessica Taylor',
		'Elevator, USA',
		'Mon-Fri 09:00AM-05:00PM',
		'(789) 012-3456',
		'jessica.taylor@chitchat.com',
		'www.drjessicataylorsilence.com',
		2,
		'Dr. Taylor arms clients with foolproof responses to the dreaded \'crazy weather we\'re having.\''
	),
	(
		138,
		'Dr. William Anderson',
		'Desk, USA',
		'Mon-Fri 09:00AM-05:00PM',
		'(890) 123-4567',
		'william.anderson@taskavoider.com',
		'www.drwilliamandersonlists.com',
		2,
		'Dr. Anderson offers groundbreaking techniques like \'write it down and stare at it\' for maximum productivity guilt.'
	),
	(
		139,
		'Dr. Olivia Clark',
		'App Store, USA',
		'Mon-Fri 09:00AM-05:00PM',
		'(901) 234-5678',
		'olivia.clark@leftswipe.com',
		'www.droliviaclarkswipes.com',
		2,
		'Dr. Clark supports dating app survivors through profile detoxing and crafting bios that scream \'I love long walks to the fridge.\''
	),
	(
		140,
		'Dr. Daniel White',
		'Amazon Prime, USA',
		'Mon-Fri 09:00AM-05:00PM',
		'(012) 345-6789',
		'daniel.white@checkoutoops.com',
		'www.drdanielwhiteoops.com',
		2,
		'Dr. White assists clients in reconciling their wallets with past \'But it was on sale!\' decisions.'
	),
	(
		141,
		'Sigmund Fraud',
		'Vienna, Austria',
		'Mon-Fri 09:00AM-05:00PM',
		'(123) 456-7890',
		'sigmund.fraud@psychoanalysis.com',
		'www.sigmundfraudtherapy.com',
		1,
		'Dr. Fraud has a knack for uncovering \'repressed memories\' that conveniently justify all of his patients\' worst decisions. Known for diagnosing everyone with an Oedipus complex, he often offers advice like, \'Have you considered blaming your mother?\''
	),
	(
		142,
		'Carl Dung',
		'Basement, USA',
		'Mon-Fri 10:00PM-02:00AM',
		'(234) 567-8901',
		'carl.dung@shadowwork.com',
		'www.carldungtherapy.com',
		1,
		'Dr. Dung believes that every emotional problem can be linked to metaphorical \'emotional garbage.\' His patients often leave sessions feeling like they’ve been through a mental landfill.'
	),
	(
		143,
		'Jung at Heart',
		'Dreamland, USA',
		'Mon-Sun 06:00AM-06:00PM',
		'(345) 678-9012',
		'jung.atheart@positivethinking.com',
		'www.jungathearttherapy.com',
		2,
		'Dr. Jung at Heart believes that with enough positive thinking, even your darkest archetypes can become sunshine and rainbows. She’s a firm believer that your subconscious just needs a little pep talk.'
	),
	(
		144,
		'Anna Freudful',
		'Worryville, USA',
		'Mon-Sun 12:00AM-11:59PM',
		'(456) 789-0123',
		'anna.freudful@worstcase.com',
		'www.annafreudfultherapy.com',
		2,
		'Dr. Freudful spends most of her sessions worrying on behalf of her clients. If you didn’t have anxiety before seeing her, you might by the time you leave.'
	),
	(
		145,
		'B.F. Sminner',
		'Lab, USA',
		'Mon-Fri 09:00AM-05:00PM',
		'(567) 890-1234',
		'bf.sminner@behaviorism.com',
		'www.bfsminnertherapy.com',
		1,
		'Dr. Sminner believes that free will is just a fancy myth. He’s best known for his \'Positive Reinforcement Lifestyle Plan,\' which involves doling out candy whenever you make eye contact during a session.'
	),
	(
		146,
		'Jean Piagetty',
		'Playground, USA',
		'Mon-Fri 09:00AM-05:00PM',
		'(678) 901-2345',
		'jean.piagetty@childpsych.com',
		'www.jeanpiagettytherapy.com',
		1,
		'Dr. Piagetty takes play therapy to the extreme. Sessions often involve finger painting, Lego-building, and the occasional tantrum (sometimes from the doctor himself).'
	),
	(
		147,
		'Erik Sinson',
		'Life Stages, USA',
		'Mon-Fri 09:00AM-05:00PM',
		'(789) 012-3456',
		'erik.sinson@psychosocial.com',
		'www.eriksinsontherapy.com',
		1,
		'Dr. Sinson loves discussing all eight of his famous psychosocial stages, but somehow the conversation always circles back to guilt and shame.'
	),
	(
		148,
		'Ivan Pavlove',
		'Kitchen, USA',
		'Mon-Fri 09:00AM-05:00PM',
		'(890) 123-4567',
		'ivan.pavlove@conditioning.com',
		'www.ivanpavlovetherapy.com',
		2,
		'Dr. Pavlove runs a therapy practice out of his kitchen, where clients are greeted by the sound of a bell and the smell of freshly baked cookies.'
	),
	(
		149,
		'Karen Horneyed',
		'Drama, USA',
		'Mon-Fri 09:00AM-05:00PM',
		'(901) 234-5678',
		'karen.horneyed@relationship.com',
		'www.karenhorneyedtherapy.com',
		5,
		'Dr. Horneyed specializes in relationship counseling, though her sessions often take a dramatic turn. Quick to suggest that your partner is \'just like your mother,\' she’s not afraid to stir the pot.'
	),
	(
		150,
		'Rorschmuck',
		'Art Studio, USA',
		'Mon-Fri 09:00AM-05:00PM',
		'(012) 345-6789',
		'rorschmuck@inkblot.com',
		'www.rorschmucktherapy.com',
		1,
		'Dr. Rorschmuck believes that every inkblot test reveals a deeper truth — usually that you’re \'probably a little messed up.\''
	),
	(
		151,
		'Ivan Pavlove',
		'Kitchen, USA',
		'Mon-Fri 09:00AM-05:00PM',
		'(890) 123-4567',
		'ivan.pavlove@conditioning.com',
		'www.ivanpavlovetherapy.com',
		2,
		'Dr. Pavlove runs a therapy practice out of his kitchen, where clients are greeted by the sound of a bell and the smell of freshly baked cookies.'
	),
	(
		152,
		'Karen Horneyed',
		'Drama, USA',
		'Mon-Fri 09:00AM-05:00PM',
		'(901) 234-5678',
		'karen.horneyed@relationship.com',
		'www.karenhorneyedtherapy.com',
		5,
		'Dr. Horneyed specializes in relationship counseling, though her sessions often take a dramatic turn. Quick to suggest that your partner is \'just like your mother,\' she’s not afraid to stir the pot.'
	),
	(
		153,
		'Rorschmuck',
		'Art Studio, USA',
		'Mon-Fri 09:00AM-05:00PM',
		'(012) 345-6789',
		'rorschmuck@inkblot.com',
		'www.rorschmucktherapy.com',
		1,
		'Dr. Rorschmuck believes that every inkblot test reveals a deeper truth — usually that you’re \'probably a little messed up.\''
	),
	(
		154,
		'Dr. Pilliam Shakespeare',
		'Theater, USA',
		'Mon-Fri 09:00AM-05:00PM',
		'(123) 456-7890',
		'pilliam.shakespeare@dramatherapy.com',
		'www.pilliamshakespearetherapy.com',
		2,
		'Dr. Shakespeare believes all mental health issues are just tragedies waiting to be rewritten. Every diagnosis is a soliloquy, and he often prescribes \'to medicate or not to medicate\' as the ultimate question.'
	),
	(
		155,
		'Dr. Prozaccident',
		'Pharmacy, USA',
		'Mon-Fri 09:00AM-05:00PM',
		'(234) 567-8901',
		'prozaccident@medication.com',
		'www.prozaccidenttherapy.com',
		3,
		'Dr. Prozaccident believes there’s no problem that a cocktail of medications can’t solve. Side effects? That’s just the price of happiness!'
	),
	(
		156,
		'Dr. Lithium & Let Die',
		'Serenity, USA',
		'Mon-Fri 09:00AM-05:00PM',
		'(345) 678-9012',
		'lithium.letdie@balance.com',
		'www.lithiumletdietherapy.com',
		3,
		'Dr. Lithium takes pride in bringing balance to even the most chaotic minds. His office décor is a serene blend of grays and blues — a reflection of his commitment to emotional equilibrium.'
	),
	(
		157,
		'Dr. Benzo Diazepam',
		'Calmville, USA',
		'Mon-Fri 09:00AM-05:00PM',
		'(456) 789-0123',
		'benzo.diazepam@chill.com',
		'www.benzodiazepamtherapy.com',
		3,
		'Dr. Diazepam has an uncanny ability to remain calm, even in the face of a patient’s complete meltdown. He’s quick to prescribe \'a little something to take the edge off.\''
	),
	(
		158,
		'Dr. Psych O’Path',
		'Crime Scene, USA',
		'Mon-Fri 09:00AM-05:00PM',
		'(567) 890-1234',
		'psych.opath@criminal.com',
		'www.psychopaththerapy.com',
		1,
		'Despite the ominous title, Dr. O’Path is surprisingly compassionate, though his fascination with criminal behavior can be unsettling.'
	),
	(
		159,
		'Dr. Mania Calzone',
		'Pizzeria, USA',
		'Mon-Fri 09:00AM-05:00PM',
		'(678) 901-2345',
		'mania.calzone@pizza.com',
		'www.maniacalzonetherapy.com',
		3,
		'Dr. Calzone believes that all mood disorders can be categorized as \'extra cheesy\' or \'crispy on the edges.\' His unconventional therapy often involves discussing emotions through food metaphors.'
	),
	(
		160,
		'Dr. Schizo Phrenia',
		'Mindscape, USA',
		'Mon-Fri 09:00AM-05:00PM',
		'(789) 012-3456',
		'schizo.phrenia@psychosis.com',
		'www.schizophreniatherapy.com',
		3,
		'Dr. Phrenia is a remarkably skilled psychiatrist who prides herself on breaking down the stigma surrounding mental illness.'
	),
	(
		161,
		'Dr. Xanax Machina',
		'Clinic, USA',
		'Mon-Fri 09:00AM-05:00PM',
		'(890) 123-4567',
		'xanax.machina@efficiency.com',
		'www.xanaxmachinatherapy.com',
		3,
		'Dr. Machina operates like a well-oiled machine, quickly diagnosing patients and dispensing solutions like a human vending machine.'
	),
	(
		162,
		'Dr. Neurotica Jones',
		'Nervousville, USA',
		'Mon-Fri 09:00AM-05:00PM',
		'(901) 234-5678',
		'neurotica.jones@anxiety.com',
		'www.neuroticajonestherapy.com',
		2,
		'Dr. Jones is a whirlwind of worry herself. She keeps an emergency supply of stress balls, chamomile tea, and fidget toys within arm’s reach.'
	),
	(
		163,
		'Dr. Sero Toned-Up',
		'Gym, USA',
		'Mon-Fri 09:00AM-05:00PM',
		'(012) 345-6789',
		'sero.tonedup@fitness.com',
		'www.serotoneduptherapy.com',
		2,
		'Dr. Toned-Up prescribes a blend of SSRIs and vigorous exercise. He believes every mental block can be conquered with \'just one more set of squats.\''
	),
	(
		164,
		'Dr. Talkaholic',
		'Chatroom, USA',
		'Mon-Fri 09:00AM-05:00PM',
		'(123) 456-7890',
		'talkaholic@conversation.com',
		'www.talkaholictherapy.com',
		2,
		'Dr. Talkaholic believes that no problem is too small for a 90-minute discussion. Patients often find themselves struggling to get a word in while she enthusiastically unpacks their \'inner narrative.\''
	),
	(
		165,
		'Dr. Crysa Lott',
		'Tissue Box, USA',
		'Mon-Fri 09:00AM-05:00PM',
		'(234) 567-8901',
		'crysa.lott@tears.com',
		'www.crysalotttherapy.com',
		2,
		'Dr. Lott encourages her patients to dig deep and release the tears. No session is complete without a tissue box conveniently placed within arm’s reach.'
	),
	(
		166,
		'Dr. Boundarie Jones',
		'Boundaryville, USA',
		'Mon-Fri 09:00AM-05:00PM',
		'(345) 678-9012',
		'boundarie.jones@boundaries.com',
		'www.boundariejonestherapy.com',
		2,
		'Dr. Jones is famous for advising patients to \'say no\' — sometimes before they’ve even described their problem.'
	),
	(
		167,
		'Dr. Sigmund Cheers',
		'Bar, USA',
		'Mon-Fri 09:00AM-05:00PM',
		'(456) 789-0123',
		'sigmund.cheers@happyhour.com',
		'www.sigmundcheerstherapy.com',
		2,
		'Dr. Cheers believes in \'emotional happy hours\' where no topic is off-limits. His therapeutic approach involves encouraging patients to \'spill it all.\''
	),
	(
		168,
		'Dr. Trauma Lama',
		'Zen Den, USA',
		'Mon-Fri 09:00AM-05:00PM',
		'(567) 890-1234',
		'trauma.lama@meditation.com',
		'www.traumalamatherapy.com',
		2,
		'Dr. Lama has a soothing voice and a collection of meditation cushions that rival a yoga retreat. She gently guides her patients through their emotional valleys.'
	),
	(
		169,
		'Dr. Venty McVentface',
		'Soundproof Room, USA',
		'Mon-Fri 09:00AM-05:00PM',
		'(678) 901-2345',
		'venty.mcventface@venting.com',
		'www.ventymcventfacetherapy.com',
		2,
		'Dr. McVentface encourages clients to \'let it rip\' in a judgment-free zone. Yelling? Swearing? Dramatic table slams? All are welcome here.'
	),
	(
		170,
		'Dr. Eileen Listen',
		'Quiet Corner, USA',
		'Mon-Fri 09:00AM-05:00PM',
		'(789) 012-3456',
		'eileen.listen@listening.com',
		'www.eileenlistentherapy.com',
		2,
		'Dr. Listen is renowned for her almost eerie ability to remain silent while patients talk themselves into their own epiphanies.'
	),
	(
		171,
		'Dr. Mindy Yourbusiness',
		'Privacyville, USA',
		'Mon-Fri 09:00AM-05:00PM',
		'(890) 123-4567',
		'mindy.yourbusiness@boundaries.com',
		'www.mindyyourbusinesstherapy.com',
		2,
		'Dr. Yourbusiness excels at redirecting nosy tendencies, often asking, \'But how is that serving you?\''
	),
	(
		172,
		'Dr. Chillaximus Prime',
		'Relaxation Station, USA',
		'Mon-Fri 09:00AM-05:00PM',
		'(901) 234-5678',
		'chillaximus.prime@relaxation.com',
		'www.chillaximusprimetherapy.com',
		2,
		'Dr. Prime combines mindfulness exercises with an impressive collection of bean bags. Her therapeutic philosophy is rooted in the belief that all problems are 42% worse without a good nap.'
	),
	(
		173,
		'Dr. Empathy Lovett',
		'Comfort Zone, USA',
		'Mon-Fri 09:00AM-05:00PM',
		'(012) 345-6789',
		'empathy.lovett@support.com',
		'www.empathylovetttherapy.com',
		2,
		'Dr. Lovett is a master of the empathetic head tilt and the perfectly timed \'That sounds really hard.\''
	),
	(
		174,
		'Dr. Olive Branch',
		'Peaceville, USA',
		'Mon-Fri 09:00AM-05:00PM',
		'(123) 456-7890',
		'olive.branch@peacemaking.com',
		'www.olivebranchtherapy.com',
		2,
		'Dr. Branch has an uncanny ability to turn even the most heated arguments into \'growth opportunities.\''
	),
	(
		175,
		'Dr. Blamey McBlamerson',
		'Resolutionville, USA',
		'Mon-Fri 09:00AM-05:00PM',
		'(234) 567-8901',
		'blamey.mcblamerson@conflict.com',
		'www.blameymcblamersontherapy.com',
		2,
		'Dr. McBlamerson believes that finger-pointing is a natural part of any relationship — so why not get it out of the way?'
	),
	(
		176,
		'Dr. Loveita Knot',
		'Loveville, USA',
		'Mon-Fri 09:00AM-05:00PM',
		'(345) 678-9012',
		'loveita.knot@relationship.com',
		'www.loveitaknottherapy.com',
		5,
		'Dr. Knot believes every couple has a soulmate connection — even if they just spent 15 minutes arguing over whose turn it was to unload the dishwasher.'
	),
	(
		177,
		'Dr. Fixon Relashun',
		'Puzzleland, USA',
		'Mon-Fri 09:00AM-05:00PM',
		'(456) 789-0123',
		'fixon.relashun@relationship.com',
		'www.fixonrelashuntherapy.com',
		5,
		'Dr. Relashun sees every relationship as a puzzle that just needs a little tweaking. Her sessions involve more worksheets than a high school math class.'
	),
	(
		178,
		'Dr. Medi Anna Tion',
		'Meditation Room, USA',
		'Mon-Fri 09:00AM-05:00PM',
		'(567) 890-1234',
		'medi.anna.tion@meditation.com',
		'www.mediannationtherapy.com',
		2,
		'Dr. Tion combines traditional therapy with guided meditation. Whenever arguments escalate, she calmly rings a tiny bell and instructs both partners to \'breathe in love, exhale resentment.\''
	),
	(
		179,
		'Dr. Compromise McStubborn',
		'Middle Ground, USA',
		'Mon-Fri 09:00AM-05:00PM',
		'(678) 901-2345',
		'compromise.mcstubborn@compromise.com',
		'www.compromisemcstubborntherapy.com',
		2,
		'Dr. McStubborn believes the key to a happy relationship is \'agreeing to disagree — but nicely.\''
	),
	(
		180,
		'Dr. Sassie Lovejoy',
		'Sarcasmville, USA',
		'Mon-Fri 09:00AM-05:00PM',
		'(789) 012-3456',
		'sassie.lovejoy@communication.com',
		'www.sassielovejoytherapy.com',
		2,
		'Dr. Lovejoy thrives on decoding the true meaning behind passive-aggressive remarks. \'When you said, ‘Oh sure, I love cleaning up after you,’ what did you really mean?\''
	),
	(
		181,
		'Dr. Knotta Therapist',
		'Game Show, USA',
		'Mon-Fri 09:00AM-05:00PM',
		'(890) 123-4567',
		'knotta.therapist@relationship.com',
		'www.knotta.therapisttherapy.com',
		5,
		'Dr. Therapist believes that every relationship can be improved with a little fun and games. Her sessions often involve playful activities and light-hearted challenges.'
	);
-- Dumping structure for table sht.professions
CREATE TABLE IF NOT EXISTS `professions` (
	`professionId` tinyint NOT NULL AUTO_INCREMENT,
	`name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
	PRIMARY KEY (`professionId`)
) ENGINE = InnoDB AUTO_INCREMENT = 6 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;
-- Dumping data for table sht.professions: ~0 rows (approximately)
INSERT IGNORE INTO `professions` (`professionId`, `name`)
VALUES (1, 'Psychologist'),
	(2, 'Therapist'),
	(3, 'Psychiatrist'),
	(4, 'Family Therapist'),
	(5, 'Couples Therapist');
-- Dumping structure for table sht.resourcetypes
CREATE TABLE IF NOT EXISTS `resourcetypes` (
	`typeId` tinyint NOT NULL AUTO_INCREMENT,
	`name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
	PRIMARY KEY (`typeId`)
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;
-- Dumping data for table sht.resourcetypes: ~0 rows (approximately)
INSERT IGNORE INTO `resourcetypes` (`typeId`, `name`)
VALUES (1, 'Hotline'),
	(2, 'Email'),
	(3, 'Website'),
	(4, 'Support Group');
-- Dumping structure for table sht.users
CREATE TABLE IF NOT EXISTS `users` (
	`userId` int NOT NULL AUTO_INCREMENT,
	`username` varchar(50) COLLATE utf8mb4_general_ci NOT NULL UNIQUE,
	`email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL UNIQUE,
	`password` text COLLATE utf8mb4_general_ci NOT NULL,
	`userType` tinyint NOT NULL DEFAULT (1),
	PRIMARY KEY (`userId`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;
-- Dumping data for table sht.users: ~0 rows (approximately)
INSERT INTO `users` (`username`, `email`, `password`)
VALUES (
		'john_doe',
		'john@example.com',
		'$2b$12$abcdefghijABCDEFGHIJ1234567890ABC'
	),
	(
		'dr_smith',
		'smith@example.com',
		'$2b$12$1234567890abcdefghijABCDEFGHIJABC'
	),
	(
		'agent_kate',
		'kate@example.com',
		'$2b$12$abcdef1234567890ABCDEFGHijklmnop'
	);
-- Dumping structure for table sht.usertypes
CREATE TABLE IF NOT EXISTS `usertypes` (
	`typeId` int NOT NULL AUTO_INCREMENT,
	`name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
	PRIMARY KEY (`typeId`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;
-- Dumping data for table sht.usertypes: ~0 rows (approximately)
INSERT IGNORE INTO `usertypes` (`typeId`, `name`)
VALUES (1, 'patient'),
	(2, 'professional'),
	(3, 'agent');
-- Dumping structure for table sht.appointments
CREATE TABLE IF NOT EXISTS `appointments` (
	`appt_id` INT NOT NULL AUTO_INCREMENT,
	`userId` INT NOT NULL,
	`date` DATE NOT NULL,
	`time` TIME NOT NULL,
	`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	`description` TEXT NOT NULL,
	PRIMARY KEY (`appt_id`),
	FOREIGN KEY (`userId`) REFERENCES `users` (`userId`) ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;
-- Dumping data for table sht.appointments: ~0 rows (approximately)
INSERT INTO `appointments` (userId, date, time, description)
VALUES (
		1,
		'2025-04-01',
		'10:00:00',
		'Initial therapy consultation'
	),
	(
		2,
		'2025-04-02',
		'11:30:00',
		'Follow-up session with psychologist'
	),
	(
		3,
		'2025-04-03',
		'14:00:00',
		'Cognitive Behavioral Therapy session'
	),
	(
		1,
		'2025-04-05',
		'16:00:00',
		'Group therapy session'
	),
	(
		2,
		'2025-04-06',
		'09:30:00',
		'Mental health assessment'
	);
/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */
;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */
;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */
;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */
;