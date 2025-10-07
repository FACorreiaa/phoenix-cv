defmodule PhoenixCsvWeb.CvLive do
  use PhoenixCsvWeb, :live_view

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:page_title, "CV - Fernando Correia")
      |> Phoenix.Component.assign_new(:inner_content, fn -> nil end)

    {:ok, socket, layout: {PhoenixCsvWeb.Layouts, :app}}
  end

  def render(assigns) do
    ~H"""
    <div class="min-h-screen bg-base-100">
      <div class="container mx-auto px-4 py-8 max-w-6xl">
        <!-- Header Section -->
        <div class="hero bg-base-200 rounded-box mb-8">
          <div class="hero-content text-center py-12">
            <div class="max-w-3xl">
              <h1 class="text-4xl md:text-5xl font-bold mb-4">Fernando Correia</h1>
              <p class="text-xl md:text-2xl mb-6 opacity-80">
                Software Engineer & Full Stack Developer
              </p>
              <div class="flex flex-wrap justify-center gap-4 mb-6 text-sm">
                <div class="badge badge-lg badge-outline gap-2">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    class="h-4 w-4"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"
                    />
                  </svg>
                  fernandocorreia316@gmail.com
                </div>
                <div class="badge badge-lg badge-outline gap-2">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    class="h-4 w-4"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"
                    />
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"
                    />
                  </svg>
                  Berlin, Germany
                </div>
              </div>
              <div class="flex flex-wrap justify-center gap-3">
                <a href="https://github.com/FACorreiaa" target="_blank" class="btn btn-outline">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    class="h-5 w-5"
                    fill="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z" />
                  </svg>
                  GitHub
                </a>
                <a
                  href="https://www.linkedin.com/in/fernando-correia-ab018079/"
                  target="_blank"
                  class="btn btn-outline"
                >
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    class="h-5 w-5"
                    fill="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path d="M19 0h-14c-2.761 0-5 2.239-5 5v14c0 2.761 2.239 5 5 5h14c2.762 0 5-2.239 5-5v-14c0-2.761-2.238-5-5-5zm-11 19h-3v-11h3v11zm-1.5-12.268c-.966 0-1.75-.79-1.75-1.764s.784-1.764 1.75-1.764 1.75.79 1.75 1.764-.783 1.764-1.75 1.764zm13.5 12.268h-3v-5.604c0-3.368-4-3.113-4 0v5.604h-3v-11h3v1.765c1.396-2.586 7-2.777 7 2.476v6.759z" />
                  </svg>
                  LinkedIn
                </a>
                <a
                  href="https://alunosipca-my.sharepoint.com/:w:/g/personal/a11199_alunos_ipca_pt/ESQtn-RfJexFuzTIfSrCTDIBPOEWApCr0ZQdGKxB8vmKNA?e=Wy1Trf"
                  target="_blank"
                  class="btn btn-primary"
                >
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    class="h-5 w-5"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M12 10v6m0 0l-3-3m3 3l3-3m2 8H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"
                    />
                  </svg>
                  Download PDF
                </a>
              </div>
            </div>
          </div>
        </div>
        <!-- Professional Summary -->
        <div class="card bg-base-200 shadow-xl mb-8">
          <div class="card-body">
            <h2 class="card-title text-3xl mb-4">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                class="h-8 w-8"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"
                />
              </svg>
              Professional Summary
            </h2>
            <p class="text-base leading-relaxed">
              Versatile Full-Stack Engineer with a 7-year track record of delivering robust applications. Specializes in Go and Kubernetes, with extensive experience across the stack including React, React Native, Angular, and Node.js. Passionate about building high-performance REST/GraphQL and gRPC services and currently focused on developing solutions with LLMs and Kafka. Currently learning about Elixir, Erlang and BEAM ecosystem to broaden backend expertise.
            </p>
          </div>
        </div>
        <!-- Experience Section -->
        <div class="card bg-base-200 shadow-xl mb-8">
          <div class="card-body">
            <h2 class="card-title text-3xl mb-6">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                class="h-8 w-8"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M21 13.255A23.931 23.931 0 0112 15c-3.183 0-6.22-.62-9-1.745M16 6V4a2 2 0 00-2-2h-4a2 2 0 00-2 2v2m4 6h.01M5 20h14a2 2 0 002-2V8a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"
                />
              </svg>
              Experience
            </h2>
            <div class="space-y-6">
              <!-- Experience 1 -->
              <div class="collapse collapse-arrow bg-base-100">
                <input type="checkbox" checked />
                <div class="collapse-title">
                  <div class="flex flex-col md:flex-row md:justify-between md:items-start gap-2">
                    <div>
                      <h3 class="text-xl font-bold">Senior Software Engineer</h3>
                      <p class="text-primary font-semibold">iDWELL</p>
                    </div>
                    <div class="badge badge-primary badge-lg">2022 - Present</div>
                  </div>
                </div>
                <div class="collapse-content">
                  <ul class="list-disc list-inside space-y-2 text-sm mt-4">
                    <li>
                      Led development of microservices architecture multiple users for multiple accounting systems.
                    </li>
                    <li>
                      Collaborating with cross-functional teams to enhance system architecture and drive process automation for finance-related tasks.
                    </li>
                    <li>
                      Developing web services for the finance sector, working on mission-critical features with Go, Postgres, MSSQL, and GraphQL.
                    </li>
                    <li>
                      Creation of data pipelienes aggregators with Go to validate information before submission to internal API.
                    </li>
                    <li>Mentored junior developers and conducted code reviews</li>
                  </ul>
                  <div class="divider"></div>
                  <div class="flex flex-wrap gap-2 mt-4">
                    <span class="badge badge-outline">Go</span>
                    <span class="badge badge-outline">Postgres</span>
                    <span class="badge badge-outline">MSSQL</span>
                    <span class="badge badge-outline">GraphQL</span>
                    <span class="badge badge-outline">AWS</span>
                  </div>
                </div>
              </div>
              <!-- Experience 2 -->
              <div class="collapse collapse-arrow bg-base-100">
                <input type="checkbox" />
                <div class="collapse-title">
                  <div class="flex flex-col md:flex-row md:justify-between md:items-start gap-2">
                    <div>
                      <h3 class="text-xl font-bold">Software Engineer</h3>
                      <p class="text-primary font-semibold">GSMK</p>
                    </div>
                    <div class="badge badge-secondary badge-lg">2023 - 2024</div>
                  </div>
                </div>
                <div class="collapse-content">
                  <ul class="list-disc list-inside space-y-2 text-sm mt-4">
                    <li>
                      Built the web version of the company's mobile network tracking application using React and Rust, offering a comprehensive overview of network stations and their data.
                    </li>
                    <li>
                      Introduced Golang for developing CLI tools to streamline multi-technology projects, coordinating with Erlang, Rust, and C++ teams.
                    </li>
                    <li>
                      Developed gRPC-based microservices at GSMK to enable efficient communication between internal services, integrated with OTLP for real-time telemetry and monitoring with Prometheus.
                    </li>
                  </ul>
                  <div class="divider"></div>
                  <div class="flex flex-wrap gap-2 mt-4">
                    <span class="badge badge-outline">React</span>
                    <span class="badge badge-outline">Go</span>
                    <span class="badge badge-outline">Postgres</span>
                    <span class="badge badge-outline">Docker</span>
                    <span class="badge badge-outline">Jenkins</span>
                  </div>
                </div>
              </div>
              <!-- Experience 3 -->
              <div class="collapse collapse-arrow bg-base-100">
                <input type="checkbox" />
                <div class="collapse-title">
                  <div class="flex flex-col md:flex-row md:justify-between md:items-start gap-2">
                    <div>
                      <h3 class="text-xl font-bold">Software developer</h3>
                      <p class="text-primary font-semibold">Beedeez</p>
                    </div>
                    <div class="badge badge-accent badge-lg">2021 - 2023</div>
                  </div>
                </div>
                <div class="collapse-content">
                  <ul class="list-disc list-inside space-y-2 text-sm mt-4">
                    <li>
                      Led the development of a social learning platform with React Native and TypeScript, ensuring high reusability of frontend components.
                    </li>
                    <li>
                      Built cross-platform mobile and web apps, implementing a dynamic learning experience with full backoffice configuration capabilities.
                    </li>
                    <li>
                      Developed a Go-based tool to aggregate and manage JSON data, improving internal team communication and facilitating decision-making for sales teams.
                    </li>
                  </ul>
                  <div class="divider"></div>
                  <div class="flex flex-wrap gap-2 mt-4">
                    <span class="badge badge-outline">React Native</span>
                    <span class="badge badge-outline">NodeJS</span>
                    <span class="badge badge-outline">MongoDB</span>
                    <span class="badge badge-outline">Docker</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- Skills Section -->
        <div class="card bg-base-200 shadow-xl mb-8">
          <div class="card-body">
            <h2 class="card-title text-3xl mb-6">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                class="h-8 w-8"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M9.663 17h4.673M12 3v1m6.364 1.636l-.707.707M21 12h-1M4 12H3m3.343-5.657l-.707-.707m2.828 9.9a5 5 0 117.072 0l-.548.547A3.374 3.374 0 0014 18.469V19a2 2 0 11-4 0v-.531c0-.895-.356-1.754-.988-2.386l-.548-.547z"
                />
              </svg>
              Technical Skills
            </h2>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
              <div>
                <h3 class="text-lg font-bold mb-3 flex items-center gap-2">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    class="h-5 w-5"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M10 20l4-16m4 4l4 4-4 4M6 16l-4-4 4-4"
                    />
                  </svg>
                  Programming Languages
                </h3>
                <div class="flex flex-wrap gap-2">
                  <span class="badge badge-primary">Elixir</span>
                  <span class="badge badge-primary">Go</span>
                  <span class="badge badge-primary">JavaScript</span>
                  <span class="badge badge-primary">TypeScript</span>
                  <span class="badge badge-primary">C#</span>
                  <span class="badge badge-primary">SQL</span>
                </div>
              </div>
              <div>
                <h3 class="text-lg font-bold mb-3 flex items-center gap-2">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    class="h-5 w-5"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"
                    />
                  </svg>
                  Frameworks & Libraries
                </h3>
                <div class="flex flex-wrap gap-2">
                  <span class="badge badge-secondary">Phoenix LiveView</span>
                  <span class="badge badge-secondary">React</span>
                  <span class="badge badge-secondary">SolidStart</span>
                  <span class="badge badge-secondary">Gin</span>
                  <span class="badge badge-secondary">Echo</span>
                  <span class="badge badge-secondary">HTMX</span>
                </div>
              </div>
              <div>
                <h3 class="text-lg font-bold mb-3 flex items-center gap-2">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    class="h-5 w-5"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M4 7v10c0 2.21 3.582 4 8 4s8-1.79 8-4V7M4 7c0 2.21 3.582 4 8 4s8-1.79 8-4M4 7c0-2.21 3.582-4 8-4s8 1.79 8 4m0 5c0 2.21-3.582 4-8 4s-8-1.79-8-4"
                    />
                  </svg>
                  Databases & Tools
                </h3>
                <div class="flex flex-wrap gap-2">
                  <span class="badge badge-accent">PostgreSQL</span>
                  <span class="badge badge-accent">Redis</span>
                  <span class="badge badge-accent">Docker</span>
                  <span class="badge badge-accent">Kubernetes</span>
                  <span class="badge badge-accent">Git</span>
                </div>
              </div>
              <div>
                <h3 class="text-lg font-bold mb-3 flex items-center gap-2">
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    class="h-5 w-5"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M3 15a4 4 0 004 4h9a5 5 0 10-.1-9.999 5.002 5.002 0 10-9.78 2.096A4.001 4.001 0 003 15z"
                    />
                  </svg>
                  Cloud & DevOps
                </h3>
                <div class="flex flex-wrap gap-2">
                  <span class="badge badge-info">AWS</span>
                  <span class="badge badge-info">GCP</span>
                  <span class="badge badge-info">CI/CD</span>
                  <span class="badge badge-info">Terraform</span>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- Education Section -->
        <div class="card bg-base-200 shadow-xl">
          <div class="card-body">
            <h2 class="card-title text-3xl mb-6">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                class="h-8 w-8"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
              >
                <path d="M12 14l9-5-9-5-9 5 9 5z" />
                <path d="M12 14l6.16-3.422a12.083 12.083 0 01.665 6.479A11.952 11.952 0 0012 20.055a11.952 11.952 0 00-6.824-2.998 12.078 12.078 0 01.665-6.479L12 14z" />
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M12 14l9-5-9-5-9 5 9 5zm0 0l6.16-3.422a12.083 12.083 0 01.665 6.479A11.952 11.952 0 0012 20.055a11.952 11.952 0 00-6.824-2.998 12.078 12.078 0 01.665-6.479L12 14zm-4 6v-7.5l4-2.222"
                />
              </svg>
              Education
            </h2>
            <div class="card bg-base-100 shadow-md">
              <div class="card-body">
                <div class="flex flex-col md:flex-row md:justify-between md:items-start gap-2">
                  <div>
                    <h3 class="text-xl font-bold">Bachelor and Masters of Science in Computer Science</h3>
                    <p class="text-primary font-semibold mt-2">IPCA University</p>
                    <p class="text-sm mt-2 opacity-80">
                      Relevant coursework: Data Structures, Algorithms, Software Engineering, Database Systems
                    </p>
                  </div>
                  <div class="badge badge-outline badge-lg">2017 - 2022</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
