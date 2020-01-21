# -*- encoding : utf-8 -*-
require 'mechanize'

class Scraping 
  
  
=begin  
  def self.wantedly
    agent = Mechanize.new
    wantedly_links = []
    
    # それぞれのページから詳細へのリンクを取得
    for i in 1..101 do
      current_page = agent.get("https://jp.wantedly.com/projects?type=mixed&page=#{i}&hiring_types%5B%5D=internship&keywords%5B%5D=%E5%A%4%A7%E9%98%AA")
      elements = current_page.search(".projects-index-list article")
      elements.each do |ele|
        wantedly_links << ele.get_attribute('data-project-id')
      end
    end 
     
    # get_wantedly_projectsを実行
    wantedly_links.each do |link|
      get_wantedly_projects('https://www.wantedly.com/projects/' + link)
    end 
  end
  
  # 取得したリンクからインターンの詳細をスクレイピングで入手し、データベースへ保存
  def self.get_wantedly_projects(link)
    agent = Mechanize.new
    page = agent.get(link)
    
    name = page.at('.project-title').inner_text if page.at('.project-title')
    # content = page.at('.js-descriptions p').inner_text if page.at('.js-descriptions')
    company = page.at('.company-name a').inner_text if page.at('.company-name')
    companyLogo = page.at('.company-logo span img')[:src] if page.at(".company-logo")
    location = page.at('.company-description').inner_text if page.at('.company-description')
    image = page.at('.cover-image img')[:src] if page.at(".cover-image")
    
    internship = Internship.where(title: name).first_or_initialize
    # internship.content = content
    internship.company = company
    internship.companyLogo = companyLogo
    internship.location = location
    internship.url = link
    internship.image = image
    internship.save
  end 
=end
  
  
  def self.infra
    agent = Mechanize.new
    infra_links = []
    
    # それぞれのページから詳細へのリンクを取得(1ページのみ)
    
    # for i in 1..2 do
      current_page = agent.get("https://www.in-fra.jp/intern-list?area%5B%5D=9&order=recommended")
      elements = current_page.search(".interns-pc-card-content .intern-title a")
      elements.each do |ele|
        infra_links << ele.get_attribute('href')
      end 
    # end 
    
    # get_infra_projectsを実行
    infra_links.each do |link|
      get_infra_projects('https://www.in-fra.jp' + link)
    end 
  end
  
  # 取得したリンクからインターンの詳細をスクレイピングで入手し、データベースへ保存
  def self.get_infra_projects(link)
    agent = Mechanize.new
    page = agent.get(link)
    
    name = page.at('.intern-detail-mv-title-text').inner_text if page.at('.intern-detail-mv-title-text')
    company = page.at('.intern-detail-desc-name a').inner_text if page.at('.intern-detail-desc-name')
    companyLogo = page.at(".intern-detail-desc-logo img").get_attribute("data-src")
    image = page.at(".intern-detail .intern-detail-mv img").get_attribute("data-src")
    location = page.at(".intern-detail-desc-ward span").inner_text

    internship = Internship.where(title: name).first_or_initialize
    internship.company = company
    internship.companyLogo = companyLogo
    internship.location = location
    internship.url = link
    internship.image = image
    internship.save
  end
  
  
  
  def self.zero_one_intern
    agent = Mechanize.new
    zero_one_intern_links = []
    
    # それぞれのページから詳細�����のリンクを取得
    for i in 1..5 do
      current_page = agent.get("https://01intern.com/job/list.html?page=#{i}&areas=27")
      elements = current_page.search(".m-joblist-btn_detail")
      elements.each do |ele|
        zero_one_intern_links << ele.get_attribute('href')
      end 
    end 
    
    # get_wantedly_projectsを実行
    zero_one_intern_links.each do |link|
      get_zero_one_intern_projects('https://01intern.com' + link)
    end 
  end
  
  # 取得したリンクからインターンの詳細をスクレイピングで入手し、データベースへ保存
  def self.get_zero_one_intern_projects(link)
    agent = Mechanize.new
    page = agent.get(link)
    
    name = page.at('.l-job-title h2').inner_text if page.at('.l-job-title')
    company = page.at('.m-job-titleName').inner_text if page.at('.m-job-imgBox img')
    image = page.at(".l-job-imgBox img")[:src] if page.at(".l-job-imgBox img")
    location = page.at(".l-job-requirements dl:nth-child(7) dd")

    internship = Internship.where(title: name).first_or_initialize
    internship.company = company
    internship.image = image
    internship.url = link
    internship.save
  end
  
  
  
  def self.careerbaito
    agent = Mechanize.new
    careerbaito_links = []
    
    # それぞれのページから詳細�����のリンクを取得
    for i in 1..3 do
      current_page = agent.get("https://careerbaito.com/search/43?page=#{i}")
      elements = current_page.search(".informClick")
      elements.each do |ele|
        careerbaito_links << ele.get_attribute('href')
      end 
    end 
    
    # get_wantedly_projectsを実行
    careerbaito_links.each do |link|
      get_careerbaito_projects('https://careerbaito.com' + link)
    end 
  end
  
  # 取得したリンクからインターンの詳細をスクレイピングで入手し、データベースへ保存
 # def self.get_careerbaito_projects(link)
 #   agent = Mechanize.new
 #   page = agent.get(link)
 #   
 #   name = page.at('.jobView_top_box_ttl').inner_text if page.at('.jobView_top_box_ttl')
 #   company = page.at('.jobView_top_ttl_name span').inner_text if page.at('.jobView_top_ttl_name')
 #   image = page.at(".jobView_top_img_cut img")[:src]
 #   location = page.at(".jobView_top_box_detail_item_area span span").inner_text
 #   companyLogo = page.at(".jobView_top_ttl_logo img")[:src]
 #   
 #   internship = Internship.where(title: name).first_or_initialize
 #   internship.company = company
 #   internship.image = image
 #   internship.location = location
 #   internship.companyLogo = companyLogo
 #   internship.url = link
 #   internship.save
 # end
  
  
  
  # def self.jeek
  #   agent = Mechanize.new
  #   jeek_links = []
    
  #   # それぞれのページから詳細へのリンクを取得
 
  #   current_page = agent.get("https://jeek.jp/article?prefecture_ids%5B%5D=27")
  #   elements = current_page.search(".article-image a")
  #   elements.each do |ele|
  #     jeek_links << ele.get_attribute('href')
  #   end 

    
  #   # get_wantedly_projectsを実行
  #   jeek_links.each do |link|
  #     get_jeek_projects('https://jeek.jp' + link)
  #   end 
  # end
  
  # # 取得したリンクからインターンの詳細をスクレイピングで入手し、データベースへ保存
  # def self.get_jeek_projects(link)
  #   agent = Mechanize.new
  #   page = agent.get(link)
    
  #   name = page.at('.contentsMainTitle h1').inner_text if page.at('.contentsMainTitle')
  #   company = page.at('#mainHeaderTitle').inner_text if page.at('#mainHeaderTitle')
    
  #   internship = Internship.where(name: name).first_or_initialize
  #   internship.company = company
  #   internship.save
  # end
end 

# リンクコラムの作成
# linkをリンクコラムに代入して保存


# このクラスはどう実行すればいいのか。
# 更新頻度はどのくらいなのか
# どの詳細をデータベースに保存するのか

# カテゴリ保存
# カテゴリのテーブル作成
# カテゴリを同時にスクレイピングで取得
# カテゴリが存在しなければ新しく作成
# カテゴリと紐づけてインターン詳細を同時に保存

#Scraping.careerbaito
Scraping.infra
Scraping.zero_one_intern
  
  
