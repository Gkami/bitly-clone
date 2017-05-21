$(document).ready(function(){
    // $(".disappear").click(function(){
    //     $(this).hide();
    // });

//     $( "#target" ).submit(function( event ) {
//   alert( "Handler for .submit() called." );
//   event.preventDefault();
// 		});

// });

// $(document).ready(function(){
	$('form').submit(function(event) {
		// $('shorten-input').on('paste',function(){
		event.preventDefault();  //this will prevent from going back to reload the whole page
		genLink($(this).serialize());
		
		// $.ajax({  //you get the data from url.rb
		// 	url: '/:short_url',
		// 	method: 'get',
		// 	data: $(this).serialize(), //it takes the data 
		// 	dataType: 'json',            //it will changed to json
		// 	success: function(data) {

					// var resultStr; // need a var to store as data will be executed one by one
    	// 		$.each(data, function(index, value) {
    	// 			resultStr += 
    	// 			"<tr>" +
		   //      		"<td>" + data[index].long_url + "</td>" +
		   //      		"<td><a href='" + data[index].short_url + "' target='_blank'>" + "http://bit.ly/" + data[index].short_url + "</td>" +
		   //      		"<td>" + data[index].count_click + "</td>" +
	    //     		"</tr>"
 //        		})

 //    			$('.initial-table').html(resultStr); //result will be displayed in the table
	// 		}
	// 	})

	})

})

function onPasteLink(){
	var url = event.clipboardData.getData('text')
	genLink({long_url: url})
}

function genLink(formdata){
		console.log('genlink')
		$.ajax({  //you get the data from url.rb
			url: '/urls',
			method: 'post',
			data: formdata, //it takes the data 
			dataType: 'json',            //it will changed to json
			success: function(data) {

					var resultStr; // need a var to store as data will be executed one by one
    			$.each(data, function(index, value) {
    				resultStr += 
    				"<tr>" +
		        		"<td>" + data[index].long_url + "</td>" +
		        		"<td><a href='" + data[index].short_url + "' target='_blank'>" + "http://bit.ly/" + data[index].short_url + "</a>" + "</td>" +
		        		"<td>" + data[index].count_click + "</td>" +
	        		"</tr>"
        		})
    			$('.initial-table').html(resultStr); //result will be displayed in the table
					$($('.initial-table')[0].children[0]).effect("highlight", {color:"red"}, 3000) //need to add $ so that it will recognize it as jQuery (else it will return effect no function)
					//$('.initial-table tr:nth-child(2)').effect("highlight", {color:"red"}, 3000) // you dont need $ as it will take the css code - nth child
			}

		})
		}

