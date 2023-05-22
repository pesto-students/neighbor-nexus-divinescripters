import { getServerSession } from "next-auth"
import { redirect } from "next/navigation";

export default async function Home() {
  const session = await getServerSession();

  if (!session) {
    return (
      redirect('api/auth/signin')
    )
  }

  return (
    <main className="flex min-h-screen flex-col items-center justify-between p-24">
      <h1 className="text-4xl font-bold text-center">
        Welcome AJ
      </h1>
    </main>
  )
}
