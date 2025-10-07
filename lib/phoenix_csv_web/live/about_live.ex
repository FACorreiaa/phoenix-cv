defmodule PhoenixCsvWeb.AboutLive do
  use PhoenixCsvWeb, :live_view

  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(:page_title, "About Me - Fernando Correia")
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
              <h1 class="text-4xl md:text-5xl font-bold mb-4">About Me</h1>
              <p class="text-xl md:text-2xl opacity-80">Get to know the person behind the code</p>
            </div>
          </div>
        </div>
        <!-- Personal Introduction -->
        <div class="card bg-base-200 shadow-xl mb-8">
          <div class="card-body">
            <div class="grid grid-cols-1 md:grid-cols-3 gap-8 items-center">
              <div class="md:col-span-1 flex justify-center">
                <div class="avatar placeholder">
                  <div class="bg-primary text-primary-content rounded-full w-48">
                    <span class="text-6xl">👨‍💻</span>
                  </div>
                </div>
              </div>
              <div class="md:col-span-2 space-y-4">
                <h2 class="card-title text-2xl">Hello, I'm Fernando!</h2>
                <p class="leading-relaxed">
                  I'm a passionate software engineer with a love for creating elegant solutions to complex problems. My journey in technology started over 5 years ago, and I've been fascinated by the endless possibilities that code can unlock ever since.
                </p>
                <p class="leading-relaxed">
                  When I'm not coding, you'll find me exploring new technologies, contributing to open-source projects, or sharing my knowledge through technical writing and mentoring.
                </p>
              </div>
            </div>
          </div>
        </div>
        <!-- My Story -->
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
                  d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"
                />
              </svg>
              My Story
            </h2>
            <div class="space-y-4">
              <p class="leading-relaxed">
                My fascination with technology began in college when I wrote my first "Hello, World!" program. That simple moment of seeing code come to life sparked a passion that has driven my career ever since.
              </p>
              <p class="leading-relaxed">
                Throughout my career, I've had the privilege of working with amazing teams and tackling challenging problems across various industries. From startups to enterprise companies, each experience has shaped my approach to software development and problem-solving.
              </p>
              <p class="leading-relaxed">
                I believe that great software is not just about clean code—it's about understanding user needs, collaborating effectively with teams, and continuously learning and adapting to new technologies.
              </p>
            </div>
          </div>
        </div>
        <!-- What I Love -->
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
                  d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z"
                />
              </svg>
              What I Love About Development
            </h2>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
              <div class="card bg-base-100 shadow-md">
                <div class="card-body">
                  <div class="flex items-start gap-4">
                    <div class="avatar placeholder">
                      <div class="bg-primary text-primary-content rounded-full w-12">
                        <span class="text-xl">🧩</span>
                      </div>
                    </div>
                    <div class="flex-1">
                      <h3 class="card-title text-lg">Problem Solving</h3>
                      <p class="text-sm">
                        Breaking down complex challenges into manageable pieces and finding elegant solutions.
                      </p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card bg-base-100 shadow-md">
                <div class="card-body">
                  <div class="flex items-start gap-4">
                    <div class="avatar placeholder">
                      <div class="bg-secondary text-secondary-content rounded-full w-12">
                        <span class="text-xl">🚀</span>
                      </div>
                    </div>
                    <div class="flex-1">
                      <h3 class="card-title text-lg">Performance Optimization</h3>
                      <p class="text-sm">
                        Fine-tuning applications to achieve maximum efficiency and user experience.
                      </p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card bg-base-100 shadow-md">
                <div class="card-body">
                  <div class="flex items-start gap-4">
                    <div class="avatar placeholder">
                      <div class="bg-accent text-accent-content rounded-full w-12">
                        <span class="text-xl">👥</span>
                      </div>
                    </div>
                    <div class="flex-1">
                      <h3 class="card-title text-lg">Team Collaboration</h3>
                      <p class="text-sm">
                        Working with diverse teams to build amazing products and mentor other developers.
                      </p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card bg-base-100 shadow-md">
                <div class="card-body">
                  <div class="flex items-start gap-4">
                    <div class="avatar placeholder">
                      <div class="bg-info text-info-content rounded-full w-12">
                        <span class="text-xl">📚</span>
                      </div>
                    </div>
                    <div class="flex-1">
                      <h3 class="card-title text-lg">Continuous Learning</h3>
                      <p class="text-sm">
                        Staying up-to-date with the latest technologies and best practices in the industry.
                      </p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- Beyond Code -->
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
                  d="M14.828 14.828a4 4 0 01-5.656 0M9 10h.01M15 10h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"
                />
              </svg>
              Beyond Code
            </h2>
            <p class="leading-relaxed mb-6">
              When I'm not immersed in code, I enjoy a variety of activities that keep me balanced and inspired:
            </p>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
              <div class="card bg-base-100 shadow-md">
                <div class="card-body items-center text-center">
                  <div class="avatar placeholder mb-3">
                    <div class="bg-primary text-primary-content rounded-full w-16">
                      <span class="text-3xl">🏃‍♂️</span>
                    </div>
                  </div>
                  <h3 class="card-title text-lg">Fitness & Running</h3>
                  <p class="text-sm">
                    Regular exercise helps me stay focused and energized for tackling complex problems.
                  </p>
                </div>
              </div>
              <div class="card bg-base-100 shadow-md">
                <div class="card-body items-center text-center">
                  <div class="avatar placeholder mb-3">
                    <div class="bg-secondary text-secondary-content rounded-full w-16">
                      <span class="text-3xl">📖</span>
                    </div>
                  </div>
                  <h3 class="card-title text-lg">Reading</h3>
                  <p class="text-sm">
                    I love reading about technology, psychology, and leadership to broaden my perspective.
                  </p>
                </div>
              </div>
              <div class="card bg-base-100 shadow-md">
                <div class="card-body items-center text-center">
                  <div class="avatar placeholder mb-3">
                    <div class="bg-accent text-accent-content rounded-full w-16">
                      <span class="text-3xl">🌍</span>
                    </div>
                  </div>
                  <h3 class="card-title text-lg">Travel</h3>
                  <p class="text-sm">
                    Exploring new cultures and places provides fresh insights and inspiration.
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- Let's Connect -->
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
                  d="M17 8h2a2 2 0 012 2v6a2 2 0 01-2 2h-2v4l-4-4H9a1.994 1.994 0 01-1.414-.586m0 0L11 14h4a2 2 0 002-2V6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2v4l.586-.586z"
                />
              </svg>
              Let's Connect
            </h2>
            <p class="mb-6 max-w-2xl mx-auto">
              I'm always excited to connect with fellow developers, discuss new opportunities, or simply chat about technology and innovation.
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
            </div>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
