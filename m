Return-Path: <SRS0=BTcE=EU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A671C56202
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Nov 2020 22:33:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1D992245F
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Nov 2020 22:33:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QiiHVuyr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1D992245F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WuowVQx/LQM5W/WhUeJdNu+4K0iEy6PPp4045VM+vT0=; b=QiiHVuyr4s7sTAzLQMiq0VUyZ
	0MpanLeQJ3NXWEo8T+wEcW8/x8d0sZm5nIbQCRH9QDUyno6G3lgLsAaLnNYFgB4R0rWJojY9eYjdS
	7+buRhrrO0XaGf6K1wdJ6MA08Hp2YZf+FF/r7EB1inIJNmUPxsSLfLYhSTk6AHwfnUlQi+gsZ4yEw
	wpH++cWqnpPIn87vpDM5CQA6KwOQzWfrm0QTqye9JAdWSioiqsLmeHFVzY0T8Drjafxlwi4iJe2Yt
	pItTtc6IlaLBsO+jGW3nasbT8Lu5XBxrNatUkF9HsjDuVAX/lI2YgoJx0HqFQSOMUBepbgEfVEukP
	HbDpI9LCQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ke46W-0005Ny-C2; Sat, 14 Nov 2020 22:33:08 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ke46S-0005NU-UL; Sat, 14 Nov 2020 22:33:06 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1ke46E-0075um-ET; Sat, 14 Nov 2020 23:32:50 +0100
Date: Sat, 14 Nov 2020 23:32:50 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH RFC v1 1/4] dt-bindings: net: dwmac-meson: use
 picoseconds for the RGMII RX delay
Message-ID: <20201114223250.GI1480543@lunn.ch>
References: <20201114200104.4148283-1-martin.blumenstingl@googlemail.com>
 <20201114200104.4148283-2-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201114200104.4148283-2-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201114_173304_995453_D78FACFE 
X-CRM114-Status: GOOD (  22.40  )
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
Cc: devicetree@vger.kernel.org, jianxin.pan@amlogic.com,
 narmstrong@baylibre.com, khilman@baylibre.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-amlogic@lists.infradead.org, kuba@kernel.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, Nov 14, 2020 at 09:01:01PM +0100, Martin Blumenstingl wrote:
> Amlogic Meson G12A, G12B and SM1 SoCs have a more advanced RGMII RX
> delay register which allows picoseconds precision. Deprecate the old
> "amlogic,rx-delay-ns" in favour of a new "amlogic,rgmii-rx-delay-ps"
> property.
> 
> For older SoCs the only known supported values were 0ns and 2ns. The new
> SoCs have 200ps precision and support RGMII RX delays between 0ps and
> 3000ps.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../bindings/net/amlogic,meson-dwmac.yaml     | 52 ++++++++++++++++++-
>  1 file changed, 51 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> index 6b057b117aa0..bafde1194193 100644
> --- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> @@ -74,18 +74,68 @@ allOf:
>              Any configuration is ignored when the phy-mode is set to "rmii".
>  
>          amlogic,rx-delay-ns:
> +          deprecated: true
>            enum:
>              - 0
>              - 2
>            default: 0
> +          description:
> +            The internal RGMII RX clock delay in nanoseconds. Deprecated, use
> +            amlogic,rgmii-rx-delay-ps instead.
> +
> +        amlogic,rgmii-rx-delay-ps:
> +          default: 0
>            description:
>              The internal RGMII RX clock delay (provided by this IP block) in
> -            nanoseconds. When phy-mode is set to "rgmii" then the RX delay
> +            picoseconds. When phy-mode is set to "rgmii" then the RX delay
>              should be explicitly configured. When the phy-mode is set to
>              either "rgmii-id" or "rgmii-rxid" the RX clock delay is already
>              provided by the PHY. Any configuration is ignored when the
>              phy-mode is set to "rmii".

Hi Martin

I don't think the wording matches what the driver is actually doing:

        if (dwmac->rx_delay_ns == 2)
                rx_dly_config = PRG_ETH0_ADJ_ENABLE | PRG_ETH0_ADJ_SETUP;
        else
                rx_dly_config = 0;

        switch (dwmac->phy_mode) {
        case PHY_INTERFACE_MODE_RGMII:
                delay_config = tx_dly_config | rx_dly_config;
                break;
        case PHY_INTERFACE_MODE_RGMII_RXID:
                delay_config = tx_dly_config;
                break;
        case PHY_INTERFACE_MODE_RGMII_TXID:
                delay_config = rx_dly_config;
                break;
        case PHY_INTERFACE_MODE_RGMII_ID:
        case PHY_INTERFACE_MODE_RMII:
                delay_config = 0;
                break;

So rx_delay is used for both rgmii and rgmii-txid. The binding says
nothing about rgmii-txid.

And while i'm looking at the code, i wonder about this:

       if (rx_dly_config & PRG_ETH0_ADJ_ENABLE) {
                if (!dwmac->timing_adj_clk) {
                        dev_err(dwmac->dev,
                                "The timing-adjustment clock is mandatory for the RX delay re-timing\n");
                        return -EINVAL;
                }

                /* The timing adjustment logic is driven by a separate clock */
                ret = meson8b_devm_clk_prepare_enable(dwmac,
                                                      dwmac->timing_adj_clk);
                if (ret) {
                        dev_err(dwmac->dev,
                                "Failed to enable the timing-adjustment clock\n");
                        return ret;
                }
        }

It looks like it can be that rx_dly_config & PRG_ETH0_ADJ_ENABLE is
true, so the clock is enabled, but delay_config does not contain
rx_delay_config, so it is pointless turning it on.

	Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
