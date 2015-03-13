module Slice
  module ResourceBasedMethods

    # ## 'Users' Resources

    # ### Slice::Client#whoami(params = nil, headers = nil)
    # Get the user object corresponding to the OAuth token
    #
    def whoami(params = nil, headers = nil)
      get("/api/v1/users/self", params, headers)
    end


    # ## 'Mailboxes' Resources

    # ### Slice::Client#list_mailboxes(params = nil, headers = nil)
    # List mailboxes
    #
    def list_mailboxes(params = nil, headers = nil)
      get("/api/v1/mailboxes", params, headers)
    end

    # ### Slice::Client#get_mailbox(params = nil, headers = nil)
    # Get a particular mailbox
    #
    def get_mailbox(id, params = nil, headers = nil)
      get("/api/v1/mailboxes/#{id}", params, headers)
    end


    # ## 'Orders' Resources

    # ### Slice::Client#list_orders(params = nil, headers = nil)
    # List orders
    #
    def list_orders(params = nil, headers = nil)
      get("/api/v1/orders", params, headers)
    end

    # ### Slice::Client#create_order(params = nil, headers = nil)
    # Create a new order
    #
    def create_order(params = nil, headers = nil)
      post("/api/v1/orders", params, headers)
    end

    # ### Slice::Client#get_order(id, params = nil, headers = nil)
    # Get a particular order
    #
    def get_order(id, params = nil, headers = nil)
      get("/api/v1/orders/#{id}", params, headers)
    end

    # ### Slice::Client#update_order(id, params = nil, headers = nil)
    # Update a particular order
    #
    def update_order(id, params = nil, headers = nil)
      put("/api/v1/orders/#{id}", params, headers)
    end

    # ### Slice::Client#delete_order(id, params = nil, headers = nil)
    # Delete a particular order
    #
    def delete_order(id, params = nil, headers = nil)
      delete("/api/v1/orders/#{id}", params, headers)
    end

    # ## 'Items' Resources

    # ### Slice::Client#list_items(params = nil, headers = nil)
    # List items
    #
    def list_items(params = nil, headers = nil)
      get("/api/v1/items", params, headers)
    end

    # ### Slice::Client#create_item(params = nil, headers = nil)
    # Create a new item
    #
    def create_item(params = nil, headers = nil)
      post("/api/v1/items", params, headers)
    end

    # ### Slice::Client#get_item(id, params = nil, headers = nil)
    # Get a particular item
    #
    def get_item(id, params = nil, headers = nil)
      get("/api/v1/items/#{id}", params, headers)
    end

    # ### Slice::Client#update_item(id, params = nil, headers = nil)
    # Update a particular item
    #
    def update_item(id, params = nil, headers = nil)
      put("/api/v1/items/#{id}", params, headers)
    end

    # ### Slice::Client#delete_item(id, params = nil, headers = nil)
    # Delete a particular item
    #
    def delete_item(id, params = nil, headers = nil)
      delete("/api/v1/items/#{id}", params, headers)
    end


    # ## 'Shipments' Resources

    # ### Slice::Client#list_shipments(params = nil, headers = nil)
    # List shipments
    #
    def list_shipments(params = nil, headers = nil)
      get("/api/v1/shipments", params, headers)
    end

    # ### Slice::Client#create_shipment(params = nil, headers = nil)
    # Create a new shipment
    #
    def create_shipment(params = nil, headers = nil)
      post("/api/v1/shipments", params, headers)
    end

    # ### Slice::Client#get_shipment(id, params = nil, headers = nil)
    # Get a particular shipment
    #
    def get_shipment(id, params = nil, headers = nil)
      get("/api/v1/shipments/#{id}", params, headers)
    end

    # ### Slice::Client#update_shipment(id, params = nil, headers = nil)
    # Update a particular shipment
    #
    def update_shipment(id, params = nil, headers = nil)
      put("/api/v1/shipments/#{id}", params, headers)
    end

    # ### Slice::Client#delete_shipment(id, params = nil, headers = nil)
    # Delete a particular shipment
    #
    def delete_shipment(id, params = nil, headers = nil)
      delete("/api/v1/shipments/#{id}", params, headers)
    end


    # ## 'Merchants' Resources

    # ### Slice::Client#get_merchant(id, params = nil, headers = nil)
    # Get a particular merchant
    #
    def get_merchant(id, params = nil, headers = nil)
      get("/api/v1/merchants/#{id}", params, headers)
    end


    # ## 'Recalls' Resources

    # ### Slice::Client#list_recalls(params = nil, headers = nil)
    # List recalls for the user
    #
    def list_recalls(params = nil, headers = nil)
      get("/api/v1/recalls", params, headers)
    end

    # ### Slice::Client#get_recall(id, params = nil, headers = nil)
    # Get a particular recall for the user
    #
    def get_recall(id, params = nil, headers = nil)
      get("/api/v1/recalls/#{id}", params, headers)
    end


    # ## 'Email' Resources

    # ### Slice::Client#get_email(id, params = nil, headers = nil)
    # Get a particular email
    #
    def get_email(id, params = nil, headers = nil)
      get("/api/v1/emails/#{id}", params, headers)
    end

    # ### Slice::Client#get_email(id, params = nil, headers = nil)
    # Get a particular email content
    #
    def get_email_content(id, params = nil, headers = nil)
      get("/api/v1/emails/#{id}/content", params, headers)
    end


    # ## Dictionary (static) Resources

    # ### Slice::Client#list_categories(params = nil, headers = nil)
    # List categories of items that a user may have purchased
    #
    def list_categories(params = nil, headers = nil)
      get("/api/v1/categories", params, headers)
    end

    # ### Slice::Client#list_providers(params = nil, headers = nil)
    # List providers of items that a user may have purchased
    #
    def list_providers(params = nil, headers = nil)
      get("/api/v1/providers", params, headers)
    end

    # ### Slice::Client#list_purchasetypes(params = nil, headers = nil)
    # List different types of purchases
    #
    def list_purchasetypes(params = nil, headers = nil)
      get("/api/v1/purchasetypes", params, headers)
    end

    # ### Slice::Client#list_shippers(params = nil, headers = nil)
    # List shippers that may be used to deliver packages
    #
    def list_shippers(params = nil, headers = nil)
      get("/api/v1/shippers", params, headers)
    end


    # ## 'Action' Resources

    # ### Slice::Client#update(params = nil, headers = nil)
    # Tell Slice to recrawl the mailboxes of the user
    #
    def update(params = nil, headers = nil)
      post("/api/v1/actions/update", params, headers)
    end

  end
end
