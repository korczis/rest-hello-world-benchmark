package main

import "encoding/json"
import "github.com/gofiber/fiber/v2"


type Message struct {
    Message string `json:message`
}

func main() {
   config := fiber.Config{
       Prefork: false,
   }

   app := fiber.New(config)

    app.Get("/api/hello-world", func(c *fiber.Ctx) error {
	msg := Message{	Message: "Hello World!" }
        res, _ := json.Marshal(msg)

        // return c.SendString("{\"message\": \"Hello World!\"}")
        return c.SendString(string(res))
    })

    app.Listen(":4000")
}
