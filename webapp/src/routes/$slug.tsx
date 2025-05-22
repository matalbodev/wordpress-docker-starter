import {createFileRoute} from '@tanstack/react-router'

export const Route = createFileRoute('/$slug')({
  component: Page,
})

function Page() {
  const { slug } = Route.useParams()
  return <h1>Hello world {slug} !</h1>
}
