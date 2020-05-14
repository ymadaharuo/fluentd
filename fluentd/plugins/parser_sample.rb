require 'fluent/plugin/parser'

module Fluent::Plugin
  class SampleParser < Parser
    Fluent::Plugin.register_parser("sample", self)

    def configure(conf)
      super
    end

    def parse(text)
      # $1: LBのIP
      # $2: アイデンティティ。基本 -
      # $3: ユーザ名。基本 -
      # $4: 時刻
      # $5: リクエストメソッド
      # $6: リクエストURI
      # $7: HTTPバージョン
      # $8: HTTPステータス
      # $9: コンテンツサイズ
      # $10: レスポンスタイム。マイクロ秒
      # $11: ファイル名
      # $12: リファラ
      # $13: ユーザエージェント
      # $14: リモートIP
      keyValue = text.split(/^([^ ]+) ([^ ]+) ([^ ]+) \[([^\]]+)\] \"([^ ]+) ([^ ]+) ([^ ]+)\" ([^ ]+) ([^ ]+) ([^ ]+) ([^ ]+) \"([^"]*)\" \"([^"]*)\" \"([^"]*)\"/)
      keyValue.delete_at(0)
			keyAry = ["ip", "aidentiti", "user_name", 'time', 'request_method', 'request_uri', 'http_version', 'http_status', 'content_size', 'response_time', 'file_name', 'referrer', 'user_agent', 'remote_ip']
			ary = [keyAry,keyValue].transpose
			h = Hash[*ary.flatten]
      yield Fluent::EventTime.now, h
    end
  end
end