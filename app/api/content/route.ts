import { getServerSession } from "next-auth";
import { NextResponse } from "next/server";

const post = [{
  title: 'asd',
  slug: 'asd',
  content: 'as dasd asd'
}]
export async function GET() {
  const session = await getServerSession()
  return NextResponse.json(post)
}