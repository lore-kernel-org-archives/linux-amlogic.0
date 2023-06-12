Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D665C7EE25
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Jun 2023 10:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DEd8JeZLgY0nCtunHWiMlM4ay6cLvvatJZW1FUkCY0o=; b=hM6yxmFCBBw2u/
	jfyVZUw/sK9VnD8spIy1zPLk7U7CduqSkwACAHyRc7H5u3PdPoXdBUpzCv0LTwwCYmXq1LSxiqXjs
	zSkho7uj7LV2aCI8DQT4myj+02F1mCzBIGu0+8rtaJl+yrkjCqGm3Zoj4Mj8bakpnLuTLwjeXsiwl
	C7Mm4XeG5ce3VyXrnryKE6wzFt6qudfT0DtpnBuDNAWsk/8E4sGQw+HmnzfrCDfil+Cyo0OV7mie6
	SRStuI/+FivSsXB9SJhVWmAk4nU1vFR0XFqjrIibvpQc/2dP2FE3LNf7EtflAZi5/GEpWTeVjTESU
	z5jPJZ8GkyyTHi9iCsLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8eLX-003P8b-1n;
	Mon, 12 Jun 2023 10:00:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8eLV-003P7S-1b;
	Mon, 12 Jun 2023 10:00:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A4B6B62348;
	Mon, 12 Jun 2023 10:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0CB2FC4339E;
	Mon, 12 Jun 2023 10:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686564020;
	bh=fd4cfXXX+PL9XfONOIfuuKx40StrUtxc6WwcSiy9Q0U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=iySDKzKjo2ln1pXfyHGboc5hcwaLHVMvCWUke2VRF5bgeoX98N71gYZkCcHpHo/Zr
	 KPXU4P/6SiL1aZdnNOy+dMEtBittCA7FO5pGdj4YH54c/HLZs7RlNgAyn1qc/qfzzt
	 Cm8zkDen8zagaz1Nt2NgpioXY8ewXECKmWDnuYmI/EE2sGKXJH38KiRxJ0ZmCKRue9
	 BU+uf24apUEiKt3nzSzAzVg/caXGfR3XPr3yGXH/Us6xx6O15PeasrAGDFBnCegy+r
	 sYCMX8FiKWa/abOjyjfkAc5t3rLogATn0XxT3eF4PP6h2YEkHUMYKFU8aDuSfh0sRU
	 knDZCcGbLYRJA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D81D1C395EC;
	Mon, 12 Jun 2023 10:00:19 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] dt-bindings: net: drop unneeded quotes
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <168656401987.30960.9087751436682057307.git-patchwork-notify@kernel.org>
Date: Mon, 12 Jun 2023 10:00:19 +0000
References: <20230609140713.64701-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230609140713.64701-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, neil.armstrong@linaro.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, opendmb@gmail.com,
 florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, heiko@sntech.de,
 nobuhiro1.iwamatsu@toshiba.co.jp, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, mripard@kernel.org,
 vineetha.g.jaya.kumaran@intel.com, biao.huang@mediatek.com,
 xiaoning.wang@nxp.com, david.wu@rock-chips.com, grygorii.strashko@ti.com,
 nsekhar@ti.com, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_030021_616171_E335A5DD 
X-CRM114-Status: GOOD (  10.99  )
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

Hello:

This patch was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Fri,  9 Jun 2023 16:07:12 +0200 you wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml     | 2 +-
>  .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml    | 2 +-
>  .../devicetree/bindings/net/amlogic,meson-dwmac.yaml          | 2 +-
>  Documentation/devicetree/bindings/net/brcm,bcmgenet.yaml      | 2 +-
>  Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml   | 2 +-
>  Documentation/devicetree/bindings/net/mediatek-dwmac.yaml     | 2 +-
>  Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml      | 2 +-
>  Documentation/devicetree/bindings/net/rockchip-dwmac.yaml     | 2 +-
>  .../devicetree/bindings/net/ti,k3-am654-cpsw-nuss.yaml        | 4 ++--
>  .../devicetree/bindings/net/toshiba,visconti-dwmac.yaml       | 2 +-
>  10 files changed, 11 insertions(+), 11 deletions(-)

Here is the summary with links:
  - dt-bindings: net: drop unneeded quotes
    https://git.kernel.org/netdev/net-next/c/61ab5a060a57

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
