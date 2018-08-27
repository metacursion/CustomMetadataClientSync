// MIT License
// 
// Copyright (c) 2018 metacursion
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
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