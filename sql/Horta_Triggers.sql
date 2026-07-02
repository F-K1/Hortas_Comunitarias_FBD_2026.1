-- ==============================================================================
-- 🚀 RECURSOS AVANÇADOS: TRIGGERS, VIEWS E ÍNDICES
-- ==============================================================================

-- ------------------------------------------------------------------------------
-- 1. TRIGGERS (Automação de Estoque)
-- ------------------------------------------------------------------------------
-- Função para abater o estoque de insumos automaticamente
CREATE OR REPLACE FUNCTION baixar_estoque_insumo()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE insumos
    SET quantidade = quantidade - NEW.quantidade
    WHERE id_insumos = NEW.id_insumos;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Gatilho que escuta a tabela 'uso'
CREATE TRIGGER trg_baixar_estoque
AFTER INSERT ON uso
FOR EACH ROW
EXECUTE FUNCTION baixar_estoque_insumo();

-- ------------------------------------------------------------------------------
-- 2. VIEWS (Relatórios Virtuais)
-- ------------------------------------------------------------------------------
-- Relatório consolidado do módulo de cultivo com cálculo de datas
CREATE OR REPLACE VIEW vw_relatorio_cultivo AS
SELECT 
    h.nome AS nome_horta,
    cant.id_canteiro,
    cant.tipo_solo,
    cult.nome_comum AS cultura_plantada,
    cult.quantidade_plantada,
    cult.data_plantio,
    (cult.data_plantio + cult.ciclo_dias) AS data_colheita_prevista
FROM canteiro cant
LEFT JOIN horta h ON cant.id_horta = h.id_horta
LEFT JOIN cultura cult ON cant.id_canteiro = cult.id_canteiro;

-- ------------------------------------------------------------------------------
-- 3. INDEXES (Otimização de Performance)
-- ------------------------------------------------------------------------------
-- Índices para acelerar buscas frequentes no sistema
CREATE INDEX idx_cultura_nome ON cultura(nome_comum);
CREATE INDEX idx_tarefa_status ON tarefa(status);
CREATE INDEX idx_tarefa_usuario_fk ON tarefa(id_usuario);