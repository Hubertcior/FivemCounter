document.addEventListener('DOMContentLoaded', () => {
    const container = document.getElementById('body');
    container.style.display = 'none'; 

    window.addEventListener('message', (event) => {
        const data = event.data;

        if (data.action === 'open') {
            container.style.display = 'block';
            document.getElementById('count').textContent = data.count;
        } else if (data.action === 'close') {
            container.style.display = 'none';
        } else if (data.action === 'update') {
            document.getElementById('count').textContent = data.count;
        }
    });

    document.getElementById('add').addEventListener('click', () => {
        fetch(`https://${GetParentResourceName()}/add`, {
            method: 'POST',
        });
    });

    document.getElementById('close').addEventListener('click', () => {
        fetch(`https://${GetParentResourceName()}/close`, {
            method: 'POST',
        });
    });

    document.addEventListener('keydown', (event) => {
        if (event.code === 'F5') {
            event.preventDefault(); 
            fetch(`https://${GetParentResourceName()}/close`, {
                method: 'POST',
            });
        }
    });

});

