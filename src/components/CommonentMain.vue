<template>
    <div class="comment-section">
        <div class="comment-box">
            <div class="comment-form">
                <input v-model="newComment" placeholder="添加新评论...">
                <button @click="addComment">添加</button>
            </div>
            <div class="comment-list">
                <div v-for="(comment, index) in comments" :key="index" class="comment">
                    <div class="comment-text">{{ comment }}</div>
                    <div class="comment-actions">
                        <button @click="likeComment(index)">{{ likedComments.includes(index) ? '取消点赞' : '点赞' }}</button>
                        <span class="like-count">{{ likeCount[index] }}</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
  
<script>
export default {
    data() {
        return {
            newComment: '',
            comments: [],
            likedComments: [],
            likeCount: [],
        }
    },
    methods: {
        addComment() {
            if (this.newComment.trim()) {
                this.comments.push(this.newComment);
                this.likeCount.push(0);
                this.newComment = '';
            }
        },
        likeComment(index) {
            if (this.likedComments.includes(index)) {
                this.likedComments.splice(this.likedComments.indexOf(index), 1);
                this.likeCount[index]--;
            } else {
                this.likedComments.push(index);
                this.likeCount[index]++;
            }
        }
    }
}
</script>
  
<style>
.comment-section {
    font-family: Arial, sans-serif;
}

.comment-box {
    border: 1px solid #ccc;
    border-radius: 5px;
    padding: 10px;
}

.comment-form {
    display: flex;
    margin-bottom: 10px;
}

.comment-form input {
    flex: 1;
    border-radius: 5px;
    border: 1px solid #ccc;
    padding: 5px;
    margin-right: 10px;
}

.comment-form button {
    border: none;
    border-radius: 5px;
    background-color: #ccc;
    color: #fff;
    padding: 5px 10px;
    cursor: pointer;
}

.comment {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 10px;
    padding: 10px;
    background-color: #f5f5f5;
    border-radius: 5px;
}

.comment-text {
    flex: 1;
}

.comment-actions {
    display: flex;
    align-items: center;
}

.comment-actions button {
    border: none;
    background-color: transparent;
    color: #007bff;
    cursor: pointer;
}

.like-count {
    margin-left: 10px;
}</style>
  

