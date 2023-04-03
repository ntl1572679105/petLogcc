SET NAMES utf8;
DROP DATABASE IF EXISTS petlog;
CREATE DATABASE petlog CHARSET=utf8;
USE petlog;

-- 用户表
CREATE TABLE user(
    user_id INT PRIMARY KEY auto_increment,
    user_avatar VARCHAR(128),
    user_phone VARCHAR(32) NOT NULL,
    user_pwd VARCHAR(32) NOT NULL,
    user_name VARCHAR(32),
    user_email VARCHAR(32),
    user_sex INT,
    user_sign VARCHAR(32)
);
insert into user value(null,'http://localhost','15533882261','569369','刘鹿军','22323655585',1,'');
insert into user value(null,'https://i.postimg.cc/qMNXrCHK/20230325101451.jpg','13333333333','111111','张三','22@qq.com',1,'');
insert into user value(null,'https://i.postimg.cc/QdkBZXC5/20230325101452.jpg','13444444444','111111','李四','33@qq.com',1,'');
insert into user value(null,'https://i.postimg.cc/g2P4mqy7/20230325101453.jpg','13555555555','111111','王二','55@qq.com',1,'');
insert into user value(null,'https://i.postimg.cc/GmrPZ3dw/20230325101454.jpg','13555555555','111111','麻子','55@qq.com',1,'');




--管理员表
CREATE TABLE admin_a(
    admin_id INT PRIMARY KEY AUTO_INCREMENT,
    admin_phone varchar(16) NOT NULL,
    admin_pwd VARCHAR(32) NOT NULL,
    admin_name VARCHAR(32),
    admin_level VARCHAR(1) DEFAULT 1,
    admin_undetermined1 VARCHAR(32),
    admin_undetermined2 VARCHAR(32),
    admin_undetermined3 VARCHAR(32),
    admin_undetermined4 VARCHAR(32)
);
insert into admin_a values(1,'15533882266','111111','店长','1','','','','');
insert into admin_a values(null,'15555555555','111111','店长','1','','','','');
insert into admin_a values(null,'17766883321','222222','管理员1','2','','','','');
insert into admin_a values(null,'15555555555','333333','管理员2','2','','','','');
--权限表
CREATE TABLE role(
    rid INT PRIMARY KEY AUTO_INCREMENT,
    role_name varchar(16) NOT NULL,
    role_path VARCHAR(32) NOT NULL,
    role_icon VARCHAR(32),
    parent_id VARCHAR(4) DEFAULT 0,
    admin_level VARCHAR(1) DEFAULT 0 
);
INSERT INTO role values
(null,'首页','index','el-icon-location',0,0),
(null,'宠物店管理','1','el-icon-location',0,0),
(null,'社区管理','2','el-icon-location',0,0),
(null,'科普管理','3','el-icon-location',0,0),
(null,'新闻管理','4','el-icon-location',0,0),
(null,'商品审核','/home/commondity-audit','el-icon-notebook-2',2,1),
(null,'商品管理','/home/commondity','el-icon-notebook-2',2,2),
(null,'新增商品','/home/commondity-add','el-icon-notebook-2',2,2),
(null,'商品列表','/home/commondity-list','el-icon-plus',2,2),
(null,'洗护预约','/home/wash','el-icon-plus',2,2),
(null,'信息审核','/home/message-audit','el-icon-notebook-2',3,1),
(null,'信息管理','/home/message-manage','el-icon-plus',3,1),
(null,'科普管理','/home/science-add','el-icon-notebook-2',4,1),
(null,'新增科普','/home/science-list','el-icon-plus',4,1),
(null,'新闻列表','/home/science-list','el-icon-notebook-2',5,1),
(null,'新增新闻','/home/news-add','el-icon-plus',5,1);





--商品表 
CREATE TABLE `commondity`  (
    `commondity_id` int NOT NULL AUTO_INCREMENT,
    `commondity_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `commondity_description` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `commondity_img` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `commondity_price` float(16, 2) NULL DEFAULT NULL,
    `petshop_id` int NULL DEFAULT NULL,
    `commondity_state` int NULL DEFAULT 0,
    `user_undetermined1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备用',
    `user_undetermined2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备用',
    `user_undetermined3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备用',
    PRIMARY KEY (`commondity_id`) USING BTREE
);

INSERT INTO `commondity` VALUES (1, '麦富迪猫粮 藻趣儿10kg 成猫（三文鱼螺旋藻）', '蕴含优质动物性钙源，有助于骨骼发育。\r\n\r\n配方里的螺旋藻有丰富的藻蓝蛋白，提高宠物的免疫力。\r\n\r\n粗蛋白达20%，钙磷比约1.25：1，这个数值就是很正常的。', 'https://i.postimg.cc/jqzxfzJ8/3e81d87c8920899c.jpg', 119.00, 1, 1, 'xxx', 'xxx', 'xxx');
INSERT INTO `commondity` VALUES (2, '宜特（EETOYS）小号乳胶橄榄球狗狗玩具趣味发声洁齿球乳胶球宠', '强身健体，锻炼狗的灵敏度，消耗体能，有效减肥', 'https://i.postimg.cc/7LyX5rvt/337d8e9975bbe891.jpg', 12.00, 1, 1, 'xxxx', 'xxx', 'xxx');
INSERT INTO `commondity` VALUES (3, '俏尾巴SmartTail 棉绳球玩具 拉球 长30cm', '重量100g 健康棉绳 结球造型 磨牙逗趣 训犬搭档', 'https://i.postimg.cc/RFB1Z7Hk/Smart-Tail.png', 5.00, 1, 1, 'xxxx', 'xxxx', 'xxxx');
INSERT INTO `commondity` VALUES (4, 'Amycarol 狗狗玩具 编织系列 长尾巴世界 毛线小兔', '材料采用塑料片+尼龙线 +特殊的布线法 不伤牙齿', 'https://i.postimg.cc/nVkvk9yk/61e2babcc78f3047390f8519a5873a03.j', 9.00, 1, 1, 'xxx', 'xxx', 'xxx');
INSERT INTO `commondity` VALUES (5, '俏尾巴SmartTail 清洁湿巾 80抽', '添加金银花 抑菌又护肤 清洁除臭 减少异味', 'https://i.postimg.cc/Jh019v00/172553-651298.jpg', 10.00, 1, 1, 'xxx', 'xxx', 'xxx');
INSERT INTO `commondity` VALUES (6, '犬心保 驱虫牛肉块 M 体重12-22kg 6粒/盒', '每月一次 有效驱除蛔虫/心丝虫/钩虫 牛肉粒更易喂食', 'https://i.postimg.cc/zDcT6Yfb/01054010-871820.jpg', 189.00, 1, 1, 'xxx', 'xxx', 'xxx');
INSERT INTO `commondity` VALUES (7, '日本sincerejapan 藤架猫吊床 桔色 69*51*32', '印尼天然藤木 手工编织 自然光泽 柔软软垫 舒适睡眠', 'https://i.postimg.cc/qBhLxxcd/95d11c3e74c9761d1aaf222bed545ed4.j', 899.00, 1, 1, 'xxxx', 'xxx', 'xxx');



--社区发帖表
CREATE TABLE invitation(
    invitation_id INT PRIMARY KEY AUTO_INCREMENT,
    invitation_title VARCHAR(255),
    invitation_content VARCHAR(1024),
    invitation_time VARCHAR(64),
    user_id INT(12),
    invitation_state INT DEFAULT 0 ,
    user_image VARCHAR(1024),
    user_like VARCHAR(32),
    user_undetermined3 VARCHAR(32),
    user_undetermined4 VARCHAR(32)
);
insert into  invitation values 
    (null,'马里努阿犬新手容易饲养吗？女孩子不建议饲养马犬!',
    '有个女网友问马犬好养吗？女孩子想养就是不知道好不好养，我的个神，你这简直就是悬崖边上扭秧歌花式作死。',
    '2023-02-14 18:33','1',null,
    'https://img.chongwuzhi.com.cn/2022/04/20220427101435208.jpeg?imageMogr2/format/webp',
    '532','1','1'),
    (null,'女孩子养什么品种的狗比较好？',
    '女孩子养什么狗好？很多女孩子都有一个大型犬梦，你想想，一个漂亮的女孩子养了一只帅气的大狗狗，首先安全感爆棚，其次平时牵着狗威风八面的走在大街上，那回头率活脱脱一副美女与野兽。',
    '2023-02-04 13:19','1',null,
    'https://img.chongwuzhi.com.cn/2022/04/img_6260bc2152bce.png?imageView2/0/format/webp/q/75|imageslim',
    '177','1','1'),
    (null,'为什么我家小猫咬我的手或攻击我的脚？',
    '很多养幼猫的铲屎官，都会有一个问题，尤其是那种只养一只猫咪的铲屎官。就是，为什么我家的小猫，会没事来攻击我的手脚？不是来咬手指，就是来咬脚趾，咬到我快要崩溃啦！！！',
    '2023-01-25 08:21','1',null,
    'https://img.chongwuzhi.com.cn/2022/06/img_62b12f7b76494.png?imageView2/0/format/webp/q/75|imageslim',
    '13','1','1'),
    (null,'猫打人一下就跑是什么意思？',
    '跟猫猫玩得正起劲，猫猫却突然赏孽奴饲主一记猫拳就跑……这揪竟？！
    难不成是在玩耍的过程中惹怒猫主子了吗？ Φ౪Φ＜孽奴莫慌～本喵只是在邀请你玩你追我跑的游戏喵～♪。',
    '2023-02-01 11:34','1',null,
    'https://img.chongwuzhi.com.cn/2022/06/img_62a0701601969.png?imageView2/0/format/webp/q/75|imageslim',
    '51','1','1'),
    (null,'母画眉——鸟类世界中的低调魅力',
    '画眉鸟，又称相思鸟，是一种色彩鲜艳、鸣声悦耳的鸟类。它们常常受到观鸟爱好者和鸟类鉴赏家的喜爱。然而，在画眉鸟中，雄性画眉由于其亮丽的羽毛和悦耳的歌声，往往成为人们关注的焦点。',
    '2023-01-26 13:35','1',null,
    'https://img.chongwuzhi.com.cn/2023/03/img_6423af170d399.png?imageView2/0/format/webp/q/75|imageslim',
    '32','1','1'),


    (null,'三湖慈鲷可以和什么鱼混养？',
    '三湖慈鲷（African Cichlids）是指源自非洲三大湖（马拉维湖、唐尼喀湖和维多利亚湖）的慈鲷鱼。它们因其鲜艳的颜色、活泼的性格和独特的行为而受到观赏鱼爱好者的喜爱。然而，由于三湖慈鲷具有较强的地盘性和攻击性，选择合适的鱼种进行混养显得尤为重要。',
    '2023-04-01 20:24','1',null,
    'https://img.chongwuzhi.com.cn/2023/04/img_6428328fbb549.png?imageView2/0/format/webp/q/75|imageslim',
    '3','1','1'),
    (null,'兔子最爱吃的十种食物：为您的宠物兔提供丰富多样的营养',
    '兔子是草食动物，以植物为主要食物来源。它们需要摄取大量纤维来维持肠道健康，因此草料应该是它们饮食的主要部分。另外，兔子还需要摄取适量的蛋白质、脂肪、维生素和矿物质来保持健康。下面我们将介绍兔子最喜欢的十种食物，以帮助您为您的宠物兔提供丰富多样的营养。',
    '2023-04-02 23:14','1',null,
    'https://img.chongwuzhi.com.cn/2023/04/img_64283588c148f.png?imageView2/0/format/webp/q/75|imageslim',
    '32','1','1'),
    (null,'溜猫怎么溜，如何正确的溜猫？',
    '溜猫这件事应该是很多猫奴都有的愿望，您是否时常看见猫咪常常坐在窗前看天看树、或者听到鸟叫声就好奇的往窗外看，其实不论室内环境布置的再怎样丰富，都是无法满足猫咪对外面世界的好奇心及天性。',
    '2022-07-22 14:14','1',null,
    'https://img.chongwuzhi.com.cn/2021/11/202111187863-300x201.jpg?imageView2/0/format/webp/q/75|imageslim',
    '652','1','1'),
    (null,'养狗狗的八个好处！',
    '瑞典的科学家有做过一个大规模的研究，追踪了34万个患有心血管疾病的人，花了12年的时间后发现，出院后有养狗狗在身边的患者比起没有养狗的患者出院后的死亡风险率降低了33%。过去有研究指出，养狗能减轻社交孤立感，甚至还能降低血压。',
    '2023-02-16 23:14','1',null,
    'https://img.chongwuzhi.com.cn/2022/04/img_626a03e463ee5.png?imageView2/0/format/webp/q/75|imageslim',
    '84','1','1'),
    (null,'美国恶霸犬很丑，但确实很温柔',
    '你知道狗中长得比较丑的有哪些吗？今天的一个，他嘴似血盆大口，眼色怒目金刚，浑身肌肉犹如铁铸，看起来凶神恶煞。但就是这么一个煞神，性格却极端温柔，温柔到可以给小孩子当玩伴，更是被誉为最完美的家庭陪伴犬，它就是恶霸犬。',
    '2022-03-12 16:22','1',null,
    'https://img.chongwuzhi.com.cn/2022/04/img_625a3c69f1285.png?imageView2/0/format/webp/q/75|imageslim',
    '429','1','1'),
    (null,'小博美多少钱一只？小博美犬市场价格解析！',
    '小博美犬的价格受多种因素影响，购买时需要考虑品种纯度、血统、年龄、性别、外观和身体状况等因素。在中国市场，小博美犬价格大约在2,000元至6,000元人民币之间，优良血统的纯种犬可能价格更高。购买前，请务必选择正规渠道，并充分了解品种特点和狗狗的健康状况。',
    '2022-03-31 09:42','1',null,
    'https://img.chongwuzhi.com.cn/2023/03/img_64250210626da.png?imageView2/0/format/webp/q/75|imageslim',
    '98','1','1'),
    (null,'新手养鸟重点，注意这四点让你养出健康漂亮的鸟',
    '您是否也因为鸟儿那美丽的羽毛，部分品种还有易与人类互动且能学习人类说话等等的特色而产生了饲养宠物鸟的想法呢？在饲养之前，先就以下的几点重点来预先做些饲养知识的充实吧！已经有养鸟儿的主人也可以来看看是否与您的日常照护重点相同喔！',
    '2022-08-26 23:14','1',null,
    'https://img.chongwuzhi.com.cn/2022/07/img_62d8bf34411b2.png?imageView2/0/format/webp/q/75|imageslim',
    '65','1','1'),
    (null,'给猫咪绝育的好处并没有流传的那么夸张！请理性看待猫咪绝育问题！',
    '多数的铲屎官对猫咪绝育的理解太片面了，甚至有人认为是猫就必须做绝育，更有某些不良自媒体将绝育直接神话，认为给猫咪做绝育能提高猫咪的寿命。最可笑的是有些人竟然将绝育当成年礼送给自己的猫。你猜你的猫知道你这么想会不会骂娘？请大家合理看待猫咪绝育，它没有你想的那么神奇。',
    '2022-03-24 00:00','1',null,
    'https://img.chongwuzhi.com.cn/2022/04/img_625149b233d23.png?imageView2/0/format/webp/q/75|imageslim',
    '56','1','1'),
    (null,'根据猫咪眼睛状态来判断猫咪的心情状态',
    '当猫咪瞳孔缩成一条细线时，且除了光线太强的因素，可能代表猫咪处于警戒状态，或是对于周遭环境感到威胁，这时千万不可任意碰猫咪，否则挨上一爪半咬都不是什么奇怪的事喔。不过细线状的猫眼也有例外的～当猫咪感到满足时，瞳孔也会眯成一条线。因此，各位奴才可要搭配猫咪其他行为动作，与当下情境判断主子的心情啊。',
    '2022-05-15 22:53','1',null,
    'https://img.chongwuzhi.com.cn/2022/06/img_62a008401ce41.png?imageView2/0/format/webp/q/75|imageslim',
    '71','1','1'),
    (null,'猫下颌(嘴巴下)粉刺的症状及防治',
    '治疗通常包括改善卫生。 通常考虑用过氧化苯甲酰清洁。 抗皮脂溢香波和剪毛被推荐。 抗菌素、脂肪酸补充、或口服异维a酸可以用于严重的或慢性的病例。在一些猫，用有色塑料食盆和下颌粉刺是有关联的。 这些猫，如果食盆换成陶瓷的、玻璃的、或不铖钢的，问题可能解决。',
    '2022-04-25 13:14','1',null,
    'https://img.chongwuzhi.com.cn/2023/03/img_6423af170d399.png?imageView2/0/format/webp/q/75|imageslim',
    '32','1','1'),
    (null,'狗狗的那些行为是主人最喜欢的无法抗拒的？',
    '你觉得你是主人，你的狗都听你的，对吗？但是其实你的一举一动早就被你的狗狗控制了，你都还不知道，那是因为他们与生俱来很多绝招，我们主人是很难招架得住的。今天就来让我讲讲狗狗的大绝招，一招比一招狠，一招比一招“毒”，看到最后一招你要撑住！',
    '2022-03-25 23:14','1',null,
    'https://img.chongwuzhi.com.cn/2022/05/img_626e30bb884d3.png?imageView2/0/format/webp/q/75|imageslim',
    '32','1','1'),
    (null,'教猫咪用马桶会比用猫砂盆好吗？',
    '相信你一定看过这种影片。一只猫咪，在人类马桶的边缘，闻来闻去做出埋沙的动作。之后乔个好位置，开始跟人一样往马桶中尿尿或便便，完事之后又往马桶闻了一闻，做了像埋沙一样的动作，厉害的猫咪还会冲一下马桶。',
    '2022-06-15 13:14','1',null,
    'https://img.chongwuzhi.com.cn/2023/03/img_6423af170d399.png?imageView2/0/format/webp/q/75|imageslim',
    '73','1','1'),
    (null,'搞懂喵星人猫演化与身体构造解密',
    '大约6,000万年前，狗、猫以及所有肉食性动物拥有共同祖先──小古猫属（Miacis），原生存于北美洲及欧洲大陆，是栖息于数上的五爪肉食动物。直至3,400万～2,300万年前，才逐渐演化出原猫（Proailurus），就目前的文献记载，原猫很可能是现今所有猫科动物最早的祖先。5万～2万年前，犬科动物率先走出森林，逐渐被驯化并人类的生活；而猫科动物则继续它们的探险生涯，独自埋伏狩猎，进而形成独居动物。从此，猫咪与狗狗的生态与习性分道扬镳。',
    '2022-03-27 20:55','1',null,
    'https://img.chongwuzhi.com.cn/2023/03/img_6423af170d399.png?imageView2/0/format/webp/q/75|imageslim',
    '154','1','1'),
    (null,'小狗吃什么?幼犬到成年犬的饮食重点攻略！',
    '刚出生的幼犬就像刚出生的婴儿一样可爱，随便一个举动就可以融化人心，也因此许多向往饲养狗狗的人都会想从幼犬开始养，不过幼犬对于营养的需求与成犬非常不同，不同体型的幼犬需要的营养也有些许不同。所以，应该怎么吃，吃什么？很需要毛爸妈积极用心的了解！',
    '2022-09-16 23:14','1',null,
    'https://img.chongwuzhi.com.cn/2022/01/202201042234.png?imageView2/0/format/webp/q/75|imageslim',
    '921','1','1'),
    (null,'猫怕黄瓜是真的吗？假的！',
    '你可能怎么都想不到，猫居然最怕黄瓜。养猫的你一定看过这样的视频，当猫在吃饭或者睡觉时，悄悄将一根黄瓜放在猫咪身后，猫咪会被黄瓜吓的直接飞起来，甚至有人将猫怕黄瓜这一现象做成了猫和老鼠的动画片。杰瑞，手拿一根黄瓜牛肉拿着一件神器搬下的汤姆魂飞魄散。一根黄瓜怎么能把猫吓成这样？是不是真的？假的！',
    '2022-05-34 19:49','1',null,
    'https://img.chongwuzhi.com.cn/2023/03/img_6423af170d399.png?imageView2/0/format/webp/q/75|imageslim',
    '81','1','1'),
    (null,'猫小狗长牙爱咬人怎么办？',
    '当与小狗玩耍时，开始啃咬你的手，很可能狗狗正在长牙。长牙咬人是个发育问题，而不是行为问题。这和人类婴儿长牙时是一样的。当小狗两到四周大时，微小的针状牙齿开始出现。当它们大约三个月大时，小狗开始长出恒牙。这个过程一直持续到小狗大约八个月大。',
    '2023-03-17 23:14','1',null,
    'https://img.chongwuzhi.com.cn/2023/03/img_6423af170d399.png?imageView2/0/format/webp/q/75|imageslim',
    '67','1','1'),
    (null,'养一只猫一个月需要花多少钱才能养好？',
    '养一只猫一个月得花多少钱？昨天看网友聊天，有人说他家猫一个月得花1000多，我听了都震惊，养猫哪有那么费钱？养猫的开销无非就是吃住医玩，所以今天给大家算一算我家猫一个月花多少钱。',
    '2022-08-25 18:57','1',null,
    'https://img.chongwuzhi.com.cn/2022/04/img_6258ec31335f3.png?imageView2/0/format/webp/q/75|imageslim',
    '752','1','1'),
    (null,'2023第六届中原国际宠物产业博览会（6月2-4日）',
    '2023 第六届中原国际宠物产业博览会暨中原第五届小动物医师大会至今已成功举办 5 届。在协会展商以及各地观众的支持下走过数载，并在不断的总结与发展中创新展会内容，优化展会服务，已成为中部宠物市场极具影响力的展会，是品牌推广、市场开拓、行业趋势发展及商务贸易的专业化平台更有同期猫主题论坛、医疗会议以及渠道峰会等重磅活动,大咖坐镇,赋能行业。',
    '2023-03-06 08:00','1',null,
    'https://img.chongwuzhi.com.cn/2023/02/20230220152455756.webp?imageView2/0/format/webp/q/75|imageslim',
    '667','1','1'),
    (null,'鹦鹉吃什么食物最好？鹦鹉饮食的奥秘！',
    '鹦鹉是人们经常养的一种宠物鸟类，它们聪明、活泼、喜欢和人交流，因此备受欢迎。但是，鹦鹉的食物是饲养鹦鹉的一个重要问题，饲主需要为鹦鹉提供营养均衡、健康的食物。那么，鹦鹉应该吃什么食物最好呢？',
    '2023-03-27 23:58','1',null,
    'https://img.chongwuzhi.com.cn/2023/03/img_6422838e0237a.png?imageView2/0/format/webp/q/75|imageslim',
    '103','1','1'),
    (null,'折耳猫为什么不能养？因为折耳猫到了一定的年龄一定会发病！',
    '目前折耳猫分两种，一种是纯合子，一种是杂合子。所谓的纯合子是指父母都是折耳猫，纯合子的折耳猫一到两岁就会发病。杂合子是指父或母一方是折耳猫，另一方是立耳猫，以此来稀释折耳猫的错误基因。但杂合子的猫三到七岁也会发病，所以折耳猫都会发病，只是或早或晚、或轻或重的问题。',
    '2023-04-02 23:14','1',null,
    'https://img.chongwuzhi.com.cn/2022/04/img_625a4b5de0a8c.png?imageView2/0/format/webp/q/75|imageslim',
    '98','1','1'),



    (null,'蓝湾牧羊犬也太帅了吧！性格还温柔适合爱狗的女孩子饲养!',
    '就在昨天我一直以为捷克狼犬一直是最帅的狗，结果在今天刷抖音的时候我看到了它：大部分人不知道这是什么狗，它叫蓝湾牧羊犬。',
    '2023-03-02 23:17','1',null,
    'https://img.chongwuzhi.com.cn/2022/04/img_625147245855a.png?imageView2/0/format/webp/q/75|imageslim',
    '7','1','1');


-- 评论表
CREATE TABLE `commenton` (
  `commenton_id` int(12) NOT NULL primary key AUTO_INCREMENT,
  `commenton_content` varchar(10240) NOT NULL,
  `invitation_id` int(12) NOT NULL,
  `user_id` int(12) NOT NULL,
  `parent_id` int(12) NOT NULL,
  `user_undetermined1` varchar(1024) NOT NULL,
  `user_undetermined2` varchar(1024) NOT NULL,
  `user_undetermined3` varchar(1024) NOT NULL,
  `user_undetermined4` varchar(1024) NOT NULL
);

INSERT INTO `commenton` (`commenton_id`, `commenton_content`, `invitation_id`, `user_id`, `parent_id`, `user_undetermined1`, `user_undetermined2`, `user_undetermined3`, `user_undetermined4`) VALUES
(1, '<span>这是第一条社区评论。</span>', 1, 1, 0, '1', '1', '1', '1'),
(2, '<span>这是第二条社区评论。</span>', 1, 2, 1, '1', '1', '1', '1'),
(3, '<span>这是第三条社区评论。</span>', 1, 1, 1, '1', '1', '1', '1'),
(4, '<span>这是第四条社区评论。</span>', 1, 2, 2, '1', '1', '1', '1');


--预约洗护
create table wash(
    wash_id int primary key auto_increment,
    type_id varchar(16),
    wash_time varchar(32),
    wash_resolve int DEFAULT 0,
    user_id int,
    petshop_id int,
    user_undetermined1 varchar(64),
    user_undetermined2 varchar(64),
    user_undetermined3 varchar(64)
);

insert into wash values
 (null,1,'2022-3-21 14:00',0,1,1,'','',''),
 (null,3,'2022-3-21 17:00',0,18,2,'','',''),
 (null,1,'2022-3-22 14:00',0,12,1,'','',''),
 (null,3,'2022-3-22 17:00',1,8,3,'','',''),
 (null,2,'2022-3-23 14:00',1,16,3,'','','');

 --科普表
 CREATE TABLE science(
    science_id INT PRIMARY KEY AUTO_INCREMENT,
    science_title VARCHAR(128),
    science_img VARCHAR(64),
    science_content VARCHAR(1024),
    user_undetermined1 VARCHAR(32),
    user_undetermined2 VARCHAR(32)
);
insert into science values
     ('001',
     '猫粮该怎么选？天然猫粮商品粮成分优劣比较！猫咪饮食',
    'https://img.chongwuzhi.com.cn/2021/08/img_611ccecdca4c3.png?imageView2/0/format/webp/q/75|imageslim',
    '天然粮和商品粮定义天然粮的成分不含动物死尸、动物副产品等材料，不使用诱食剂、防腐剂等有害物质的狗粮，天然粮是用维生素e保存的，里面没有什么元素对猫狗是有害的，长期使用，猫狗的毛发和便便都比较光亮。市场上天然粮定义天然粮是经过完善检验的外国产的宠物粮，他们的选材是没有任何副产品的（包括添加剂），而且肉类来源于没有污染的，野外放养的农场（有机天然的要求更高，必须来自有机农场）
这跟一般人类吃的饲料鸡，饲料羊完全不同，从肉质到所含物质都大不一样。 简单概括，天然粮原料就是来自野生动物（不含内脏等）及植物，不含任何食品添加剂。商品粮材料主要是4d成份及其副产品，4d成份是以下四种状态的动物的简称：dead已死、diseased有病、dying垂死和disabled残废，而副产品是指它们的内脏、皮毛等。虽然商品粮的材料对于狗狗来说并没有吸引力，但通过添加大量的诱食剂，所以普遍来说反而更香，大多数狗狗都爱吃。选择商品粮的危害国外的研究报告显示：喂饲4d及副产品制造狗粮的犬只，初期的健康状况良好，发育非常之正常，但到了后期，相对于喂饲纯天然制造狗粮的犬只，它们的衰老速度快出20%以上，寿命短27%，同时会有更高的生病概率，主要集中在：免疫系统失调、心脏病、肝病、肾病、糖尿病、膀胱癌及多种退化性疾病等……天然粮pk商品粮商品粮，就是市面上常见的价格较为低廉的含有添加剂和防腐剂的猫粮。1.原料来源天然粮：有机农业生产体系或野生天然产品，肉类没经过污染;',
'null','null');

--宠物店表
create table petshop(
	petshop_id int primary key auto_increment,
	petshop_name varchar(32) not null,
    petshop_img varchar(32),
	petshop_address varchar(32),
	petshop_phone varchar(16),
	admin_level varchar(1) DEFAULT 2,
    fosterage_price varchar(8),
	petshop_longitude varchar(128),
	petshop_latitude varchar(128),
	user_undetermined2 varchar(32),
	user_undetermined3 varchar(32),
	user_undetermined4 varchar(32)
);
-- 插入数据
insert into petshop values(1,'丢丢宠物(乔司店)','http:3000','乔司街道永乔路136号',18812345667,'1','99','','','','','');
insert into petshop values(2,'圣宠宠物店(吴家门路店)','http:3001','吴家门路211号',13999128823,'1','99','','','','','');
insert into petshop values(3,'宠时光宠物生活馆(四季店)','http:3002','凌霄街四季风景苑7幢2号',15999999111,'1','99','','','','','');


--新闻表
CREATE TABLE news(
    news_id INT PRIMARY KEY AUTO_INCREMENT,
    news_title VARCHAR(1024),
    news_img VARCHAR(64),
    news_content VARCHAR(255),
    news_time varchar(16),
    user_undetemined1 VARCHAR(32),
    user_undetemined2 VARCHAR(32)
);
INSERT INTO news VALUES 
(null,'瑞鹏宠物医院回应“医生狂踹虐待猫咪”:已开除,门店停业整改!','https://i.postimg.cc/d3D8V6Mw/img-aspx-File-Location-PJ-TAISOUNDS-Files-File-Name-photo-35651-t.jpg','3月18日,网曝重庆瑞鹏宠物医院(龙山分院)医生虐待猫咪。网传视频中,绿衣男子数次抽打、脚踢踹猫咪。猫咪躲在笼子下又被抓出来,遭拖把猛搥。围观人员全程未阻止。19日,宠物医院客服回应,虐猫医生已被开除,涉事门店停业整改。瑞鹏宠物医院成立于1998年,门店分布于上海、广州、深圳、重庆等地。','2023-03-20 10:11:32',null,null),
(null,'宠物经济火爆','https://i.postimg.cc/L5TQPN57/151807761.png','你是否注意到,身边的人们越来越多地关注宠物?宠物市场的规模也在不断扩大,尤其是在中国。其实在2020年的时候,宠物经济产业规模是已经达到了近3000亿元,,这个数字比之前的增长了33.5%。而到了今年，预计是会翻倍。昨天，马当路一家综合性广场举办了一场别开生面的猫咪集市，各个类型各个品种的猫咪齐聚一堂，吸引了不少市民前来观看。','2023-03-20 11:13:06',null,null),
(null,'IPO中的最大宠物医院新瑞鹏被爆“虐猫”,家长们还能放心吗?','https://i.postimg.cc/BQjnMycJ/U1565-P1-T1-D15352624-F21-DT20080414122237.jpg','3月17日晚间,新瑞鹏重庆宠物医院龙山分院被网友爆出,有宠物医院医生在2月8日殴打送院治疗的猫咪。网传视频显示,该名宠物医生穿着绿衣,做出抽打与脚踢踹猫咪的虐猫行为。','2023-03-20 13:15:06',null,null);


--洗护类型表
create table washtype(
    type_id int primary key auto_increment,
    type_name varchar(16),
    price varchar(12),
    petshop_id int
);
insert into washtype values(1,'简单洗澡','39',1),(2,'深度清洗','99',1),(3,'全身精洗除菌','159',1);


--寄养表
create table fosterage(
    fosterage_id int primary key auto_increment,
    petshop_id int ,
    daylong varchar(8),
    total varchar(8),
    user_id int 
);

--预约照相表
create table takepicture(
    pic_id int primary key auto_increment,
    petshop_id int,
    user_id int,
    pic_time varchar(12)

);

