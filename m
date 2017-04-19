From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Wed, 19 Apr 2017 21:59:35 +0200
Subject: [PATCH v2 0/6] serial: meson: series with smaller fixes and
 improvements
Message-ID: <4abafe6e-3c7c-049f-d450-ab27e2c7acfd@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This series includes a few smaller fixes and improvements for the
meson uart driver.

Changes in v2:
- change patch 3 based on review discussion
- change patch 6 to use port->name instead

Heiner Kallweit (6):
  serial: meson: fix setting number of stop bits
  serial: meson: remove dead code in meson_uart_change_speed
  serial: meson: remove unneeded variable assignment in meson_serial_port_write
  serial: meson: make use of uart_port member mapsize
  serial: meson: remove use of flag UPF_IOREMAP
  serial: meson: change interrupt description to of node name

 drivers/tty/serial/meson_uart.c | 68 ++++++++++++++++-------------------------
 1 file changed, 26 insertions(+), 42 deletions(-)

-- 
2.12.2
