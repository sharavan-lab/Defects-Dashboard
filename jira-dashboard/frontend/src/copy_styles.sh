#!/bin/bash

# Navigate to the styles directory
mkdir -p frontend/src/assets/styles
cd frontend/src/assets/styles

# Create and populate CSS files

# 1. Dashboard.css
cat > Dashboard.css << 'EOL'
.dashboard-container {
  padding: 2rem;
  max-width: 1200px;
  margin: 0 auto;
}

.summary-cards {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 1rem;
  margin-bottom: 2rem;
}

.card {
  background: #fff;
  padding: 1rem;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}
EOL

# 2. IssueTable.css
cat > IssueTable.css << 'EOL'
.issue-table-container {
  margin: 2rem 0;
  overflow-x: auto;
}

.issue-table {
  width: 100%;
  border-collapse: collapse;
  margin-top: 1rem;
}

.issue-table th,
.issue-table td {
  padding: 12px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

.issue-table th {
  background-color: #f5f5f5;
}

.status-badge {
  padding: 4px 8px;
  border-radius: 12px;
  font-size: 0.8rem;
  font-weight: 500;
}

.status-badge.open {
  background-color: #ffd7d5;
  color: #d32f2f;
}

.status-badge.in-progress {
  background-color: #fff4e5;
  color: #ed6c02;
}

.status-badge.done {
  background-color: #d8f5d1;
  color: #2e7d32;
}
EOL

# 3. CreateTicketForm.css
cat > CreateTicketForm.css << 'EOL'
.ticket-form {
  background: #fff;
  padding: 2rem;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
  margin: 2rem 0;
}

.form-group {
  margin-bottom: 1.5rem;
}

.form-group label {
  display: block;
  margin-bottom: 0.5rem;
  font-weight: 500;
}

.form-group input,
.form-group textarea,
.form-group select {
  width: 100%;
  padding: 8px;
  border: 1px solid #ddd;
  border-radius: 4px;
  font-size: 1rem;
}

.form-group textarea {
  height: 100px;
  resize: vertical;
}

.submit-button {
  background-color: #2563eb;
  color: white;
  padding: 10px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 1rem;
}

.submit-button:hover {
  background-color: #1d4ed8;
}

.form-message {
  margin-top: 1rem;
  color: #2e7d32;
  font-weight: 500;
}
EOL

# 4. Loader.css
cat > Loader.css << 'EOL'
.loader-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 200px;
}

.loader-spinner {
  width: 50px;
  height: 50px;
  border: 4px solid #f3f3f3;
  border-top: 4px solid #2563eb;
  border-radius: 50%;
  animation: spin 1s linear infinite;
  margin-bottom: 1rem;
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
EOL

# 5. App.css (if not already created)
cat > App.css << 'EOL'
.App {
  text-align: center;
}

.header {
  background-color: #282c34;
  padding: 20px;
  color: white;
}
EOL

echo "✅ All CSS files created in frontend/src/assets/styles/"
