From: khilman@baylibre.com (Kevin Hilman)
Date: Tue, 30 Jan 2018 16:38:32 -0800
Subject: [PATCH v2 0/2] meson8b-odroidc1: ethernet support
In-Reply-To: <cover.1516326105.git.ingrassia@epigenesys.com> (Emiliano
 Ingrassia's message of "Fri, 19 Jan 2018 02:47:17 +0100")
References: <cover.1516326105.git.ingrassia@epigenesys.com>
Message-ID: <7h607ic16f.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Emiliano Ingrassia <ingrassia@epigenesys.com> writes:

> This patchset, tested on an Odroid-C1+ board, enables ethernet support
> on Odroid-C1/C1+ boards, improving and extending the ethernet description
> in the relative device tree.
>
> In particular:
> - enables the Meson8b ethernet controller pin multiplexing;
> - fixes and extends the Meson8b ethernet controller description;
> - adds the Odroid-C1+ ethernet PHY description and enables the
>   ethernet controller.
>
> This patchset depends on patchset "dwmac-meson8b: clock fixes for Meson8b".

Series applied to v4.17/dt64, with tags from Martin and Linus,

Thanks,

Kevin
