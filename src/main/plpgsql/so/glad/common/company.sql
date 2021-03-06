CREATE SEQUENCE public.table_company_id_seq
INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1;
ALTER SEQUENCE public.table_company_id_seq
OWNER TO soglad;

-- Table: public.company;
-- Dependency currency
-- DROP TABLE public.company;

CREATE TABLE public.company
(
  id          BIGINT                      NOT NULL DEFAULT nextval('public.table_company_id_seq' :: CHARACTER VARYING),
  identity    CHARACTER VARYING(255)      NOT NULL,
  revoked     BOOLEAN                     NOT NULL DEFAULT FALSE,
  name        CHARACTER VARYING(255)      NOT NULL,
  alias       CHARACTER VARYING(255)      NOT NULL,
  category    CHARACTER VARYING(255)      NOT NULL DEFAULT 'LTD',
  capital     DECIMAL(20, 2)              NOT NULL DEFAULT 10000.00,
  currency_id BIGINT                      NOT NULL DEFAULT 1,
  found_date  TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  chairman    CHARACTER VARYING(255)      NOT NULL,
  address     CHARACTER VARYING(255)      NOT NULL,
  industry    CHARACTER VARYING(255)      NOT NULL,
  size        INTEGER                     NOT NULL DEFAULT 50,
  business    TEXT                        NOT NULL DEFAULT '',
  summary     TEXT                        NOT NULL DEFAULT '',
  comment     CHARACTER VARYING(255)      NOT NULL DEFAULT '',
  created_at  TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at  TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT company_pkey PRIMARY KEY (id),
  CONSTRAINT company_identity_unique UNIQUE (identity),
  CONSTRAINT company_currency_id_foreign FOREIGN KEY (currency_id)
  REFERENCES public.currency (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE CASCADE
) WITH (OIDS = FALSE) TABLESPACE soglad;
ALTER TABLE public.company OWNER TO soglad;

CREATE INDEX company_identity_index
  ON public.company USING BTREE (identity) TABLESPACE soglad;

CREATE INDEX company_currency_id_index
  ON public.company USING BTREE (currency_id) TABLESPACE soglad;
CREATE INDEX company_alias_index
  ON public.company USING BTREE (alias) TABLESPACE soglad;
CREATE INDEX company_category_index
  ON public.company USING BTREE (category) TABLESPACE soglad;
CREATE INDEX company_capital_index
  ON public.company USING BTREE (capital) TABLESPACE soglad;
CREATE INDEX company_found_date_index
  ON public.company USING BTREE (found_date) TABLESPACE soglad;
CREATE INDEX company_industry_index
  ON public.company USING BTREE (industry) TABLESPACE soglad;
CREATE INDEX company_size_index
  ON public.company USING BTREE (size) TABLESPACE soglad;
CREATE INDEX company_business_index
  ON public.company USING BTREE (business) TABLESPACE soglad;


INSERT INTO public.company (identity, name, alias, category, capital, found_date, chairman, address, industry, business, summary)
VALUES
  ('911100007109250324', '中国移动通信集团公司', '中国移动', '全民所有制', 300000000000, '1999-07-22', '尚冰',
                         '北京市西城区金融大街２９号', '电信、广播电视和卫星传输服务',
                         '', ''),
  ('91110000717851160R', '中国移动通信有限公司', '中国移动', '有限责任公司（外国法人独资）', 1641848300, '2004-02-27', '尚冰',
                         '北京市西城区金融大街２９号', '电信、广播电视和卫星传输服务',
                         '', ''),

  ('9132000070404188XX', '中国移动通信集团江苏有限公司', '江苏移动', '有限责任公司（法人独资）', 2800000000, '1998-08-26', '周毅',
                         '江苏省南京市虎踞路59号', '电信、广播电视和卫星传输服务',
                         '', '中国移动通信集团江苏有限公司是中国移动有限公司在江苏设立的全资子公司。前身为1992年成立的江苏省移动通信公司，隶属于原江苏省邮电管理局，1998年从邮电系统剥离实行股份制改造和公司化重组并在纽约、香港两地上市。'),

  ('91320000714086950U', '中国移动通信集团江苏有限公司南京分公司', '南京移动', '有限责任公司分公司', 2800000000, '2000-08-04', '刘中儒',
                         '江苏省南京市庐山路226号', '电信、广播电视和卫星传输服务',
                         '固定通信业务（IP电话业务限Phone-Phone的电话业务），蜂窝移动通信业务（9001800MHzGSM第二代数字蜂窝移动通信业务），因特网数据传送业务（限于因特网骨干网数据传送业务），无线接入业务（含3.5GHz无线接入业务、26GHz无线接入业务）。从事移动通信、IP电话和互联网等网络的设计、投资和建设；移动通信、IP电话和互联网等设施的安装、工程施工和维修；经营与移动通信、IP电话和互联网业务相关的系统集成、漫游结算清算、技术开发、技术服务、设备销售等；设计、制作、代理各类广告，利用自有网络发布各类广告；出售、出租移动电话终端设备、IP电话设备、互联网设备及其零配件，并提供售后服务。', ''),

  ('913202007035102854', '中国移动通信集团江苏有限公司无锡分公司', '无锡移动', '有限责任公司分公司', 0, '1999-04-14', '谢生勃',
                         '江苏省无锡市滨湖区蠡园经济开发区溢红路139号', '电信、广播电视和卫星传输服务',
                         '基础电信业务（按照《基础电信业务经营许可证》上范围经营）、增值电信业务（按照《增值电信业务经营许可证》上范围经营）。从事移动通信、IP电话和互联网等网络的设计、投资和建设；移动通信、IP电话和互联网等设施的安装、工程施工和维修；经营与移动通信、IP电话和互联网业务相关的系统集成、漫游结算清算、技术开发、技术服务、设备销售等；出售、出租移动电话终端设备、IP电话设备、互联网设备及其零配件，并提供售后服务；设计、制作、代理各类广告，利用自有网络发布各类广告；房屋、柜台出租；商务代理服务。（依法须经批准的项目，经相关部门批准后方可开展经营活动）', ''),

  ('91320500714023378A', '中国移动通信集团江苏有限公司苏州分公司', '苏州移动', '有限责任公司分公司', 0, '1999-04-01', '周建成',
                         '江苏省苏州市干将西路1390号', '电信、广播电视和卫星传输服务',
                         '基础电信业务（按照《基础电信业务经营许可证》上范围经营）；增值电信业务（按照《增值电信业务经营许可证》上范围经营）（互联网信息服务不含新闻、出版、教育、医疗保健、药品、医疗器械、电子公告服务等内容）；从事移动通信、IP电话和互联网网络设计、投资和建设；移动通信、IP电话和互联网设施的安装、工程施工和维修；经营与移动通信、IP电话和互联网业务相关的系统集成、漫游结算清算、技术开发、技术服务、设备销售；设计、制作、代理国内各类广告，利用自有网络发布各类广告；出售、出租移动电话终端设备、IP电话设备、互联网设备及其零配件，并提供售后服务；房屋、柜台出租，商务代理服务。', ''),

  ('91310000132149237G', '中国移动通信集团上海有限公司', '上海移动', '有限责任公司', 6038667700, '1998-08-26', '陈力',
                         '上海市普陀区长寿路200号', '电信、广播电视和卫星传输服务',
                         '在上海市经营基础电信业务，具体详见《基础电信业务经营许可证》（编号：A1.A2-20090001）和增值电信业务，具体详见《增值电信业务经营许可证》（编号：A2.B1.B2-20100001）,从事移动通信、IP电话和互联网等网络的设计、投资和建设；移动通信、IP电话和互联网等设施的安装、工程施工和维修，经营与移动通信、IP电话和互联网业务相关的系统集成、漫游结算清算、技术开发、技术服务、广告业务、设备销售等；出售、出租移动电话终端设备、IP电话设备、互联网设备及其零部件，并提供售后服务。【依法须经批准的项目，经相关部门批准后方可开展经营活动】', '中国移动通信集团江苏有限公司是中国移动有限公司在江苏设立的全资子公司。前身为1992年成立的江苏省移动通信公司，隶属于原江苏省邮电管理局，1998年从邮电系统剥离实行股份制改造和公司化重组并在纽约、香港两地上市。'),

  ('91310113MA1GKPP93W', '臻快网络科技（上海）有限公司', '臻快网络', '有限责任公司', 10000000, '2016-07-22', '赵晓铭',
                         '上海市宝山区顾北东路575弄1-17号A区109-7', '软件和信息技术服务',
                         '从事网络科技、通讯技术领域内的技术开发、技术转让、技术服务、技术咨询；计算机软硬件的研究开发；通讯工程；通讯及计算机设备的销售。', ''),
  ('9142010005202707XM', '武汉昊阳科技有限公司', '昊阳科技', '有限责任公司（自然人投资或控股的法人独资）', 3000000, '2012-09-04', '徐庆锋',
                         '武汉市东湖开发区光谷大道46号丽岛漫城19栋8层05室', '软件和信息技术服务', '软件和信息服务；计算机系统服务。（依法须经审批的项目，经相关部门审批后方可开展经营活动）',
                         ''),
  ('913101153987006985', '上海艾涛信息科技发展有限公司', '艾涛信息', '有限责任公司', 5000000, '2014-07-02', '崔宁峰', '上海市浦东新区泥城镇云汉路969号',
                         '软件和信息技术服务',
                         '信息技术领域内的技术开发、技术咨询、技术转让、技术服务，网络科技（不得从事科技中介），网络工程，通信建设工程施工，计算机系统集成，设计、制作各类广告，电子商务（不得从事增值电信、金融业务），动漫设计，文化艺术交流策划，赛事活动策划，公关活动策划，企业管理咨询、商务咨询，投资咨询（以上咨询除经纪），物业管理，会议及展览服务，企业营销策划，五金交电、玻璃制品、钢材、电子元器件、电线电缆、日用百货、计算机、软件及服装设备（除计算机信息系统安全专用产品）、通讯器材、汽摩配件、机械设备及配件的销售。【依法须经批准的项目，经相关部门批准后方可开展经营活动】',
                         ''),
  ('914201113036083120', '武汉筹谋企业管理有限公司', '筹谋企管', '有限责任公司（自然人独资）', 10000000, '2014-11-06', '李俊良',
                         '武汉市洪山区雄楚大街456号绿汀雅境1栋3号商网', '商务服务',
                         '网络信息技术咨询；计算机软硬件的研发、销售及技术服务；计算机系统集成；电子商务平台运营。（依法须经审批的项目，经相关部门审批后方可开展经营活动）', ''),
  ('510104000076533', '成都新创诚科技有限公司', '新创诚科', '有限责任公司（自然人投资或控股）', 1000000, '2010-03-15', '李永华',
                      '成都市锦江区滨江东路162号1栋锦江区银海音泰思青年创业园4楼408号', '软件和信息技术服务',
                      '计算机软硬件的研究及技术咨询；在四川境内从事第二类增值电信业务中的信息服务业务（不含固定网电话信息服务）（凭许可证并按许可时效经营至2016年12月19日）；计算机网络技术咨询服务；销售：通信产品（以上经营范围不含国家法律、行政法规、国务院决定禁止或限制的项目，依法须批准的项目，经相关部门批准后方可开展经营活动）。',
                      '');