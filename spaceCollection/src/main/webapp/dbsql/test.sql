create or replace view spaceDetail_refund_view
as
select s.*, r.refund_7_day,r.refund_5_day,r.refund_6_day,r.refund_4_day,
            r.refund_3_day,r.refund_2_day,r.refund_1_day,r.refund_day
from space s,
    refund r
where s.refund_num = r.refund_num

create or replace view spaceDetail_facility_view
as
select f.*, s.sd_num, s.sd_type, sd_price, sd_open_time, sd_close_time, sd_min_people,
                        sd_max_people, sd_area, space_num,sd_min_time
from space_detail s,
    facility f
where s.facility_num = f.facility_num

insert into user_info(user_num, user_name,user_hp,user_id,user_pwd,user_email,user_sns_code,user_reg_date)
values(user_info_seq.nextval, '조상혁', '01011114444','testId123', 'test123', 'testEmail@naver.com', 'none', sysdate)

insert into payment_type
values(payment_type_seq.nextval, 'kcp', 'kcp카드결제')

insert into refund(REFUND_NUM,       
REFUND_7_DAY,
REFUND_6_DAY,
REFUND_5_DAY,
REFUND_4_DAY,
REFUND_3_DAY,
REFUND_2_DAY)
values(refund_seq.nextval,'100%','100%','100%','100%','100%','100%');

insert into facility(facility_num, fac_wifi,fac_tv, fac_drink,fac_Chair_table, fac_cook, fac_food, fac_rest_room, fac_parking)
values(facility_seq.nextval, 'Y','Y','Y','Y','Y','Y','Y','Y')

insert into refund(refund_num,refund_7_day,refund_6_day,refund_5_day, refund_4_day)
values(refund_seq.nextval,'100%', '80%', '70%', '50%')

insert into facility(facility_num, FAC_WIFI,FAC_PRINTER,FAC_AUDIO,FAC_CHAIR_TABLE,FAC_PARKING,FAC_PC)
values(facility_seq.nextval, 'Y','Y','Y','Y','Y','Y')

insert into facility(facility_num, FAC_AUDIO, FAC_CHAIR_TABLE, FAC_PRINTER, FAC_REST_ROOM, FAC_PARKING, FAC_WIFI, FAC_PC )
values(facility_seq.nextval, 'Y','Y','Y','Y','Y','Y','Y')

insert into space(space_num, space_name, space_type, space_business_num, space_zipcode,SPACE_ADDRESS,SPACE_ADDRESS_DETAIL,SPACE_LOCATION,SPACE_INTRO,SPACE_INFO,SPACE_TAG,SPACE_FACILITY,SPACE_PHONE_NUM,SPACE_WARN,LATITUDE,LONGITUDE,refund_num,user_num)
values(space_seq.nextval, '을지로 루프탑 바베큐 스페이스주다', '파티룸', '101-23-09080', '04545', '서울특별시', '중구 주교동 170-1', '나이스빌딩 5층', '을지로 4가역 1초거리 바베큐 가능한 루프탑 공간', '을지로 4가역 1초 거리!<br><br> 10년차 디자이너가 디자인한<br>전국 최고의 감성 바베큐 파티룸! <br><br>예쁜 포토존이 있는 실내와 스페셜한 정원<br>그리고 을지로가 한 눈에 보이는 루프탑까지!<br><br>10인용 바베큐 화로2개, 그릴, 가스, 토치, 숯 봉지 모두 제공합니다<br>**추가 비용 옵션입니다!', '바베큐/서울파티룸/워크샵/종로파티룸/세미나', '최대 36인 수용가능 (실내 15명, 정원 6명, 루프탑 15명)||12인용 바베큐 화로 1개, 6인용 바베큐화로 1개, 기타 바베큐 장비||냉장고, 싱크대, 이동식 2구 인덕션, 전자레인지, 냉난방기||블루투스 스피커(실내 마샬 스피커, 실외방수 스피커,),빔프로젝터, OTT 셋톱박스||테이블 및 의자: 실내(10인 원목테이블 및 의자, 4인쇼파, 좌식의자 6개, 좌식테이블 1개)','01011114444', '화재사고 및 청결 유지를 위해 실내/실외 절대 금연구역 입니다.(CCTV 적발시 보증금 미환급)||물품 분실 또는 파손시 전액 보상이 요구되며 부주의로 인한 사고 발생시 책임지지 않습니다||준비시간과 정리정돈 시간은 예약시간이 포함입니다||미성년자 단독 출입은 불가합니다||파티룸안에서 일어나는 안전사고에 대해 책임지지 않습니다.||이용시 보증금 10만원이 발생하며, 문제없을 시 퇴실 후 4일 내에 환급됩니다.',37.567867591237, 126.99786989441, 1, 2);

insert into space(space_num, space_name, space_type, space_business_num, space_zipcode,SPACE_ADDRESS,SPACE_ADDRESS_DETAIL,SPACE_LOCATION,SPACE_INTRO,SPACE_INFO,SPACE_TAG,SPACE_FACILITY,SPACE_PHONE_NUM,SPACE_WARN,LATITUDE,LONGITUDE,refund_num,user_num)
values(space_seq.nextval, '[뮤즈와인드사운드] 셀프레코딩 룸', '녹음실', '122-22-09011', '08591', '서울특별시 금천구', '가산동 660', '지하 105호, 106호', '신규 개업하여 깔끔하고 아늑한 녹음실 입니다.', '뮤즈와인드 사운드는 2023년 5월 개업한 깨끗하고 아늑한 시설을 자랑합니다.<br>고객님들께 보다 편안하고 음악적 고민과 양질의 레코딩 결과물을 제공해드리기 위해 초심을 잃지 않고 끊임없이 노력하겠습니다.<br>[위치 및 주차 안내]<br>1호선 독산역에서 5분 이내의 찾아오시기 편한 곳에 위치해 있습니다.<br>상담 및 공간 이용시 주차권은 무료로 제공해 드립니다:)<br><br> [장비 및 설치 프로그램 안내]<br>*Room A : M1 아이맥, Logic pro X, UAVolt276, AT4047, sm58, M-0Audio Hammer88 pro<br>*Room B : M1 아이맥, Logic pro X, SSL 2+, Rode Nt1-a, sm58, M-0Audio Hammer88 pro<br>', '녹음실/셀프레코딩/예쁜녹음실/셀프녹음실/크리에이터','주차가능(상담 및 이용 시 무료)||화장실 남/녀 구분||반려동물 동반 가능||정수기||건물 내 편의점','01022225555','예약 확인 시 관리자의 예약 확정 메시지에 답변 부탁드립니다.||부득이하게 예약취소 및 변경을 하셔야 하는 경우 예약일 1일전까지 미리 말씀해주세요.||MR을 미리 준비해오시면 좋고, 준비가 안되신 경우 관리자에게 예약 전일까지 말씀해 주세요.',	37.468691182029,126.88712952142,2,2)

insert into space(space_num, space_name, space_type, space_business_num, space_zipcode,SPACE_ADDRESS,SPACE_ADDRESS_DETAIL,SPACE_LOCATION,SPACE_INTRO,SPACE_INFO,SPACE_TAG,SPACE_FACILITY,SPACE_PHONE_NUM,SPACE_WARN,LATITUDE,LONGITUDE,refund_num,user_num)
values(space_seq.nextval, '푸토어 프로덕션 스페이스', '녹음실', '100-23-05125', '06781', '서울특별시 서초구', '동산로19길 35-1 (양재동)', '3층', '아티스트들의 위한 창작 공간 푸토어 스페이스',
'크러쉬, 딘딘, 존노 등을 포함한 싱글 아티스트와 다수의 아이돌 그룹 음반이 제작된 공간"<br><br>푸토어 프로덕션 스페이스는 송 캠프, 셀프 레코딩, 미디 작업, 믹싱, 마스터링 등의 프로페셔널 작업 뿐만 아니라 보컬 연습, 피아노, 기타 등의 악기 연습, 레슨실 임대, 1인 방송과 컨텐츠 촬영까지 다양한 목적으로 이용될 수 있는 공간입니다.<br><br>사전 시뮬레이션을 통해 설계된 본 시설은 내부에 운영되고 있는 레코딩 스튜디오와 동급 성능으로 풍부한 사운드를 연출할 수 있는 장비가 구성되어 아티스트를 위한 최적의 창작 환경을 제공합니다.<br><br>본 시설은 세스코 바이러스 케어를 통해 주기적인 살균 및 청소 등을 통해 내부 청결을 상시 관리하고 있습니다.<br><br>또한 시설 내 안전과 화재 및 범죄 예방을 위해 주요 위치에 CCTV를 설치하여 운영하고 있습니다.<br><br>시설 이용 시 장비 및 프로그램 사용에 어려움을 느끼시는 고객을 위해 현역 프로듀서의 1:1 원포인트 레슨을 진행하고 있습니다.(추가옵션)<br><br>', 
'보컬연습실/레슨실대여/악기연습실/강남연습실/셀프녹음실',
'System / OS | Mac Mini (M2) Ventura||Monitor | 삼성 M7 스마트 모니터 (32인치)||DAW | Cubase, Live, Logic Pro, Pro Tools||Audio Interface | SSL 12||Monitor Speaker | Adam A7X, Britz 블루투스 스피커||Master Keyboard (Synthesizer) | YAMAHA MOXF8 (88건반)||Microphone | Lewitt LCT240 PRO (옵션: Audio Technica AT-4047, Lewitt LCT940, Presonus Revelator)||Headphone | SHURE SRH440 (옵션: AVANTONE MP1)||그외 시설 | 얼음정수기, 에어컨, 바닥 난방 등의 편의 시설',
'01035548898',
'본 시설 입장 시 배치된 실내화로 갈아 신고 입장해 주시길 바랍니다.||예약시간에 늦을 시 시간 변경이 불가능하며, 다음 고객을 위해 예약시간 마감 5분 전 퇴실을 원칙으로 합니다.||본 시설 내 물과 커피 이외의 음료 및 음식물 반입이 금지됩니다.||본 연습실은 푸토어 스튜디오 내 송 캠프를 위해 마련된 시설입니다.||따라서 사용하시는 장비는 안내드린 매뉴얼에 따라 이용하셔야 하며, 수칙 미 준수로 인해 장비 및 시설물이 파손될 경우 신품 가액으로 변상하셔야 합니다.||시설 이용 계약서에 서명하지 않을 경우 이용이 제한됩니다.||그 외 문의사항 또는 당일 예약 관련 문의는 카카오톡 채널을 통해 연락 부탁드립니다. (카카오톡 채널: @푸토어 스튜디오)',
37.474084899092,127.04620078301,3,2);

insert into space_detail(sd_num, sd_type, sd_price, sd_open_time, sd_close_time, sd_min_people, sd_max_people, sd_Area, space_num, facility_num)
values(space_detail_seq.nextval, '파티룸', '20000', '10시', '8시', '1', '25', '99', 4, 1)

insert into space_detail(sd_num, sd_type, sd_price, sd_open_time, sd_close_time, sd_min_people, sd_max_people, sd_Area, space_num, facility_num)
values(space_detail_seq.nextval, '프로덕션 스페이스 004', '8900', '9', '24', '1', '3', '172', 6, 3)
select * from space_detail;
select * from facility

commit;