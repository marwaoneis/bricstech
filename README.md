# bricstech

## Overview
This repository contains basic JavaScript code snippets commonly used for handling lookup fields, hiding/showing fields, observing changes in subgrids, and setting fields as required or non-required.

## Code Snippets

### 1. Populate Lookup Field

```javascript
// Access the global variables from the parent window
var id = window.parent.id;
var name = window.parent.name;

// Populate the lookup field
$('#lookupFieldId').val(id);
$('#lookupFieldName').val(name);
$('#lookupFieldEntityName').val("tableName");

$('#lookupFieldId').siblings("div.input-group-btn").find("button").prop("disabled", true);
$('#lookupFieldId').siblings("div.input-group-btn").hide();
```

### 2. Hide and Show Fields

```javascript
$('#field1').closest('td').hide();
$('#field2').closest('td').hide();

// Show fields
function setFieldAsRequired(fieldId, fieldName) {
    $("#" + fieldId).prop('required', true);
    $("#" + fieldId).closest('td').show();
    $("#" + fieldId).closest(".control").prev().addClass("required");
}

setFieldAsRequired('field1', 'Field 1');
setFieldAsRequired('field2', 'Field 2');
```

### 3. Observe Changes in Subgrid

```javascript
// Hide fields
$('#field1').closest('td').hide();
$('#field2').closest('td').hide();

// Show fields
function setFieldAsRequired(fieldId, fieldName) {
    $("#" + fieldId).prop('required', true);
    $("#" + fieldId).closest('td').show();
    $("#" + fieldId).closest(".control").prev().addClass("required");
}

setFieldAsRequired('field1', 'Field 1');
setFieldAsRequired('field2', 'Field 2');
```

### 4. Set Field as Required

```javascript
function setFieldAsRequired(fieldId, fieldName) {
    if (typeof(Page_Validators) == 'undefined') return;
    if ($("#" + fieldId) != undefined && $("#" + fieldId + "_label") != undefined) {
        $("#" + fieldId).prop('required', true);
        $("#" + fieldId).closest(".control").prev().addClass("required");

        // Create new validator object
        var requiredValidator = document.createElement('span');
        requiredValidator.style.display = "none";
        requiredValidator.id = fieldId + "Validator";
        requiredValidator.controltovalidate = fieldId;
        requiredValidator.errormessage = "<a href='#" + fieldId + "_label'>" +  fieldName  + " is a required field.</a>";
        requiredValidator.initialvalue = "";
        requiredValidator.evaluationfunction = function () {
            var fieldControl = $("#" + fieldId);
            if (fieldControl.is("span")) {
                var value0 = $("#" + fieldId + "_0").prop("checked");
                var value1 = $("#" + fieldId + "_1").prop("checked");
                return value0 || value1;
            } else {
                var value = $("#" + fieldId).val();
                return value != null && value != "";
            }
        };

        // Add the new validator to the page validators array
        Page_Validators.push(requiredValidator);
    }
}
```

### 5. Set Field as Non-Required

```javascript
function setFieldAsNonRequired(fieldId) {
    if (typeof(Page_Validators) == 'undefined') return;
    if ($("#" + fieldId) != undefined) {
        $("#" + fieldId).closest(".control").prev().removeClass("required");
        $("#" + fieldId).prop('required', false);
        for (var i = 0; i < Page_Validators.length; i++) {
            if (Page_Validators[i].id == fieldId + "Validator") {
                Page_Validators.splice(i, 1);
                break;
            }
        }
    }
}
```
