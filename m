From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Sun, 16 Apr 2017 22:06:40 +0200
Subject: [PATCH 1/6] serial: meson: fix setting number of stop bits
In-Reply-To: <d16f695a-42b2-dfc2-0e53-df110f5a8389@gmail.com>
References: <d16f695a-42b2-dfc2-0e53-df110f5a8389@gmail.com>
Message-ID: <d1091d2e-8f6c-618b-556b-400e4b8db3c3@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The stop bit value as to be or'ed, so far this worked only just by chance
because AML_UART_STOP_BIN_1SB is 0.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/tty/serial/meson_uart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index 60f16795..e2e25da1 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -355,7 +355,7 @@ static void meson_uart_set_termios(struct uart_port *port,
 	if (cflags & CSTOPB)
 		val |= AML_UART_STOP_BIN_2SB;
 	else
-		val &= ~AML_UART_STOP_BIN_1SB;
+		val |= AML_UART_STOP_BIN_1SB;
 
 	if (cflags & CRTSCTS)
 		val &= ~AML_UART_TWO_WIRE_EN;
-- 
2.12.2
