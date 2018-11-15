From: khilman@baylibre.com (Kevin Hilman)
Date: Thu, 15 Nov 2018 11:43:47 -0800
Subject: [PATCH 0/3] 32-bit Meson: add missing /chosen/stdout-path
In-Reply-To: <20181028140343.1071-1-martin.blumenstingl@googlemail.com>
References: <20181028140343.1071-1-martin.blumenstingl@googlemail.com>
Message-ID: <7h4lcif7nw.fsf@eze.i-did-not-set--mail-host-address--so-tickle-me>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> Some boards don't have the /chosen/stdout-path property yet. Support
> for these boards is far from being complete and I don't have any of
> those for testing. Whenever someone reports an issue with one of these
> boards I would like an output with the "earlycon" kernel argument.
> However, this only works when the board sets the /chosen/stdout-path
> property.
>
> None of these were tested manually, but since it's the same for all
> existing (32-bit and 64-bit) boards it's safe to assume that this will
> work.

Queued for v4.21, with Neil's acks (branch: v4.21/dt)

Kevin
