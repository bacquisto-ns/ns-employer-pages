# Power Automate HTTP Trigger - Quick Reference

## Quick Start: Copy-Paste Ready Examples

### Sample JSON Schema for HTTP Trigger

```json
{
    "type": "object",
    "properties": {
        "firstName": {
            "type": "string"
        },
        "lastName": {
            "type": "string"
        },
        "email": {
            "type": "string"
        },
        "phone": {
            "type": "string"
        },
        "message": {
            "type": "string"
        },
        "itemId": {
            "type": "integer"
        },
        "status": {
            "type": "string"
        },
        "priority": {
            "type": "string",
            "enum": ["Low", "Medium", "High"]
        }
    },
    "required": ["firstName", "lastName", "email"]
}
```

### Sample JSON Payload for Testing

```json
{
    "firstName": "John",
    "lastName": "Doe",
    "email": "john.doe@example.com",
    "phone": "555-1234",
    "message": "This is a test submission from the form",
    "itemId": 1,
    "status": "New",
    "priority": "High"
}
```

## PowerShell Test Script

Save this as `Test-Webhook.ps1`:

```powershell
# Test Power Automate HTTP Webhook
# Replace YOUR_WEBHOOK_URL with your actual webhook URL

param(
    [Parameter(Mandatory=$true)]
    [string]$WebhookUrl,
    
    [Parameter(Mandatory=$false)]
    [string]$FirstName = "Test",
    
    [Parameter(Mandatory=$false)]
    [string]$LastName = "User",
    
    [Parameter(Mandatory=$false)]
    [string]$Email = "test@example.com"
)

$body = @{
    firstName = $FirstName
    lastName = $LastName
    email = $Email
    phone = "555-1234"
    message = "Test message from PowerShell script"
    itemId = 1
    status = "New"
    priority = "Medium"
} | ConvertTo-Json

try {
    Write-Host "Sending request to webhook..." -ForegroundColor Yellow
    $response = Invoke-RestMethod -Uri $WebhookUrl -Method Post -Body $body -ContentType "application/json"
    
    Write-Host "Success!" -ForegroundColor Green
    Write-Host "Response:" -ForegroundColor Cyan
    $response | ConvertTo-Json -Depth 10
} catch {
    Write-Host "Error occurred:" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
    if ($_.ErrorDetails.Message) {
        Write-Host $_.ErrorDetails.Message -ForegroundColor Red
    }
}
```

**Usage:**
```powershell
.\Test-Webhook.ps1 -WebhookUrl "YOUR_WEBHOOK_URL_HERE"
```

## cURL Test Command

```bash
curl -X POST "YOUR_WEBHOOK_URL_HERE" \
  -H "Content-Type: application/json" \
  -d '{
    "firstName": "Jane",
    "lastName": "Smith",
    "email": "jane.smith@example.com",
    "phone": "555-5678",
    "message": "Test message from cURL",
    "itemId": 1,
    "status": "New",
    "priority": "High"
  }'
```

## JavaScript/TypeScript Example

```javascript
async function sendToWebhook(webhookUrl, formData) {
    try {
        const response = await fetch(webhookUrl, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(formData)
        });
        
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        
        const data = await response.json();
        console.log('Success:', data);
        return data;
    } catch (error) {
        console.error('Error:', error);
        throw error;
    }
}

// Example usage
const formData = {
    firstName: "John",
    lastName: "Doe",
    email: "john.doe@example.com",
    phone: "555-1234",
    message: "Test message",
    itemId: 1,
    status: "New",
    priority: "Medium"
};

sendToWebhook('YOUR_WEBHOOK_URL_HERE', formData);
```

## Python Example

```python
import requests
import json

def send_to_webhook(webhook_url, form_data):
    """Send form data to Power Automate webhook"""
    headers = {
        'Content-Type': 'application/json'
    }
    
    try:
        response = requests.post(
            webhook_url,
            headers=headers,
            data=json.dumps(form_data)
        )
        response.raise_for_status()
        return response.json()
    except requests.exceptions.RequestException as e:
        print(f"Error: {e}")
        raise

# Example usage
form_data = {
    "firstName": "John",
    "lastName": "Doe",
    "email": "john.doe@example.com",
    "phone": "555-1234",
    "message": "Test message",
    "itemId": 1,
    "status": "New",
    "priority": "Medium"
}

result = send_to_webhook('YOUR_WEBHOOK_URL_HERE', form_data)
print(result)
```

## Power Automate Expressions Reference

### Accessing HTTP Request Body Fields

```
triggerBody()?['fieldName']
```

### Combining Fields (for Title)

```
concat(triggerBody()?['firstName'], ' ', triggerBody()?['lastName'])
```

### Conditional Logic

```
if(equals(triggerBody()?['priority'], 'High'), 'Urgent', 'Normal')
```

### Date Formatting

```
formatDateTime(utcNow(), 'yyyy-MM-ddTHH:mm:ssZ')
```

### Accessing SharePoint Action Output

```
body('Update_item')?['Id']
body('Update_item')?['Title']
```

## Common SharePoint Field Mappings

### Text Fields
```
Title: triggerBody()?['title']
Email: triggerBody()?['email']
Phone: triggerBody()?['phone']
```

### Choice Fields
```
Status: triggerBody()?['status']
Priority: triggerBody()?['priority']
```

### Number Fields
```
ItemId: triggerBody()?['itemId']
```

### Date Fields
```
CreatedDate: utcNow()
DueDate: addDays(utcNow(), 7)
```

### Person/Group Fields
```
AssignedTo: {
    "email": triggerBody()?['assignedToEmail']
}
```

## Flow Action Configuration Quick Reference

### Update Item Action
- **Site Address**: Select from dropdown or enter URL
- **List Name**: Select your list
- **Id**: `triggerBody()?['itemId']` (for updates)
- **Title**: Required - use expression or dynamic content
- **Other Fields**: Map from trigger body

### Create Item Action
- **Site Address**: Select from dropdown or enter URL
- **List Name**: Select your list
- **Title**: Required - use expression or dynamic content
- **Other Fields**: Map from trigger body
- **Note**: No Id field needed for creation

### Response Action
- **Status Code**: `200` (success) or `400` (error)
- **Body**: JSON object with response data

## Troubleshooting Quick Fixes

| Issue | Solution |
|-------|----------|
| Flow not triggering | Check URL, Content-Type header, JSON format |
| 400 Bad Request | Verify JSON matches schema |
| 401 Unauthorized | Check authentication settings |
| SharePoint update fails | Verify item ID exists, check required fields |
| Dynamic content not showing | Save flow first, refresh browser |
| Field type mismatch | Check SharePoint column type matches data type |

## Security Best Practices

1. **Authentication**: Use "Any user in my tenant" minimum
2. **Validation**: Validate all inputs before SharePoint update
3. **Error Messages**: Don't expose sensitive info in error responses
4. **HTTPS**: Always use HTTPS (Power Automate enforces this)
5. **Rate Limiting**: Consider adding rate limiting logic

## Next Steps Checklist

- [ ] Create SharePoint list with required columns
- [ ] Create Power Automate flow
- [ ] Configure HTTP trigger with JSON schema
- [ ] Add SharePoint Update/Create item action
- [ ] Map all fields from form to SharePoint columns
- [ ] Add Response action
- [ ] Test with sample data
- [ ] Verify SharePoint list updates correctly
- [ ] Integrate webhook URL into your form
- [ ] Monitor flow runs
- [ ] Set up error notifications if needed

