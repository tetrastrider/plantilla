/********select style******************************/
            function DropDown(el,ident) {
                this.dd = el;
                this.placeholder = this.dd.children('span');
                this.opts = this.dd.find('ul.dropdown > li');
                this.val = '';
                this.index = 1;
                this.out = ident;
                this.initEvents();
            }
            DropDown.prototype = {
                initEvents : function() {
                    var obj = this;

                    obj.dd.on('click', function(event){
                        $(this).toggleClass('active');
                        return false;
                    });

                    obj.opts.on('click',function(){
                        var opt = $(this);
                        obj.val = opt.text();
                        obj.index = opt.index();
                        obj.placeholder.text(obj.val);
                        $(obj.out).val(obj.val);//mi var
                    });
                },
                getValue : function() {
                    return this.val;
                },
                getIndex : function() {
                    return this.index;
                }
            }

/***************dropdown categorias**************************/
$(function() {
    var dd = new DropDown( $('#dd'),'#result' );
        $(document).click(function() {
                    
            $('.wrapper-dropdown-3').removeClass('active');
        });
});
/**/
$(function() {
    var d2 = new DropDown( $('#d2'),'#result2' );
        $(document).click(function() {
                    
            $('.wrapper-dropdown-3').removeClass('active');
        });
});