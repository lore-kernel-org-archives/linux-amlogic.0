From: khilman@baylibre.com (Kevin Hilman)
Date: Fri, 06 Oct 2017 15:24:39 -0700
Subject: [PATCH] ARM: dts: meson: fixing USB support on Meson6,
 Meson8 and Meson8b
In-Reply-To: <20170922115708.GA14806@ingrassia.epigenesys.com> (Emiliano
 Ingrassia's message of "Fri, 22 Sep 2017 13:57:08 +0200")
References: <20170922115708.GA14806@ingrassia.epigenesys.com>
Message-ID: <7hlgkn9aoo.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Emiliano Ingrassia <ingrassia@epigenesys.com> writes:

> This patch fixes the Meson6, Meson8 and Meson8b USB controllers dts nodes
> which interrupts are level type instead of edge type.
> This avoids errors like "usb 1-1-port1: cannot reset (err = -110)" and
> similars on Odroid-C1+ board.
>
> Fixes: e29b1cf87473 ("ARM: dts: meson: add USB support on Meson8 and Meson8b")
>
> Signed-off-by: Emiliano Ingrassia <ingrassia@epigenesys.com>

Applied to v4.15/dt,

Thanks,

Kevin
