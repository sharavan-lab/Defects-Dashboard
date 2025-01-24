export interface Issue {
  id: string;
  title: string;
  status: 'Open' | 'In Progress' | 'Done';
  severity: 'Low' | 'Medium' | 'High' | 'Critical';
  createdDate: string;
  resolvedDate?: string;
}

export interface TicketFormData {
  summary: string;
  description: string;
  priority: 'Low' | 'Medium' | 'High';
}
