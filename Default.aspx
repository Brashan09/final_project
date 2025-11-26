<%@ Page Language="C#" AutoEventWireup="true" ResponseEncoding="utf-8" %>

    <!DOCTYPE html>
    <html lang="es">

    <head runat="server">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Algoritmos Shor y Grover | Computación Cuántica</title>
        <!-- Tech-Quantum Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;500;700&family=Share+Tech+Mono&display=swap"
            rel="stylesheet">
        <link rel="stylesheet" href="css/style.css">
    </head>

    <body>
        <form id="form1" runat="server">

            <!-- Tech Background Canvas -->
            <canvas id="tech-bg"></canvas>

            <!-- Hero Section -->
            <header class="hero">
                <div class="hero-content">
                    <h1 class="gsap-hero-title">Algoritmos Shor y Grover</h1>
                    <p class="gsap-hero-subtitle">Una inmersión profunda en la supremacía cuántica</p>
                    <a href="#presenters" class="btn-scroll gsap-hero-btn">Comenzar Presentación</a>
                </div>
            </header>

            <!-- Presenters Section -->
            <section id="presenters" class="reveal">
                <h2 class="section-title">Presentadores</h2>
                <div class="presenters-grid">
                    <div class="presenter-card gsap-card">
                        <h3>Brayan Quintero</h3>
                        <p>Desarrollador Full Stack</p>
                    </div>
                    <div class="presenter-card gsap-card">
                        <h3>Eddie Man</h3>
                        <p>Desarrollador Full Stack</p>
                    </div>
                    <div class="presenter-card gsap-card">
                        <h3>Eliecias Cubilla</h3>
                        <p>Desarrollador Full Stack</p>
                    </div>
                    <div class="presenter-card gsap-card">
                        <h3>Harold Morales</h3>
                        <p>Desarrollador Full Stack</p>
                    </div>
                    <div class="presenter-card gsap-card">
                        <h3>Carlos Miranda</h3>
                        <p>Desarrollador Full Stack</p>
                    </div>
                </div>
            </section>

            <!-- Shor's Algorithm Section -->
            <section id="shor" class="reveal">
                <h2 class="section-title">Algoritmo de Shor</h2>
                <div class="algo-content">
                    <div class="algo-text">
                        <p>El algoritmo de Shor, desarrollado por Peter Shor en 1994, es un algoritmo cuántico para la
                            factorización de enteros. Resuelve el problema de descomponer un número compuesto N en sus
                            factores primos.</p>

                        <h3>Características Clave</h3>
                        <ul>
                            <li><strong>Propósito:</strong> Factorización de grandes números enteros.</li>
                            <li><strong>Impacto:</strong> Rompe la criptografía RSA, base de la seguridad en internet
                                actual.</li>
                            <li><strong>Complejidad:</strong> O((log N)³), polinómica en el número de bits.</li>
                            <li><strong>Componente Principal:</strong> Transformada Cuántica de Fourier (QFT).</li>
                        </ul>

                        <h3>Cómo Funciona</h3>
                        <ol style="margin-left: 20px; color: #ccc;">
                            <li>Se elige un número aleatorio 'a' menor que N.</li>
                            <li>Se encuentra el periodo 'r' de la función f(x) = a^x mod N usando la QFT.</li>
                            <li>Si 'r' es par, se pueden encontrar los factores de N.</li>
                        </ol>
                    </div>
                    <div class="algo-visual">
                        <pre>
Input: N (Entero compuesto)
|0> ---[ H ]---[ a^x mod N ]---[ QFT ]--- Measure
|0> ---[ H ]---[     |     ]---[     ]
...
|1> -----------------|
Output: Factores Primos (p, q)
                    </pre>
                    </div>
                </div>
            </section>

            <!-- Grover's Algorithm Section -->
            <section id="grover" class="reveal">
                <h2 class="section-title">Algoritmo de Grover</h2>
                <div class="algo-content">
                    <div class="algo-visual">
                        <pre>
Input: Lista desordenada de N elementos
|s> = H|0> (Superposición uniforme)

Repeat O(√N) times:
    1. Oracle (Marca la solución)
    2. Diffusion (Amplifica amplitud)

Measure: Solución con alta probabilidad
                    </pre>
                    </div>
                    <div class="algo-text">
                        <p>El algoritmo de Grover, ideado por Lov Grover en 1996, proporciona una aceleración cuadrática
                            para la búsqueda en bases de datos no estructuradas.</p>

                        <h3>Características Clave</h3>
                        <ul>
                            <li><strong>Propósito:</strong> Búsqueda en listas desordenadas.</li>
                            <li><strong>Speedup:</strong> Cuadrático. De O(N) clásico a O(√N) cuántico.</li>
                            <li><strong>Aplicaciones:</strong> Optimización, resolución de problemas NP-completos,
                                criptoanálisis (AES).</li>
                            <li><strong>Mecanismo:</strong> Amplificación de Amplitud.</li>
                        </ul>

                        <h3>El Oráculo</h3>
                        <p>Una función "caja negra" que reconoce la solución correcta invirtiendo su fase, permitiendo
                            que el operador de difusión aumente la probabilidad de medir ese estado.</p>
                    </div>
                </div>
            </section>

            <!-- Comparison Section -->
            <section id="comparison" class="reveal">
                <h2 class="section-title">Comparación Técnica</h2>
                <table class="comparison-table">
                    <thead>
                        <tr>
                            <th>Característica</th>
                            <th>Algoritmo de Shor</th>
                            <th>Algoritmo de Grover</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Problema</td>
                            <td>Factorización de Enteros / Logaritmo Discreto</td>
                            <td>Búsqueda no estructurada</td>
                        </tr>
                        <tr>
                            <td>Complejidad Clásica</td>
                            <td>Exponencial (Criba general del cuerpo de números)</td>
                            <td>O(N) (Búsqueda lineal)</td>
                        </tr>
                        <tr>
                            <td>Complejidad Cuántica</td>
                            <td>Polinómica O((log N)³)</td>
                            <td>Raíz Cuadrada O(√N)</td>
                        </tr>
                        <tr>
                            <td>Tipo de Aceleración</td>
                            <td>Exponencial (Superpolinómica)</td>
                            <td>Cuadrática</td>
                        </tr>
                        <tr>
                            <td>Amenaza Criptográfica</td>
                            <td>RSA, ECC (Clave Pública)</td>
                            <td>AES, SHA (Clave Simétrica - reduce bits efectivos a la mitad)</td>
                        </tr>
                    </tbody>
                </table>
            </section>

            <section id="conclusion" class="reveal">
                <h2 class="section-title">Conclusiones Clave</h2>
                <div class="conclusion-grid">
                    <div class="conclusion-point gsap-concl-point">
                        <h3>Dominio Exponencial</h3>
                        <p>Shor destruye los esquemas de criptografía de clave pública actuales (RSA, ECC), redefiniendo
                            la seguridad digital.</p>
                    </div>
                    <div class="conclusion-point gsap-concl-point">
                        <h3>Aceleración Práctica</h3>
                        <p>Grover ofrece una aceleración cuadrática para problemas de optimización y búsqueda, con
                            impacto en IA y ML.</p>
                    </div>
                    <div class="conclusion-point gsap-concl-point">
                        <h3>El Futuro del Cómputo</h3>
                        <p>Ambos algoritmos demuestran la promesa de la supremacía cuántica, impulsando la era de la
                            computación post-cuántica.</p>
                    </div>
                </div>
            </section>

            <footer>
                <p>&copy; 2025 Conferencia de Computación Cuántica. Todos los derechos reservados.</p>
                <p>Diseñado por Los5Furiosos</p>
            </footer>

        </form>

        <!-- GSAP Scripts -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/ScrollTrigger.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/ScrollToPlugin.min.js"></script>
        <script src="js/script.js"></script>
    </body>

    </html>