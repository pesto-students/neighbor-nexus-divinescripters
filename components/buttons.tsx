'use client';

import { signIn, signOut, useSession } from 'next-auth/react';
import Image from 'next/image';
import Link from 'next/link';

export function SignInButton() {
  const { data: session, status } = useSession();

  console.log(status);
  if (status === 'loading') {
    return <p>Loading...</p>;
  }

  if (status === 'authenticated') {
    return (
      <Link href="/dashboard">
        <Image src={session?.user?.image!} alt="user avatar" width={32} height={32} className='rounded-full' />
      </Link>
    );
  }

  return (
    <button onClick={() => signIn()}>Sign In</button>
  );
}

export function SignOutButton() {
  const { status } = useSession();
  if (status === 'authenticated') {
    return <button onClick={() => signOut()}>Sign Out</button>
  }
  return <></>
}
