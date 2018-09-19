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
public class CustomMetadataClient {
// Apex Example:
//    void sampleApexCall(){
//        List<Map<String, Object>> records = new List<Map<String, Object>> ();
//        records.add(
//                new Map<String, Object> {
//                        'MasterLabel' => 'Foo',
//                        'DeveloperName' => 'Custom__mdt.baz'
//                }
//        );
//        CustomMetadataClient.upsertMetadata(records);
//    }
    public static List<Database.UpsertResult> upsertMetadata(List<Map<String, Object>> records) {
        if (Test.isRunningTest()) {
            Test.setMock(WebServiceMock.class, new CustomMetadataImpl.UpsertMetadataMock());
        }
        List<CustomMetadataImpl.CustomMetadata> customRecords = new List<CustomMetadataImpl.CustomMetadata>();
        for (Map<String, Object> i : records) {
            customRecords.add(new CustomMetadataImpl.CustomMetadata(i));
        }
        return returnWrapper(customRecords);
    }
    public static List<Database.UpsertResult> upsertMetadata(List<SObject> records) {
        if (Test.isRunningTest()) {
            Test.setMock(WebServiceMock.class, new CustomMetadataImpl.UpsertMetadataMock());
        }
        List<CustomMetadataImpl.CustomMetadata> customRecords = new List<CustomMetadataImpl.CustomMetadata>();
        for (SObject i : records) {
            Map<String, Object> metadata = new Map<String, Object>();
            metadata.putAll(i.getPopulatedFieldsAsMap());
            if(metadata.containsKey('Label')){
                metadata.put('MasterLabel', metadata.get('Label'));
                metadata.remove('Label');
            }
            if(metadata.containsKey('Name')){
                metadata.put('DeveloperName', i.getSObjectType()+'.'+metadata.get('Name'));
                metadata.remove('Name');
            } else if(metadata.containsKey('DeveloperName')){
                metadata.put('DeveloperName', i.getSObjectType()+'.'+metadata.get('DeveloperName'));
            }
            customRecords.add(new CustomMetadataImpl.CustomMetadata(metadata));
        }
        return returnWrapper(customRecords);
    }
    public static List<Database.DeleteResult> deleteMetadata(List<String> fullNames) {
        if (Test.isRunningTest()) {
            Test.setMock(WebServiceMock.class, new CustomMetadataImpl.DeleteMetadataMock());
        }
        //coerce to familiar database class
        List<Database.DeleteResult> databaseResults = new List<Database.DeleteResult>();
        for (CustomMetadataImpl.DeleteResult i : new CustomMetadataImpl.MetadataClient().deleteMetadata(fullNames, true)) {
            databaseResults.add(i.toDatabaseDeleteResult());
        }
        return databaseResults;
    }
    static List<Database.UpsertResult> returnWrapper(List<CustomMetadataImpl.CustomMetadata> customRecords){
        List<Database.UpsertResult> databaseResults = new List<Database.UpsertResult>();
        for (CustomMetadataImpl.UpsertResult i : new CustomMetadataImpl.MetadataClient().upsertMetadata(customRecords, true)) {
            databaseResults.add(i.toDatabaseUpsertResult());
        }
        return databaseResults;
    }
}
