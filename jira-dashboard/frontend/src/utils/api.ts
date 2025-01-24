import axios from 'axios';
import { Issue, TicketFormData } from '../types/issueTypes';

const API_BASE = process.env.REACT_APP_API_URL;

export const fetchIssues = async (): Promise<Issue[]> => {
  const response = await axios.get<Issue[]>(`${API_BASE}/issues`);
  return response.data;
};

export const createTicket = async (data: TicketFormData): Promise<void> => {
  await axios.post(`${API_BASE}/issues`, data);
};
