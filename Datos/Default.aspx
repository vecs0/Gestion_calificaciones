<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Datos._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .landing { max-width: 1080px; margin: 0 auto; padding: 48px 16px 64px; color: var(--text); }
        .landing-tag { color: var(--amber); font-weight: 700; letter-spacing: .12em; text-transform: uppercase; font-size: .8rem; }
        .landing-title { font-size: clamp(2rem, 5vw, 3.2rem); font-weight: 800; line-height: 1.1; margin: 12px 0 16px; }
        .landing-title span { color: var(--amber); }
        .landing-lead { color: var(--text2); font-size: 1.1rem; max-width: 60ch; margin-bottom: 28px; }
        .landing-actions { display: flex; flex-wrap: wrap; gap: 12px; margin-bottom: 48px; }
        .btn-landing { display: inline-flex; align-items: center; gap: 8px; padding: 12px 22px; border-radius: 10px; font-weight: 700; text-decoration: none; transition: transform .15s ease, background .15s ease; }
        .btn-landing:hover { transform: translateY(-2px); }
        .btn-landing.primary { background: var(--amber); color: #111; }
        .btn-landing.primary:hover { background: var(--amber2); color: #111; }
        .btn-landing.ghost { border: 1px solid var(--border2); color: var(--text); }
        .btn-landing.ghost:hover { background: var(--bg3); color: var(--text); }
        .landing-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(230px, 1fr)); gap: 16px; }
        .landing-card { background: var(--bg2); border: 1px solid var(--border); border-radius: 14px; padding: 20px; }
        .landing-card h2 { font-size: 1rem; font-weight: 700; margin: 10px 0 6px; }
        .landing-card p { color: var(--text2); font-size: .92rem; margin: 0; }
        .landing-icon { width: 38px; height: 38px; border-radius: 10px; display: grid; place-items: center; font-size: 1.1rem; }
        .landing-icon.amber { background: var(--amber-glow); color: var(--amber); }
        .landing-icon.teal { background: var(--teal-glow); color: var(--teal); }
        .landing-icon.red { background: var(--red-glow); color: var(--red); }
        .landing-icon.blue { background: rgba(74,158,255,.12); color: var(--blue); }
        .landing-note { margin-top: 32px; color: var(--text3); font-size: .85rem; }
    </style>

    <section class="landing" aria-labelledby="landingTitle">
        <div class="landing-tag">Gestión académica · ASP.NET Web Forms</div>
        <h1 id="landingTitle" class="landing-title">Sistema de <span>Calificaciones</span> Académicas</h1>
        <p class="landing-lead">
            Cargá estudiantes y sus notas por materia, obtené totales y promedios automáticos,
            revisá la distribución del curso y exportá todo a Excel, CSV o JSON.
        </p>

        <div class="landing-actions">
            <a class="btn-landing primary" runat="server" href="~/Calificaciones">Abrir el sistema →</a>
            <a class="btn-landing ghost" runat="server" href="~/About">Ver documentación</a>
        </div>

        <div class="landing-grid">
            <article class="landing-card">
                <div class="landing-icon amber">∑</div>
                <h2>Cálculo automático</h2>
                <p>Parciales (0–20), TP (0–10) y examen final (0–50): total, promedio y nota en letra al instante.</p>
            </article>
            <article class="landing-card">
                <div class="landing-icon teal">▦</div>
                <h2>Estadísticas del curso</h2>
                <p>Promedio general, mejor calificación y distribución de promedios por rango.</p>
            </article>
            <article class="landing-card">
                <div class="landing-icon red">◉</div>
                <h2>Auditoría</h2>
                <p>Cada alta, edición y baja queda registrada con fecha, alumno y detalle del cambio.</p>
            </article>
            <article class="landing-card">
                <div class="landing-icon blue">⬇</div>
                <h2>Exportar e importar</h2>
                <p>Descarga en Excel o CSV, importación de planillas y respaldo completo de la sesión en JSON.</p>
            </article>
        </div>

        <p class="landing-note">
            5 materias · Validación de duplicados por matrícula + materia · Vista de impresión · Localizado para es-AR.
        </p>
    </section>
</asp:Content>
