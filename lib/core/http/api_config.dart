const bool isWriteLog = true;
const String base_url = "https://testbe.smartvision.vn/";
//auth
const String auth_profile = "auth/user";
const String auth_login = "auth/login";
const String auth_changePass = "auth/change-pass";
//camera
const String list_camera = "v1/cameras";
const String list_camera_by_dvr = "v1/assigns/camera/user";
const String controller_camera_function = "v1/camera-functions/function";
const String controller_camera_function_list = "v1/camera-functions/camera";
//dvrs
const String list_dvr = "v1/dvrs";
//user
const String controller_user = "v1/users";
const String get_profile = "v1/users";
const String update_profile = "v1/users";
//NOTIFICATION
const String controller_notify = "v1/notifications";
const String controller_news = "v1/notifications";
const String controller_notify_read = "v1/notifications/read";
//HLS
const String open_stream = 'v1/cameraStreams/open';
const String keep_stream = 'v1/cameraStreams/update';
//Tenant
const String controller_tenant_detail = "v1/tenants/detailt";

//SOS
const String sos_alert_in_house = "v1/pc-functions/triggerAlarm";
//Contact
const String getContact = "v1/contacts";