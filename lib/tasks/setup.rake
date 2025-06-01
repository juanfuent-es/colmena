namespace :setup do
  desc "Create base system pages and configurations"
  task base: :environment do
    puts "\n=== Creating base system pages ==="
    
    # Create admin user if not exists
    admin = User.find_or_create_by!(email: "admin@example.com") do |user|
      user.password = "colmena#2024"
      user.password_confirmation = "colmena#2024"
      user.role = "admin"
    end
    puts "✓ Admin user created/verified"

    # Create static pages
    static_pages = [
      {
        title: "Home",
        slug: "home",
        content: "Welcome to our platform",
        category: "static",
        restricted: true,
        published: true
      },
      {
        title: "About",
        slug: "about",
        content: "About our platform",
        category: "static",
        restricted: true,
        published: true
      },
      {
        title: "Contact",
        slug: "contact",
        content: "Contact information",
        category: "static",
        restricted: true,
        published: true
      }
    ]

    static_pages.each do |page_data|
      page = Page.find_or_create_by!(slug: page_data[:slug], category: page_data[:category]) do |p|
        p.title = page_data[:title]
        p.content = page_data[:content]
        p.og_title = page_data[:title]
        p.og_description = page_data[:content].slice(0..160)
        p.restricted = page_data[:restricted]
        p.published = page_data[:published]
        p.user = admin
      end
      puts "✓ Static page '#{page.title}' created/verified"
    end

    # Create error pages
    error_pages = [
      {
        title: "404 Not Found",
        slug: "404",
        content: "The page you are looking for does not exist.",
        category: "errors",
        restricted: true,
        published: true
      },
      {
        title: "422 Unprocessable Entity",
        slug: "422",
        content: "The change you wanted was rejected.",
        category: "errors",
        restricted: true,
        published: true
      },
      {
        title: "500 Server Error",
        slug: "500",
        content: "We're sorry, but something went wrong.",
        category: "errors",
        restricted: true,
        published: true
      },
      {
        title: "Offline",
        slug: "offline",
        content: "You are currently offline. Please check your internet connection.",
        category: "errors",
        restricted: true,
        published: true
      }
    ]

    error_pages.each do |page_data|
      page = Page.find_or_create_by!(slug: page_data[:slug], category: page_data[:category]) do |p|
        p.title = page_data[:title]
        p.content = page_data[:content]
        p.og_title = page_data[:title]
        p.og_description = page_data[:content].slice(0..160)
        p.restricted = page_data[:restricted]
        p.published = page_data[:published]
        p.user = admin
      end
      puts "✓ Error page '#{page.title}' created/verified"
    end

    # Create session pages
    session_pages = [
      {
        title: "Sign In",
        slug: "sign_in",
        content: "Please sign in to continue",
        category: "users",
        restricted: true,
        published: true
      }
    ]

    session_pages.each do |page_data|
      page = Page.find_or_create_by!(slug: page_data[:slug], category: page_data[:category]) do |p|
        p.title = page_data[:title]
        p.content = page_data[:content]
        p.og_title = page_data[:title]
        p.og_description = page_data[:content].slice(0..160)
        p.restricted = page_data[:restricted]
        p.published = page_data[:published]
        p.user = admin
      end
      puts "✓ Session page '#{page.title}' created/verified"
    end

    puts "\n=== Base system setup completed ==="
  end
end 