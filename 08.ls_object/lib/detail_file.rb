# frozen_string_literal: true

require 'etc'

class DetailFile
  TYPES = {
    'file' => '-',
    'directory' => 'd',
    'characterSpecial' => 'c',
    'blockSpecial' => 'b',
    'fifo' => 'p',
    'link' => 'l',
    'socket' => 's'
  }.freeze

  PERMISSIONS = {
    '0' => '---',
    '1' => '--x',
    '2' => '-w-',
    '3' => '-wx',
    '4' => 'r--',
    '5' => 'r-x',
    '6' => 'rw-',
    '7' => 'rwx'
  }.freeze

  def initialize(file)
    @file = file
  end

  def require_line
    [
      require_type + require_permission,
      File.stat(@file).nlink.to_s.rjust(2),
      Etc.getpwuid(File.stat(@file).uid).name,
      Etc.getgrgid(File.stat(@file).gid).name.rjust(6),
      File.stat(@file).size.to_s.rjust(5),
      File.stat(@file).mtime.strftime(' %-m %_d %H:%M'),
      File.basename(@file, '/*')
    ].join(' ')
  end

  private

  def require_mode
    File.stat(@file).mode.to_s(8).rjust(6, '0')
  end

  def require_type
    TYPES[File.stat(@file).ftype]
  end

  def require_permission
    require_mode[3..5].chars.sum('') { |permission| PERMISSIONS[permission] }
  end
end
