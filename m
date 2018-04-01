From: davem@davemloft.net (David Miller)
Date: Sat, 31 Mar 2018 21:57:01 -0400 (EDT)
Subject: [PATCH net-next v1 0/2] Meson8m2 support for dwmac-meson8b
In-Reply-To: <20180329230035.20958-1-martin.blumenstingl@googlemail.com>
References: <20180329230035.20958-1-martin.blumenstingl@googlemail.com>
Message-ID: <20180331.215701.873320498954210575.davem@davemloft.net>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 30 Mar 2018 01:00:33 +0200

> The Meson8m2 SoC is an updated version of the Meson8 SoC. Some of the
> peripherals are shared with Meson8b (for example the watchdog registers
> and the internal temperature sensor calibration procedure).
> Meson8m2 also seems to include the same Gigabit MAC register layout as
> Meson8b.
> 
> The registers in the Amlogic dwmac "glue" seem identical between Meson8b
> and Meson8m2. Manual testing seems to confirm this.
> 
> To be extra-safe a new compatible string is added because there's no
> (public) documentation on the Meson8m2 SoC. This will allow us to
> implement any SoC-specific variations later on (if needed).

Series applied, thank you.
