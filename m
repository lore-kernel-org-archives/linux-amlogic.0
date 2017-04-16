From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Sun, 16 Apr 2017 22:02:47 +0200
Subject: [PATCH 0/6] serial: meson: series with smaller fixes and improvements
Message-ID: <d16f695a-42b2-dfc2-0e53-df110f5a8389@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This series includes a few smaller fixes and improvements for the
meson uart driver.

Heiner Kallweit (6):
  serial: meson: fix setting number of stop bits
  serial: meson: remove dead code in meson_uart_change_speed
  serial: meson: remove unneeded variable assignment in meson_serial_port_write
  serial: meson: make use of uart_port member mapsize
  serial: meson: remove use of flag UPF_IOREMAP
  serial: meson: change interrupt description to of node name

 drivers/tty/serial/meson_uart.c | 52 ++++++++++-------------------------------
 1 file changed, 12 insertions(+), 40 deletions(-)

-- 
2.12.2
