({
    upsert : function(component, event, helper) {
        return component.lax.enqueue('c.UpsertMetadata', event.getParam('arguments'))
    },
    delete : function(component, event, helper) {
        return component.lax.enqueue('c.DeleteMetadata', event.getParam('arguments'))
    }
})