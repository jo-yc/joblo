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
    }
  },
  props: ['category'],
  computed: {
    index_url: function() {
      return '/api/blog/posts'
    },
  },
  mounted: function() {
    let that = this
    Vue.http.get(this.index_url, {params: {category: this.category, page: 1}}).then(function(response){
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
      Vue.http.get(this.index_url, {params: {category: this.category, page: page}}).then(function(response){
        that.posts       = response.body.posts
        that.currentPage = response.body.meta.pages_info.current_page
        that.nextPage    = response.body.meta.pages_info.next_page
        that.prevPage    = response.body.meta.pages_info.prev_page
      })
    },

  }
})

new Vue({
  el: '#post-index',
})
