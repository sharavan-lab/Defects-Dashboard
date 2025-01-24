import React from 'react';
import { Chart } from 'react-google-charts';
import { useIssues } from '../../contexts/IssueContext';

const IssueChart = () => {
  const { issues } = useIssues();
  
  const severityData = [
    ['Severity', 'Count'],
    ['Critical', issues.filter(i => i.severity === 'Critical').length],
    ['High', issues.filter(i => i.severity === 'High').length],
    ['Medium', issues.filter(i => i.severity === 'Medium').length],
  ];

  return (
    <div className="chart-container">
      <Chart
        chartType="PieChart"
        data={severityData}
        options={{ title: 'Issues by Severity' }}
        width="100%"
        height="400px"
      />
    </div>
  );
};

export default IssueChart;
