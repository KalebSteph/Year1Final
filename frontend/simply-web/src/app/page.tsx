"use client";
import { useRouter } from "next/navigation";
import styles from "./page.module.css";

export default function HomePage() {
  const router = useRouter();

  return (
    <div className={styles.container}>
      <div className={styles.titleImageRow}>
        <h1 className={styles.title}>Welcome<br/> To<br/> Simply Cards</h1>
        <div className={styles.imageContainer}>
          <img src="/Cards.jpeg" alt="Cards" className={styles.cardsImage} />
        </div>
      </div>

      <div className={styles.buttonWrapper}>
        <button className={styles.button} onClick={() => window.location.href = "/enter"}>
          Enter
        </button>
      </div>
    </div>
  );
}
