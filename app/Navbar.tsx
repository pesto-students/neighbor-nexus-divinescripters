import { SignInButton, SignOutButton } from "@/components/buttons";
import Link from "next/link";

Navbar.propTypes = {};

function Navbar() {
  return (
    <nav className="flex">
      <Link className="mr-2" href={'/'}>
        <img src='https://cdn-icons-png.flaticon.com/512/5038/5038229.png' height={30} width={30} alt='saadad dsdd' />
      </Link>
      <ul className="flex align-text-bottom">
        <li className="mr-2"><Link href={'/about'}>About</Link></li>
        <li className="mr-2"><Link href={'/home'}>home</Link></li>
        <li className="mr-2"><Link href={'/user'}>User</Link></li>
        <li className="mr-2"><SignInButton /></li>
        <li className="mr-2"><SignOutButton /></li>
      </ul>
    </nav>
  );
}

export default Navbar;