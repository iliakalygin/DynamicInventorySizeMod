data.raw["gui-style"]["default"]["property-table"] = {
    type = "table_style",
    wide_as_column_count = true,
    margin = 8,
    column_alignments = {
        { -- property
            column = 1,
            alignment = "right",
        },
        { -- input
            column = 2,
            alignment = "center",
        },
    },
}

data.raw["gui-style"]["default"]["mod-description"] = {
    type = "label_style",
    single_line = false,
    maximal_width = 300,
    margin = 8,
}