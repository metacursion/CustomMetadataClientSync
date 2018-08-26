# CustomMetadataClientSync
Synchronously manipulate Custom Metadata records from Lightning components.

Usage
```
component
    .find('CustomMetadataService')
    .upsert([{
        sobjectType: 'Custom__mdt',
        DeveloperName: 'Foo_is_Name',
        MasterLabel: 'Baz is label' }])
    .then(function(res){
        // do something
    })
    .catch(function(err){
        // do something
    })
```

Depends on lax: https://github.com/ruslan-kurchenko/sfdc-lax

Credit to bigassforce: https://gist.github.com/bigassforce/295eefa237841d0296d2dd1e35ecdfa7/revisions