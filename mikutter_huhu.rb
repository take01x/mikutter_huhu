# -*- coding: utf-8 -*-

Plugin.create(:mikutter_huhu) do
  command(
          :mikutter_huhu,
          name: 'ふふっ',
          condition: lambda{ |opt| true },
          visible: true,
          role: :timeline
          ) do |opt|
    opt.messages.map{ |m|
      user_name = m.message.user.idname
      message = "@" + user_name + " ふふっ(*^_^*)"
      message += '　' * (rand(140-message.split(//).size+1)+1)
      Service.primary.post(:message => message,
                           :replyto => m.message)
    }
  end
end

