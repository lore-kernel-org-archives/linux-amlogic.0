From: wd@denx.de (Wolfgang Denk)
Date: Mon, 12 Nov 2018 15:09:25 +0100
Subject: [U-Boot] [PATCH u-boot] spi: Add Amlogic Meson SPI Flash
 Controller driver
In-Reply-To: <7206f5df-626e-a367-8933-4e6afb64a660@baylibre.com>
References: <1541496359-18064-1-git-send-email-narmstrong@baylibre.com>
 <7206f5df-626e-a367-8933-4e6afb64a660@baylibre.com>
Message-ID: <20181112140925.AE120242DCA@gemini.denx.de>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Dear Neil,

In message <7206f5df-626e-a367-8933-4e6afb64a660@baylibre.com> you wrote:
> 
> On 06/11/2018 10:25, Neil Armstrong wrote:
> > The Amlogic Meson SoCs embeds a Flash oriented SPI Controller name SPIFC.
> > This driver, ported from the Linux meson-spi-spifc driver, add support
> > for this controller on the Amlogic Meson GX SoCs in U-Boot.
> 
> I found a bug in this driver, I'll send a v2 fixing it.

Then please also fix attribution. See especially bullet # 4 at
http://www.denx.de/wiki/view/U-Boot/Patches#Attributing_Code_Copyrights_Sign

Thanks.

Wolfgang Denk

-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd at denx.de
Cleverness and Style have no place in getting a project completed.
                                                  -- Tom Christiansen
