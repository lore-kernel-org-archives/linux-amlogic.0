From: andrew@lunn.ch (Andrew Lunn)
Date: Mon, 10 Jul 2017 16:37:31 +0200
Subject: [PATCH net] mdio: mux: fix parsing mux registers outside of the
 PHY address range
In-Reply-To: <CAC3K-4p0gidfh1U+_o3i7bwCgQo1QtNb7D+MXwYa+X_-9sFhrw@mail.gmail.com>
References: <20170710123523.6625-1-martin.blumenstingl@googlemail.com>
 <20170710125652.GG1616@lunn.ch>
 <CAC3K-4p0gidfh1U+_o3i7bwCgQo1QtNb7D+MXwYa+X_-9sFhrw@mail.gmail.com>
Message-ID: <20170710143731.GE21118@lunn.ch>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

> To be clear, are you suggesting that we add an additional property to
> of_mdio_parse_addr() that specifies the limit to check against, or
> remove the check and add it to each additional caller?

Hi Jon

Probably the simplest is to add an extra parameter to mdio_mux_init()
which is the maximum allowed reg value.

We should not touch of_mdio_parse_addr(). reg is not an mdio
address. It is a count of gpios, or a value to be poked into an
register.

      Andrew
