package md.utm.cloudapp.rest

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController
import java.net.InetAddress
import org.slf4j.LoggerFactory

@RestController
class MainController {
    companion object {
        private val logger = LoggerFactory.getLogger(MainController::class.java)
    }
    @GetMapping("/")
    fun main(): String {
        val hostname = InetAddress.getLocalHost().hostName

        logger.info("Request received on host: {}", hostname)
        return "Hello World! Host: $hostname. Good night."
    }
}
