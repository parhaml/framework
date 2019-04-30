require 'r00lz/version'

module R00lz
  class Error < StandardError; end

  class App
    def call(env)
      require "pry";binding.pry
      kl, act = cont_and_act(env)
      text = kl.new(env).send(act)
      [200, { 'Content-Type' =>
        'text/html' }, [text]]
    end

    def cont_and_act(env)
      _, con, act, after =
        env['PATH_INFO'].split('/')
      con = con.capitalize +
            'Controller'
      [Object.const_get(con), act]
    end
  end

  class Controller
    attr_reader :env

    def initialize(env)
      @env = env
    end
  end
end
