public class CustomMetadataService {
    @AuraEnabled public static String UpsertMetadata(SObject[] records){
        String[] errors = new String[]{};
        List<Database.UpsertResult> results;
        try {
            results = CustomMetadataClient.upsertMetadata(records);
            for(Database.UpsertResult i: results){
                if(!i.isSuccess()){
                    errors.add(CustomMetadataService.errorsToString(i.getErrors()));
                }
            }
        } catch (Exception e){
            errors.add(e.getMessage());
        }
        if( ! errors.isEmpty() ){
            String err = String.join(errors, '\n');
            AuraHandledException e = new AuraHandledException(err);
            e.setMessage(err);
            throw e;
        } else {
            return JSON.serialize(results);
        }
    }
    @AuraEnabled public static String DeleteMetadata(List<String> records){
        String[] errors = new String[]{};
        List<Database.DeleteResult> results;
        try {
            results = CustomMetadataClient.deleteMetadata(records);
            for(Database.DeleteResult i: results){
                if(!i.isSuccess()){
                    errors.add(CustomMetadataService.errorsToString(i.getErrors()));
                }
            }
        } catch (Exception e){
            errors.add(e.getMessage());
        }
        if( ! errors.isEmpty() ){
            String err = String.join(errors, '\n');
            AuraHandledException e = new AuraHandledException(err);
            e.setMessage(err);
            throw e;
        } else {
            return JSON.serialize(results);
        }
    }
//    static Schema.SObjectType stringToType(String type){
//        return Schema.getGlobalDescribe().get(type);
//    }
    static String errorsToString(List<Database.Error> err){
        String ret = '';
        for(Database.Error i: err){
            ret += i.getStatusCode() + ': ' + i.getFields() + ' ' + i.getMessage() + '\n';
        }
        return ret;
    }
//    static List<Map<SObjectField, Object>> mapToMap(List<Map<String, Object>> input){
//        List<Map<SObjectField, Object>> ret = new List<Map<SObjectField, Object>>();
//        for(Map<String, Object> i: input){
//            Map<SObjectField, Object> tmp = new Map<SObjectField, Object>();
//            for(String j: i.keySet()){
//                List<String> splitString = j.split('\\.');
//                SObjectField k = Schema.getGlobalDescribe().get(splitString[0]).getDescribe().fields.getMap().get(splitString[1]);
//                tmp.put(k, i.get(j));
//            }
//            ret.add(tmp);
//        }
//        return ret;
//    }
}