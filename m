From: khilman@baylibre.com (Kevin Hilman)
Date: Fri, 28 Jul 2017 09:43:44 -0700
Subject: [PATCH 0/2] Add PWM support for Meson8
In-Reply-To: <20170711222015.10401-1-martin.blumenstingl@googlemail.com>
 (Martin Blumenstingl's message of "Wed, 12 Jul 2017 00:20:13 +0200")
References: <20170711222015.10401-1-martin.blumenstingl@googlemail.com>
Message-ID: <7hziboqzpb.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> This series moves the pwm_ab and pwm_cd nodes to the common meson.dtsi.
> According to Amlogic's GPL kernel sources Meson6 contains the same PWM
> IP blocks for pwm_ab and pwm_cd (at the same register offsets) as Meson8
> and Meson8b.
>
> pwm_ef on the other hand does not exist on Meson6, so it stays in
> meson8b.dtsi (and is added to meson8b.dtsi).
>
> Known usages of the PWM controllers:
> - controlling the brightness of the system LED
> - generating the 32.768kHz wifi LPO clock
> - controlling the VDDEE (CPU) voltage

Applied to v4.14/dt,

Thanks,

Kevin
