# -*- coding: utf-8 -*-

Plugin.create(:mikutter_huhu) do
  command(
          :mikutter_huhu,
          name: 'ふふっ',
          condition: lambda{ |opt| true },
          visible: true,
          role: :timeline
          ) do |opt|
    user_name = opt.messages[0].user.idname
    message = "@" + user_name + " ふふっ(*^_^*)"
    message += '　' * (rand(140-message.split(//).size+1)+1)
    Service.primary.post(:message => message,
                         :replyto => opt.messages[0])
  end
end

