From: khilman@baylibre.com (Kevin Hilman)
Date: Wed, 16 Nov 2016 13:35:57 -0800
Subject: [PATCH 3/3] ARM64: dts: meson-gxbb: add the USB reset also to the
 second USB PHY
In-Reply-To: <20161112131305.26088-4-martin.blumenstingl@googlemail.com>
 (Martin Blumenstingl's message of "Sat, 12 Nov 2016 14:13:05 +0100")
References: <20161001152134.8168-1-martin.blumenstingl@googlemail.com>
 <20161112131305.26088-1-martin.blumenstingl@googlemail.com>
 <20161112131305.26088-4-martin.blumenstingl@googlemail.com>
Message-ID: <m2twb7w1j6.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> When the USB PHY driver was introduced the reset framework did not
> have support for triggering a reset pulse for shared resets. On GXBB
> however there is only one reset line for both PHYs (meaning we have a
> shared reset line). With the latest changes to the reset framework and
> the corresponding updates to the phy-meson8b-usb2 driver we can now pass
> the reset to the second PHY as well.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Applied.

Thanks,

Kevin
