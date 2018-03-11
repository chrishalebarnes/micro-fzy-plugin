VERSION = "0.0.1"

MakeCommand("fzy", "fzy.find", 0)
MakeCommand("fzy", "fzy.findGitTrackedFiles", 0)

function common(fn)
  if TermEmuSupported then
    if CurView():CanClose() then
      fn()
    else
      messenger:Message("micro-fzy-plugin: cannot open fzy since the current view cannot be closed")
    end
  else
    messenger:Message("micro-fzy-plugin: terminal emulation is not supported on this platform")
  end
end

function find()
  common(function()
    RunTermEmulator("sh -c 'find . -type f | fzy'", false, true, "fzy.handleFzyOutput")
  end)
end

function findGitTrackedFiles()
  common(function()
    RunTermEmulator("sh -c 'git ls-files | fzy'", false, true, "fzy.handleFzyOutput")
  end)
end

function handleFzyOutput(output)
  if output ~= nil and output ~= '' then
    local strings = import("strings")
    path = strings.TrimSpace(output)
    CurView():Open(path)
    messenger:Message("micro-fzy-plugin: opened " .. path)
  else
    messenger:Message("micro-fzy-plugin: cancelled or nothing to open")
  end
end

AddRuntimeFile("fzy", "help", "README.md")
