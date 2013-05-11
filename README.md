# Tubesock Example

## Usage

    bundle install
    bundle exec rails s puma

Then visit the app in your browser. Type a message in the box and hit enter.

## Notable files

* config/routes
* app/assets/javascripts/chat
* app/views/chat/index.html
* app/controllers/chat_controller.rb

## Issues

Check active connections to postgres with
    
    psql postgres -c "select * from pg_stat_activity;"
    
I'm not seeing Rails release connetions back to the pool / reap them when the thread is closed.
I've tried an `onclose` block that does all/every combination of these calls:

        ActiveRecord::Base.connection_pool.release_connection
        ActiveRecord::Base.clear_active_connections!
        
        ActiveRecord::Base.connection.close
        ActiveRecord::Base.connection.disconnect!
        
But none of those have helped me decrease the active connections to the db.
