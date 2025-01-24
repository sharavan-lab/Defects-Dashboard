import React, { createContext, useContext, useState, useEffect, ReactNode } from 'react';
import { fetchIssues } from '../utils/api';
import { Issue } from '../types/issueTypes';

interface IssueContextType {
  issues: Issue[];
  loading: boolean;
  refreshIssues: () => Promise<void>;
}

const IssueContext = createContext<IssueContextType>({
  issues: [],
  loading: true,
  refreshIssues: async () => {},
});

export const IssueProvider = ({ children }: { children: ReactNode }) => {
  const [issues, setIssues] = useState<Issue[]>([]);
  const [loading, setLoading] = useState(true);

  const refreshIssues = async () => {
    try {
      const data = await fetchIssues();
      setIssues(data);
    } catch (error) {
      console.error('Error refreshing issues:', error);
    }
  };

  useEffect(() => {
    refreshIssues().finally(() => setLoading(false));
  }, []);

  return (
    <IssueContext.Provider value={{ issues, loading, refreshIssues }}>
      {children}
    </IssueContext.Provider>
  );
};

export const useIssues = () => useContext(IssueContext);
