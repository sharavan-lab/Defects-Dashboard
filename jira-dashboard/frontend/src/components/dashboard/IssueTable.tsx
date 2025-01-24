import React from 'react';
import { useIssues } from '../../contexts/IssueContext';
import { Issue } from '../../types/issueTypes';
import './IssueTable.css'; // Create this CSS file

const IssueTable = () => {
  const { issues } = useIssues();

  return (
    <div className="issue-table-container">
      <h3>All Issues</h3>
      <table className="issue-table">
        <thead>
          <tr>
            <th>Title</th>
            <th>Status</th>
            <th>Severity</th>
            <th>Created Date</th>
          </tr>
        </thead>
        <tbody>
          {issues.map((issue: Issue) => (
            <tr key={issue.id}>
              <td>{issue.title}</td>
              <td>
                <span className={`status-badge ${issue.status.toLowerCase()}`}>
                  {issue.status}
                </span>
              </td>
              <td>{issue.severity}</td>
              <td>{new Date(issue.createdDate).toLocaleDateString()}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default IssueTable;
