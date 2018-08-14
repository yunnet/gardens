var layTabPlus = {
    _tabs: {},
    _opt: {
        refresh: true,
        lay_filter: null,
        tab_jump: false
    },
    init: function (opt) {
        _this = this;
        if (opt) {
            _this._opt.refresh = opt.refresh || _this._opt.refresh;
            _this._opt.tab_jump = opt.tab_jump || _this._opt.tab_jump;
            _this._opt.lay_filter = opt.lay_filter;
        }
        if (null == this._opt.lay_filter) {
            throw new Error("lay_filter can't be null");
        }
        element.on('tabDelete(' + this._opt.lay_filter + ')', function (data) {
            var tab_id = $(this.parentNode).attr('lay-id');
            delete _this._tabs[tab_id];
        });
        $(".layui-tab-title").on('click', ".layui-icon-refresh", function () {
            var iframe = $("#" + $(this).attr('f_id'))[0];
            iframe.src = iframe.src;
        });
        $('body').on('click', '.layTabPlus', function () {
            _this.addTab(this);
        });
        //css
        document.write('<style>.layui-body{overflow-y: hidden;}.layui-tab{margin: 0;}.layui-tab-title li .layui-icon-refresh:hover{border-radius:2px;background-color:#FF5722;color:#fff}.layui-tab-title li .layui-icon-refresh{position:relative;display:inline-block;width:18px;height:18px;line-height:20px;margin-left:8px;top:1px;text-align:center;font-size:14px;color:#c2c2c2;transition:all .2s;-webkit-transition:all .2s}.layui-tab-title{padding-top:0!important;border-top:5px solid #009688}.layui-tab-title .layui-this:after{border-width:0!important}.noclose i{display:none!important}.layui-tab-title .layui-this{color:#fff;background:#009688}</style>');
    },
    addTab: function (obj, title) {//1直接传dom 2传url和title
        var tab_url = obj;
        var tab_title = title || tab_url;
        var iframe_id = 'ltp_' + Date.now().toString(36);
        if (obj instanceof HTMLElement) {
            var tab_jump = obj.getAttribute('tab_jump');
            if (tab_jump) {
                this._opt.tab_jump = true;
            }
            tab_url = obj.getAttribute('tab_url');
            // tab_title = obj.innerHTML;
            tab_title = obj.innerText;
        }
        if (this._opt.refresh) {
            tab_title += ' <i class="layui-icon layui-icon-refresh" f_id="' + iframe_id + '"></i>';
        }
        if (this._tabs[tab_url] == null) {
            var tab_jump_str = '';
            if (!this._opt.tab_jump) {
                tab_jump_str = 'sandbox="allow-scripts allow-same-origin allow-popups"';
            }
            element.tabAdd(this._opt.lay_filter, {
                title: tab_title,
                content: '<iframe id="' + iframe_id + '" src="' + tab_url + '" style="width:100%;" height="2000" onload="layTabPlus.setIframeHeight(this)" frameborder="0" scrolling="auto" ' + tab_jump_str + '></iframe>', //支持传入html
                id: tab_url
            });
            this._tabs[tab_url] = iframe_id;
        }
        element.tabChange(this._opt.lay_filter, tab_url);
    },
    setIframeHeight: function (iframe) {
        iframe.height = document.documentElement.clientHeight - 150;
    }
};
