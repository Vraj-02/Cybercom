function addData(){
    let userName=document.getElementById("txtUserName").value;
    let userEmail=document.getElementById("userEmail").value;
    let userPassword=document.getElementById("userPassword").value;
    let userDob=document.getElementById("userDob").value;

    let data={
        name: userName,
        email: userEmail,
        password: userPassword,
        Dob: userDob
    };
    
    let datas= sessionStorage.getItem("datas");
    datas= datas ? JSON.parse(datas) : [];
    datas.push(data);
    sessionStorage.setItem("datas",JSON.stringify(datas))
}