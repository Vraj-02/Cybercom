function addDetails(){
    let adminName=document.getElementById("txtName").value;
    let adminEmail=document.getElementById("registerEmail").value;
    let adminPassword=document.getElementById("registerPassword").value;
    let adminCity=document.getElementById("registerCity").value;
    let adminState=document.getElementById("registerState").value;

    let detail={
        name: adminName,
        email: adminEmail,
        password: adminPassword,
        city: adminCity,
        state: adminState
    };
    let details= sessionStorage.getItem("details");
    details= details ? JSON.parse(details) : [];

    details.push(detail);
    sessionStorage.setItem("details",JSON.stringify(details))
}