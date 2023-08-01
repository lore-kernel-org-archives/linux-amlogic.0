Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E0C2C0015E
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Aug 2023 17:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2xs+iXB4074cu0zcIhKdnFAik1fP7mzRXeR8Zs6Ov4A=; b=3PWT+Ugg99H0ko
	Cp1taBPhcSlNP+3lSqOLV1w1XdueNq3lSIcvnnGVj20pUoDTX9x8ajsfziW0UNBs8t28U4SYQML0u
	Oy2VbpH0YqAeIJefi7edI8/bT/iXQpdz83uoCfJr5BqmYRTDeiqK2MTWExI7pfS7EbDQKM90bHaYn
	fo9VdvyU7H9CXgTvN7efu2Kc0w8pbpeyGHlb/0jmBc6z0tRrtUmZGJdcvRgDiIWxKG4sbv3XDL/g0
	r5U9pYKdN+IKq9y5mSE7KUy9FqNuzrsIu/rJMeK1kuxPKCB1GeGGHER1W5mhZz8rJl1LoUSyzDLZN
	FrItznAnBuVW2ARYh0AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQt6O-002upI-0q;
	Tue, 01 Aug 2023 17:24:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQt6L-002uoJ-1Z
	for linux-amlogic@lists.infradead.org;
	Tue, 01 Aug 2023 17:24:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690910643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+xn3eAMGq07q5lKeOtXwb0xhFpvRYswY7sySLx8S8uc=;
	b=d/nXXZxJiGSyCzwq0mpnJxyEoNvMRpz5szF3oW3zxPoOmlUBFJDIlaHk6Ka58h83PeaQOV
	xhlKtVIzEbNMF6HVvbQbL1+F81/xcD5kj+kYLJfpbyn9V5syMzVCUm/rurLqZj03k+mq3v
	BGJL85XhlULHtqFOADKXF7bCVoT97v4=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-cg3PHIIBMaSKM7Y1Qqc6Lg-1; Tue, 01 Aug 2023 13:24:00 -0400
X-MC-Unique: cg3PHIIBMaSKM7Y1Qqc6Lg-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-63d2ce64a58so56654016d6.3
        for <linux-amlogic@lists.infradead.org>; Tue, 01 Aug 2023 10:24:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690910640; x=1691515440;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xn3eAMGq07q5lKeOtXwb0xhFpvRYswY7sySLx8S8uc=;
        b=V9FkuumKxLnKqCe4cOfY3kM2cKXTRD5+wUNvJtGvPJ7jTKjgVaopKB5kBCB627vB4d
         yqPbkIQmt9t+AUkWO7QKszqyMUcD21GSfhRKLFYqMQhZfq3+a8b72SxSTjyfwNAvjuc1
         tNKTE5xnTFYeKAKnhI9N55a+K6EQ98zOWb3MSSlABizZyoILfLQARSbxNRf3SXC0M38O
         Zq2XuuSRKdhm6yR+8MEBeCX2+jGlaTPfksr4BHxknHoEs0jFYdV5IaqQjZY7ZQ+mPZce
         S+Kzniu/SvdLOKuqMMzXclCPnEhXkbwWbhFto8nn5O9w8eL5+NysUZLTduWhHZA1vucX
         BcYA==
X-Gm-Message-State: ABy/qLYwZrsIkesv2+qGjWon7McqFMTrAbB3UHdQ5pc4wyw+rD4RlTyT
	a3CD8y0zS7v+qwkn131f1zgh1hvUhsvXhrL8LIpIg+UolBYeTaaBotWcpb7BnhTGTPGOCfZuEN0
	78c3CSdNUGZqdaeknHDWKfUzGQsRpsc0=
X-Received: by 2002:ac8:7f82:0:b0:40d:4c6:bcd8 with SMTP id z2-20020ac87f82000000b0040d04c6bcd8mr9326406qtj.58.1690910639746;
        Tue, 01 Aug 2023 10:23:59 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGSypiuFIG8fuhXUpkOosWEI1DPcjZqq+VDqRQ2Q4IGwgSH7r27Hjm6MOKpRcjM5bj1X8CnKA==
X-Received: by 2002:ac8:7f82:0:b0:40d:4c6:bcd8 with SMTP id z2-20020ac87f82000000b0040d04c6bcd8mr9326391qtj.58.1690910639458;
        Tue, 01 Aug 2023 10:23:59 -0700 (PDT)
Received: from fedora ([2600:1700:1ff0:d0e0::45])
        by smtp.gmail.com with ESMTPSA id y24-20020a37e318000000b0076cb3ea651fsm1602448qki.134.2023.08.01.10.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 10:23:59 -0700 (PDT)
Date: Tue, 1 Aug 2023 12:23:56 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Russell King <linux@armlinux.org.uk>, 
	Johannes Zink <j.zink@pengutronix.de>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
	Simon Horman <simon.horman@corigine.com>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Wong Vee Khee <veekhee@apple.com>, Revanth Kumar Uppala <ruppala@nvidia.com>, 
	Jochen Henneberg <jh@henneberg-systemdesign.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	Frank Li <frank.li@nxp.com>
Subject: Re: [EXT] Re: [PATCH v3 net 2/2] net: stmmac: dwmac-imx: pause the
 TXC clock in fixed-link
Message-ID: <u5u7cdgfjpvyiu4usegrg3ukrmniq7z7eyzgajlldwqd7r55nr@lal546vvmfdy>
References: <20230731161929.2341584-1-shenwei.wang@nxp.com>
 <20230731161929.2341584-3-shenwei.wang@nxp.com>
 <bf2979c4-0b63-be53-b530-3d7385796534@pengutronix.de>
 <ZMkBCGJrX/COB5+f@shell.armlinux.org.uk>
 <PAXPR04MB9185207744645A9064D2ACF5890AA@PAXPR04MB9185.eurprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PAXPR04MB9185207744645A9064D2ACF5890AA@PAXPR04MB9185.eurprd04.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_102405_612331_B6CB20E0 
X-CRM114-Status: GOOD (  39.75  )
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

On Tue, Aug 01, 2023 at 05:06:46PM +0000, Shenwei Wang wrote:
> 
> 
> > -----Original Message-----
> > From: Russell King <linux@armlinux.org.uk>
> > Sent: Tuesday, August 1, 2023 7:57 AM
> > To: Johannes Zink <j.zink@pengutronix.de>
> > Cc: Shenwei Wang <shenwei.wang@nxp.com>; David S. Miller
> > <davem@davemloft.net>; Eric Dumazet <edumazet@google.com>; Jakub
> > Kicinski <kuba@kernel.org>; Paolo Abeni <pabeni@redhat.com>; Maxime
> > Coquelin <mcoquelin.stm32@gmail.com>; Shawn Guo <shawnguo@kernel.org>;
> > Sascha Hauer <s.hauer@pengutronix.de>; Neil Armstrong
> > <neil.armstrong@linaro.org>; Kevin Hilman <khilman@baylibre.com>; Vinod
> > Koul <vkoul@kernel.org>; Chen-Yu Tsai <wens@csie.org>; Jernej Skrabec
> > <jernej.skrabec@gmail.com>; Samuel Holland <samuel@sholland.org>;
> > Giuseppe Cavallaro <peppe.cavallaro@st.com>; Alexandre Torgue
> > <alexandre.torgue@foss.st.com>; Jose Abreu <joabreu@synopsys.com>;
> > Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> > <festevam@gmail.com>; dl-linux-imx <linux-imx@nxp.com>; Jerome Brunet
> > <jbrunet@baylibre.com>; Martin Blumenstingl
> > <martin.blumenstingl@googlemail.com>; Bhupesh Sharma
> > <bhupesh.sharma@linaro.org>; Nobuhiro Iwamatsu
> > <nobuhiro1.iwamatsu@toshiba.co.jp>; Simon Horman
> > <simon.horman@corigine.com>; Andrew Halaney <ahalaney@redhat.com>;
> > Bartosz Golaszewski <bartosz.golaszewski@linaro.org>; Wong Vee Khee
> > <veekhee@apple.com>; Revanth Kumar Uppala <ruppala@nvidia.com>; Jochen
> > Henneberg <jh@henneberg-systemdesign.com>; netdev@vger.kernel.org; linux-
> > stm32@st-md-mailman.stormreply.com; linux-arm-kernel@lists.infradead.org;
> > linux-kernel@vger.kernel.org; linux-amlogic@lists.infradead.org;
> > imx@lists.linux.dev; Frank Li <frank.li@nxp.com>
> > Subject: [EXT] Re: [PATCH v3 net 2/2] net: stmmac: dwmac-imx: pause the TXC
> > clock in fixed-link
> >
> > Caution: This is an external email. Please take care when clicking links or
> > opening attachments. When in doubt, report the message using the 'Report this
> > email' button
> >
> >
> > On Tue, Aug 01, 2023 at 02:47:46PM +0200, Johannes Zink wrote:
> > > Hi Shenwei,
> > >
> > > thanks for your patch.
> > >
> > > On 7/31/23 18:19, Shenwei Wang wrote:
> > > > When using a fixed-link setup, certain devices like the SJA1105
> > > > require a small pause in the TXC clock line to enable their internal
> > > > tunable delay line (TDL).
> > >
> > > If this is only required for some devices, is it safe to enforce this
> > > behaviour unconditionally for any kind of fixed link devices connected
> > > to the MX93 EQOS or could this possibly break for other devices?
> >
> > This same point has been raised by Andrew Halaney in message-id
> > <4govb566nypifbtqp5lcbsjhvoyble5luww3onaa2liinboguf@4kgihys6vhrg>
> > and Fabio Estevam in message-id
> >
> > <CAOMZO5ANQmVbk_jy7qdVtzs3716FisT2c72W+3WZyu7FoAochw@mail.gmail.
> > com>
> > but we don't seem to have any answer for it.
> >
> Hi Russell,
> 
> I hope you have thoroughly read all of my earlier responses, as I believe I already addressed this question.
> I'm happy to clarify further, but kindly avoid unsubstantiated comments.
> 
> https://lore.kernel.org/imx/20230727152503.2199550-1-shenwei.wang@nxp.com/T/#m08da3797a056d4d8ea4c1d8956b445ae967e7cfa
> " Yes, that's the purpose because it won't hurt even the other side is not SJA1105."
> 
> > Also, the patch still uses wmb() between the write and the delay, and as Will
> > Deacon pointed out in his message, message-id
> > <20230728153611.GH21718@willie-the-truck>
> > this is not safe, yet still a new version was sent.
> >
> 
> Can we conclude that even without the wmb() here, the desired delay time between
> operations can still be ensured?

Will's talk[0] he linked has the sequence you've done here (writel's
followed by wmb() followed by a udelay), and he states it is wrong if
the goal is for the device to see the writes prior to the udelay. That's
discussed at around 28:00 and followed up by (thankfully, cuz I too
didn't understand it) a question at 34:10 to discuss why mb() isn't
sufficient (it completes the write, but the device *may not* see it
yet, the read forces that).

He mentioned that over at [1] in the review here, and suggested reading
from the device again prior to the udelay() instead to force the writes
to take affect on the device prior to the udelay.

I found a quick example in the ufs-qcom.c driver that I'll copy paste
here too from upstream that follows this advice:

		writel_relaxed(temp, host->dev_ref_clk_ctrl_mmio);

		/*
		 * Make sure the write to ref_clk reaches the destination and
		 * not stored in a Write Buffer (WB).
		 */
		readl(host->dev_ref_clk_ctrl_mmio);

		/*
		 * If we call hibern8 exit after this, we need to make sure that
		 * device ref_clk is stable for at least 1us before the hibern8
		 * exit command.
		 */
		if (enable)
			udelay(1);


[0] https://www.youtube.com/watch?v=i6DayghhA8Q
[1] https://lore.kernel.org/netdev/20230728153611.GH21718@willie-the-truck/

I hope that helps,
Andrew


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
