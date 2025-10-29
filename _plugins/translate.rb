module Jekyll
  module Translate
    def translate(key, lang = nil)
      lang ||= @context.registers[:page]['lang'] || @context.registers[:site].config['default_lang']
      
      # Load translations
      translations = @context.registers[:site].data['translations']
      return key unless translations && translations[lang]
      
      # Split the key by dots to navigate nested structure
      keys = key.split('.')
      value = translations[lang]
      
      keys.each do |k|
        if value.is_a?(Hash) && value.key?(k)
          value = value[k]
        else
          return key # Return original key if translation not found
        end
      end
      
      value
    end
    
    def current_lang
      @context.registers[:page]['lang'] || @context.registers[:site].config['default_lang']
    end
    
    def available_languages
      @context.registers[:site].config['languages'] || ['en']
    end
    
    def lang_name(lang)
      lang_names = @context.registers[:site].config['lang_names'] || {}
      lang_names[lang] || lang
    end
  end
end

Liquid::Template.register_filter(Jekyll::Translate) 