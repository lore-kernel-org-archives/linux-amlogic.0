From: khilman@baylibre.com (Kevin Hilman)
Date: Wed, 06 Dec 2017 17:05:52 -0800
Subject: [PATCH v2 0/2] add Meson8/Meson8b serial core clock handling
In-Reply-To: <20171117225857.9571-1-martin.blumenstingl@googlemail.com>
 (Martin Blumenstingl's message of "Fri, 17 Nov 2017 23:58:55 +0100")
References: <20171117225857.9571-1-martin.blumenstingl@googlemail.com>
Message-ID: <7hvahjl53j.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> This patchset adds the tty/serial core clock handling to the UARTs
> on Meson8 and Meson8b.
>
> Basically this is the Meson8 and Meson8b version of a patchset from
> Helmut Klein and Neil Armstrong, who implemented this for Meson GX
> (see [0]). Back then I asked Neil to drop Meson8b from his patchset
> because I was working on the Meson8 clock controller at that time.
>
> This also removes the last users that rely on the "amlogic,meson-uart"
> binding. Removing that binding from the meson_uart driver is not part
> of this series though.

I mistakenly replied to the v1 of this series.  It's this version (v2)
that I applied to v4.16/dt.

Sorry for the confusion, and thanks for the patches!

Kevin
