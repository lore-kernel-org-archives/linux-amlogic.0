Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5148DC00528
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Aug 2023 14:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X6Q95S1J00IrdoVLe1B1Gx4cScO30TdNSBJp8AojHcM=; b=GKmNdP2IEVqSo2
	AoEmRea16sTnsxChdV5B2d9x4tO52wKbaD0qPVWwgwC/82GB6BlD0C3k2RYRoi/JzgPDD871OSCXf
	umCGLXASkJI+U8ROX2xMBAhczLOBEzepqHXpaEfm3J2g1Skt5s9g2g77xnJHubofSg6t5T50t5F5a
	sfyVmUAKmZs7QkuHc+d8od0DjCsA8GpClzaNYCeKYHNTstgu6nJ3eY96EKD5VesA6wQ243sq2ZxEg
	ZG5HhTAMUw1AplcB4PPLwAd/gPJmo9tXIz9WsOR8NJgsW7ysP/pfLrP8dIs0I3hzXaXFWXtbz6WYY
	/6Ho/zF/Ef2RnnBI8dqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qT17X-00HWO1-2L;
	Mon, 07 Aug 2023 14:22:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qT17V-00HWMr-25;
	Mon, 07 Aug 2023 14:22:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D76C661D1F;
	Mon,  7 Aug 2023 14:22:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24B3DC433C8;
	Mon,  7 Aug 2023 14:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691418124;
	bh=cXFiuh6QE/l5gO4LSGbmHHnCOg0r0pMDyGjk4yYWqGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K0jWe+U56RKMxh65PlSh0uPPdDBU77fJ9Tn/1K+nNW3X5eLmlmcqQ1IO/XanTxc4y
	 /r4mYYmhEJP9y+6hzmnp8PojJb3N1XcfwZUNwvOMrtmhTmBFO4vTjjq44TjR5Zbc+A
	 KMXyo+IYxfXbHpjq9MUoGp6fL/HiZObf+2O9Z3g1HTchwW5MQj6kIO6pCxC7vQ1b2T
	 O2+590JEwTPQK5Jvsy7VTDDtKkLMHICHK9o/A+rMINyr3MpMZ/80eEKqryjs96Fpmq
	 GD+y1WWgWk9ePAnQ+hgEknZh6VzDY63ob2hH+dYAKRm2hN5+KfZRX0qpnshbR/dagZ
	 9f9zydEc+YiOQ==
Date: Mon, 7 Aug 2023 16:21:58 +0200
From: Simon Horman <horms@kernel.org>
To: Da Xue <da@libre.computer>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Luke Lu <luke.lu@libre.computer>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [PATCH v2] net: phy: meson-gxl: implement
 meson_gxl_phy_resume()
Message-ID: <ZND+BrB0OCqgLo9u@vergenet.net>
References: <20230804201903.1303713-1-da@libre.computer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230804201903.1303713-1-da@libre.computer>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_072205_774730_3BBADCC8 
X-CRM114-Status: GOOD (  24.06  )
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

On Fri, Aug 04, 2023 at 04:19:02PM -0400, Da Xue wrote:
> After suspend and resume, the meson GXL internal PHY config needs to be initialized again or the carrier cannot be found.
> 
> Signed-off-by: Luke Lu <luke.lu@libre.computer>
> Reviewed-by: Da Xue <da@libre.computer>

Hi Da Xue,

as the posted of this patch you need to provide your signed-off-by line.

From the way things are structured above it is unclear what Luke's
role is. Was he the author of the patch? If so the body of the email,
just above the patch description, should start with:

From: Luke Lu <luke.lu@libre.computer>

Link: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

> ---
>  drivers/net/phy/meson-gxl.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/phy/meson-gxl.c b/drivers/net/phy/meson-gxl.c
> index bb9b33b6b..2df516ed4 100644
> --- a/drivers/net/phy/meson-gxl.c
> +++ b/drivers/net/phy/meson-gxl.c
> @@ -132,6 +132,18 @@ static int meson_gxl_config_init(struct phy_device *phydev)
>  	return 0;
>  }
>  
> +static int meson_gxl_phy_resume(struct phy_device *phydev)
> +{
> +	int ret;
> +
> +	genphy_resume();

This patch doesn't compile because the call to genphy_resume() has too
few arguments.

> +	ret = meson_gxl_config_init(phydev);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
>  /* This function is provided to cope with the possible failures of this phy
>   * during aneg process. When aneg fails, the PHY reports that aneg is done
>   * but the value found in MII_LPA is wrong:
> @@ -196,7 +208,7 @@ static struct phy_driver meson_gxl_phy[] = {
>  		.config_intr	= smsc_phy_config_intr,
>  		.handle_interrupt = smsc_phy_handle_interrupt,
>  		.suspend        = genphy_suspend,
> -		.resume         = genphy_resume,
> +		.resume         = meson_gxl_phy_resume,
>  		.read_mmd	= genphy_read_mmd_unsupported,
>  		.write_mmd	= genphy_write_mmd_unsupported,
>  	}, {
> -- 
> 2.39.2
> 
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
