from graphviz import Digraph


def escape(s: str) -> str:
    s = s.replace('|\n', '|')
    s = s.replace('{', '\\{')
    s = s.replace('}', '\\}')
    s = s.replace('<', '\\<')
    s = s.replace('>', '\\>')
    s = s.replace('\n', '\\l')
    return s


def escape_format(label):
    return "{{" + escape(label) + "}}"


class EdgeStyles(object):
    dashed_bold_green = {
        "color": "#71cb92",
        "penwidth": "3",
        "style": "dashed"
    }
    dashed_bold_tomato = {
        "color": "#e74c3c",
        "penwidth": "3",
        "style": "dashed"
    }

    dashed_green = {"color": "#71cb92", "style": "dashed"}


class NodeStyles(object):
    black = {
        "style": "filled",
        "fillcolor": "black",
        "fontcolor": "white",
        "shape": "record",
    }
    normal = {"shape": "record", "style": "rounded"}
    light_blue = {
        "shape": "record",
        "style": "rounded,filled",
        "fillcolor": "#48cae4",
        "fontcolor": "#3d4752",
        "color": "#48cae4",
    }
    dark_blue = {
        "fillcolor": "#3d4752",
        "fontcolor": "#dedfe0",
        "color": "#3d4752",
        "shape": "record",
        "style": "rounded,filled",
    }
    blue = {
        "fillcolor": "#1a2c50",
        "fontcolor": "#dedfe0",
        "color": "#d4ddec",
        "shape": "record",
        "style": "rounded,filled",
    }
    light_green = {
        "fillcolor": "#71cb92",
        "fontcolor": "#374052",
        "color": "#71cb92",
        "shape": "record",
        "style": "rounded,filled",
    }
    grass_green = {
        "fillcolor": "#c5eb97",
        "fontcolor": "#374052",
        "color": "#c5eb97",
        "shape": "record",
        "style": "rounded,filled",
    }
    tea_green = {
        "fillcolor": "#01a288",
        "fontcolor": "#f2f8f7",
        "color": "#01a288",
        "shape": "record",
        "style": "rounded,filled",
    }
    light_gray = {
        "fillcolor": "#eeeeee",
        "fontcolor": "#434b54",
        "color": "#eeeeee",
        "shape": "record",
        "style": "rounded,filled",
    }
    little_drak_cycle = {
        "fillcolor": "#3d4752",
        "fontcolor": "#dedfe0",
        "color": "#3d4752",
        "shape": "cycle",
        "style": "filled",
    }
    tomato = {
        "fillcolor": "#e74c3c",
        "fontcolor": "#fef9f9",
        "color": "#e74c3c",
        "shape": "record",
        "style": "rounded,filled",
    }
    orange = {
        "fillcolor": "#e67e22",
        "fontcolor": "#fcf0e5",
        "color": "#e67e22",
        "shape": "record",
        "style": "rounded,filled",
    }
    none = None


class Builder(object):

    def __init__(self, name, format="svg"):
        self.graph = Digraph(
            name="Daemon",
            comment="the test",
            format="svg",
        )

        self.graph.graph_attr.update({
            "rankdir": "LR",
            "newrank": "true",
        })
        self.graph.edge_attr.update({"color": "#55606a"})
        self.node_style = NodeStyles.normal

    def update_graph_attr(self, **attr):
        self.graph.graph_attr.update(attr)

    def set_node_style(self, style):
        self.node_style = style

    def node(self, w, style=None):
        if style is None:
            style = self.node_style
        self.graph.node(w.name, label=escape_format(w.value), **style)

    def snode(self, name, style=None):
        if style is None:
            style = self.node_style
        self.graph.node(name, label=escape_format(name), **style)

    def edge(self, src, dst, **attrs):
        if isinstance(dst, list):
            for d in dst:
                self.graph.edge(src.name, d.name, **attrs)
            return
        self.graph.edge(src.name, dst.name, **attrs)

    def source(self):
        return self.graph.source
