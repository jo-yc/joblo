import Vue from 'vue/dist/vue.min'
import VueResource from 'vue-resource/dist/vue-resource.min'
import draggable from 'vuedraggable'

Vue.use(VueResource)

Vue.component('image-sortable', {
  components: {
    draggable,
  },
  template: '#image-sortable',
  data: () => {
    return {
      images: []
    }
  },
  props: ['postId'],
  computed: {
    base_url: function() {
      return '/api/blog/posts/'+this.postId+'/image_sort'
    },
  },
  mounted: function() {
    let that = this
    Vue.http.get(this.base_url).then(function(response){
      that.images = response.body
    })
  },
  methods: {
    imgMovedCallback: function() {
      console.log("newIndex")
      // console.log(oldIndex)
      // console.log(element)
    },
    moved: function(newIndex, oldIndex, element) {
      console.log(newIndex)
      console.log(oldIndex)
      console.log(element)
    },
    onDragEnd(evt) {
      // this.computeIndexes()
      // draggingElement = null
      console.log(evt)
      let that = this
      let sort_url = '/api/blog/posts/'+this.postId+'/image_sort/'+evt.clone.attributes['0'].value+'/sort'
      Vue.http.put(sort_url, {new_index: evt.newIndex+1}).then(function(response){
        that.images = response.body
      })
    }
  }
})

new Vue({
  el: '#post-img',
})
