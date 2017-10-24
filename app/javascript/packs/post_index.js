import Vue from 'vue/dist/vue.min'
import VueResource from 'vue-resource/dist/vue-resource.min'

Vue.use(VueResource)

Vue.component('post-index-page', {
  template: '#post-index-page',
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
  props: ['category', 'type', 'tagName'],
  computed: {
    index_url: function() {
      return '/api/blog/posts'
    },
    tags_index_url: function() {
      return '/api/blog/posts/tags_index'
    },
  },
  mounted: function() {
    let that = this
    const url = this.type == 'tags' ? this.tags_index_url : this.index_url
    const params = this.type == 'tags' ? {tag_name: this.tagName} : {category: this.category}
    Vue.http.get(url, {params: params}).then(function(response){
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
      Vue.http.get(this.index_url, {params: {category: this.category, page: page, q: {title_or_body_cont: this.search_keyword}}}).then(function(response){
        that.posts       = response.body.posts
        that.totalPages  = response.body.meta.pages_info.total_pages
        that.currentPage = response.body.meta.pages_info.current_page
        that.nextPage    = response.body.meta.pages_info.next_page
        that.prevPage    = response.body.meta.pages_info.prev_page
      })
    },
    search_posts: function(){
      let that = this
      Vue.http.get(this.index_url, {params: {category: this.category, q: {title_or_body_cont: this.search_keyword}}}).then(function(response){
        that.posts       = response.body.posts
        that.totalPages  = response.body.meta.pages_info.total_pages
        that.currentPage = response.body.meta.pages_info.current_page
        that.nextPage    = response.body.meta.pages_info.next_page
        that.prevPage    = response.body.meta.pages_info.prev_page
      })
    },
    tag_path: function(tagName){
      return '/posts/tags/' + tagName
    },
  }
})

new Vue({
  el: '#post-index',
})
