public class CustomMetadataSession {
    public final static String START_SID {
        get {
            return 'Start_SID';
        }
    }
    public final static String END_SID {
        get {
            return 'End_SID';
        }
    }
    public final static String START_BASEURL {
        get {
            return 'Start_BaseURL';
        }
    }
    public final static String END_BASEURL {
        get {
            return 'End_BaseURL';
        }
    }
    public String baseURL {
        get {
            return System.Url.getSalesforceBaseUrl().toExternalForm();
        }
    }
    public static String getSessionId(String content){
        if (String.isBlank(content)) {
            return '';
        }
        Integer s = content.indexOf(START_SID) + START_SID.length();
        Integer e = content.indexOf(END_SID);
        return content.substring(s, e);
    }
    public static String getBaseURL(String content){
        if (String.isBlank(content)) {
            return '';
        }
        Integer s = content.indexOf(START_BASEURL) + START_BASEURL.length(),
                e = content.indexOf(END_BASEURL);
        return content.substring(s, e);
    }
    public static String getSessionPageAsString(){
        if (Test.isRunningTest()) {
            return '';
        } else {
            return Page.CustomMetadataSession.getContent().toString();
        }
    }
    public static String[] getURLandSessionId(){
        String sessionPageInstance = CustomMetadataSession.getSessionPageAsString();
        return new String[]{
                CustomMetadataSession.getBaseURL(sessionPageInstance),
                CustomMetadataSession.getSessionId(sessionPageInstance)
        };
    }
}