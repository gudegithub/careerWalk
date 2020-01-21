# -*- encoding : utf-8 -*-
require "rails_helper"

RSpec.describe UserEventMailer, type: :mailer do
  let(:user) { FactoryBot.create(:user, name: 'test_user') }
  let(:event) { FactoryBot.create(:event, title: 'メイラーSpecを書く', description: '送信したメールの内容を確認する。') }

  let(:text_body) do
    part = mail.body.parts.detect { |part| part.content_type == 'text/plain; charset=UTF-8' }
    part.body.raw_source
  end
  let(:html_body) do
    part = mail.body.parts.detect { |part| part.content_type == 'text/html; charset=UTF-8' }
    part.body.raw_source
  end

  describe '#creation_email' do
    let(:mail) { UserEventMailer.creation_email(user, event) }

    it '想定通りのメールが生成される' do
      expect(mail.subject).to eq('イベント参加完了メール')
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(['creerWalk@example.com'])

      # text形式の本文
      expect(text_body).to match('以下のイベントへの参加の申し込みが完了いたしました。')
      expect(text_body).to match('メイラーSpecを書く')
      expect(text_body).to match('送信したメールの内容を確認する。')

      #html形式
      expect(html_body).to match('以下のイベントに参加申込を承りましました。')
      expect(html_body).to match('メイラーSpecを書く')
      expect(html_body).to match('送信したメールの内容を確認する。')
    end
  end
end
