/* global fetch, moment */

function addComment(event, tripId) {
    event.preventDefault();
    console.log('trigger on submit', event, tripId);
    fetch("/BookingTicketWeb/comment", {
        method: 'post',
        body: JSON.stringify({
            "content": document.getElementById("commentId").value,
            "trip": tripId
        }),
        headers: {
            "Content-Type": "application/json"
        }
    }).then((res) => {
        return res.json();
    }).then(data => {
        console.log(data);


        let area = document.getElementById("commentArea");

        area.innerHTML = `
        
        <div class="be-comment">
            <div class="be-img-comment">	
                    <a href="blog-detail-2.html">
                        <img  src="${data.customerId.avatar}" class="rounded-circle be-ava-comment" />				
                    </a>
                </div>
                <div class="be-comment-content">

                    <span class="be-comment-name" style="margin-bottom: 0px;">
                        <a href="blog-detail-2.html" style="font-size:18px; text-decoration: none">${data.customerId.name}</a>
                    </span>
                    <span class="be-comment-time comment-date" style="font-size:12px; ">
                         Thời gian:
                         ${moment(data.createddate).locale("vi").fromNow()}
                    </span>

                   <p class="be-comment-text" style="font-size:15px; margin-bottom: 30px;">
                        ${data.content}
                    </p>
                </div>
        </div>
       
        ` + area.innerHTML;
        let reset = document.getElementById("commentId");
        reset.value = null;


    });
}

let mybutton = document.getElementById("myBtn");

window.onscroll = function () {
    scrollFunction();
};

function scrollFunction() {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        mybutton.style.display = "block";
    } else {
        mybutton.style.display = "none";
    }
}

function topFunction() {
    document.documentElement.scrollTop = 0;
}

function addRating(event, driverId, tripId) {
    event.preventDefault();
    console.log('trigger on submit', event, driverId, tripId);
    let ratingValue = 0;
    const stars = document.querySelectorAll(".stars i");
    stars.forEach((star, i) => {
        
        if (star.classList.contains('active')) {
            ratingValue = i + 1;
        }
    });
    fetch("/BookingTicketWeb/rating", {
        method: 'POST',
        body: JSON.stringify({
            "stars": ratingValue,
            "driver": driverId

        }),
        headers: {
            "Content-Type": "application/json"
        }
    }).then((res) => {
        return res.json();
    }).then(() => {
        document.location.href = `/BookingTicketWeb/comment/${tripId}`;
    }).catch((error) => {
        const errEle = document.getElementById('error-message');
        errEle.textContent = "Có lỗi xảy ra, vui lòng thử lại lần nữa!!";
        console.error(error);
    });
}

