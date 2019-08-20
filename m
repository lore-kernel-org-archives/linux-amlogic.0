Return-Path: <SRS0=f3iC=WQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CED43C3A589
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 15:39:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0C4322CE3
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 15:39:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P66g/0GM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0C4322CE3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uHCkIEGgVWoACWhha0oJqY56aPdPaUMcfwoGt6cM2go=; b=P66g/0GMb7XIQG
	1b7vkXvGDdrjuaZVHYdpYH52toaqZfpxCXn2MAQ6r2OxPILbejOy/rFJGJxaAilMoBZMWrAA7Jdbx
	dsEUg1SAfOO5HIBEGpbpE6rjandUhQ2rIQucxjlGQwKs/8dPDtAPj56xJLK1NfWUn6nbzMpLbHquU
	JK1U7HDkHrBiPVH4FtYS7f2ZnFCRA5Z9Yj++ZMC1yFubq/mtzU3T/5j2NK8VxcWpH9xuZRdMH6wHu
	gRb3Skv9p03QU1nTX1ZNZuyKwggiVfoinKrJFjj3LT8egnyh35LLZQgwHeLZgae1X69GcURBLTMYT
	7YpapJzm+0f/orj9xbgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i06Ee-0003lV-No; Tue, 20 Aug 2019 15:39:48 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i06Ec-0003l7-M0
 for linux-amlogic@lists.infradead.org; Tue, 20 Aug 2019 15:39:47 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1i06EZ-0001wj-Be; Tue, 20 Aug 2019 17:39:43 +0200
Message-ID: <1566315581.3030.18.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] reset: meson-audio-arb: add sm1 support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 20 Aug 2019 17:39:41 +0200
In-Reply-To: <20190820094625.13455-3-jbrunet@baylibre.com>
References: <20190820094625.13455-1-jbrunet@baylibre.com>
 <20190820094625.13455-3-jbrunet@baylibre.com>
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_083946_722213_1113E055 
X-CRM114-Status: GOOD (  15.31  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome,

thank you for the patch. Just one nitpick and one real issue below:

On Tue, 2019-08-20 at 11:46 +0200, Jerome Brunet wrote:
> Add the new arb reset lines of the SM1 SoC family
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/reset/reset-meson-audio-arb.c | 28 ++++++++++++++++++++++++---
>  1 file changed, 25 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/reset/reset-meson-audio-arb.c b/drivers/reset/reset-meson-audio-arb.c
> index c53a2185a039..72d29dbca45a 100644
> --- a/drivers/reset/reset-meson-audio-arb.c
> +++ b/drivers/reset/reset-meson-audio-arb.c
> @@ -30,6 +30,17 @@ static const unsigned int axg_audio_arb_reset_bits[] = {
>  	[AXG_ARB_FRDDR_C]	= 6,
>  };
>  
> +static const unsigned int sm1_audio_arb_reset_bits[] = {
> +	[AXG_ARB_TODDR_A]	= 0,
> +	[AXG_ARB_TODDR_B]	= 1,
> +	[AXG_ARB_TODDR_C]	= 2,
> +	[AXG_ARB_FRDDR_A]	= 4,
> +	[AXG_ARB_FRDDR_B]	= 5,
> +	[AXG_ARB_FRDDR_C]	= 6,
> +	[AXG_ARB_TODDR_D]	= 3,
> +	[AXG_ARB_FRDDR_D]	= 7,
> +};
> +
>  static int meson_audio_arb_update(struct reset_controller_dev *rcdev,
>  				  unsigned long id, bool assert)
>  {
> @@ -82,8 +93,14 @@ static const struct reset_control_ops meson_audio_arb_rstc_ops = {
>  };
>  
>  static const struct of_device_id meson_audio_arb_of_match[] = {
> -	{ .compatible = "amlogic,meson-axg-audio-arb", },
> -	{}
> +	{
> +		.compatible = "amlogic,meson-axg-audio-arb",
> +		.data = axg_audio_arb_reset_bits,
> +	},
> +	{
> +		.compatible = "amlogic,meson-sm1-audio-arb",
> +		.data = sm1_audio_arb_reset_bits
> +	}, {}

Only slight preference, I would keep the sentinel on a separate line.
Your choice.

>  };
>  MODULE_DEVICE_TABLE(of, meson_audio_arb_of_match);
>  
> @@ -104,10 +121,15 @@ static int meson_audio_arb_remove(struct platform_device *pdev)
>  static int meson_audio_arb_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> +	const unsigned int *data;
>  	struct meson_audio_arb_data *arb;
>  	struct resource *res;
>  	int ret;
>  
> +	data = of_device_get_match_data(dev);
> +	if (!data)
> +		return -EINVAL;
> +
>  	arb = devm_kzalloc(dev, sizeof(*arb), GFP_KERNEL);
>  	if (!arb)
>  		return -ENOMEM;
> @@ -126,7 +148,7 @@ static int meson_audio_arb_probe(struct platform_device *pdev)
>  		return PTR_ERR(arb->regs);
>  
>  	spin_lock_init(&arb->lock);
> -	arb->reset_bits = axg_audio_arb_reset_bits;
> +	arb->reset_bits = data;
>  	arb->rstc.nr_resets = ARRAY_SIZE(axg_audio_arb_reset_bits);

Since SM1 has two more resets, this needs to come from device match data
as well, or the last two resets will be unusable.

>  	arb->rstc.ops = &meson_audio_arb_rstc_ops;
>  	arb->rstc.of_node = dev->of_node;

regards
Philipp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
