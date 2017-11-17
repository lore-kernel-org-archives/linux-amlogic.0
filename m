From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Fri, 17 Nov 2017 19:17:58 +0100
Subject: [PATCH 0/3] tty: serial: meson: small code improvements
Message-ID: <20171117181801.29734-1-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The goal of this series is to make some the pre-processor defines also
useful for humans (like me) who want to compare register dumps.
These patches should not have any functional impact (which is also why
I didn't add a "Fixes" tag).


Martin Blumenstingl (3):
  tty: serial: meson: remove duplicate "clear error" bit definition
  tty: serial: meson: merge the two register sections for
    AML_UART_CONTROL
  tty: serial: meson: fix typo in the "stop bit" register definition

 drivers/tty/serial/meson_uart.c | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

-- 
2.15.0
