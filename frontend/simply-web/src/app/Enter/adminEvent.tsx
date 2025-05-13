'use client';
import { useRouter } from 'next/navigation';
import styles from './adminEvent.module.css';

export default function AdminEventPage() {
  const router = useRouter();

  const handleConnectWallet = () => {
    alert('Wallet connection logic goes here.');
  };

  return (
    <div className={styles.container}>
      <div className={styles.section}>
        <h1 className={styles.title}>Add Admin</h1>
        <button className={styles.button}>Admin +</button>
        <button className={styles.button} onClick={() => router.push('/')}>Back</button>
      </div>

      <div className={styles.section}>
        <h1 className={styles.title}>Add Event</h1>
        <button className={styles.button}>Event +</button>
        <button className={styles.button} onClick={handleConnectWallet}>Connect to Wallet</button>
      </div>
    </div>
  );
}
