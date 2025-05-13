"use client";
import { useRouter } from "next/navigation";
import styles from "./page.module.css";

export default function HomePage() {
  const router = useRouter();

  return (
    <div className={styles.container}>
      <h1 className={styles.title}>Welcome<br/> To <br/>Simply Cards</h1>
      <button onClick={() => router.push("/enter")} className={styles.button}>
        Enter
      </button>
    </div>
  );
}
