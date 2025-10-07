defmodule PhoenixCsvWeb.ProjectsLive do
  use PhoenixCsvWeb, :live_view

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:page_title, "Projects - Fernando Correia")
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
              <h1 class="text-4xl md:text-5xl font-bold mb-4">My Projects</h1>
              <p class="text-xl md:text-2xl opacity-80">A showcase of my work and ongoing experiments</p>
            </div>
          </div>
        </div>
        <!-- Featured Projects -->
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
                  d="M5 3v4M3 5h4M6 17v4m-2-2h4m5-16l2.286 6.857L21 12l-5.714 2.143L13 21l-2.286-6.857L5 12l5.714-2.143L13 3z"
                />
              </svg>
              Featured Projects
            </h2>
            <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
              <!-- Loci Server -->
              <div class="card bg-base-100 shadow-md">
                <div class="card-body">
                  <div class="flex justify-between items-start mb-4">
                    <h3 class="card-title text-xl">Loci Server</h3>
                    <span class="badge badge-warning gap-2">In Progress</span>
                  </div>
                  <p class="text-sm mb-4 flex-grow">
                    Gemini powered trip assistant. Agentic API built with go and Gemini SDK to help users build their own itinerary
                  </p>
                  <div class="divider my-2"></div>
                  <div class="flex flex-wrap gap-2 mb-4">
                    <span class="badge badge-outline">Go</span>
                    <span class="badge badge-outline">Postgres</span>
                    <span class="badge badge-outline">PostGIS</span>
                    <span class="badge badge-outline">Docker</span>
                    <span class="badge badge-outline">Kubernetes</span>
                    <span class="badge badge-outline">Terraform</span>
                  </div>
                  <div class="card-actions justify-end">
                    <a
                      href="https://github.com/FACorreiaa/wanderwise-ai-server"
                      target="_blank"
                      class="btn btn-outline btn-sm"
                    >
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        class="h-4 w-4"
                        fill="currentColor"
                        viewBox="0 0 24 24"
                      >
                        <path d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z" />
                      </svg>
                      GitHub
                    </a>
                  </div>
                </div>
              </div>
              <!-- Loci Client -->
              <div class="card bg-base-100 shadow-md">
                <div class="card-body">
                  <div class="flex justify-between items-start mb-4">
                    <h3 class="card-title text-xl">Loci client</h3>
                    <span class="badge badge-warning gap-2">In Progress</span>
                  </div>
                  <p class="text-sm mb-4 flex-grow">
                    Mobile first web app for Loci. Travel assistant tracker focused on building itineraries and help users save time between points of interest
                  </p>
                  <div class="divider my-2"></div>
                  <div class="flex flex-wrap gap-2 mb-4">
                    <span class="badge badge-outline">SolidStart</span>
                    <span class="badge badge-outline">Solid-query</span>
                    <span class="badge badge-outline">shadcn</span>
                    <span class="badge badge-outline">tailwindcss</span>
                  </div>
                  <div class="card-actions justify-end">
                    <a
                      href="https://github.com/FACorreiaa/wanderwise-ai-client"
                      target="_blank"
                      class="btn btn-outline btn-sm"
                    >
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        class="h-4 w-4"
                        fill="currentColor"
                        viewBox="0 0 24 24"
                      >
                        <path d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z" />
                      </svg>
                      GitHub
                    </a>
                  </div>
                </div>
              </div>
              <!-- Go FitMe REST -->
              <div class="card bg-base-100 shadow-md">
                <div class="card-body">
                  <div class="flex justify-between items-start mb-4">
                    <h3 class="card-title text-xl">Go FitMe REST</h3>
                    <span class="badge badge-success gap-2">Completed</span>
                  </div>
                  <p class="text-sm mb-4 flex-grow">
                    Backend of the Stay Healthy App. Comprehensive fitness tracking API with user management, workout planning, and health metrics.
                  </p>
                  <div class="divider my-2"></div>
                  <div class="flex flex-wrap gap-2 mb-4">
                    <span class="badge badge-outline">Go</span>
                    <span class="badge badge-outline">REST API</span>
                    <span class="badge badge-outline">gRPC</span>
                    <span class="badge badge-outline">PostgreSQL</span>
                  </div>
                  <div class="card-actions justify-end">
                    <a
                      href="https://github.com/FACorreiaa/Go-FitMe-REST"
                      target="_blank"
                      class="btn btn-outline btn-sm"
                    >
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        class="h-4 w-4"
                        fill="currentColor"
                        viewBox="0 0 24 24"
                      >
                        <path d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z" />
                      </svg>
                      GitHub
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- All Projects -->
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
                  d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"
                />
              </svg>
              All Projects
            </h2>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
              <!-- FitMe gRPC -->
              <div class="card bg-base-100 shadow-md">
                <div class="card-body">
                  <div class="flex justify-between items-start mb-4">
                    <h3 class="card-title text-lg">FitMe gRPC</h3>
                    <span class="badge badge-success">Completed</span>
                  </div>
                  <p class="text-sm mb-4 flex-grow">
                    gRPC server for the FitME REST API. High-performance microservice communication with protocol buffers.
                  </p>
                  <div class="divider my-2"></div>
                  <div class="flex flex-wrap gap-2 mb-4">
                    <span class="badge badge-outline badge-sm">Go</span>
                    <span class="badge badge-outline badge-sm">gRPC</span>
                    <span class="badge badge-outline badge-sm">Protocol Buffers</span>
                  </div>
                  <div class="card-actions justify-end">
                    <a
                      href="https://github.com/FACorreiaa/fitme-grpc"
                      target="_blank"
                      class="btn btn-outline btn-sm"
                    >
                      GitHub
                    </a>
                  </div>
                </div>
              </div>
              <!-- FitMe Protos -->
              <div class="card bg-base-100 shadow-md">
                <div class="card-body">
                  <div class="flex justify-between items-start mb-4">
                    <h3 class="card-title text-lg">FitMe Protos</h3>
                    <span class="badge badge-success">Completed</span>
                  </div>
                  <p class="text-sm mb-4 flex-grow">
                    Protocol buffer repository for FitME backend. Defines the service contracts and data structures for the fitness application.
                  </p>
                  <div class="divider my-2"></div>
                  <div class="flex flex-wrap gap-2 mb-4">
                    <span class="badge badge-outline badge-sm">Go</span>
                    <span class="badge badge-outline badge-sm">Protocol Buffers</span>
                    <span class="badge badge-outline badge-sm">gRPC</span>
                  </div>
                  <div class="card-actions justify-end">
                    <a
                      href="https://github.com/FACorreiaa/fitme-protos"
                      target="_blank"
                      class="btn btn-outline btn-sm"
                    >
                      GitHub
                    </a>
                  </div>
                </div>
              </div>
              <!-- Ink App Backend -->
              <div class="card bg-base-100 shadow-md">
                <div class="card-body">
                  <div class="flex justify-between items-start mb-4">
                    <h3 class="card-title text-lg">Ink App Backend gRPC</h3>
                    <span class="badge badge-warning">In Progress</span>
                  </div>
                  <p class="text-sm mb-4 flex-grow">
                    gRPC client for ink backend. Microservice architecture for creative content management system.
                  </p>
                  <div class="divider my-2"></div>
                  <div class="flex flex-wrap gap-2 mb-4">
                    <span class="badge badge-outline badge-sm">Go</span>
                    <span class="badge badge-outline badge-sm">gRPC</span>
                    <span class="badge badge-outline badge-sm">Microservices</span>
                  </div>
                  <div class="card-actions justify-end">
                    <a
                      href="https://github.com/FACorreiaa/ink-app-backend-grpc"
                      target="_blank"
                      class="btn btn-outline btn-sm"
                    >
                      GitHub
                    </a>
                  </div>
                </div>
              </div>
              <!-- SkyVisor Insight -->
              <div class="card bg-base-100 shadow-md">
                <div class="card-body">
                  <div class="flex justify-between items-start mb-4">
                    <h3 class="card-title text-lg">SkyVisor Insight</h3>
                    <span class="badge badge-success">Completed</span>
                  </div>
                  <p class="text-sm mb-4 flex-grow">
                    Aviation tracker server side rendering page using Go, Templ, HTMX and Postgres. Real-time flight tracking with modern web technologies.
                  </p>
                  <div class="divider my-2"></div>
                  <div class="flex flex-wrap gap-2 mb-4">
                    <span class="badge badge-outline badge-sm">Go</span>
                    <span class="badge badge-outline badge-sm">Templ</span>
                    <span class="badge badge-outline badge-sm">HTMX</span>
                    <span class="badge badge-outline badge-sm">PostgreSQL</span>
                  </div>
                  <div class="card-actions justify-end">
                    <a
                      href="https://github.com/FACorreiaa/skyvisor-insight"
                      target="_blank"
                      class="btn btn-outline btn-sm"
                    >
                      GitHub
                    </a>
                  </div>
                </div>
              </div>
              <!-- Algorithms Review -->
              <div class="card bg-base-100 shadow-md">
                <div class="card-body">
                  <div class="flex justify-between items-start mb-4">
                    <h3 class="card-title text-lg">Algorithms Review</h3>
                    <span class="badge badge-success">Completed</span>
                  </div>
                  <p class="text-sm mb-4 flex-grow">
                    Main Algorithms and Logic in Python. Comprehensive collection of algorithm implementations for learning and reference.
                  </p>
                  <div class="divider my-2"></div>
                  <div class="flex flex-wrap gap-2 mb-4">
                    <span class="badge badge-outline badge-sm">Python</span>
                    <span class="badge badge-outline badge-sm">Algorithms</span>
                    <span class="badge badge-outline badge-sm">Data Structures</span>
                  </div>
                  <div class="card-actions justify-end">
                    <a
                      href="https://github.com/FACorreiaa/algorithms-review"
                      target="_blank"
                      class="btn btn-outline btn-sm"
                    >
                      GitHub
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- Tech Stack Focus -->
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
                  d="M9 3v2m6-2v2M9 19v2m6-2v2M5 9H3m2 6H3m18-6h-2m2 6h-2M7 19h10a2 2 0 002-2V7a2 2 0 00-2-2H7a2 2 0 00-2 2v10a2 2 0 002 2zM9 9h6v6H9V9z"
                />
              </svg>
              Technology Focus
            </h2>
            <p class="mb-6">
              My projects primarily focus on backend development with Go, emphasizing:
            </p>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
              <div class="space-y-4">
                <div class="collapse collapse-arrow bg-base-100">
                  <input type="checkbox" checked />
                  <div class="collapse-title font-semibold">
                    <div class="flex items-center gap-2">
                      <span class="badge badge-primary badge-sm"></span>
                      Microservices
                    </div>
                  </div>
                  <div class="collapse-content">
                    <p class="text-sm">gRPC-based service architectures with protocol buffers</p>
                  </div>
                </div>
                <div class="collapse collapse-arrow bg-base-100">
                  <input type="checkbox" />
                  <div class="collapse-title font-semibold">
                    <div class="flex items-center gap-2">
                      <span class="badge badge-secondary badge-sm"></span>
                      Real-time Applications
                    </div>
                  </div>
                  <div class="collapse-content">
                    <p class="text-sm">HTMX and WebSocket implementations for live data</p>
                  </div>
                </div>
              </div>
              <div class="space-y-4">
                <div class="collapse collapse-arrow bg-base-100">
                  <input type="checkbox" />
                  <div class="collapse-title font-semibold">
                    <div class="flex items-center gap-2">
                      <span class="badge badge-accent badge-sm"></span>
                      Modern Web Stack
                    </div>
                  </div>
                  <div class="collapse-content">
                    <p class="text-sm">Go with Templ for server-side rendering</p>
                  </div>
                </div>
                <div class="collapse collapse-arrow bg-base-100">
                  <input type="checkbox" />
                  <div class="collapse-title font-semibold">
                    <div class="flex items-center gap-2">
                      <span class="badge badge-info badge-sm"></span>
                      API Design
                    </div>
                  </div>
                  <div class="collapse-content">
                    <p class="text-sm">RESTful and gRPC APIs with PostgreSQL</p>
                  </div>
                </div>
              </div>
              <div class="space-y-4">
                <div class="collapse collapse-arrow bg-base-100">
                  <input type="checkbox" />
                  <div class="collapse-title font-semibold">
                    <div class="flex items-center gap-2">
                      <span class="badge badge-warning badge-sm"></span>
                      Algorithm Study
                    </div>
                  </div>
                  <div class="collapse-content">
                    <p class="text-sm">Continuous learning and implementation in Python</p>
                  </div>
                </div>
                <div class="collapse collapse-arrow bg-base-100">
                  <input type="checkbox" />
                  <div class="collapse-title font-semibold">
                    <div class="flex items-center gap-2">
                      <span class="badge badge-success badge-sm"></span>
                      Aviation Tech
                    </div>
                  </div>
                  <div class="collapse-content">
                    <p class="text-sm">Specialized tracking and monitoring systems</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- Contact CTA -->
        <div class="card bg-base-200 shadow-xl">
          <div class="card-body text-center">
            <h2 class="card-title text-3xl justify-center mb-4">
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
                  d="M8 12h.01M12 12h.01M16 12h.01M21 12c0 4.418-4.03 8-9 8a9.863 9.863 0 01-4.255-.949L3 20l1.395-3.72C3.512 15.042 3 13.574 3 12c0-4.418 4.03-8 9-8s9 3.582 9 8z"
                />
              </svg>
              Interested in Collaborating?
            </h2>
            <p class="mb-6 max-w-2xl mx-auto">
              I'm always open to discussing new projects, opportunities, or just chatting about technology.
            </p>
            <div class="flex flex-wrap justify-center gap-4">
              <a href="mailto:fernandocorreia316@gmail.com" class="btn btn-primary">
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
                    d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"
                  />
                </svg>
                Get In Touch
              </a>
              <a href="https://github.com/FACorreiaa" target="_blank" class="btn btn-outline">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  class="h-5 w-5"
                  fill="currentColor"
                  viewBox="0 0 24 24"
                >
                  <path d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z" />
                </svg>
                View GitHub
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
