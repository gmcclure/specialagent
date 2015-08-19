module("Control Panel Testing");

test("Create Page model", function(){
    var page = new Page();
    ok(page, 'Can create a Page model');
});

test("Create PageView view", function(){
    var page = new Page();
    var pageview = new PageView({ model: page });
    ok(pageview, 'Can create a PageView view');
});
