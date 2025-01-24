#!/bin/bash

# Frontend directory structure setup script
FRONTEND_DIR="frontend"

# Create React app with TypeScript template
npx create-react-app $FRONTEND_DIR --template typescript --use-npm

# Navigate to frontend directory
cd $FRONTEND_DIR || exit

# Create directory structure
mkdir -p \
  src/assets/styles \
  src/assets/images \
  src/components/common \
  src/components/dashboard \
  src/contexts \
  src/types \
  src/utils

# Create component files
touch \
  src/components/common/Header.tsx \
  src/components/common/Loader.tsx \
  src/components/dashboard/SummaryCards.tsx \
  src/components/dashboard/IssueChart.tsx \
  src/components/dashboard/IssueTable.tsx \
  src/components/dashboard/CreateTicketForm.tsx

# Create context, types, and utility files
touch \
  src/contexts/IssueContext.tsx \
  src/types/issueTypes.ts \
  src/utils/api.ts

# Create config files
echo "REACT_APP_API_URL=http://localhost:3001" > .env
echo "REACT_APP_JIRA_PROJECT_KEY=YOUR_PROJECT_KEY" >> .env

# Add basic TypeScript config (if not already created by CRA)
if [ ! -f tsconfig.json ]; then
  touch tsconfig.json
fi

# Install additional dependencies
npm install --save \
  axios \
  react-google-charts \
  @types/react-google-charts \
  @mui/material @emotion/react @emotion/styled \
  @mui/icons-material

echo ""
echo "✅ Frontend structure created successfully!"
echo "Next steps:"
echo "1. cd $FRONTEND_DIR"
echo "2. Start development server: npm start"
echo "3. Add your code to the generated files"
