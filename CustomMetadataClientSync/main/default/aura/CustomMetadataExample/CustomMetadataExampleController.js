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