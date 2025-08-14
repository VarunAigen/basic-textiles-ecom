document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll(".view-more-btn").forEach(button => {
        button.addEventListener("click", function (event) {
            event.preventDefault();

            const title = this.getAttribute("data-title");
            const description = this.getAttribute("data-description");
            const image = this.getAttribute("data-image");
            const price = this.getAttribute("data-price");
            // Update modal content
            document.getElementById("product-title").textContent = title;
            document.getElementById("product-image").src = image;
            document.getElementById("product-description").textContent = description;
            document.getElementById("product-price").textContent = price;

            // Display the modal
            document.getElementById("product-details").style.display = "flex";
        });
    });

    // Close the modal when the close button is clicked
    document.querySelector(".close-btn").addEventListener("click", function () {
        document.getElementById("product-details").style.display = "none";
    });

    // Close the modal if the user clicks outside of the modal content
    window.onclick = function (event) {
        if (event.target == document.getElementById("product-details")) {
            document.getElementById("product-details").style.display = "none";
        }
    };
});
