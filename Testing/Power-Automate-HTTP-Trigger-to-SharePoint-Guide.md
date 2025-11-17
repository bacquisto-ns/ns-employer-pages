# Power Automate: HTTP Request Trigger to SharePoint List Update

This guide walks you through creating a Power Automate flow that receives form data via an HTTP webhook and updates a SharePoint list.

## Overview

The flow will:
1. **Trigger**: Receive HTTP POST requests with form data
2. **Process**: Parse the incoming form data
3. **Action**: Update a SharePoint list item with the received data

## Step 1: Create the Flow

1. Go to [Power Automate](https://make.powerautomate.com/)
2. Sign in with your Microsoft account
3. Select **My flows** from the left navigation
4. Click **+ New flow** → **+ Automated cloud flow**
5. Name your flow (e.g., "Update SharePoint from Form Webhook")
6. Click **Skip** or **Create** to proceed

## Step 2: Add HTTP Request Trigger

1. In the flow designer, search for **"When an HTTP request is received"**
2. Select the trigger from the results

### Configure the Trigger

#### Option A: Define JSON Schema Manually

In the **Request Body JSON Schema** field, paste your JSON schema. Here's an example for form data:

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
        }
    }
}
```

#### Option B: Use Sample Payload (Recommended)

1. Click **Use sample payload to generate schema**
2. Paste a sample JSON payload in the text box:

```json
{
    "firstName": "John",
    "lastName": "Doe",
    "email": "john.doe@example.com",
    "phone": "555-1234",
    "message": "This is a test message",
    "itemId": 1
}
```

3. Click **Done** to automatically generate the schema

### Configure Authentication (Important!)

Set who can trigger the flow:

- **Any user in my tenant**: Any authenticated user in your organization (Recommended for internal forms)
- **Specific users in my tenant**: Only specific users (provide email addresses)
- **Anyone**: Open access (Use with caution - less secure)

**Recommendation**: Use "Any user in my tenant" for most scenarios.

### Save to Generate Webhook URL

1. Click **Save** at the top of the flow designer
2. The HTTP POST URL will be generated automatically
3. **Copy this URL** - you'll need it to send data to the webhook
4. The URL will look like:
   ```
   https://prod-XX.westus.logic.azure.com:443/workflows/.../triggers/manual/paths/invoke?api-version=2016-10-01&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=...
   ```

## Step 3: Add SharePoint Update Item Action

1. Click **+ New step**
2. Search for **"SharePoint"**
3. Select **Update item** action from SharePoint connector

### Configure the Update Item Action

1. **Site Address**: 
   - Select your SharePoint site from the dropdown, or
   - Enter the site URL manually (e.g., `https://yourtenant.sharepoint.com/sites/yoursite`)

2. **List Name**: 
   - Select the SharePoint list where you want to update items
   - Make sure this list exists and has the columns you need

3. **Id**: 
   - This is the ID of the SharePoint list item to update
   - You can use dynamic content from the HTTP trigger
   - Example: If your form sends `itemId`, click in the **Id** field and select **itemId** from dynamic content

4. **Title** (Required field):
   - SharePoint lists require a Title field
   - Map this from your form data or use an expression
   - Example: Use dynamic content to combine firstName and lastName: `concat(triggerBody()?['firstName'], ' ', triggerBody()?['lastName'])`

5. **Additional Fields**:
   - Add any other columns from your SharePoint list
   - Map them to the corresponding fields from the HTTP request body
   - Use dynamic content to select values from the trigger

### Example Field Mappings

| SharePoint Column | Value Source | Dynamic Content Path |
|------------------|--------------|---------------------|
| Title | Expression | `concat(triggerBody()?['firstName'], ' ', triggerBody()?['lastName'])` |
| Email | HTTP Body | `triggerBody()?['email']` |
| Phone | HTTP Body | `triggerBody()?['phone']` |
| Message | HTTP Body | `triggerBody()?['message']` |
| Status | Static | `"Submitted"` |

## Step 4: Add Response Action (Optional but Recommended)

Add a response to confirm the update was successful:

1. Click **+ New step**
2. Search for **"Response"**
3. Select **Response** action

### Configure Response

1. **Status Code**: `200` (Success)
2. **Body**: JSON response confirming the update

Example response body:
```json
{
    "status": "success",
    "message": "SharePoint list item updated successfully",
    "itemId": "@{body('Update_item')?['Id']}"
}
```

Or use dynamic content to build the response:
- Status: `success`
- Message: `Item updated successfully`
- ItemId: Select from dynamic content → Update item → Id

## Step 5: Test Your Flow

### Test the Flow

1. **Save** your flow
2. Copy the HTTP POST URL from the trigger
3. Use a tool like Postman, curl, or PowerShell to test:

#### PowerShell Example:
```powershell
$uri = "YOUR_WEBHOOK_URL_HERE"
$body = @{
    firstName = "Jane"
    lastName = "Smith"
    email = "jane.smith@example.com"
    phone = "555-5678"
    message = "Test message from PowerShell"
    itemId = 1
} | ConvertTo-Json

Invoke-RestMethod -Uri $uri -Method Post -Body $body -ContentType "application/json"
```

#### cURL Example:
```bash
curl -X POST "YOUR_WEBHOOK_URL_HERE" \
  -H "Content-Type: application/json" \
  -d '{
    "firstName": "Jane",
    "lastName": "Smith",
    "email": "jane.smith@example.com",
    "phone": "555-5678",
    "message": "Test message",
    "itemId": 1
  }'
```

### Check Flow Run History

1. Go to **My flows**
2. Select your flow
3. Click on the **Run history** tab
4. Review the execution to see if it succeeded
5. Click on a run to see detailed execution steps

## Step 6: Handle Errors (Optional but Recommended)

Add error handling using a **Configure run after** setting:

1. Click on the **SharePoint Update item** action
2. Click the **...** (three dots) menu
3. Select **Configure run after**
4. Enable **is failed** and **is skipped**
5. Add error handling steps, such as:
   - Send an email notification
   - Log to a SharePoint list
   - Return an error response

## Common SharePoint Column Types

When mapping form data to SharePoint columns, note these common types:

| SharePoint Column Type | Power Automate Type | Notes |
|----------------------|-------------------|-------|
| Single line of text | string | Direct mapping |
| Multiple lines of text | string | Direct mapping |
| Choice | string | Must match exact choice value |
| Number | number or string | Can be mapped as string |
| Yes/No | boolean | Use true/false |
| Date and Time | string | Format: ISO 8601 (e.g., "2024-01-15T10:30:00Z") |
| Person or Group | object | Requires user ID or email |
| Lookup | number | Requires the ID of the lookup item |

## Advanced: Creating New Items Instead of Updating

If you want to **create new items** instead of updating existing ones:

1. Replace **Update item** with **Create item** action
2. Remove the **Id** field (not needed for creation)
3. Map all required fields from your form data
4. Optional: Use the created item's ID in the response

## Best Practices

1. **Security**: Always use authentication ("Any user in my tenant" or "Specific users")
2. **Validation**: Validate incoming data in the flow before updating SharePoint
3. **Error Handling**: Implement proper error handling and logging
4. **Testing**: Test with various data scenarios before going live
5. **Documentation**: Document your flow's purpose and expected JSON schema
6. **Naming**: Use descriptive names for your flow and actions

## Troubleshooting

### Flow Not Triggering
- Verify the webhook URL is correct
- Check that the Content-Type header is `application/json`
- Ensure the JSON body matches your schema
- Check authentication settings

### SharePoint Update Fails
- Verify the item ID exists in the list
- Ensure all required fields are provided
- Check that field types match (e.g., numbers, dates)
- Verify you have permissions to update the list
- Check for ETag conflicts if updating concurrently

### Accessing Dynamic Content
- Dynamic content appears after you save the flow
- Use expressions: `triggerBody()?['fieldName']` to access HTTP body fields
- Use `body('ActionName')?['FieldName']` to access previous action outputs

## Example: Complete Flow Structure

```
Trigger: When an HTTP request is received
    ↓
Action: Update item (SharePoint)
    ├─ Site Address: [Your SharePoint Site]
    ├─ List Name: [Your List]
    ├─ Id: [From HTTP body: itemId]
    ├─ Title: [Expression: concat(firstName, ' ', lastName)]
    ├─ Email: [From HTTP body: email]
    ├─ Phone: [From HTTP body: phone]
    └─ Message: [From HTTP body: message]
    ↓
Action: Response
    ├─ Status Code: 200
    └─ Body: Success message with item ID
```

## Additional Resources

- [Power Automate HTTP Connectors Documentation](https://learn.microsoft.com/en-us/training/modules/http-connectors/)
- [SharePoint Connector in Power Automate](https://learn.microsoft.com/en-us/sharepoint/dev/business-apps/power-automate/sharepoint-connector-actions-triggers)
- [Add OAuth authentication for HTTP request triggers](https://learn.microsoft.com/en-us/power-automate/oauth-authentication)

## Next Steps

1. Create your SharePoint list with the required columns
2. Create the Power Automate flow following this guide
3. Test the flow with sample data
4. Integrate the webhook URL into your form application
5. Monitor flow runs and adjust as needed

---

**Note**: Remember to save your flow after each configuration step. The webhook URL is only generated after the first save.

