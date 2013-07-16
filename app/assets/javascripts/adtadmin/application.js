function my_ajax_send(url, send_data, success_code){
  $.ajax({
   url: url,
   type: "POST",
   dataType: "json",
   beforeSend : function(xhr){xhr.setRequestHeader("Accept", "application/json")}, 
   beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
   data:send_data,
   success: function(resp){ 
    success_code();
  }
});
}
function my_ajax_delete(url){
  $.ajax({
   url: url,
   type: "DELETE",
   dataType: "json",
   beforeSend : function(xhr){xhr.setRequestHeader("Accept", "application/json")}, 
   beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
   data:"",
 });
}


$(document).ready(function () {
    /* $.getJSON('/get_regions', function (data) {
         var items = [];
         $.each(data, function (key, val) {
          $('<li id="' + key + '">' + '<a class="h_link" href=\"/' + val.alias + '\">' + val.name + '</a>' + '</li>').appendTo('#region_list');
         });
   
     });*/
/*
    $('#login_push').click( function(){
     $('#login_cover').css("visibility", "visible");
    });
*/

    var add_agent, load_accountabilityagents, load_all_agent_list, update_image_list;
    load_all_agent_list = function() {
      return $.getJSON("/adtadmin/agentprofiles.json", function(data) {
        return $.each(data, function(key, val) {
          return $("#all_agents").append("<option value=\"" + val.id + "\">" + val.name + "</option>");
        });
      });
    };

    add_agent = function(post_id, agent_id) {
      var accountabilityagent, agent_data;
      accountabilityagent = void 0;
      agent_data = {
        accountabilityagent: {
          post_id: post_id,
          agentprofile_id: agent_id
        }
      };
      return my_ajax_send("/adtadmin/accountabilityagents.json", agent_data, function() {
        return load_accountabilityagents($("#post_id").val());
      });
    };
    load_accountabilityagents = function(post_id) {
      $("#agent_list").empty();
      return $.getJSON("/adtadmin/agentprofiles/findbypost/" + post_id, function(data) {
        return $.each(data, function(key, val) {
          return $("#agent_list ").append("<div>" + val.name + "<button class=\"delete_agent_button\"  type=\"button\"  value=\"" + val.id + "\" ><i class=\"icon-remove\"></i></button>" + "</div> ");
        });
      });
    };
    update_image_list = function(post_id) {
      return $.getJSON("/adtadmin/images/findbypost/" + post_id, function(data) {
        return $.each(data, function(key, val) {
          return $("#image_thumbinals ").append("<div class=\"image_thumb\" " + " style=\"background-image:  url(" + val.url + ");\">" + val.url + "<button class=\"delete_img_button\"  type=\"button\"  value=\"" + val.id + "\" ><i class=\"icon-remove\"></i></button>" + "</div> ");
        });
      });
    };


   load_full_name_category = function(category_id) {
      return $.getJSON("/adtadmin/categories/" + category_id + ".json", function(data) {
        return $("#title_field").val(data.full_name + " " + $("#district_field").val());
      });
    }; 

  $("#compile_title").click(function() {
   // alert("sadsa");
      var category_id;
      category_id = $("#category_field").val();
      return load_full_name_category(category_id);
    });


    $("#add_new_img_button").click(function() {
      var image_data, imgurl, post_id;
      image_data = void 0;
      imgurl = void 0;
      post_id = void 0;
      imgurl = $("#imgurl").val();
      post_id = $("#post_id").val();
      image_data = {
        image: {
          post_id: post_id,
          url: imgurl
        }
      };
      return my_ajax_send("/adtadmin/images.json", image_data, function() {
        $("#imgurl").val("");
        $("#image_thumbinals").empty();
        return update_image_list($("#post_id").val());
      });
    });




    
    $('.plan_select').click(function() {
      return $("#plan_field").val($(this).text());
    });

    $('.material_select').click(function() {
      return $("#material_field").val($(this).text());
    });

    $('.apartmen_select').click(function() {
      return $("#apartmen_field").val($(this).text());
    });

     $("#price_field").change(function() {
      var newstr, re, str;
      re = /^\d+$/;
      str = $("#price_field").val();
      newstr = str.replace(/(\s+)/g, "");
      return $("#price_field").val(newstr);
    });

     $("#post_imageurl").popover({
      html: true,
      placement: 'top',
      trigger: 'hover',
      delay: 2000,
      content: function() {
        return "<img src=\"" + $("#post_imageurl").val() + "\">";
      }
    });


    $("#add_agent_button").click(function() {
      return add_agent($("#post_id").val(), $("#all_agents").val());
    });
    $(document).on("click", ".delete_img_button", function() {
      my_ajax_delete("/adtadmin/images/" + $(this).val() + ".json");
      $("#image_thumbinals").empty();
      return update_image_list($("#post_id").val());
    });
    $(document).on("click", ".delete_agent_button", function() {
      my_ajax_delete("/adtadmin/accountabilityagents/" + $(this).val() + ".json");
      return load_accountabilityagents($("#post_id").val());
    });
    update_image_list($("#post_id").val());
    load_all_agent_list();
    return load_accountabilityagents($("#post_id").val());



});