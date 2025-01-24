import React from 'react';
import { IssueProvider } from './contexts/IssueContext';
import Header from './components/common/Header';
import SummaryCards from './components/dashboard/SummaryCards';
import IssueChart from './components/dashboard/IssueChart';
import IssueTable from './components/dashboard/IssueTable';
import CreateTicketForm from './components/dashboard/CreateTicketForm';
import './assets/styles/App.css';
import './assets/styles/Dashboard.css';

const App = () => {
  return (
    <IssueProvider>
      <div className="App">
        <Header />
        <main className="dashboard-container">
          <SummaryCards />
          <IssueChart />
          <IssueTable />
          <CreateTicketForm />
        </main>
      </div>
    </IssueProvider>
  );
};

export default App;
