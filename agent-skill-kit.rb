class AgentSkillKit < Formula
  desc "Centralized skills repository and CLI toolkit for AI agents"
  homepage "https://github.com/NavanithanS/Agent-Skill-Kit"
  url "https://pypi.io/packages/source/a/agent-skill-kit/agent_skill_kit-0.4.1.tar.gz"
  sha256 "d2f1a4e0f9d2d325f821a2e882fc1f074cc2a07231ebe5b22a149477a07c337e"
  license "MIT"

  depends_on "python@3.12"

  def install
    # Create a virtual environment in the libexec directory
    system "python3", "-m", "venv", libexec
    
    # Install the package and its dependencies into the virtual environment
    # This assumes the machine has internet access during the build (standard for private taps)
    system libexec/"bin/pip", "install", "-v", "."
    
    # Symlink the 'ask' executable to the bin directory
    bin.install_symlink libexec/"bin/ask"
  end

  test do
    # Verify the installation by checking the version
    system "#{bin}/ask", "--version"
  end
end
