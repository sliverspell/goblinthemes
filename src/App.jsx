import { BrowserRouter, Routes, Route } from 'react-router-dom';
import Layout from './components/Layout';
import Home from './pages/Home';
import ThemeStore from './pages/ThemeStore';
import TableGenerator from './pages/TableGenerator';
import Documentation from './pages/Documentation';
import './styles/global.css';

export default function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Layout />}>
          <Route index element={<Home />} />
          <Route path="theme-store" element={<ThemeStore />} />
          <Route path="table-generator" element={<TableGenerator />} />
          <Route path="documentation" element={<Documentation />} />
        </Route>
      </Routes>
    </BrowserRouter>
  );
}
