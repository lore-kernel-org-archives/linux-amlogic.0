From: trini@konsulko.com (Tom Rini)
Date: Tue, 19 Jun 2018 14:43:16 -0400
Subject: [U-Boot,u-boot,1/5] adc: meson-saradc: fix regmap_init_mem call
In-Reply-To: <1528976621-8397-2-git-send-email-narmstrong@baylibre.com>
References: <1528976621-8397-2-git-send-email-narmstrong@baylibre.com>
Message-ID: <20180619184316.GH4609@bill-the-cat.ec.rr.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Thu, Jun 14, 2018 at 01:43:37PM +0200, Neil Armstrong wrote:

> The SARADC driver was merged after the following commit :
> commit d35812368a59 ("regmap: change regmap_init_mem() to take ofnode instead udevice")
> Thus breaking build, this patch fixes the regmap_init_mem accordingly.
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
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20180619/3f977926/attachment.sig>
