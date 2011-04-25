require 'sinatra/base'

module Sinatra
  module EngineTracking
    def erb?
      @current_engine == :erb
    end

    def erubis?
      @current_engine == :erubis or
      erb? && Tilt[:erb] == Tilt::ErubisTemplate
    end

    def haml?
      @current_engine == :haml
    end

    def sass?
      @current_engine == :sass
    end

    def scss?
      @current_engine == :scss
    end

    def less?
      @current_engine == :less
    end

    def builder?
      @current_engine == :builder
    end

    def liquid?
      @current_engine == :liquid
    end

    def markdown?
      @current_engine == :markdown
    end

    def textile?
      @current_engine == :textile
    end

    def rdoc?
      @current_engine == :rdoc
    end

    def radius?
      @current_engine == :radius
    end

    def markaby?
      @current_engine == :markaby
    end

    def coffee?
      @current_engine == :coffee
    end

    def nokogiri?
      @current_engine == :nokogiri
    end

    def slim?
      @current_engine == :slim
    end

    def call!(env)
      @current_engine = :ruby
      super
    end

    private

    def render(engine, *)
      @current_engine, engine_was = engine.to_sym, @current_engine
      super
    ensure
      @current_engine = engine_was
    end
  end

  helpers EngineTracking
end
