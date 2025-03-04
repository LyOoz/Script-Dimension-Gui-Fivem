
var setting1 = true, setting2 = true, setting3 = true, setting4 = true , setting5 = true ,setting6 = true;
var select1 = true, select2 = true, select3 = true, select4 = true , select5 = true , select6 = true;

window.addEventListener('message', function (event) {
    switch (event.data.action) {
        case 'openUi':
            $('#display1').fadeIn(200);
            if (event.data.dimension !== undefined) {
                if (event.data.dimension === 0) {
                    $('#chaaaa').text('CH: Chanel หลัก');
                } else {
                    $('#chaaaa').text('CH: ' + event.data.dimension);
                }
            }
            break;
        case 'openUi1':
            $('#display').fadeIn(200);
            break;
        case 'closeui':
            $('#display').fadeOut(100);
            break;
        case 'closeui2':
            $('#display1').fadeOut(100);
            break;
        case 'updateDimension': 
            if (event.data.dimension === 0) {
                $('#chaaaa').text('CH: Chanel หลัก');
            } else {
                $('#chaaaa').text('CH: ' + event.data.dimension);
            }
            break;
    }
});

window.addEventListener('message', function (event) {
    switch (event.data.action) {
        case 'openUi1':

        $('#display').fadeIn(200);
    }

    $('#framjoin1').on('click', function(){
        if(setting1) {
            setting1 = false
            if (select1) {
                select1 = false
                $.post('https://Kim_Dimension/action', JSON.stringify({
                    action: 'framjoin1',
                }));
                setTimeout(function(){
                    setting1 = true
                    select1 = true
                }, 0);
            } else {
                setting1 = true

            }
        }
    });
    $('#framjoin2').on('click', function(){
        if(setting2) {
            setting2 = false
            if (select2) {
                select2 = false
                $.post('https://Kim_Dimension/action', JSON.stringify({
                    action: 'framjoin2',
                }));
                setTimeout(function(){
                    setting2 = true
                    select2 = true
                }, 0);
            } else {
                select2 = true

            }
        }
    });
    $('#framjoin3').on('click', function(){
        if(setting3) {
            setting3 = false
            if (select3) {
                select3 = false
                $.post('https://Kim_Dimension/action', JSON.stringify({
                    action: 'framjoin3',
                }));
                setTimeout(function(){
                    setting3 = true
                    select3 = true
                }, 0);
            } else {
                select3 = true

            }
        }
    });
    $('#framjoin4').on('click', function(){
        if(setting4) {
            setting4 = false
            if (select4) {
                select4 = false
                $.post('https://Kim_Dimension/action', JSON.stringify({
                    action: 'framjoin4',
                }));
                setTimeout(function(){
                    setting4 = true
                    select4 = true
                }, 0);
            } else {
                select4 = true

            }
        }
    });
    $('#framjoin5').on('click', function(){
        if(setting5) {
            setting5 = false
            if (select5) {
                select5 = false
                $.post('https://Kim_Dimension/action', JSON.stringify({
                    action: 'framjoin5',
                }));
                setTimeout(function(){
                    setting5 = true
                    select5 = true
                }, 0);
            } else {
                select5 = true

            }
        }
    });

    $('#framjoin1').hover(
        function () {
          if (select1) {
            $(this).css('background-color', 'rgb(99, 130, 150)');
          }
        },
        function () {
            if (select1) {
              $(this).css('background-color', 'rgb(176, 25, 25)');
            }
          }

    );

    $('#framjoin2').hover(
        function () {
          if (select2) {
            $(this).css('background-color', 'rgb(99, 130, 150)');
          }
        },
        function () {
            if (select2) {
              $(this).css('background-color', 'rgb(176, 25, 25)');
            }
          }

    );
    $('#framjoin3').hover(
        function () {
          if (select3) {
            $(this).css('background-color', 'rgb(99, 130, 150)');
          }
        },
        function () {
            if (select3) {
              $(this).css('background-color', 'rgb(176, 25, 25)');
            }
          }

    );
    $('#framjoin4').hover(
        function () {
          if (select4) {
            $(this).css('background-color', 'rgb(99, 130, 150)');
          }
        },
        function () {
            if (select4) {
              $(this).css('background-color', 'rgb(176, 25, 25)');
            }
          }

    );
    $('#framjoin5').hover(
        function () {
          if (select5) {
            $(this).css('background-color', 'rgb(99, 130, 150)');
          }
        },
        function () {
            if (select5) {
              $(this).css('background-color', 'rgb(176, 25, 25)');
            }
          }

    );


    document.onkeyup = function (data) {
        if (data.which == 27) {
            $('#display').fadeOut(200);
            $.post('https://Kim_Dimension/action', JSON.stringify({
                action: 'close',
            }
            ));
        }
    };
})

window.addEventListener('message', function (event) {
    switch (event.data.action) {
        case 'closeui':
        $('#display').fadeOut(100);
    }
})

window.addEventListener('message', function (event) {
    switch (event.data.action) {
        case 'closeui2':
        $('#display1').fadeOut(100);
    }
})


