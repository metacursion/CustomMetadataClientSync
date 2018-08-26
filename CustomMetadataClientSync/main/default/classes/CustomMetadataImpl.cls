public class CustomMetadataImpl {
    public class UpsertMetadataMock implements WebServiceMock {
        public void doInvoke(
                Object stub,
                Object request,
                Map<String, Object> response,
                String endpoint,
                String soapAction,
                String requestName,
                String responseNS,
                String responseName,
                String responseType
        ) {
            upsertMetadataResponse_element element = new upsertMetadataResponse_element();
            element.result = new List<UpsertResult>();
            for (Metadata metadata : ((upsertMetadata_element) request).metadata) {
                UpsertResult result = new UpsertResult();
                result.success = true;
                element.result.add(result);
            }
            response.put('response_x', element);
        }
    }
    public class DeleteMetadataMock implements WebServiceMock {
        public void doInvoke(
                Object stub,
                Object request,
                Map<String, Object> response,
                String endpoint,
                String soapAction,
                String requestName,
                String responseNS,
                String responseName,
                String responseType
        ) {
            deleteMetadataResponse_element element = new deleteMetadataResponse_element();
            element.result = new List<DeleteResult>();
            for (String fullName : ((deleteMetadata_element) request).fullNames) {
                DeleteResult result = new DeleteResult();
                result.success = true;
                result.fullName = fullName;
                element.result.add(result);
            }
            response.put('response_x', element);
        }
    }
    /**
     * This webservice class creates Custom Metadata
     * records synchronously using the Metadata API.
     */
    public class MetadataClient {
        String endpoint;
        Integer timeout_x; //special variable on the stub
        SessionHeader_element SessionHeader = new SessionHeader_element();
        AllOrNoneHeader_element AllOrNoneHeader = new AllOrNoneHeader_element();
        String SessionHeader_hns = 'SessionHeader=http://soap.sforce.com/2006/04/metadata';
        String AllOrNoneHeader_hns = 'AllOrNoneHeader=http://soap.sforce.com/2006/04/metadata';
        String[] ns_map_type_info = new String[]{
                'http://soap.sforce.com/2006/04/metadata', 'CustomMetadataImpl.MetadataClient'
        };
        /**
         * Example usage:
         *
         * MetadataClient client = new MetadataClient();
         */
        public MetadataClient() {
            Integer timeout = 60 * 1000;
            this.timeout_x = timeout;
            String[] auth = CustomMetadataSession.getURLandSessionId();
            this.endpoint = auth[0] + '/services/Soap/m/40.0';
            this.SessionHeader.sessionId = auth[1];
        }
        /**
         * Example usage:
         *
         * CustomMetadata customMetadata = new CustomMetadata();
         * customMetadata.label = 'My Meta Record1';
         * customMetadata.fullName = 'MyMeta__mdt.Record1';
         * client.upsertMetadata(new List<CustomMetadata>{customMetadata}, true);
         */
        public List<CustomMetadataImpl.UpsertResult> upsertMetadata(List<Metadata> records, Boolean allOrNone) {
            if (records.isEmpty()) {
                return new List<CustomMetadataImpl.UpsertResult>();
            }
            this.AllOrNoneHeader.allOrNone = allOrNone;
            upsertMetadata_element request = new upsertMetadata_element();
            request.metadata = records;
            upsertMetadataResponse_element response;
            Map<String, upsertMetadataResponse_element> response_map = new Map<String, upsertMetadataResponse_element>();
            response_map.put('response_x', response);
            WebServiceCallout.invoke(
                    this,
                    request,
                    response_map,
                    new String[]{
                            endpoint,
                            '',
                            'http://soap.sforce.com/2006/04/metadata',
                            'upsertMetadata',
                            'http://soap.sforce.com/2006/04/metadata',
                            'upsertMetadataResponse',
                            'CustomMetadataImpl.upsertMetadataResponse_element'
                    }
            );
            response = response_map.get('response_x');
            return response.result;
        }
        public List<CustomMetadataImpl.DeleteResult> deleteMetadata(List<String> fullNames, Boolean allOrNone) {
            if (fullNames.isEmpty()) {
                return new List<CustomMetadataImpl.DeleteResult>();
            }
            this.AllOrNoneHeader.allOrNone = allOrNone;
            deleteMetadata_element request = new deleteMetadata_element();
            request.type = 'CustomMetadata';
            request.fullNames = fullNames;
            deleteMetadataResponse_element response;
            Map<String, deleteMetadataResponse_element> response_map = new Map<String, deleteMetadataResponse_element>();
            response_map.put('response_x', response);
            WebServiceCallout.invoke(
                    this,
                    request,
                    response_map,
                    new String[]{
                            endpoint,
                            '',
                            'http://soap.sforce.com/2006/04/metadata',
                            'deleteMetadata',
                            'http://soap.sforce.com/2006/04/metadata',
                            'deleteMetadataResponse',
                            'CustomMetadataImpl.deleteMetadataResponse_element'
                    }
            );
            response = response_map.get('response_x');
            return response.result;
        }
    }
    class CustomMetadataValue {
        String field;
        String value;
        /**
         * Example usage:
         *
         * CustomMetadataValue value = new CustomMetadataValue(
         *     Stage__mdt.Position__c,
         *     3
         *  );
         */
        CustomMetadataValue(String field, Object value) {
            this.field = String.valueOf(field);
            this.value = String.valueOf(value);
        }
        String[] field_type_info = new String[]{
                'field', 'http://soap.sforce.com/2006/04/metadata', null, '1', '1', 'false'
        };
        String[] value_type_info = new String[]{
                'value', 'http://soap.sforce.com/2006/04/metadata', null, '1', '1', 'true'
        };
        String[] apex_schema_type_info = new String[]{
                'http://soap.sforce.com/2006/04/metadata', 'true', 'false'
        };
        String[] field_order_type_info = new String[]{
                'field', 'value'
        };
    }
    class SessionHeader_element {
        String sessionId;
        String[] sessionId_type_info = new String[]{
                'sessionId', 'http://soap.sforce.com/2006/04/metadata', null, '1', '1', 'false'
        };
        String[] apex_schema_type_info = new String[]{
                'http://soap.sforce.com/2006/04/metadata', 'true', 'false'
        };
        String[] field_order_type_info = new String[]{
                'sessionId'
        };
    }
    class upsertMetadata_element {
        Metadata[] metadata;
        String[] metadata_type_info = new String[]{
                'metadata', 'http://soap.sforce.com/2006/04/metadata', null, '0', '-1', 'false'
        };
        String[] apex_schema_type_info = new String[]{
                'http://soap.sforce.com/2006/04/metadata', 'true', 'false'
        };
        String[] field_order_type_info = new String[]{
                'metadata'
        };
    }
    class upsertMetadataResponse_element {
        UpsertResult[] result;
        String[] result_type_info = new String[]{
                'result', 'http://soap.sforce.com/2006/04/metadata', null, '0', '-1', 'false'
        };
        String[] apex_schema_type_info = new String[]{
                'http://soap.sforce.com/2006/04/metadata', 'true', 'false'
        };
        String[] field_order_type_info = new String[]{
                'result'
        };
    }
    class deleteMetadata_element {
        String type;
        String[] fullNames;
        String[] type_type_info = new String[]{
                'type', 'http://soap.sforce.com/2006/04/metadata', null, '1', '1', 'false'
        };
        String[] fullNames_type_info = new String[]{
                'fullNames', 'http://soap.sforce.com/2006/04/metadata', null, '0', '-1', 'false'
        };
        String[] apex_schema_type_info = new String[]{
                'http://soap.sforce.com/2006/04/metadata', 'true', 'false'
        };
        String[] field_order_type_info = new String[]{
                'type', 'fullNames'
        };
    }
    class deleteMetadataResponse_element {
        CustomMetadataImpl.DeleteResult[] result;
        String[] result_type_info = new String[]{
                'result', 'http://soap.sforce.com/2006/04/metadata', null, '0', '-1', 'false'
        };
        String[] apex_schema_type_info = new String[]{
                'http://soap.sforce.com/2006/04/metadata', 'true', 'false'
        };
        String[] field_order_type_info = new String[]{
                'result'
        };
    }
    class AllOrNoneHeader_element {
        Boolean allOrNone;
        String[] allOrNone_type_info = new String[]{
                'allOrNone', 'http://soap.sforce.com/2006/04/metadata', null, '1', '1', 'false'
        };
        String[] apex_schema_type_info = new String[]{
                'http://soap.sforce.com/2006/04/metadata', 'true', 'false'
        };
        String[] field_order_type_info = new String[]{
                'allOrNone'
        };
    }
    class Error {
        String message;
        String[] fields;
        String statusCode;
        transient String[] fields_type_info = new String[]{
                'fields', 'http://soap.sforce.com/2006/04/metadata', null, '0', '-1', 'false'
        };
        transient String[] message_type_info = new String[]{
                'message', 'http://soap.sforce.com/2006/04/metadata', null, '1', '1', 'false'
        };
        transient String[] statusCode_type_info = new String[]{
                'statusCode', 'http://soap.sforce.com/2006/04/metadata', null, '1', '1', 'false'
        };
        transient String[] apex_schema_type_info = new String[]{
                'http://soap.sforce.com/2006/04/metadata', 'true', 'false'
        };
        transient String[] field_order_type_info = new String[]{
                'fields', 'message', 'statusCode'
        };
    }
    abstract class Metadata {
        //inheritance doesn't work
    }
    public class CustomMetadata extends Metadata {
        String label;
        String fullName;
        String description;
        Boolean isProtected;
        CustomMetadataValue[] values;
        public CustomMetadata(SObject sobj) {
            Map<String, Object> metadata = sobj.getPopulatedFieldsAsMap();
            this.values = new List<CustomMetadataValue>();
            for (String i : metadata.keySet()) {
                //populate special properties for developer name and master label
                if (String.valueOf(i) == 'MasterLabel') {
                    this.label = String.valueOf(metadata.get(i));
                }
                if (String.valueOf(i) == 'DeveloperName') {
                    this.fullName = String.valueOf(sobj.getSObjectType()) + '.' + metadata.get(i);
                }
                //ignore Id, Label, Language, NamespacePrefix, QualifiedApiName etc
                if (!String.valueOf(i).endsWith('__c')) {
                    continue;
                }
                //coerce all other keys and values to value DTOs
                this.values.add(new CustomMetadataValue(i, metadata.get(i)));
            }
        }
        String type = 'CustomMetadata';
        String[] type_att_info = new String[]{
                'xsi:type'
        };
        String[] fullName_type_info = new String[]{
                'fullName', 'http://soap.sforce.com/2006/04/metadata', null, '0', '1', 'false'
        };
        String[] description_type_info = new String[]{
                'description', 'http://soap.sforce.com/2006/04/metadata', null, '0', '1', 'false'
        };
        String[] label_type_info = new String[]{
                'label', 'http://soap.sforce.com/2006/04/metadata', null, '0', '1', 'false'
        };
        String[] isProtected_type_info = new String[]{
                'protected', 'http://soap.sforce.com/2006/04/metadata', null, '0', '1', 'false'
        };
        String[] values_type_info = new String[]{
                'values', 'http://soap.sforce.com/2006/04/metadata', null, '0', '-1', 'false'
        };
        String[] apex_schema_type_info = new String[]{
                'http://soap.sforce.com/2006/04/metadata', 'true', 'false'
        };
        String[] field_order_type_info = new String[]{
                'fullName', 'description', 'label', 'isProtected', 'values'
        };
    }
    public class DeleteResult {
        String id;
        Error[] errors;
        Boolean success;
        transient String fullName;
        transient String[] errors_type_info = new String[]{
                'errors', 'http://soap.sforce.com/2006/04/metadata', null, '0', '-1', 'false'
        };
        transient String[] fullName_type_info = new String[]{
                'fullName', 'http://soap.sforce.com/2006/04/metadata', null, '1', '1', 'false'
        };
        transient String[] success_type_info = new String[]{
                'success', 'http://soap.sforce.com/2006/04/metadata', null, '1', '1', 'false'
        };
        transient String[] apex_schema_type_info = new String[]{
                'http://soap.sforce.com/2006/04/metadata', 'true', 'false'
        };
        transient String[] field_order_type_info = new String[]{
                'errors', 'fullName', 'success'
        };
        public Database.DeleteResult toDatabaseDeleteResult() {
            this.id = this.fullName;
            return (Database.DeleteResult) JSON.deserialize(JSON.serialize(this), Database.DeleteResult.class);
        }
    }
    public class UpsertResult {
        String id;
        Error[] errors;
        Boolean success;
        Boolean created;
        transient String fullName;
        transient String[] created_type_info = new String[]{
                'created', 'http://soap.sforce.com/2006/04/metadata', null, '1', '1', 'false'
        };
        transient String[] errors_type_info = new String[]{
                'errors', 'http://soap.sforce.com/2006/04/metadata', null, '0', '-1', 'false'
        };
        transient String[] fullName_type_info = new String[]{
                'fullName', 'http://soap.sforce.com/2006/04/metadata', null, '1', '1', 'false'
        };
        transient String[] success_type_info = new String[]{
                'success', 'http://soap.sforce.com/2006/04/metadata', null, '1', '1', 'false'
        };
        transient String[] apex_schema_type_info = new String[]{
                'http://soap.sforce.com/2006/04/metadata', 'true', 'false'
        };
        transient String[] field_order_type_info = new String[]{
                'created', 'errors', 'fullName', 'success'
        };
        public Database.UpsertResult toDatabaseUpsertResult() {
            this.id = this.fullName;
            return (Database.UpsertResult) JSON.deserialize(JSON.serialize(this), Database.UpsertResult.class);
        }
    }
}
