Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30499C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Mar 2022 19:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c1+rQFe9Km0wwhdeWMqQp6n5ztWQoe9A/it6PhRbvfM=; b=1ihD/tojasrfjQJuM/glonxY/5
	x7kLIzyVkkvcZE6qgrKQtACK+6G9W5lBiOBv+EHTzGuOgFS10KmSl+IDQZklXCOtzzJfVrBGL3E55
	Fd6s7aSX82mKcMVnZsIgd8jJmTqSwacevvNiVlurV2eY2tgFtuhyEiHRzF3RcsFTA7dppsmUD76Gx
	9IqXwWlL8AVHoeF2ov7J9FItKi1/ZZp6uN08rWCJrqjLmIZeq3i0OJI/bum1uFw/YIBTBVEM3F3bH
	qrk4tks+nNYhdq9pXmxuJw4F0AE4QmWGpXrioFZuctg+aG9JXYLktNd5ismamhTjZux17YeipthAM
	IMPmXOsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQDz8-00Bo85-2s; Fri, 04 Mar 2022 19:53:06 +0000
Received: from mx.msync.work ([51.91.38.21])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQDz3-00Bo5a-Qa; Fri, 04 Mar 2022 19:53:04 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 02CEE1E078; Fri,  4 Mar 2022 19:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
 t=1646423574; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=lKAg1aZ3/OVlbnHBQ2pMnRlOfyWJyfFmLorR+5Ap/IQ=;
 b=u4+p9YgsY4u3lL70tjKH6XhGIXH2yCrFY46fIuWJkAPggRctMKPAlLQpYm3qQFup4ynTL+
 ZOryPcFEz4vXCDX6kHGQYM9QWLDBu5SXF9dGYUVMz1IK7DFGmWNdQc0YrjUlNbtV8MsNXY
 k2UEtAbjNWrZ/qsyimEhAPSi5OWZoa0sj3OrRhDlSzofHdSyFE03XBBoLQ9weKNPQZ/tbU
 +nlVcMT/8GOU42lyEM7rQALoUSCp09YL+22l3ip5gQ+lpjZN8XN2h7obGYX0mizNgup75r
 ZYQJyfRBDdNkmD+wo0vDIS7rFKi5Gt6TcMeqUUHAB/whMIEiI31X4txyzDa0aw==
Message-ID: <962ae330-b2aa-c52d-5888-83b4fff74c44@lexina.in>
Date: Fri, 4 Mar 2022 22:52:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH net] net: phy: meson-gxl: fix interrupt handling in forced
 mode
Content-Language: ru
To: Heiner Kallweit <hkallweit1@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, netdev@vger.kernel.org
References: <04cac530-ea1b-850e-6cfa-144a55c4d75d@gmail.com>
From: Vyacheslav <adeep@lexina.in>
In-Reply-To: <04cac530-ea1b-850e-6cfa-144a55c4d75d@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_115302_213395_3B844909 
X-CRM114-Status: GOOD (  23.79  )
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

Seems works for JetHub H1 (S905W with internal phy)

03.03.2022 10:54, Heiner Kallweit wrote:
> This PHY doesn't support a link-up interrupt source. If aneg is enabled
> we use the "aneg complete" interrupt for this purpose, but if aneg is
> disabled link-up isn't signaled currently.
> According to a vendor driver there's an additional "energy detect"
> interrupt source that can be used to signal link-up if aneg is disabled.
> We can safely ignore this interrupt source if aneg is enabled.
> 
> This patch was tested on a TX3 Mini TV box with S905W (even though
> boot message says it's a S905D).
> 
> This issue has been existing longer, but due to changes in phylib and
> the driver the patch applies only from the commit marked as fixed.
> 
> Fixes: 84c8f773d2dc ("net: phy: meson-gxl: remove the use of .ack_callback()")
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>   drivers/net/phy/meson-gxl.c | 23 +++++++++++++----------
>   1 file changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/phy/meson-gxl.c b/drivers/net/phy/meson-gxl.c
> index 7e7904fee..c49062ad7 100644
> --- a/drivers/net/phy/meson-gxl.c
> +++ b/drivers/net/phy/meson-gxl.c
> @@ -30,8 +30,12 @@
>   #define  INTSRC_LINK_DOWN	BIT(4)
>   #define  INTSRC_REMOTE_FAULT	BIT(5)
>   #define  INTSRC_ANEG_COMPLETE	BIT(6)
> +#define  INTSRC_ENERGY_DETECT	BIT(7)
>   #define INTSRC_MASK	30
>   
> +#define INT_SOURCES (INTSRC_LINK_DOWN | INTSRC_ANEG_COMPLETE | \
> +		     INTSRC_ENERGY_DETECT)
> +
>   #define BANK_ANALOG_DSP		0
>   #define BANK_WOL		1
>   #define BANK_BIST		3
> @@ -200,7 +204,6 @@ static int meson_gxl_ack_interrupt(struct phy_device *phydev)
>   
>   static int meson_gxl_config_intr(struct phy_device *phydev)
>   {
> -	u16 val;
>   	int ret;
>   
>   	if (phydev->interrupts == PHY_INTERRUPT_ENABLED) {
> @@ -209,16 +212,9 @@ static int meson_gxl_config_intr(struct phy_device *phydev)
>   		if (ret)
>   			return ret;
>   
> -		val = INTSRC_ANEG_PR
> -			| INTSRC_PARALLEL_FAULT
> -			| INTSRC_ANEG_LP_ACK
> -			| INTSRC_LINK_DOWN
> -			| INTSRC_REMOTE_FAULT
> -			| INTSRC_ANEG_COMPLETE;
> -		ret = phy_write(phydev, INTSRC_MASK, val);
> +		ret = phy_write(phydev, INTSRC_MASK, INT_SOURCES);
>   	} else {
> -		val = 0;
> -		ret = phy_write(phydev, INTSRC_MASK, val);
> +		ret = phy_write(phydev, INTSRC_MASK, 0);
>   
>   		/* Ack any pending IRQ */
>   		ret = meson_gxl_ack_interrupt(phydev);
> @@ -237,9 +233,16 @@ static irqreturn_t meson_gxl_handle_interrupt(struct phy_device *phydev)
>   		return IRQ_NONE;
>   	}
>   
> +	irq_status &= INT_SOURCES;
> +
>   	if (irq_status == 0)
>   		return IRQ_NONE;
>   
> +	/* Aneg-complete interrupt is used for link-up detection */
> +	if (phydev->autoneg == AUTONEG_ENABLE &&
> +	    irq_status == INTSRC_ENERGY_DETECT)
> +		return IRQ_HANDLED;
> +
>   	phy_trigger_machine(phydev);
>   
>   	return IRQ_HANDLED;

-- 
Vyacheslav Bocharov

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
