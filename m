Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BC6C0015E
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Aug 2023 12:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rgE7D55NM1BIFbOFPd+Fs2RVYZxbduhDGZ1MApfy+PM=; b=1sO7uuqRD5m4Kd
	jProPq+Ute/9uy4SGmDIpDee/yVwKoX5NLHTa5DpOBQLYGgxvq37jpX8YO7rSn26/vCTJ7o8IB6ak
	Dop3d1t5loF+PDyxjzGf5UOiTVdTfOySFN48nGzxVJRrBBTh1kfq0MR1uNFp2r2k2raLz4qnNVlHU
	U6u4qunC1jA98HzEn1FV3LHeCuUwgHB1GFBuAPEO2PgOvDKWMefp/+ekjD5atGONranaqaMT5LaOn
	HKtTPToDtg7mxRxaWEKs/XkMgtCtmom8tZOQ3NC6zE9RqW+7HVs3ltl0LSJQlVkstbhHVnxmiSZS+
	AjfcOqCmVTEczX1fkXsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQoyH-002PPC-1z;
	Tue, 01 Aug 2023 12:59:29 +0000
Received: from [2001:4d48:ad52:32c8:5054:ff:fe00:142] (helo=pandora.armlinux.org.uk)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQoyC-002P9j-22;
	Tue, 01 Aug 2023 12:59:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=A1UXyGi4tVO1CNUnpyY8C1O55E/6x79wyybqrcHbfvA=; b=0IC1RGg2Hm6kgEu7PxHbmxTU0D
	h4LJEtklGDODfDxqL2zvXibphfmcLkhnLMgU90+1UpkswU7hCpTMnwdIqFZ66X7KG2ZWjWUk1udRh
	AIjs13najytZS+5vLWfUkcs59o4/5QI4VE0ucL1cnJKiYdxOORrbtKxvtnryYUNaRwkcZ25TUwSDi
	e6+btWY5g4lPajiNzOpQoRTulBSlMq1EaEqiY7RXswMvxBMbMHcHt9m3UwmtICalV3EREDwXtJLXV
	dXHZurCfRd1AjEA7F8zW64y/dM6jBybCT5fSPMmAq3AKLU1fKA2xjL7nrEQJRhYcOLqvg5fO/RAMA
	hhpXN4LA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55550)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qQovd-00045o-14;
	Tue, 01 Aug 2023 13:56:45 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qQovY-0000i5-6Y; Tue, 01 Aug 2023 13:56:40 +0100
Date: Tue, 1 Aug 2023 13:56:40 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Johannes Zink <j.zink@pengutronix.de>
Cc: Shenwei Wang <shenwei.wang@nxp.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Simon Horman <simon.horman@corigine.com>,
	Andrew Halaney <ahalaney@redhat.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Wong Vee Khee <veekhee@apple.com>,
	Revanth Kumar Uppala <ruppala@nvidia.com>,
	Jochen Henneberg <jh@henneberg-systemdesign.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
	Frank Li <frank.li@nxp.com>
Subject: Re: [PATCH v3 net 2/2] net: stmmac: dwmac-imx: pause the TXC clock
 in fixed-link
Message-ID: <ZMkBCGJrX/COB5+f@shell.armlinux.org.uk>
References: <20230731161929.2341584-1-shenwei.wang@nxp.com>
 <20230731161929.2341584-3-shenwei.wang@nxp.com>
 <bf2979c4-0b63-be53-b530-3d7385796534@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bf2979c4-0b63-be53-b530-3d7385796534@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_055924_692051_1CA0EE5F 
X-CRM114-Status: GOOD (  18.86  )
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

On Tue, Aug 01, 2023 at 02:47:46PM +0200, Johannes Zink wrote:
> Hi Shenwei,
> 
> thanks for your patch.
> 
> On 7/31/23 18:19, Shenwei Wang wrote:
> > When using a fixed-link setup, certain devices like the SJA1105 require a
> > small pause in the TXC clock line to enable their internal tunable
> > delay line (TDL).
> 
> If this is only required for some devices, is it safe to enforce this
> behaviour unconditionally for any kind of fixed link devices connected to
> the MX93 EQOS or could this possibly break for other devices?

This same point has been raised by Andrew Halaney in message-id
 <4govb566nypifbtqp5lcbsjhvoyble5luww3onaa2liinboguf@4kgihys6vhrg>
and Fabio Estevam in message-id
 <CAOMZO5ANQmVbk_jy7qdVtzs3716FisT2c72W+3WZyu7FoAochw@mail.gmail.com>
but we don't seem to have any answer for it.

Also, the patch still uses wmb() between the write and the delay, and as
Will Deacon pointed out in his message, message-id
 <20230728153611.GH21718@willie-the-truck>
this is not safe, yet still a new version was sent.

It seems the author of these patches is pretty resistant to comments,
and has shown that when I was requesting changes - it was an awful
struggle to get changes made. I'm now of the opinion that I really
can't be bothered to review these patches, precisely because feedback
is clearly not welcome or if welcome, apparently acted upon.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
