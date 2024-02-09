class Unifi < Oxidized::Model
  using Refinements

  prompt /@.*?:~\$\s/

  cmd :all do |cfg|
    cfg.lines.to_a[1..-2].join
  end

  cmd 'cat /tmp/running.cfg' do |cfg|
    cfg
  end

  # The comment output has to be at the end since and XML file may not start
  # with a comment.

  cfg :ssh do
    exec true
    pre_logout 'exit'
  end
end
