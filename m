Return-Path: <SRS0=tEAa=6P=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E9F5C47253
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 May 2020 15:37:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C16424958
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 May 2020 15:37:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RgrqOyPI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="TtzgkSzr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C16424958
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=573SxFwg+DUOKX1+BhNuOXg5SFqWsVPFAwG5vg2UgdI=; b=RgrqOyPIgoDypr
	nS9CDmknhkhKSo9jUeb4XM8g65dTEbLyP38gjirSezw3xCnVrPK2bjb05pq8U4VBvV7xFMhssiIta
	Os+N4plf4ZyywoR/JcpfcT2xMkXRi53NeULNKllgBa3i4rcNVteR/DRMYSY1cPAZl37wkkVTf9yrh
	4CgKpPDAp68R1MIsCom3S4TwkIBaUV5E/etdHC0TH6/oiG/ilNZ+YuAZJYxODYnzqtiV6L+0STd92
	qGjIb+5FIo5DdIIiYTjToAXp6sn6rAuhLqjqaXPbgMcQWAS6SRyi+9dgA4Gm6Yb2v1D+NkvZ9Ct+J
	P+Tc0Uc2bJl8Gc4zYecA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUXjK-0007Pt-GH; Fri, 01 May 2020 15:37:34 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUXjH-0007P8-SZ; Fri, 01 May 2020 15:37:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CCW9t2Lcf3ESlVkJ4RGqmi6BmFZgD63tWCVuekoIumU=; b=TtzgkSzrEtfblR+H1wVwLbiwig
 C8qarQ6oBZtfxDOULpsjFye+/KFqIcIkpqUOeMILNA//s3bR50E1daGGhbT5ptwh1DDApdNwbcOo5
 sBLN/MpQUJSTzfYQgIEc4qimo/sF9UbZcCWJ9oL3Pg0y09HfCU4f0DqqOiHsHPtyZEJU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.93)
 (envelope-from <andrew@lunn.ch>)
 id 1jUXjB-000YJL-8M; Fri, 01 May 2020 17:37:25 +0200
Date: Fri, 1 May 2020 17:37:25 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH RFC v2 07/11] net: stmmac: dwmac-meson8b: Make the clock
 enabling code re-usable
Message-ID: <20200501153725.GG128733@lunn.ch>
References: <20200429201644.1144546-1-martin.blumenstingl@googlemail.com>
 <20200429201644.1144546-8-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200429201644.1144546-8-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200501_083731_922629_43B5026C 
X-CRM114-Status: GOOD (  16.89  )
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
Cc: devicetree@vger.kernel.org, f.fainelli@gmail.com, jianxin.pan@amlogic.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Apr 29, 2020 at 10:16:40PM +0200, Martin Blumenstingl wrote:
> The timing adjustment clock will need similar logic as the RGMII clock:
> It has to be enabled in the driver conditionally and when the driver is
> unloaded it should be disabled again. Extract the existing code for the
> RGMII clock into a new function so it can be re-used.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 23 +++++++++++++++----
>  1 file changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
> index 41f3ef6bea66..d31f79c455de 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
> @@ -266,6 +266,22 @@ static int meson_axg_set_phy_mode(struct meson8b_dwmac *dwmac)
>  	return 0;
>  }
>  
> +static int meson8b_devm_clk_prepare_enable(struct meson8b_dwmac *dwmac,
> +					   struct clk *clk)
> +{
> +	int ret;
> +
> +	ret = clk_prepare_enable(clk);
> +	if (ret)
> +		return ret;
> +
> +	devm_add_action_or_reset(dwmac->dev,
> +				 (void(*)(void *))clk_disable_unprepare,
> +				 dwmac->rgmii_tx_clk);
> +
> +	return 0;
> +}

I'm surprised this does not exist in the core. It looks like there was
some discussion about this, but nothing merged.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
