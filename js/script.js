document.addEventListener('DOMContentLoaded', () => {

    // 1. REGISTRAR PLUGINS DE GSAP
    gsap.registerPlugin(ScrollTrigger);
    if (window.ScrollToPlugin) {
        gsap.registerPlugin(ScrollToPlugin);
    }

    // --- Tech Background Animation (Canvas) ---
    const canvas = document.getElementById('tech-bg');
    if (canvas) {
        const ctx = canvas.getContext('2d');
        let width, height;
        let particles = [];

        const initCanvas = () => {
            width = window.innerWidth;
            height = window.innerHeight;
            canvas.width = width;
            canvas.height = height;
            createParticles();
        };

        const createParticles = () => {
            particles = [];
            const count = Math.floor(width * height / 15000); // Density
            for (let i = 0; i < count; i++) {
                particles.push({
                    x: Math.random() * width,
                    y: Math.random() * height,
                    vx: (Math.random() - 0.5) * 0.5,
                    vy: (Math.random() - 0.5) * 0.5,
                    size: Math.random() * 2 + 1
                });
            }
        };

        const draw = () => {
            ctx.clearRect(0, 0, width, height);
            ctx.fillStyle = '#66fcf1';
            ctx.strokeStyle = 'rgba(69, 162, 158, 0.15)';

            for (let i = 0; i < particles.length; i++) {
                let p = particles[i];

                // Move
                p.x += p.vx;
                p.y += p.vy;

                // Bounce
                if (p.x < 0 || p.x > width) p.vx *= -1;
                if (p.y < 0 || p.y > height) p.vy *= -1;

                // Draw Point
                ctx.beginPath();
                ctx.arc(p.x, p.y, p.size, 0, Math.PI * 2);
                ctx.fill();

                // Draw Connections
                for (let j = i + 1; j < particles.length; j++) {
                    let p2 = particles[j];
                    let dx = p.x - p2.x;
                    let dy = p.y - p2.y;
                    let dist = Math.sqrt(dx * dx + dy * dy);

                    if (dist < 120) {
                        ctx.beginPath();
                        ctx.moveTo(p.x, p.y);
                        ctx.lineTo(p2.x, p2.y);
                        ctx.stroke();
                    }
                }
            }
            requestAnimationFrame(draw);
        };

        window.addEventListener('resize', initCanvas);
        initCanvas();
        draw();
    }


    // --- GSAP Animations ---

    // Hero
    const heroTimeline = gsap.timeline({ defaults: { duration: 0.8, ease: "power3.out" } });
    heroTimeline
        .fromTo('.gsap-hero-title', { opacity: 0, y: 50, letterSpacing: '10px' }, { opacity: 1, y: 0, letterSpacing: '2px', duration: 1.2 }, 0)
        .fromTo('.gsap-hero-subtitle', { opacity: 0, x: -50 }, { opacity: 1, x: 0 }, 0.3)
        .fromTo('.gsap-hero-btn', { opacity: 0, scale: 0.8 }, { opacity: 1, scale: 1 }, 0.5);

    // Sections Reveal
    gsap.utils.toArray('.reveal').forEach((section) => {
        gsap.fromTo(section,
            { y: 50, opacity: 0 },
            {
                y: 0,
                opacity: 1,
                duration: 1,
                scrollTrigger: {
                    trigger: section,
                    start: 'top 85%',
                    toggleActions: 'play none none reverse',
                }
            }
        );
    });

    // Cards Stagger (Presenters)
    // We use fromTo to ensure they start hidden and then animate in
    gsap.fromTo('.gsap-card',
        { opacity: 0, y: 50 },
        {
            opacity: 1,
            y: 0,
            duration: 0.6,
            stagger: 0.15, // Stagger delay between cards
            ease: "back.out(1.7)",
            scrollTrigger: {
                trigger: '.presenters-grid',
                start: 'top 80%',
                toggleActions: 'play none none reverse'
            }
        }
    );

    // Smooth Scroll
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (gsap.plugins.scrollTo) {
                gsap.to(window, { duration: 1, scrollTo: { y: target, offsetY: 50 }, ease: 'power4.inOut' });
            } else {
                target.scrollIntoView({ behavior: 'smooth' });
            }
        });
    });
});
