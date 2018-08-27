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