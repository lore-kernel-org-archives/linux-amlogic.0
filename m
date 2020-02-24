Return-Path: <SRS0=TU6n=4M=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DC75C35673
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Feb 2020 00:08:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EC062067D
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 Feb 2020 00:08:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LNTC5mOQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aj.id.au header.i=@aj.id.au header.b="VnESUfjI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZNNDRlge"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EC062067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zaWR3CHk+BgP7+nU3pOtHtfi7IhpR5L4b6nkthI8ook=; b=LNTC5mOQrHbycH
	a6RydzLJ9jkKyHGf8dI+D5wFJ9Ekx3vs3IZWcFKOSSUdhLPo09fSzFv0qG4HR4fMdmwznZMWrcgzJ
	50cFM7YEZmKwuOPJBcTM0LSoxnkqLa6nivHZFlbYQ+uzHNP1lc12X+2dRl8p1jVpXzhWksTRzWf55
	vgA1JJq0Ezvfghjo/YzHApwGXACiFnTQgoKzkCAjeaCRvWpWcSlRot14iohUEDbpltcS0G2LVs8DT
	PQWimVgezFAnNoieP02KoDl683303VC3EWfDGAU39vYFEAnWbTP0pWIijEF53979GOlV9Nc0bkISv
	oTqvPOgZkt/Wy3UAICOQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j61I5-00088X-0N; Mon, 24 Feb 2020 00:08:05 +0000
Received: from new2-smtp.messagingengine.com ([66.111.4.224])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j61I2-000881-Me; Mon, 24 Feb 2020 00:08:04 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 63CCF4970;
 Sun, 23 Feb 2020 19:08:01 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 23 Feb 2020 19:08:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=T6vwYsNt81W4QVG/9yltC3IUmOKJa1U
 I+5Ub1sDqeVo=; b=VnESUfjI+wUMSIT8zSJGjTjnvN1Q6rr2atMpcMbCiiUf2+2
 Htwj6KXEQ+XoQRcjudVhDCcOwskF5C1aPYvls8CtF8hE8ijxhlKEcUWpiHHfBaAZ
 RpBN1jLdSnyFw84+0hMNBkJ0+OEsYJGQuZNZjX5qRvLg1blNdOimuZZwWcwoWWCx
 732ASIGjAnnvLOOg7YHQR1vlBbNzr171taEkuNgFM20PTEYUDefcvNl7ZX15Gs35
 GsdHQ03GOvWx4WvDhTTMdtdU/bjgc4UOt1YDe2sWngY4InuumosjKbGVluxYI2Gk
 DXJAwIJBsbVFjHC2syobhh/mok5s6BA6yGVUKYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=T6vwYs
 Nt81W4QVG/9yltC3IUmOKJa1UI+5Ub1sDqeVo=; b=ZNNDRlgevio2rb1a2YaTdE
 Qh34z29wQha3NxZnLqb4sYgCoqWwSVGOaN85Z1tMwRlBFQ3HmBELRcWX1sbS+ZOn
 uca2u05lvw56h0AhBDmYL7GywahUSivkTeGdScJRJ+Df5lqlXNbJ98X7dFa2rHdg
 aPrJdsyIKFJaWcMbMDKBZ4yHnWV0K8q9N4XGuqMx8KOrBRvXlh/jzeAYPZM5vCLg
 H6n/Jxzkrik6LKX4S7HO9BzQddCi3OYYE3U2CyVDQbVN0yRULkmdPGLEBCUzqEPg
 bHZtoDzF5du9tdhPH1ZhcWUnv2VOILcVgZtsBYNKKMsO5m47EgsSWZrvllqtTRLA
 ==
X-ME-Sender: <xms:3xNTXuMK-zhhnncLV5GITMkthKNZCwFHS9K-h156U1hfu4YOnYXcfw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrkeelgddulecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
 rdhiugdrrghu
X-ME-Proxy: <xmx:3xNTXpKC6qAm2Ahf3jxHo-c3o35FJiwIPLiVui0zfDrFEiy9M2fphQ>
 <xmx:3xNTXoJ6X6pRGcZd4emhfEMOflc3Kmf1s7dH19zKHqpXHgcQl_HQ-A>
 <xmx:3xNTXtX3k9pxeGni1WpGnPZwqOfxVh2mLDy8Dda6Ugrn6Keb7aq2nA>
 <xmx:4RNTXotkO9aFVT3yBWk2fO4CBlxxh66eNbaJcXLMJnGGDcoDtR9m6A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 16150E00A2; Sun, 23 Feb 2020 19:07:59 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-802-g7a41c81-fmstable-20200203v1
Mime-Version: 1.0
Message-Id: <41551c09-5443-4980-9c6f-6bc7f48aa356@www.fastmail.com>
In-Reply-To: <83c5df4acbbe0fa55a1d58d4c4a435b51cd2a7ad.1582361737.git.mchehab+huawei@kernel.org>
References: <cover.1582361737.git.mchehab+huawei@kernel.org>
 <83c5df4acbbe0fa55a1d58d4c4a435b51cd2a7ad.1582361737.git.mchehab+huawei@kernel.org>
Date: Mon, 24 Feb 2020 10:37:53 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
 "Linux Doc Mailing List" <linux-doc@vger.kernel.org>
Subject: =?UTF-8?Q?Re:_[PATCH_2/7]_docs:_dt:_fix_several_broken_references_due_to?=
 =?UTF-8?Q?_renames?=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200223_160802_877607_8C306490 
X-CRM114-Status: UNSURE (   4.99  )
X-CRM114-Notice: Please train this message.
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
Cc: Stuart Yoder <stuyoder@gmail.com>, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Pavel Machek <pavel@ucw.cz>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, Amit Kucheria <amit.kucheria@verdurent.com>,
 linux-aspeed@lists.ozlabs.org, Jonathan Corbet <corbet@lwn.net>,
 Kevin Hilman <khilman@baylibre.com>, openbmc@lists.ozlabs.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Joel Stanley <joel@jms.id.au>,
 Philipp Zabel <p.zabel@pengutronix.de>, Zhang Rui <rui.zhang@intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Jyri Sarha <jsarha@ti.com>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Dan Murphy <dmurphy@ti.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>, Stephen Boyd <sboyd@kernel.org>,
 Andy Gross <agross@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



On Sat, 22 Feb 2020, at 19:30, Mauro Carvalho Chehab wrote:
> Several DT references got broken due to txt->yaml conversion.
> 
> Those are auto-fixed by running:
> 
> 	scripts/documentation-file-ref-check --fix
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
...
>  .../bindings/pinctrl/aspeed,ast2400-pinctrl.yaml          | 2 +-
>  .../bindings/pinctrl/aspeed,ast2500-pinctrl.yaml          | 2 +-
>  .../bindings/pinctrl/aspeed,ast2600-pinctrl.yaml          | 2 +-

Acked-by: Andrew Jeffery <andrew@aj.id.au>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
