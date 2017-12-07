From: khilman@baylibre.com (Kevin Hilman)
Date: Wed, 06 Dec 2017 16:53:52 -0800
Subject: [PATCH 0/3] tty: serial: meson: small code improvements
In-Reply-To: <20171117181801.29734-1-martin.blumenstingl@googlemail.com>
 (Martin Blumenstingl's message of "Fri, 17 Nov 2017 19:17:58 +0100")
References: <20171117181801.29734-1-martin.blumenstingl@googlemail.com>
Message-ID: <7hk1xzmk7z.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> The goal of this series is to make some the pre-processor defines also
> useful for humans (like me) who want to compare register dumps.
> These patches should not have any functional impact (which is also why
> I didn't add a "Fixes" tag).
>
>
> Martin Blumenstingl (3):
>   tty: serial: meson: remove duplicate "clear error" bit definition
>   tty: serial: meson: merge the two register sections for
>     AML_UART_CONTROL
>   tty: serial: meson: fix typo in the "stop bit" register definition
>
>  drivers/tty/serial/meson_uart.c | 31 ++++++++++++++-----------------
>  1 file changed, 14 insertions(+), 17 deletions(-)

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
