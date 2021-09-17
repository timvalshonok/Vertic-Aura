({      
    getContactsList: function(component) {
        var action = component.get('c.getContacts');
        var self = this;
        action.setCallback(this, function(actionResult) {
            component.set('v.contacts', actionResult.getReturnValue());
        });
        $A.enqueueAction(action);
    }
})
