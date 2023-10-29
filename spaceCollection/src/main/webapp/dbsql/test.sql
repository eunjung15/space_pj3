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
values(user_info_seq.nextval, '������', '01011114444','testId123', 'test123', 'testEmail@naver.com', 'none', sysdate)

insert into payment_type
values(payment_type_seq.nextval, 'kcp', 'kcpī�����')

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
values(space_seq.nextval, '������ ����ž �ٺ�ť �����̽��ִ�', '��Ƽ��', '101-23-09080', '04545', '����Ư����', '�߱� �ֱ��� 170-1', '���̽����� 5��', '������ 4���� 1�ʰŸ� �ٺ�ť ������ ����ž ����', '������ 4���� 1�� �Ÿ�!<br><br> 10���� �����̳ʰ� ��������<br>���� �ְ��� ���� �ٺ�ť ��Ƽ��! <br><br>���� �������� �ִ� �ǳ��� ������� ����<br>�׸��� �����ΰ� �� ���� ���̴� ����ž����!<br><br>10�ο� �ٺ�ť ȭ��2��, �׸�, ����, ��ġ, �� ���� ��� �����մϴ�<br>**�߰� ��� �ɼ��Դϴ�!', '�ٺ�ť/������Ƽ��/��ũ��/������Ƽ��/���̳�', '�ִ� 36�� ���밡�� (�ǳ� 15��, ���� 6��, ����ž 15��)||12�ο� �ٺ�ť ȭ�� 1��, 6�ο� �ٺ�ťȭ�� 1��, ��Ÿ �ٺ�ť ���||�����, ��ũ��, �̵��� 2�� �δ���, ���ڷ�����, �ó����||������� ����Ŀ(�ǳ� ���� ����Ŀ, �ǿܹ�� ����Ŀ,),����������, OTT ����ڽ�||���̺� �� ����: �ǳ�(10�� �������̺� �� ����, 4�μ���, �½����� 6��, �½����̺� 1��)','01011114444', 'ȭ���� �� û�� ������ ���� �ǳ�/�ǿ� ���� �ݿ����� �Դϴ�.(CCTV ���߽� ������ ��ȯ��)||��ǰ �н� �Ǵ� �ļս� ���� ������ �䱸�Ǹ� �����Ƿ� ���� ��� �߻��� å������ �ʽ��ϴ�||�غ�ð��� �������� �ð��� ����ð��� �����Դϴ�||�̼����� �ܵ� ������ �Ұ��մϴ�||��Ƽ��ȿ��� �Ͼ�� ������� ���� å������ �ʽ��ϴ�.||�̿�� ������ 10������ �߻��ϸ�, �������� �� ��� �� 4�� ���� ȯ�޵˴ϴ�.',37.567867591237, 126.99786989441, 1, 2);

insert into space(space_num, space_name, space_type, space_business_num, space_zipcode,SPACE_ADDRESS,SPACE_ADDRESS_DETAIL,SPACE_LOCATION,SPACE_INTRO,SPACE_INFO,SPACE_TAG,SPACE_FACILITY,SPACE_PHONE_NUM,SPACE_WARN,LATITUDE,LONGITUDE,refund_num,user_num)
values(space_seq.nextval, '[������ε����] �������ڵ� ��', '������', '122-22-09011', '08591', '����Ư���� ��õ��', '���굿 660', '���� 105ȣ, 106ȣ', '�ű� �����Ͽ� ����ϰ� �ƴ��� ������ �Դϴ�.', '������ε� ����� 2023�� 5�� ������ �����ϰ� �ƴ��� �ü��� �ڶ��մϴ�.<br>���Ե鲲 ���� ����ϰ� ������ ��ΰ� ������ ���ڵ� ������� �����ص帮�� ���� �ʽ��� ���� �ʰ� ���Ӿ��� ����ϰڽ��ϴ�.<br>[��ġ �� ���� �ȳ�]<br>1ȣ�� ���꿪���� 5�� �̳��� ã�ƿ��ñ� ���� ���� ��ġ�� �ֽ��ϴ�.<br>��� �� ���� �̿�� �������� ����� ������ �帳�ϴ�:)<br><br> [��� �� ��ġ ���α׷� �ȳ�]<br>*Room A : M1 ���̸�, Logic pro X, UAVolt276, AT4047, sm58, M-0Audio Hammer88 pro<br>*Room B : M1 ���̸�, Logic pro X, SSL 2+, Rode Nt1-a, sm58, M-0Audio Hammer88 pro<br>', '������/�������ڵ�/���۳�����/����������/ũ��������','��������(��� �� �̿� �� ����)||ȭ��� ��/�� ����||�ݷ����� ���� ����||������||�ǹ� �� ������','01022225555','���� Ȯ�� �� �������� ���� Ȯ�� �޽����� �亯 ��Ź�帳�ϴ�.||�ε����ϰ� ������� �� ������ �ϼž� �ϴ� ��� ������ 1�������� �̸� �������ּ���.||MR�� �̸� �غ��ؿ��ø� ����, �غ� �ȵǽ� ��� �����ڿ��� ���� ���ϱ��� ������ �ּ���.',	37.468691182029,126.88712952142,2,2)

insert into space(space_num, space_name, space_type, space_business_num, space_zipcode,SPACE_ADDRESS,SPACE_ADDRESS_DETAIL,SPACE_LOCATION,SPACE_INTRO,SPACE_INFO,SPACE_TAG,SPACE_FACILITY,SPACE_PHONE_NUM,SPACE_WARN,LATITUDE,LONGITUDE,refund_num,user_num)
values(space_seq.nextval, 'Ǫ��� ���δ��� �����̽�', '������', '100-23-05125', '06781', '����Ư���� ���ʱ�', '�����19�� 35-1 (���絿)', '3��', '��Ƽ��Ʈ���� ���� â�� ���� Ǫ��� �����̽�',
'ũ����, ���, ���� ���� ������ �̱� ��Ƽ��Ʈ�� �ټ��� ���̵� �׷� ������ ���۵� ����"<br><br>Ǫ��� ���δ��� �����̽��� �� ķ��, ���� ���ڵ�, �̵� �۾�, �ͽ�, �����͸� ���� ������ų� �۾� �Ӹ� �ƴ϶� ���� ����, �ǾƳ�, ��Ÿ ���� �Ǳ� ����, ������ �Ӵ�, 1�� ��۰� ������ �Կ����� �پ��� �������� �̿�� �� �ִ� �����Դϴ�.<br><br>���� �ùķ��̼��� ���� ����� �� �ü��� ���ο� ��ǰ� �ִ� ���ڵ� ��Ʃ����� ���� �������� ǳ���� ���带 ������ �� �ִ� ��� �����Ǿ� ��Ƽ��Ʈ�� ���� ������ â�� ȯ���� �����մϴ�.<br><br>�� �ü��� ������ ���̷��� �ɾ ���� �ֱ����� ��� �� û�� ���� ���� ���� û���� ��� �����ϰ� �ֽ��ϴ�.<br><br>���� �ü� �� ������ ȭ�� �� ���� ������ ���� �ֿ� ��ġ�� CCTV�� ��ġ�Ͽ� ��ϰ� �ֽ��ϴ�.<br><br>�ü� �̿� �� ��� �� ���α׷� ��뿡 ������� �����ô� ���� ���� ���� ���ε༭�� 1:1 ������Ʈ ������ �����ϰ� �ֽ��ϴ�.(�߰��ɼ�)<br><br>', 
'���ÿ�����/�����Ǵ뿩/�Ǳ⿬����/����������/����������',
'System / OS | Mac Mini (M2) Ventura||Monitor | �Ｚ M7 ����Ʈ ����� (32��ġ)||DAW | Cubase, Live, Logic Pro, Pro Tools||Audio Interface | SSL 12||Monitor Speaker | Adam A7X, Britz ������� ����Ŀ||Master Keyboard (Synthesizer) | YAMAHA MOXF8 (88�ǹ�)||Microphone | Lewitt LCT240 PRO (�ɼ�: Audio Technica AT-4047, Lewitt LCT940, Presonus Revelator)||Headphone | SHURE SRH440 (�ɼ�: AVANTONE MP1)||�׿� �ü� | ����������, ������, �ٴ� ���� ���� ���� �ü�',
'01035548898',
'�� �ü� ���� �� ��ġ�� �ǳ�ȭ�� ���� �Ű� ������ �ֽñ� �ٶ��ϴ�.||����ð��� ���� �� �ð� ������ �Ұ����ϸ�, ���� ���� ���� ����ð� ���� 5�� �� ����� ��Ģ���� �մϴ�.||�� �ü� �� ���� Ŀ�� �̿��� ���� �� ���Ĺ� ������ �����˴ϴ�.||�� �������� Ǫ��� ��Ʃ��� �� �� ķ���� ���� ���õ� �ü��Դϴ�.||���� ����Ͻô� ���� �ȳ��帰 �Ŵ��� ���� �̿��ϼž� �ϸ�, ��Ģ �� �ؼ��� ���� ��� �� �ü����� �ļյ� ��� ��ǰ �������� �����ϼž� �մϴ�.||�ü� �̿� ��༭�� �������� ���� ��� �̿��� ���ѵ˴ϴ�.||�� �� ���ǻ��� �Ǵ� ���� ���� ���� ���Ǵ� īī���� ä���� ���� ���� ��Ź�帳�ϴ�. (īī���� ä��: @Ǫ��� ��Ʃ���)',
37.474084899092,127.04620078301,3,2);

insert into space_detail(sd_num, sd_type, sd_price, sd_open_time, sd_close_time, sd_min_people, sd_max_people, sd_Area, space_num, facility_num)
values(space_detail_seq.nextval, '��Ƽ��', '20000', '10��', '8��', '1', '25', '99', 4, 1)

insert into space_detail(sd_num, sd_type, sd_price, sd_open_time, sd_close_time, sd_min_people, sd_max_people, sd_Area, space_num, facility_num)
values(space_detail_seq.nextval, '���δ��� �����̽� 004', '8900', '9', '24', '1', '3', '172', 6, 3)
select * from space_detail;
select * from facility

commit;