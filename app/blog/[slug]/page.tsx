interface Post {
  title: string;
  content: string
  slug: string
}

interface Props {
  params: { slug: string }
}

export default async function BlogPagePost({ params }: Props) {

  const posts: Post[] = await fetch('http://localhost:3000/api/content').then(
    (res) => res.json()
  )

  const post = posts.find((post) => post.slug === params.slug)!
  return (
  <div>
    <h1 className="text-cyan-300">{post.title}</h1>
    <p>{post.content}</p>
  </div>)
}