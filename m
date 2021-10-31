Return-Path: <SRS0=DVbv=PT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7977C433EF
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 Oct 2021 22:16:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EEC360C51
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 Oct 2021 22:16:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4EEC360C51
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DRv2b6f3mNBW8yH3Wsd5BzLMGJwQpVusE+vKrVnnDZU=; b=Of9hnx1Zx4en52
	2PAauUTAhulbep0BJc9ahdyHXmAQEuEcJVyYNqK2787k50Wad2imtYT9SMYIWgu0NDuJrLOFk22O9
	lS5LxrcZLGz2ZXBiLoiOUZXrLcw8BIQyoDHUfmZaK2xdd0CazKqCjVuM66N3G4TbispRPhgTZmZkE
	HEFe0Tv+QJJOz8WAde42XEcLWovlVUJxmtryO54n+uV8pVRryqpBjkUxtcDw1pgi8RuJczVBk0myB
	wE/uj35jG/bSqEM1O3ZDYphFwh+WBdr6zoHb24jBVGpwBXpLwivw3QKjf/hp0fCorz/GMGB+N9Ppy
	r8bMFx1TwuqhyEGuFupg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhJ84-00EmtN-TU; Sun, 31 Oct 2021 22:16:40 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhJ7h-00EmnV-61; Sun, 31 Oct 2021 22:16:18 +0000
Received: from p508fde95.dip0.t-ipconnect.de ([80.143.222.149]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mhJ7W-0001BA-FH; Sun, 31 Oct 2021 23:16:06 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 David Heidelberg <david@ixit.cz>
Cc: ~okias/devicetree@lists.sr.ht, phone-devel@vger.kernel.org,
 David Heidelberg <david@ixit.cz>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 2/3] arm64: dts: make dts use gpio-fan matrix instead
 of array
Date: Sun, 31 Oct 2021 23:16:05 +0100
Message-ID: <6620342.YEPOndrCoh@phil>
In-Reply-To: <20211029114948.41841-2-david@ixit.cz>
References: <20211029114948.41841-1-david@ixit.cz>
 <20211029114948.41841-2-david@ixit.cz>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211031_151617_292206_9217AF71 
X-CRM114-Status: GOOD (  10.27  )
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

Am Freitag, 29. Oktober 2021, 13:49:45 CET schrieb David Heidelberg:
> No functional changes.
> 
> Adjust to comply with dt-schema requirements
> and make possible to validate values.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts | 9 +++++----
>  arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts     | 2 +-
>  arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtsi     | 2 +-
>  arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts    | 5 +++--

for the Rockchip boards:
Acked-by: Heiko Stuebner <heiko@sntech.de>




_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
