$(document).ready(function () {

    var generate_collapse = function(item) {
        html = "";
        if (Object.keys(item).length === 0) {
            html += '<li  class = "divider"  tabindex = "-1"></li>';
        }
        else {
            html += '<li ' + ((item.active !== undefined) ? "active" : "") + '>' +
                '<a class="collapsible-header" ' + ((item.target !== undefined) ? 'href="#' + item.target + '"' : "") + '>' +
                  ((item.header !== undefined) ? item.header : "") +
                  ((item.icon !== undefined) ? '<i class="material-icons">' + item.icon + '</i>' : "") +
                  ((item.name !== undefined) ? item.name : "") +
                  ((item.badge !== undefined) ? '<span class="badge">' + item.badge + '</span>' : "") +
                '</a>' +
                ((item.content !== undefined) ? '<div class = "collapsible-body">' + item.content + '</div>' : "") +
            '</li>';
        }
        return html;
    };


    function initmaterializeCollapsible(callback) {
        $('.collapsible').collapsible();
        callback();
    }

    initmaterializeCollapsible(function () {

        var materializeCollapsible = new Shiny.InputBinding();
        $.extend(materializeCollapsible, {
            find: function (scope) {
                return $(scope).find(".materialize-collapsible");
            },
            getValue: function (el) {
                return $(el).val();
            },
             getState: function(el, data) {
              return { value: this.getValue(el) };
            },
            subscribe: function (el, callback) {
                $(el).on("change.materialize-collapsible", function (e) {
                    callback();
                });
            },
            unsubscribe: function (el) {
                $(el).destroy();
            },
            receiveMessage: function(el, data) {
              var $el = $(el);
              if (data.cllist !== undefined) {
                $el.find('li').remove();
                $.each(data.cllist, function(index, item) {
                  $el.append(generate_collapse(item));
                });
                $el.change();
              }
            }
        });

        Shiny.inputBindings.register(materializeCollapsible, "materialize.collapsible");
    });
});
