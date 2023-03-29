const storage = {

    save(key:string, value:any) {
        sessionStorage.setItem(key, JSON.stringify(value))
    },

    get(key:string) {
        return JSON.parse(sessionStorage.getItem(key)||'')
    }
}

export default storage;