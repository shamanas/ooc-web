use web, fastcgi

import web/Application
import fastcgi/Server
import io/[Reader, FileReader]


//TODO: update this to use the new body() writer
SendFile: class extends Application {
    processRequest: func -> Reader {
        response setHeader("Content-type", "text/plain; charset=utf-8")
        return FileReader new("../README")
    }
}

main: func {
    server := FCGIServer new(":8000")
    server application = SendFile new()
    server run()
}
