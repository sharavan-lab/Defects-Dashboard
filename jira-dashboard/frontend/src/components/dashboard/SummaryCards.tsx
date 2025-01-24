import React from 'react';
import { useIssues } from '../../contexts/IssueContext';

const SummaryCards = () => {
  const { issues } = useIssues();
  const openIssues = issues.filter(issue => issue.status === 'Open').length;

  return (
    <div className="summary-cards">
      <div className="card">
        <h3>Open Issues</h3>
        <p>{openIssues}</p>
      </div>
      <div className="card">
        <h3>Fixed Issues</h3>
        <p>{issues.length - openIssues}</p>
      </div>
    </div>
  );
};

export default SummaryCards;
