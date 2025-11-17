# Step-by-Step Instructions: Create a Power Automate Flow from Microsoft Forms to Planner

## Prerequisites
Before you begin, ensure you have:
- A Microsoft work or school account with access to Power Automate
- A Microsoft Form already created
- Access to Microsoft Planner with at least one plan created
- Necessary permissions to create flows

---

## Step 1: Access Power Automate
1. Navigate to [Power Automate](https://make.powerautomate.com)
2. Sign in with your Microsoft work or school account
3. Click on **+ Create** in the left navigation pane

---

## Step 2: Create an Automated Cloud Flow

### Option A: Using Copilot (New Designer - Recommended)
1. In the Copilot prompt box, type:
   ```
   when a new MS Forms response is submitted, create a task in Planner
   ```
2. Click **Next**
3. Review the suggested connections and click **Create flow**
4. You'll land on the designer with a pre-configured flow

### Option B: From Blank (Classic Method)
1. Select **Automated cloud flow** from the Create menu
2. Give your flow a name (e.g., "Forms to Planner Task")
3. In the search box, type "Microsoft Forms"
4. Select the trigger **When a new response is submitted**
5. Click **Create**

---

## Step 3: Configure the Microsoft Forms Trigger
1. In the **When a new response is submitted** card, click on the **Form Id** dropdown
2. Select the Microsoft Form you want to use from the list
3. This trigger will fire automatically every time someone submits your form

---

## Step 4: Add Get Response Details Action
1. Click **+ New step** (or **Add an action**)
2. Search for "Microsoft Forms"
3. Select the action **Get response details**
4. In the **Form Id** field, select the same form you chose in Step 3
5. In the **Response Id** field, click in the box and select **Response Id** from the dynamic content panel
   - This will automatically insert the response ID from the trigger

---

## Step 5: Add Create Planner Task Action
1. Click **+ New step**
2. Search for "Planner"
3. Select the action **Create a task**
4. Sign in to the Planner connector if prompted

---

## Step 6: Configure the Planner Task Details

Fill in the following fields:

### Required Fields:
- **Group Id**: Select the Microsoft 365 Group/Team that contains your Planner
- **Plan Id**: Select the specific Planner plan where you want to create tasks
- **Title**: Click in the field and select dynamic content from your form
  - Example: Select the form question response that contains the task title
  - Or create a custom title like: `New Task from ` + [Responder's Name field]

### Optional Fields (Recommended):
- **Bucket Id**: Choose which bucket/category in your plan to organize the task
- **Assignments**: To assign the task to someone:
  - Click **Show advanced options**
  - In the **Assigned User Ids** field, enter the user ID or email
  - You can also use dynamic content if your form collects assignee information
  
- **Due Date Time**: Set a due date
  - Use dynamic content if your form has a date picker question
  - Or use an expression like: `addDays(utcNow(), 7)` for 7 days from submission
  
- **Start Date Time**: Set a start date for the task
  - Use dynamic content or expressions similar to due date

- **Description**: Add details to the task
  - Click in the Description field
  - Add multiple dynamic content fields from your form responses
  - Example: Combine multiple form answers to create a detailed task description

- **Priority**: Set task priority (1 = Urgent, 5 = Medium, 9 = Low)

---

## Step 7: Map Form Questions to Task Fields

For each field in the Planner task, you can use dynamic content from your form:

### Example Mapping:
- **Task Title** ← Form question: "What task needs to be completed?"
- **Description** ← Form questions: "Task details", "Additional notes"
- **Due Date** ← Form question: "When is this due?"
- **Assigned to** ← Form question: "Who should complete this?" (if you collect emails)

To add dynamic content:
1. Click in any field
2. Click on the lightning bolt icon to open dynamic content panel
3. Select the form question response you want to use

---

## Step 8: (Optional) Add Notification Action
To notify someone that a task was created:

1. Click **+ New step**
2. Search for "Send an email" (Office 365 Outlook)
3. Configure:
   - **To**: Enter email address or use dynamic content
   - **Subject**: `New Planner Task Created: ` + [Task Title]
   - **Body**: Include details about the task created

---

## Step 9: Save and Test Your Flow
1. Click **Save** at the top of the screen
2. To test:
   - Go to your Microsoft Form
   - Submit a test response
   - Return to Power Automate and click on your flow
   - Check the **Run history** to see if it succeeded
   - Verify the task was created in your Planner

---

## Step 10: Monitor and Troubleshoot
- View flow run history by clicking on your flow name
- Each run shows success/failure status
- Click on a failed run to see detailed error messages
- Common issues:
  - Incorrect Plan/Group IDs
  - Missing required fields
  - Permission issues (ensure you have access to the Planner)

---

## Advanced Tips

### Add Conditional Logic
Create different tasks based on form responses:
1. Add a **Condition** action after getting response details
2. Check a form answer (e.g., "Priority" = "High")
3. Create different Planner tasks in each branch

### Multiple Assignments
To assign tasks to multiple people:
- Use a **Parse JSON** action to handle multiple user IDs
- Or create an **Apply to each** loop if your form collects multiple assignees

### Dynamic Bucket Assignment
Route tasks to different buckets based on form responses:
1. Add a **Switch** or **Condition** action
2. Check the form response category
3. Use different Bucket IDs for each category

---

## Sample Flow Structure
```
1. Trigger: When a new response is submitted (Microsoft Forms)
   └─ Form: [Your Form Name]

2. Action: Get response details (Microsoft Forms)
   └─ Form Id: [Your Form]
   └─ Response Id: [Dynamic - from trigger]

3. Action: Create a task (Planner)
   └─ Group Id: [Your Team]
   └─ Plan Id: [Your Planner Plan]
   └─ Title: [Dynamic - from form response]
   └─ Description: [Dynamic - from form response]
   └─ Due DateTime: [Dynamic - from form response]
   └─ Bucket Id: [Optional]
   
4. Action: Send an email (Optional)
   └─ To: [Task assignee or form submitter]
   └─ Subject: Task Created Confirmation
   └─ Body: Task details
```

---

## Resources
- [Microsoft Forms Connector Documentation](https://learn.microsoft.com/en-us/connectors/microsoftforms/)
- [Planner Connector Documentation](https://learn.microsoft.com/en-us/connectors/planner/)
- [Common ways to use forms in a flow](https://learn.microsoft.com/en-us/power-automate/forms/popular-scenarios)
- [Power Automate Getting Started](https://learn.microsoft.com/en-us/power-automate/getting-started)

---

This flow will automatically create a Planner task every time someone submits your Microsoft Form, streamlining your task management and eliminating manual data entry!

