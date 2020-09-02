Return-Path: <SRS0=TE1J=CL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D84DC433E7
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Sep 2020 16:36:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A155206E7
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Sep 2020 16:36:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eWBEOvYg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A155206E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7ysX4FUDTaZH3eU4ytgEGx3bMnYMuEIisxi0KRNJ6C8=; b=eWBEOvYg/KQvcbfDCruO+B6lQ
	CNKX6pFcrd0LloLhsnob42EhYC5krUoJGt83KfeMvQ2sxjBlyXPo8dYk6tCvfYbauXwEC/+S1cRUC
	tcs4Q51GZYQsNITiEtgKWHmo+gFfHR8acLqrfQ5sfnlt/SwQquVfFT3vwZt6325ykruwcAz2xFdZ3
	57FNs4Tk11shoPjMVnP23uV1kLeQOzgWVtfNYQrRPYzv/yNoNV9eRBu3Gyxf0KY3aQPmFtUgFpG0O
	brNakTE4FOQrjRTkpE8baNJdLrEspFimmbj+bnDRpnrj3p0IhRoyd1l39K0mkQcWaG+ESRJ1LfhPA
	n0sIm1egg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDVk2-0007au-4G; Wed, 02 Sep 2020 16:36:10 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDVjy-0007a4-6x; Wed, 02 Sep 2020 16:36:08 +0000
X-Originating-IP: 90.66.108.79
Received: from localhost (lfbn-lyo-1-1932-79.w90-66.abo.wanadoo.fr
 [90.66.108.79]) (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id C04D9C0003;
 Wed,  2 Sep 2020 16:35:58 +0000 (UTC)
Date: Wed, 2 Sep 2020 18:35:58 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 01/10] clk: at91: Drop unused at91sam9g45_pcr_layout
Message-ID: <20200902163558.GA4137028@piout.net>
References: <20200902150348.14465-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200902150348.14465-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_123606_339672_97F3732B 
X-CRM114-Status: GOOD (  16.47  )
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 David Lechner <david@lechnology.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Maxime Ripard <mripard@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Andy Gross <agross@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 linux-amlogic@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 02/09/2020 17:03:39+0200, Krzysztof Kozlowski wrote:
> The at91sam9g45_pcr_layout is not used so drop it to fix build warning:
> 
>   drivers/clk/at91/at91sam9g45.c:49:36: warning:
>     'at91sam9g45_pcr_layout' defined but not used [-Wunused-const-variable=]
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  drivers/clk/at91/at91sam9g45.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/clk/at91/at91sam9g45.c b/drivers/clk/at91/at91sam9g45.c
> index c88ee20bee31..cb4a406ed15d 100644
> --- a/drivers/clk/at91/at91sam9g45.c
> +++ b/drivers/clk/at91/at91sam9g45.c
> @@ -46,13 +46,6 @@ static const struct {
>  	{ .n = "pck1",  .p = "prog1",    .id = 9 },
>  };
>  
> -static const struct clk_pcr_layout at91sam9g45_pcr_layout = {
> -	.offset = 0x10c,
> -	.cmd = BIT(12),
> -	.pid_mask = GENMASK(5, 0),
> -	.div_mask = GENMASK(17, 16),
> -};
> -
>  struct pck {
>  	char *n;
>  	u8 id;
> -- 
> 2.17.1
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
