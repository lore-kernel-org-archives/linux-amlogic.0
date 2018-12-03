Return-Path: <SRS0=94bh=OM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08C85C04EB9
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 21:57:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB6CE20850
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 21:57:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MteKCw1E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB6CE20850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b1FQBwjVPQIN4p/EXV531qvDBGJwcs4RP381WaJME2s=; b=MteKCw1Ebr6HC0
	8q8cNZmLLaF2sh/hKqe/OBJurpszSaVc7KNP7uF+p6RX4bD51rHoA8XsORXQJ06XkTsJBLhY4uBiY
	+8KiXAYLoK8tBO9cFYPk5Wjgg5RTVoMcEVMhjiSTydDFjC+M737DcR1V1t9RkHq7BdH1uVBwfIVeZ
	zljrCawlz68flib45RKRpCjvdpnSSEnhywo+zw3WIo+l5wqbBoH17M7ZlKtGypI8ET26Q9J6E+eYj
	w8vltu7a78cefrDe7qpRT43P+aTxatuFzITw2U2YmdSGxBoapy9vHoxG3Sx7m1mhBzTamAYtS/Ch6
	OTc09+JeHinzAiI8cA2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gTwDR-000174-UQ; Mon, 03 Dec 2018 21:57:21 +0000
Received: from smtp11.smtpout.orange.fr ([80.12.242.133]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTwDM-00014m-GB
 for linux-amlogic@lists.infradead.org; Mon, 03 Dec 2018 21:57:19 +0000
Received: from belgarion ([90.89.234.36]) by mwinf5d89 with ME
 id 7Zww1z00H0nnJME03ZwwYC; Mon, 03 Dec 2018 22:57:04 +0100
X-ME-Helo: belgarion
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Mon, 03 Dec 2018 22:57:04 +0100
X-ME-IP: 90.89.234.36
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] ARM: dts: Kill off skeleton{64}.dtsi
In-Reply-To: <20181130170634.9467-1-robh@kernel.org> (Rob Herring's message of
 "Fri, 30 Nov 2018 11:06:34 -0600")
References: <20181130170634.9467-1-robh@kernel.org>
User-Agent: Gnus/5.130008 (Ma Gnus v0.8) Emacs/24.5 (gnu/linux)
X-URL: http://belgarath.falguerolles.org/
Date: Mon, 03 Dec 2018 22:56:56 +0100
Message-ID: <87wooquvdj.fsf@belgarion.home>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181203_135716_819035_B2E19B17 
X-CRM114-Status: GOOD (  15.37  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-oxnas@groups.io,
 Baruch Siach <baruch@tkos.co.il>, David Brown <david.brown@linaro.org>,
 Jamie Iles <jamie@jamieiles.com>, linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 =?utf-8?Q?Ra?= =?utf-8?Q?fa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@axis.com,
 Jon Mason <jonmason@broadcom.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>, arm@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, Hauke Mehrtens <hauke@hauke-m.de>,
 Andy Gross <andy.gross@linaro.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 Jason Cooper <jason@lakedaemon.net>,
 Antoine Tenart <antoine.tenart@bootlin.com>, Ray Jui <rjui@broadcom.com>,
 Sylvain Lemieux <slemieux.tyco@gmail.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>,
 linux-mediatek@lists.infradead.org, Lars Persson <lars.persson@axis.com>,
 Gregory Fong <gregory.0xf0@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Barry Song <baohua@kernel.org>, Brian Norris <computersforpeace@gmail.com>,
 Eric Miao <eric.y.miao@gmail.com>, Scott Branden <sbranden@broadcom.com>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Li Yang <leoyang.li@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Carlo Caione <carlo@caione.org>, Jun Nie <jun.nie@linaro.org>,
 Tsahee Zidenberg <tsahee@annapurnalabs.com>, Shawn Guo <shawnguo@kernel.org>,
 Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Rob Herring <robh@kernel.org> writes:

>  arch/arm/boot/dts/pxa2xx.dtsi                  |  3 ++-
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

-- 
Robert

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
