public class CustomMetadataClient {
    public static List<Database.UpsertResult> upsertMetadata(List<SObject> records) {
        if (Test.isRunningTest()) {
            Test.setMock(WebServiceMock.class, new CustomMetadataImpl.UpsertMetadataMock());
        }
        //turn maps of fields and values into web service DTOs
        List<CustomMetadataImpl.CustomMetadata> customRecords = new List<CustomMetadataImpl.CustomMetadata>();
        for (SObject i : records) {
            customRecords.add(new CustomMetadataImpl.CustomMetadata(i));
        }
        //coerce to familiar database class
        List<Database.UpsertResult> databaseResults = new List<Database.UpsertResult>();
        for (CustomMetadataImpl.UpsertResult i : new CustomMetadataImpl.MetadataClient().upsertMetadata(customRecords, true)) {
            databaseResults.add(i.toDatabaseUpsertResult());
        }
        return databaseResults;
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
}