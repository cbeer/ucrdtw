require "ucrdtw/version"
require 'ffi'
require 'ffi-compiler/loader'

module Ucrdtw
  extend FFI::Library
  ffi_lib FFI::Compiler::Loader.find('ucrdtw')

  attach_function :ucrdtw, [:pointer, :long_long, :pointer, :long, :double, :int, :pointer, :pointer], :int

  class <<self
    def verbose=(verbose)
      @verbose = verbose
    end

    def verbose
      @verbose ||= 0
    end
  end

  def self.dtw(data, query, warp_width = 0.05)
    dataBuf = FFI::MemoryPointer.new(:double, data.size)
    dataBuf.write_array_of_double(data)

    queryBuf = FFI::MemoryPointer.new(:double, query.size)
    queryBuf.write_array_of_double(query)

    location = FFI::MemoryPointer.new(:long_long, 1)
    distance = FFI::MemoryPointer.new(:double, 1)

    ucrdtw(dataBuf, data.length, queryBuf, query.length, warp_width, verbose, location, distance)

    [location.read_long_long, distance.read_double]
  end

end
