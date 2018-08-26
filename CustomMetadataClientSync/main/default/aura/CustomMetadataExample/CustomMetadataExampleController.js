({
    create : function (component) {
        component
            .find('CustomMetadataService')
            .upsert( [{
                sobjectType: component.get('v.type'),
                DeveloperName: component.get('v.name'),
                MasterLabel: component.get('v.label')}] )
            .then(function(res){
                console.table(JSON.parse(res));
                alert('Success');
            })
            .catch(function(err){
                console.error(err);
                alert('Error');
            })
    },
    delete : function (component) {
        component
            .find('CustomMetadataService')
            .delete( [ component.get('v.type') +'.'+ component.get('v.name')])
            .then(function(res){
                console.table(JSON.parse(res));
                alert('Success');
            })
            .catch(function(err){
                console.error(err);
                alert('Error');
            })
    },
    createBulk : function (component) {
        var records = [
            {
                sobjectType: component.get('v.type1'),
                DeveloperName: component.get('v.name1'),
                MasterLabel: component.get('v.label1')
            },
            {
                sobjectType: component.get('v.type2'),
                DeveloperName: component.get('v.name2'),
                MasterLabel: component.get('v.label2')
            }
        ];
        component
            .find('CustomMetadataService')
            .upsert( records )
            .then(function(res){
                console.table(JSON.parse(res));
                alert('Success');
            })
            .catch(function(err){
                console.error(err);
                alert('Error');
            })
    },
    deleteBulk : function (component) {
        var records = [
            component.get('v.type1') + '.' + component.get('v.name1') ,
            component.get('v.type2') + '.' + component.get('v.name2')
        ];
        component
            .find('CustomMetadataService')
            .delete( records )
            .then(function(res){
                console.table(JSON.parse(res));
                alert('Success');
            })
            .catch(function(err){
                console.error(err);
                alert('Error');
            })
    }
});