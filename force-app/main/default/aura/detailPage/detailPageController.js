({
    navigateToDetail:function(component){

        var Record = component.get("v.contact");
      
        var sObectEvent = $A.get("e.force:navigateToSObject");
            sObectEvent.setParams({
            "recordId": Record.AccountId,
            "objectApiName" : "Account",
            "slideDevName" : "view"
        });
        sObectEvent.fire();
    }
})
