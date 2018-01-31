From: khilman@baylibre.com (Kevin Hilman)
Date: Tue, 30 Jan 2018 16:44:45 -0800
Subject: [PATCH v2 0/3] Meson8/Meson8b reset improvements
In-Reply-To: <20180121221414.1060-1-martin.blumenstingl@googlemail.com>
 (Martin Blumenstingl's message of "Sun, 21 Jan 2018 23:14:11 +0100")
References: <20180121221414.1060-1-martin.blumenstingl@googlemail.com>
Message-ID: <7hy3keambm.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> Recently reset level support (.assert/.deassert) was added to the
> reset-meson driver.
> This prepares Meson8b to enable level resets as well (for this we
> have to grow the memory zone of the reset controller).
>
> I also noticed that Meson8 does not have the reset controller in it's
> .dtsi yet, so this series adds that as well.
> It also adds the USB reset lines on Meson8 afterwards to stay
> consistent with Meson8b.
>
> changes since v1 at [0]:
> - added Neil's Reviewed-by (thank you)
> - updated cover-letter since the reset-meson driver changes which
>   add level reset support also for Meson8b are queued for v4.16

Applied to v4.17/dt,

Thanks,

Kevin
