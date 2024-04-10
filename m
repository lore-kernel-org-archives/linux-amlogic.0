Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FB2C04FFE
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2024 15:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T+8pgCHP008J4HQWyVDTGPcGSPkMo3gbtbqEj4SBWe0=; b=cgRnMGV7iPmBeb
	RqysBzdDmC3BTKiTI42W3/X2+meXZjnhXl4+zFBJm97ctubU/uqgYF/aLd5XZXJRpU1TJjuFy35d2
	JguDyEKb9ZFq8WsuPJ7+7HhVhrmLlAqS9KP1OTe8GJoMvm+3ivKiHwZRgsDmtBq7/5Aczdx4tYPn5
	j1BiVAuVbgGxqodwpKj8OxtpDdru4G2erpYu3rQ50xBnmzPLvZzpFopuJ9R7uOOAtPgBlvNpZJEhp
	ZpM8HCy34+qsuzdqPi8Qy8IeEC/5p4Ktus57svkS4hL1lSoxxo74F3WyqbGwmiwsAFjKAAfCiL1VJ
	NEtGz4H5FO3GC0Rpjdzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1TB6-00000003SaA-2pOt;
	Mon, 29 Apr 2024 15:44:28 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruSuo-00000005l9N-1yLG;
	Wed, 10 Apr 2024 08:02:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 019B5CE2645;
	Wed, 10 Apr 2024 08:02:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EDFDC43390;
	Wed, 10 Apr 2024 08:02:36 +0000 (UTC)
Received: by mercury (Postfix, from userid 1000)
	id 324081063262; Wed, 10 Apr 2024 10:02:32 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Michael Ellerman <mpe@ellerman.id.au>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Damien Le Moal <dlemoal@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Corey Minyard <minyard@acm.org>, Peter Huewe <peterhuewe@gmx.de>, 
 Jarkko Sakkinen <jarkko@kernel.org>, Tero Kristo <kristo@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Ian Abbott <abbotti@mev.co.uk>, 
 H Hartley Sweeten <hsweeten@visionengravers.com>, 
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
 Len Brown <lenb@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 John Allen <john.allen@amd.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
 Vinod Koul <vkoul@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Moritz Fischer <mdf@kernel.org>, 
 Liviu Dudau <liviu.dudau@arm.com>, 
 Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Peter Rosin <peda@axentia.se>, Lars-Peter Clausen <lars@metafoo.de>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Lee Jones <lee@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Iyappan Subramanian <iyappan@os.amperecomputing.com>, 
 Yisen Zhuang <yisen.zhuang@huawei.com>, Stanislaw Gruszka <stf_xl@wp.pl>, 
 Kalle Valo <kvalo@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Mark Brown <broonie@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Xiang Chen <chenxiang66@hisilicon.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Alex Elder <elder@kernel.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Jacky Huang <ychuang3@nuvoton.com>, 
 Helge Deller <deller@gmx.de>, Christoph Hellwig <hch@lst.de>, 
 Robin Murphy <robin.murphy@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Kees Cook <keescook@chromium.org>, 
 Trond Myklebust <trond.myklebust@hammerspace.com>, 
 Anna Schumaker <anna@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
 linuxppc-dev@lists.ozlabs.org, linux-ide@vger.kernel.org, 
 openipmi-developer@lists.sourceforge.net, linux-integrity@vger.kernel.org, 
 linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-crypto@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-efi@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-fpga@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
 linux-leds@vger.kernel.org, linux-wireless@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, iommu@lists.linux.dev, 
 linux-trace-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
 linux-hardening@vger.kernel.org, linux-nfs@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, alsa-devel@alsa-project.org, 
 linux-sound@vger.kernel.org
In-Reply-To: <20240403080702.3509288-1-arnd@kernel.org>
References: <20240403080702.3509288-1-arnd@kernel.org>
Subject: Re: (subset) [PATCH 00/34] address all -Wunused-const warnings
Message-Id: <171273615213.1094883.18382201508159771859.b4-ty@collabora.com>
Date: Wed, 10 Apr 2024 10:02:32 +0200
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_010242_900176_5A9F53F2 
X-CRM114-Status: GOOD (  11.39  )
X-Mailman-Approved-At: Mon, 29 Apr 2024 08:44:25 -0700
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Wed, 03 Apr 2024 10:06:18 +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Compilers traditionally warn for unused 'static' variables, but not
> if they are constant. The reason here is a custom for C++ programmers
> to define named constants as 'static const' variables in header files
> instead of using macros or enums.
> 
> [...]

Applied, thanks!

[09/34] power: rt9455: hide unused rt9455_boost_voltage_values
        commit: 452d8950db3e839aba1bb13bc5378f4bac11fa04

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
