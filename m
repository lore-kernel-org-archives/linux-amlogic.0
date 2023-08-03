Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11EDBC0015E
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Aug 2023 06:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tjT8lFO1zOlXAtSmEG2kENjPraq9QUetbo6ZdgMEmkc=; b=ZXiSBjQtoOjMhE
	FLlUEm634sTnqWopN5Sj2a3ZA1/j5diPpG0nXbZXcJylM0ctu3pdNXbcciiSfFXUH8JWN1O6deS9N
	C670Wik9dg7V9wzqcDBRLwNkbh4EF7iK7pVYtpvAvDfB/TEfLCFUn+5lZ87BaLlr8y0zsNc1dC5nY
	11hp3uzi4LjxzXhjcacTfqf/vMVFuGFvxLM4gY49ZZMFXpE8vbF3eVXOlFEalf29PRmlC/TbJVLOK
	nfenCAuGY1wAdxNGBSM4ghq2WyPNwCzoFCL3tPH4IECc0pOzBQYDYZ0o4rdLXz8Z67jwQFE530aaD
	M2Cbf9tBHsxJy6SA3qCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRRxj-006mjT-0b;
	Thu, 03 Aug 2023 06:37:31 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRRxg-006miR-0j
	for linux-amlogic@lists.infradead.org;
	Thu, 03 Aug 2023 06:37:29 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.ext.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <j.zink@pengutronix.de>)
	id 1qRRwt-0004xV-Ry; Thu, 03 Aug 2023 08:36:39 +0200
Message-ID: <22f979e8-7591-3393-f323-114da0131e7a@pengutronix.de>
Date: Thu, 3 Aug 2023 08:36:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [EXT] Re: [PATCH v3 net 2/2] net: stmmac: dwmac-imx: pause the
 TXC clock in fixed-link
To: Shenwei Wang <shenwei.wang@nxp.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Simon Horman <simon.horman@corigine.com>,
 Andrew Halaney <ahalaney@redhat.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Wong Vee Khee <veekhee@apple.com>, Revanth Kumar Uppala
 <ruppala@nvidia.com>, Jochen Henneberg <jh@henneberg-systemdesign.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>, Frank Li <frank.li@nxp.com>
References: <20230731161929.2341584-1-shenwei.wang@nxp.com>
 <20230731161929.2341584-3-shenwei.wang@nxp.com>
 <bf2979c4-0b63-be53-b530-3d7385796534@pengutronix.de>
 <PAXPR04MB9185D7D3B088E4786A216044890AA@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <e32c89e1-7385-105b-63c9-74f58c2253cb@pengutronix.de>
 <PAXPR04MB91851BB5D1375AF0EF3C51B7890BA@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <49d52a10-20cf-9c5b-ebe3-07292664fe11@pengutronix.de>
 <PAXPR04MB9185C0C3B3E41534F555BC43890BA@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Language: en-US, de-DE
From: Johannes Zink <j.zink@pengutronix.de>
In-Reply-To: <PAXPR04MB9185C0C3B3E41534F555BC43890BA@PAXPR04MB9185.eurprd04.prod.outlook.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: j.zink@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_233728_262725_B379956D 
X-CRM114-Status: GOOD (  19.26  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Shenwei,

[snip]
>>>
>>>> Also: does this only apply to i.MX93, or would we have to test and
>>>> enable it on e.g. i.MX8MP as well?
>>>>
>>>
>>> Yes, it is required when the EQOS MAC is selected. However, this patch
>>> just enables The feature on i.MX93.
>>
>> If this behaviour is required on all EQOS, I think the name
>> imx_dwmac_fix_speed_mx93() is misleading. It should either be
>> imx_dwmac_fix_speed() if applicable to all imx implementations, or
>> dwmac_fix_speed() (and moved to a non-gluecode file) if applicable for all
>> implementations in general.
>>
> 
> It has the general fix_speed function there named imx_dwmac_fix_speed.
> This one is the special for this mx93 fix.

I think I might have misunderstood your last statement or I failed to express 
my point. If you need to replace the dwmac_fix_speed() on mx93, because this 
SoC implementation requires doing so (the usual reason for doing something like 
this is something like reset quirks because of screwed up IP Core integration), 
then your approach is imho valid.

But if I got your last comment right, your changes should apply to EQOS MAC in 
general (but you want to only enable it for mx93 at the moment). In this case 
this quirk will later be as the fix_mac_speed function for other hardware as 
well, in which case the name ..._mx93 is misleading, and imho rather a 
descriptive name should be used (i.e. have the name describe what it does 
rather than for what hardware it is implemented).

Except if the maintainers have a strong opinion that the ..._mx93 suffix 
version is exactly how you should proceed...

Best regards
Johannes

> 
> Thanks,
> Shenwei
> [snip]


-- 
Pengutronix e.K.                | Johannes Zink                  |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
