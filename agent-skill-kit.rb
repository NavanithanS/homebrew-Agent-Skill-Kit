class AgentSkillKit < Formula
  desc "Centralized skills repository and CLI toolkit for AI agents"
  homepage "https://github.com/NavanithanS/Agent-Skill-Kit"
  url "https://pypi.io/packages/source/a/agent-skill-kit/agent_skill_kit-0.4.0.tar.gz"
  sha256 "4a97ff8e42b5aedfca4ed5d9de4b678a7d3dfe86a1205f7ef28355ac73fb3156"
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
