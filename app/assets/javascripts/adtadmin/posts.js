(function() {

  $(document).ready(function() {
    var add_agent, load_accountabilityagents, load_all_agent_list, update_image_list;
    load_all_agent_list = function() {
      return $.getJSON("/agentprofiles.json", function(data) {
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
      return my_ajax_send("/accountabilityagents.json", agent_data, function() {
        return load_accountabilityagents($("#post_id").val());
      });
    };
    load_accountabilityagents = function(post_id) {
      $("#agent_list").empty();
      return $.getJSON("/agentprofiles/findbypost/" + post_id, function(data) {
        return $.each(data, function(key, val) {
          return $("#agent_list ").append("<div>" + val.name + "<button class=\"delete_agent_button\"  type=\"button\"  value=\"" + val.id + "\" ><i class=\"icon-remove\"></i></button>" + "</div> ");
        });
      });
    };
    update_image_list = function(post_id) {
      return $.getJSON("/images/findbypost/" + post_id, function(data) {
        return $.each(data, function(key, val) {
          return $("#image_thumbinals ").append("<div class=\"image_thumb\" " + " style=\"background-image:  url(" + val.url + ");\">" + val.url + "<button class=\"delete_img_button\"  type=\"button\"  value=\"" + val.id + "\" ><i class=\"icon-remove\"></i></button>" + "</div> ");
        });
      });
    };



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
      return my_ajax_send("/images.json", image_data, function() {
        $("#imgurl").val("");
        $("#image_thumbinals").empty();
        return update_image_list($("#post_id").val());
      });
    });
    $("#add_agent_button").click(function() {
      return add_agent($("#post_id").val(), $("#all_agents").val());
    });
    $(document).on("click", ".delete_img_button", function() {
      my_ajax_delete("/images/" + $(this).val() + ".json");
      $("#image_thumbinals").empty();
      return update_image_list($("#post_id").val());
    });
    $(document).on("click", ".delete_agent_button", function() {
      my_ajax_delete("/accountabilityagents/" + $(this).val() + ".json");
      return load_accountabilityagents($("#post_id").val());
    });
    update_image_list($("#post_id").val());
    load_all_agent_list();
    return load_accountabilityagents($("#post_id").val());
  });

}).call(this);