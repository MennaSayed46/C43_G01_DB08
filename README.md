# SQL Server Academic Project - README

## Part 01 – Working with ITI Database

### 📌 Task 1: Index on Department Table  
- Create an index on the column `Hiredate` that allows clustering the data in the `Department` table.  
- **Question:** What will happen when you try this?

---

### 📌 Task 2: Unique Index on Student Table  
- Create an index that enforces uniqueness on the `Age` column in the `Student` table.  
- **Question:** What will happen when you try this?

---

### 📌 Task 3: Create Login `RouteStudent`  
- Create a SQL Server login named `RouteStudent`.  
- Grant this login **access to only**:
  - `Student` table  
  - `Course` table  
- **Permissions**:
  - Allow: `SELECT`, `INSERT`  
  - Deny: `UPDATE`, `DELETE`  

---

## Part 02 – Advanced Table & Trigger Logic

### 📌 Task 4: Create `ReturnedBooks` Table  
Create a table named `ReturnedBooks` with the following structure:

| Column Name | Data Type |
|-------------|-----------|
| UserSSN     |           |
| BookId      |           |
| DueDate     |           |
| ReturnDate  |           |
| Fees        |           |

---

### 📌 Task 5: Trigger on `ReturnedBooks`  
- Create an **INSTEAD OF INSERT** trigger on the `ReturnedBooks` table.  
- Logic:  
  - If `ReturnDate` is **after** `DueDate`, calculate a fee.  
  - Fee = 20% of the amount previously paid.

---

### 📌 Task 6: Restrict Actions on `Employee` Table  
- Create a trigger to **prevent any `INSERT`, `UPDATE`, or `DELETE`** operations on the `Employee` table.  
- The trigger must display a message to notify the user that actions on this table are not permitted.

---

### 📌 Task 7: Index on `Salary` in Employee Table  
- Create a clustered index on the `Salary` column in the `Employee` table.  
- **Question:** What happens when this index is applied?

---

### 📌 Task 8: Create Login with Your Name  
- Create a login using **your name** (e.g., `MennaLogin`).  
- Grant access **only** to:
  - `Employee` table  
  - `Floor` table  
- **Permissions**:
  - Allow: `SELECT`, `INSERT`  
  - Deny: `UPDATE`, `DELETE`  
- ⚠ Don’t forget to take **screenshots of each step**.

---

> 💡 *Note: Make sure to test each step and validate behavior through SQL Server Management Studio.*
