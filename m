From: trini@konsulko.com (Tom Rini)
Date: Tue, 8 May 2018 13:16:36 -0400
Subject: [U-Boot,u-boot] adc: add Amlogic Meson SAR ADC driver
In-Reply-To: <1524493163-20509-1-git-send-email-narmstrong@baylibre.com>
References: <1524493163-20509-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <20180508171636.GN12235@bill-the-cat.ec.rr.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Mon, Apr 23, 2018 at 04:19:23PM +0200, Neil Armstrong wrote:

> This patch adds the driver for the Amlogic Meson Successive Approximation
> Register (SAR) A/D Converter based on the Linux IIO driver thanks to the
> great work of Martin Blumenstingl.
> The driver has been adapted to U-Boot and the ADC UClass.
> 
> This patch depends on the regmap "regmap: add regmap_update_bits() helper"
> patch and has been tested using the newly introducted "adc" CLI command
> in the "cmd: add ADC cli commands" patch.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Applied to u-boot/master, thanks!

-- 
Tom
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20180508/7e770948/attachment.sig>
