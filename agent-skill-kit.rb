class AgentSkillKit < Formula
  desc "Centralized skills repository and CLI toolkit for AI agents"
  homepage "https://github.com/NavanithanS/Agent-Skill-Kit"
  url "https://pypi.io/packages/source/a/agent-skill-kit/agent_skill_kit-0.6.0.tar.gz"
  sha256 "3b6a45c17e2a7fa2db2e1bd7e226a28dacf6da6b74e11ea2d5f606c34af73ce3"
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
