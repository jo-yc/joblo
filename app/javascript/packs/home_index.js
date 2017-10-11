import Vue from 'vue/dist/vue.min'
import VueResource from 'vue-resource/dist/vue-resource.min'

Vue.use(VueResource)

Vue.component('home-index-page', {
  template: '#home-index-page',
  data: () => {
    return {
      posts: [],
      currentPage: Number,
      totalPages: Number,
      nextPage: Number,
      prevPage: Number,
      search_keyword: '',
    }
  },
  watch: {
    search_keyword: function(val){
      this.search_posts()
    }
  },
  props: [],
  computed: {
    index_url: function() {
      return '/api/blog/home'
    },
  },
  mounted: function() {
    let that = this
    Vue.http.get(this.index_url).then(function(response){
      that.totalPages  = response.body.meta.pages_info.total_pages
      that.currentPage = response.body.meta.pages_info.current_page
      that.nextPage    = response.body.meta.pages_info.next_page
      that.prevPage    = response.body.meta.pages_info.prev_page
      that.posts       = response.body.posts
    })
  },
  methods: {
    paginate: function(page){
      let that = this
      Vue.http.get(this.index_url, {params: {page: page, q: {title_or_body_cont: this.search_keyword}}}).then(function(response){
        that.posts       = response.body.posts
        that.totalPages  = response.body.meta.pages_info.total_pages
        that.currentPage = response.body.meta.pages_info.current_page
        that.nextPage    = response.body.meta.pages_info.next_page
        that.prevPage    = response.body.meta.pages_info.prev_page
      })
    },
    search_posts: function(){
      let that = this
      Vue.http.get(this.index_url, {params: {q: {title_or_body_cont: this.search_keyword}}}).then(function(response){
        that.posts       = response.body.posts
        that.totalPages  = response.body.meta.pages_info.total_pages
        that.currentPage = response.body.meta.pages_info.current_page
        that.nextPage    = response.body.meta.pages_info.next_page
        that.prevPage    = response.body.meta.pages_info.prev_page
      })
    },
  }
})

new Vue({
  el: '#home-index',
})
