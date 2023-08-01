Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF1BC00528
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Aug 2023 19:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IAueeGL9/yzCtdLo2krCGhAagt8NUkwEVWsywQD52Oo=; b=h0xy2lKHK7zxny
	vobn8hTPAO/3nQ+Fn6sDi6l/KlBEWkzAypFxDoBpqOP2OXOtO12GXcArKfzxqhn4n9iUe0Oq86pXe
	b666BMSecYeaDFJrcoSY3ClCi/SH0jsVf0Xft84yiRJqfUQgfzPaymq5aCRa3XnKhakjg+6VNGD1m
	cUn3XyuuXpRWl8AZFqnkzEi//xG05NoT8L3KMyOKiGw8z446kn7k22FV6QbNkA3Py9kkruiTpgqmC
	PxTAO2BE9fTkKBOQ+hLggPcuz0ohlMm2RKG4RW9O8PesgTm2gkbqoe1vxyYc2fn4g2pRtrfX/ff1N
	hAaMoV8C7CPH1CXLJ3Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQvVq-003BVS-1J;
	Tue, 01 Aug 2023 19:58:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQvVo-003BUT-1J;
	Tue, 01 Aug 2023 19:58:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 44ECB616D1;
	Tue,  1 Aug 2023 19:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7976AC433C7;
	Tue,  1 Aug 2023 19:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690919910;
	bh=79BwIOnM6SioCje3neXfEamXafGIUojs9GGzwDzIaT8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WaG0UuuiBslQIwwDoxSGmwylSNwUwUH7DIQ7eAy76ZMwNQxm6uzQTZe+DpR8IvAQD
	 AR9sF34c6pu020pThaegFYojP886SrOpKscmfRnTNlEgNYWd06/PU127Un7orzG1/E
	 9rUKbhIJY4SvTChDop2NC6sJMRkZgC9FxkLKSBCJ5AX8gdvgUcXJEF/V5ZaRjvw4ws
	 g4igCCOm2Ui3wG63wvnwlKi2DoXv7gVow1xbUTW25ecmVHjRgzWHzoVjMTgMGAYnGS
	 yrqItcGmOO8B2dQEyoty0KKnJhLztUcShDR3TUA3S9ggYOAW7cy5RY8WUi7dlpa5+q
	 jNZZJhtmtcNHQ==
Date: Tue, 1 Aug 2023 12:58:28 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Vinod
 Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Jose
 Abreu <joabreu@synopsys.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
 Simon Horman <simon.horman@corigine.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Nobuhiro Iwamatsu
 <nobuhiro1.iwamatsu@toshiba.co.jp>, Fabio Estevam <festevam@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>, Wong Vee Khee <veekhee@apple.com>,
 dl-linux-imx <linux-imx@nxp.com>, Andrew Halaney <ahalaney@redhat.com>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Revanth Kumar Uppala
 <ruppala@nvidia.com>, Jochen Henneberg <jh@henneberg-systemdesign.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Pengutronix Kernel Team
 <kernel@pengutronix.de>
Subject: Re: [EXT] Re: [PATCH v3 net 1/2] net: stmmac: add new mode
 parameter for fix_mac_speed
Message-ID: <20230801125828.209c5e88@kernel.org>
In-Reply-To: <AS8PR04MB9176FC45B9663B5BF964F58A890AA@AS8PR04MB9176.eurprd04.prod.outlook.com>
References: <20230731161929.2341584-1-shenwei.wang@nxp.com>
	<20230731161929.2341584-2-shenwei.wang@nxp.com>
	<20230801-portside-prepaid-513f1f39f245-mkl@pengutronix.de>
	<AS8PR04MB9176FC45B9663B5BF964F58A890AA@AS8PR04MB9176.eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_125832_545455_4BB34A62 
X-CRM114-Status: GOOD (  24.12  )
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

On Tue, 1 Aug 2023 18:43:52 +0000 Shenwei Wang wrote:
> Subject: RE: [EXT] Re: [PATCH v3 net 1/2] net: stmmac: add new mode parameter  for fix_mac_speed

Looks like new platform enablement, the correct tree to target this 
at is net-next (i.e. [PATCH net-next]).

> > -----Original Message-----
> > From: Marc Kleine-Budde <mkl@pengutronix.de>
> > Sent: Tuesday, August 1, 2023 1:37 AM
> > To: Shenwei Wang <shenwei.wang@nxp.com>
> > Cc: Russell King <linux@armlinux.org.uk>; David S. Miller
> > <davem@davemloft.net>; Eric Dumazet <edumazet@google.com>; Jakub
> > Kicinski <kuba@kernel.org>; Paolo Abeni <pabeni@redhat.com>; Maxime
> > Coquelin <mcoquelin.stm32@gmail.com>; Shawn Guo <shawnguo@kernel.org>;
> > Sascha Hauer <s.hauer@pengutronix.de>; Neil Armstrong
> > <neil.armstrong@linaro.org>; Kevin Hilman <khilman@baylibre.com>; Vinod
> > Koul <vkoul@kernel.org>; Chen-Yu Tsai <wens@csie.org>; Jernej Skrabec
> > <jernej.skrabec@gmail.com>; Samuel Holland <samuel@sholland.org>; Jose
> > Abreu <joabreu@synopsys.com>; imx@lists.linux.dev; Simon Horman
> > <simon.horman@corigine.com>; Alexandre Torgue
> > <alexandre.torgue@foss.st.com>; Giuseppe Cavallaro
> > <peppe.cavallaro@st.com>; Nobuhiro Iwamatsu
> > <nobuhiro1.iwamatsu@toshiba.co.jp>; Fabio Estevam <festevam@gmail.com>;
> > linux-stm32@st-md-mailman.stormreply.com; Jerome Brunet
> > <jbrunet@baylibre.com>; Bartosz Golaszewski
> > <bartosz.golaszewski@linaro.org>; Wong Vee Khee <veekhee@apple.com>; dl-
> > linux-imx <linux-imx@nxp.com>; Andrew Halaney <ahalaney@redhat.com>;
> > Bhupesh Sharma <bhupesh.sharma@linaro.org>; Martin Blumenstingl
> > <martin.blumenstingl@googlemail.com>; Revanth Kumar Uppala
> > <ruppala@nvidia.com>; Jochen Henneberg <jh@henneberg-systemdesign.com>;
> > linux-amlogic@lists.infradead.org; linux-arm-kernel@lists.infradead.org;
> > netdev@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel
> > Team <kernel@pengutronix.de>
> > Subject: [EXT] Re: [PATCH v3 net 1/2] net: stmmac: add new mode parameter
> > for fix_mac_speed

Why is this quote included? Please get a sane email client.

> > On 31.07.2023 11:19:28, Shenwei Wang wrote:  
> > > A mode parameter has been added to the callback function of
> > > fix_mac_speed to indicate the physical layer type.
> > >
> > > The mode can be one the following:
> > > 	MLO_AN_PHY	- Conventional PHY
> > > 	MLO_AN_FIXED	- Fixed-link mode
> > > 	MLO_AN_INBAND	- In-band protocol
> > >
> > > Also use short version of 'uint' to replace the 'unsigned int' in the
> > > function definitions.  
> > 
> > There are not many users of 'uint' in the kernel and it's not used in the stmmac
> > driver so far. From my point of view I would not introduce it and stick to the
> > standard 'unsigned int'.
> 
> Using 'uint' makes the code look cleaner because adding one extra
> parameter may cause some function declarations to span multiple
> lines.  This change keeps function declarations compact on a single
> line.

Marc is right. Just do it.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
