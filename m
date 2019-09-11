Return-Path: <SRS0=xGzz=XG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4211C49ED9
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Sep 2019 00:03:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C86452171F
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Sep 2019 00:03:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HjNvqtSA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NVJuR8bV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C86452171F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/JEGwKkBdtGK5sahJzZZIFc+c2WDeCc98vYGxEawMYs=; b=HjNvqtSAYqO69+
	gE5IbO6a07c48O+RBGWj36pJM8FNTJizzWxtu0+KivOp3dGoF5UwAAprBSFGqtU/CiucDWkEaXsf/
	nJql499cIjjYxRNNIazC38t6uZqgfqa71A1Rb/v00In4mPFkVbOSLPBa30rJDtf0FkkeFTE7bmlGQ
	aIjnr9Dav4/QNCuAZvDhyYFrrqF3I5OXYXHZNe3ec67RB94VMvdkJdg5uCdqi3h4J7WMAYm16vbGL
	7yw6/ULVFTWm+yCgsQc9NgBuI+7W4MU/rngJTvYqa4SXBQPEvRnT11QZE7TtFe+kGO8DekE9GreS7
	bVBnfeWYS57Yw8EQVbFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i7q6V-0004mW-FP; Wed, 11 Sep 2019 00:03:23 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i7q6P-0004iz-2B
 for linux-amlogic@lists.infradead.org; Wed, 11 Sep 2019 00:03:20 +0000
Received: by mail-lf1-x141.google.com with SMTP id r134so14898007lff.12
 for <linux-amlogic@lists.infradead.org>; Tue, 10 Sep 2019 17:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3h5YhApDdKtuz+D+gnGApd0B+4LCatw0L0XfiuEsBxQ=;
 b=NVJuR8bVMlcOgsf2yYP8qr45fff0pzpYW0BCQbtA3MsNrrnNBYVUkrPCtjMGuEx2eR
 vHG5rVpaM7qaL5D6ZhjkHfMm284dwMFpk/jTbelXuYGLLAopmskm5XPWQcubU3dyFgQP
 G88QxB3Jcb/plkyiz6fe5BqXD8nxBJ2xf0peSImUUZad5hQShUxqigYRk4Q9D8tv9p5a
 a8lcoGihpXhUGZiy7buZ+CKWHWGu0mF5S/9l1l5Cy2SeI8i3kGeBCygVnoSpYlUNWgIQ
 22K9B0rcSqbfpLPD7mNpTKq7npU9JgB0CxGqWN97IT2niY6foO3t3Au+1txtUD0IGOth
 +r5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3h5YhApDdKtuz+D+gnGApd0B+4LCatw0L0XfiuEsBxQ=;
 b=U89IGB4d29p4pKJuUs7v2nI7Re9pIZ6LEiTPwg3hMH+GVFt3kIIftXJHntbK2unGuo
 MRZIDub8UNFQRUm5NHAlSyXf1iLr7MvO1l3jLi3h0bqGvxtk0OYlmRN8XZvIcQ5YUXSf
 QyiQ9BdTSYBkXuE6sNpNNJURXEsb+HiM3d5wNGunII7IWygJTZNTi2KbGT97cpVV1UYG
 iy7T+ZlF0D5lQa8PCAZ9NAuV8uHLRoWOg0iwL4EcS/KD2mRWIaBjdEHKN7KgHjsgBquC
 YI8uTMFlTYIAuc9L1rWANB8jDwl3PI27g4smgSdmcJfLY8MMvLJxOxHaHb/7lQxt2AQg
 9XMA==
X-Gm-Message-State: APjAAAVpe6YJCAQ4hVjWAFiEJbqTZpSNbbeIZTqVvRySk5LRkDgiehr9
 6TIEdTvuwwUuIiL61z6A43qE3/kRXcHGG7inmbYNAQ==
X-Google-Smtp-Source: APXvYqwSiGgQfEWih9ymT87LJVnnaDlghzrxFki3OwEuC0IQ+sLwt8v1OcRFgydIQHHbkPzCMKjT6aFqwtFQHE75p7Y=
X-Received: by 2002:a19:f512:: with SMTP id j18mr3365169lfb.169.1568160195293; 
 Tue, 10 Sep 2019 17:03:15 -0700 (PDT)
MIME-Version: 1.0
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
 <1568123236-767-5-git-send-email-claudiu.beznea@microchip.com>
 <20190910143231.GB14966@e107533-lin.cambridge.arm.com>
 <ab43b209-78fa-0cab-b8ea-acd4c550e689@microchip.com>
 <20190910150826.GA18308@e107533-lin.cambridge.arm.com>
 <20190910151055.GX21254@piout.net>
In-Reply-To: <20190910151055.GX21254@piout.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 11 Sep 2019 01:03:03 +0100
Message-ID: <CACRpkda4mmpbPWa2nD93CvD6HWzcTUDzyyLdQxC2gNB7XiJF3w@mail.gmail.com>
Subject: Re: [PATCH 4/7] dt-bindings: chosen: Add clocksource and clockevent
 selection
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190910_170317_175650_AA281535 
X-CRM114-Status: GOOD (  18.79  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Tomer Maimon <tmaimon77@gmail.com>, "Nori, Sekhar" <nsekhar@ti.com>,
 guoren@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Ludovic Desroches <Ludovic.Desroches@microchip.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>,
 Marc Zyngier <marc.zyngier@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-unisoc@lists.infradead.org, Krzysztof Halasa <khalasa@piap.pl>,
 Thomas Gleixner <tglx@linutronix.de>, Scott Branden <sbranden@broadcom.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>,
 Sascha Hauer <kernel@pengutronix.de>,
 Claudiu Beznea <Claudiu.Beznea@microchip.com>,
 Mark Rutland <mark.rutland@arm.com>, James Hogan <jhogan@kernel.org>,
 Palmer Dabbelt <palmer@sifive.com>, Eric Anholt <eric@anholt.net>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Lyra Zhang <zhang.lyra@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Jon Hunter <jonathanh@nvidia.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Kukjin Kim <kgene@kernel.org>,
 Alexandre TORGUE <alexandre.torgue@st.com>,
 MSM <linux-arm-msm@vger.kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Florian Fainelli <f.fainelli@gmail.com>, John Stultz <john.stultz@linaro.org>,
 linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Barry Song <baohua@kernel.org>, Imre Kaloz <kaloz@openwrt.org>,
 Stephen Boyd <sboyd@kernel.org>, Patrice CHOTARD <patrice.chotard@st.com>,
 Stefan Wahren <wahrenst@gmx.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-tegra@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Benjamin Fair <benjaminfair@google.com>, Alexander Shiyan <shc_work@mail.ru>,
 Krzysztof Kozlowski <krzk@kernel.org>, Nancy Yuen <yuenn@google.com>,
 Chen-Yu Tsai <wens@csie.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Orson Zhai <orsonzhai@gmail.com>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Ray Jui <rjui@broadcom.com>, Vladimir Zapolskiy <vz@mleia.com>,
 John Crispin <john@phrozen.org>, tali.perry1@gmail.com,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Ley Foon Tan <lftan@altera.com>, linux-oxnas@groups.io,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Baruch Siach <baruch@tkos.co.il>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Liviu Dudau <liviu.dudau@arm.com>, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Russell King <linux@armlinux.org.uk>, Andy Gross <agross@kernel.org>,
 Sylvain Lemieux <slemieux.tyco@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, aou@eecs.berkeley.edu,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Michal Simek <monstr@monstr.eu>,
 Baolin Wang <baolin.wang@linaro.org>, Vineet Gupta <vgupta@synopsys.com>,
 Nicolas Ferre <Nicolas.Ferre@microchip.com>,
 Tony Prisk <linux@prisktech.co.nz>,
 "moderated list:NIOS2 ARCHITECTURE" <nios2-dev@lists.rocketboards.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Sep 10, 2019 at 4:11 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> On 10/09/2019 16:08:26+0100, Sudeep Holla wrote:
> > On Tue, Sep 10, 2019 at 02:51:50PM +0000, Claudiu.Beznea@microchip.com wrote:

> > In that case, why can't we identify capability that with the compatibles
> > for this timer IP ?
> >
> > IOW, I don't like the proposal as it's hardware limitation.
>
> To be clear, bot timers are exactly the same but can't be clocksource
> and clockevent at the same time. Why would we have different compatibles
> for the exact same IP?

In that case why not just pick the first one you find as clocksource
and the second one as clock event? As they all come to the
same timer of init function two simple local state variables can
solve that:

static bool registered_clocksource;
static bool registered_clockevent;

probe(timer) {
   if (!registered_clocksource) {
       register_clocksource(timer);
       registrered_clocksource = true;
       return;
   }
   if (!registered_clockevent) {
       register_clockevent(timer);
       registered_clockevent = true;
       return;
   }
   pr_info("surplus timer %p\n", timer);
}

Clocksource and clockevent are natural singletons so there is
no need to handle more than one of each in a driver for identical
hardware.

With the Integrator AP timer there is a real reason to select one over
the other but as I replied to that patch it is pretty easy to just identify
which block has this limitation by simply commenting out the IRQ
line for it from the device tree.

Maybe there is something about this I don't understand.

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
