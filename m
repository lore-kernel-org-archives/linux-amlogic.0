Return-Path: <SRS0=2I4g=RX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B113AC43381
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Mar 2019 10:35:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 832042075C
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Mar 2019 10:35:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="faYB7b2s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 832042075C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u2WWjppRq3jnEKpVrTv3/H15AhMqWALmX9TXvyonxRY=; b=faYB7b2sRWP3Qq
	pVvs4gHhOmu3b9UI6b2sZ9EG1F9l44/7XhFzrCBB0bIrqygj8jrpXqh9qUnzZRt+ckFALp2nDfiD8
	N+fLjfYJJKDi+fIe9c13T6qpNuCuXyjfurGhY5TqAWiVQ+i0/8pODKNt9yIftq6qCEOJfM9AjzvCP
	q95PwMaMm/2KUl1LR2SGR0dlW6ppcU3wE7ugR6OiYg1SROBq922B72A6UDHy5FsjmgcHx+QyBEmnl
	sUBkH/8l7sFKP8ksSjl5owKq9aafDOYEGLEpLYCW4DyB8nfjsBQDgZuIyAcbGdbQELkRG8erZOS9z
	v6YFaIcUUGqvlWWsim+Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6YZU-0006wp-Qy; Wed, 20 Mar 2019 10:35:44 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6YZB-0006VH-9N
 for linux-amlogic@lists.infradead.org; Wed, 20 Mar 2019 10:35:28 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.89)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1h6YZ8-0007c2-KV; Wed, 20 Mar 2019 11:35:22 +0100
Message-ID: <1553078122.7071.6.camel@pengutronix.de>
Subject: Re: [PATCH] dt-bindings: reset: meson-g12a: Add missing USB2 PHY
 resets
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Neil Armstrong <narmstrong@baylibre.com>
Date: Wed, 20 Mar 2019 11:35:22 +0100
In-Reply-To: <20190304104916.3937-1-narmstrong@baylibre.com>
References: <20190304104916.3937-1-narmstrong@baylibre.com>
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_033525_871466_403ACC30 
X-CRM114-Status: GOOD (  12.12  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 2019-03-04 at 11:49 +0100, Neil Armstrong wrote:
> The G12A Documentation lacked these 2 reset lines, but they are present and
> used for each USB 2 PHYs.
> 
> Add them to the dt-bindings for the upcoming USB support.
> 
> Fixes: dbfc54534dfc ("dt-bindings: reset: meson: add g12a bindings")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  include/dt-bindings/reset/amlogic,meson-g12a-reset.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/reset/amlogic,meson-g12a-reset.h b/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
> index 8063e8314eef..6d487c5eba2c 100644
> --- a/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
> +++ b/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
> @@ -51,7 +51,10 @@
>  #define RESET_SD_EMMC_A			44
>  #define RESET_SD_EMMC_B			45
>  #define RESET_SD_EMMC_C			46
> -/*					47-60 */
> +/*					47	*/
> +#define RESET_USB_PHY20			48
> +#define RESET_USB_PHY21			49
> +/*					50-60	*/
>  #define RESET_AUDIO_CODEC		61
>  /*					62-63	*/
>  /*	RESET2					*/

Thank you, applied to reset/fixes with Martin's review tag.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
