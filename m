Return-Path: <SRS0=0gED=DF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3508C2D0A8
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Sep 2020 09:47:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 451EC221EC
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Sep 2020 09:47:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xKmE854W";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="dVIQN+f+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 451EC221EC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dTgfZCqAeMkEQ5Y4goL7UShD1y0GWwbrHvhOlOE+suM=; b=xKmE854WX9ofDbD9I7lq6aLmF
	2DRFAsD5QEW+t/zv24V+LSWw2tmoJVuq0loAVCvsWR0roUvaKOpHBsokMQ+joqGwstre0uPiN0A1e
	nVxf8yrMxKY6AEyOqTxPNQo8eU//LisKO2TqGwEjMBuSYZbBqen3aE8SG6VW7DOv5QMlxMH8nw6TI
	m980BRNFOlkZx4CZFkvJDO+cUjf85AXO4Okl6qwH+QbqHfzSO5cSFOApnvd75iJisIR2JD8YOvzOL
	y4iorzwNQPIFQIuAZ2sowrmyXPbNx6rHwqd/PvZ/vWW1EwmRShbNufED2oFHa3yPB4ICG9B3pyffo
	VbX5goM1Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMpks-0001NE-Ai; Mon, 28 Sep 2020 09:47:34 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMpkl-0001LN-Rq
 for linux-amlogic@lists.infradead.org; Mon, 28 Sep 2020 09:47:29 +0000
Received: by mail-wr1-x441.google.com with SMTP id m6so584513wrn.0
 for <linux-amlogic@lists.infradead.org>; Mon, 28 Sep 2020 02:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=aBaJ7/GSUfwYoA9TO9qsxTcOvSw2SWgHX/gC4K79Bt4=;
 b=dVIQN+f+DCKVNjTLbL7o7s6+EZqkCS0G96fLUO9iTFd9PXBVjqxXiHnouor1t8Mlf2
 yMOMb9HmqQSXMrsWoFSUVZTnP6M6CXNFuLJR1EjLtVfp8dMnaX07gDimkOMEGDL2rdtv
 Fo67JbRt2cXalKZajjrYmDZiopA30ERhpObv7m3lu/PQ1Rkitodi0Rzk8ya22Xn5tjAj
 Ku+KbFkDY2DmHQ+O5ggUF0NWJhxIwQDXSgV2KSHyrymQNeOX22Mzt2nRShQtZjLoFWVf
 wfIm0hHAWKMTWVtGgrO82cvWCTXJv5qZfRORzqkrq/NLCS6vxqvuzVHqXot67aopvpjI
 YlNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=aBaJ7/GSUfwYoA9TO9qsxTcOvSw2SWgHX/gC4K79Bt4=;
 b=TSB9zdZsduWR2PIheRvkDg+qqIOk+bJZNM/6beUWKWrdlncDMW5Vo/KJubxdqUzPyZ
 +RcW2eJOQ6Krd5i+0a8qrmJEj7QgBpMtCtwNBGNKsIl5k1mWqIVaExs/O2k8YK3g9ccR
 CECajABX96s4DXpsXFBe5KqnJrsf333zMytkDkDaKWn72i212U0QfYd9NGT3Hk+wYh+N
 T2zw4Z6d1G9pdeo3bWNlloAFbR43QhWIKkP48BMJMG2xMBzot/24SkGnaHC/LYHShnXU
 ZSqT07NgTa07oTvm3QB/56stBD8UPl62I2Q3EI+9c86Q6hosf2X60ggwKt6OsxyoTkGo
 Q5tQ==
X-Gm-Message-State: AOAM5335X7DjuH8vJ0i4v2yzzfluEKGtse4DzNoCLFcPcCoBguhalrnb
 J3a9UPOc3Mymh04f607nAmbDHQ==
X-Google-Smtp-Source: ABdhPJw5raJ0t+x3PQZ3zFLLcp8nFJ3FIYCEkjcE9P11x12LwaPsW8P5ucUS+pbqywKxXyInI/nWEg==
X-Received: by 2002:adf:c64e:: with SMTP id u14mr672332wrg.373.1601286446068; 
 Mon, 28 Sep 2020 02:47:26 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id t1sm515386wmi.16.2020.09.28.02.47.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 02:47:25 -0700 (PDT)
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
 <1601233948-11629-11-git-send-email-Julia.Lawall@inria.fr>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Julia Lawall <Julia.Lawall@inria.fr>,
 Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 10/18] clk: meson: use semicolons rather than commas to
 separate statements
In-reply-to: <1601233948-11629-11-git-send-email-Julia.Lawall@inria.fr>
Date: Mon, 28 Sep 2020 11:47:24 +0200
Message-ID: <1j1rimjkr7.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_054728_030335_01107457 
X-CRM114-Status: GOOD (  15.01  )
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
Cc: Valdis =?utf-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>,
 linux-amlogic@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Sun 27 Sep 2020 at 21:12, Julia Lawall <Julia.Lawall@inria.fr> wrote:

Hi Stephen,

Do you want to take all the clock related patches directly ?


> Replace commas with semicolons.  What is done is essentially described by
> the following Coccinelle semantic patch (http://coccinelle.lip6.fr/):
>
> // <smpl>
> @@ expression e1,e2; @@
> e1
> -,
> +;
> e2
> ... when any
> // </smpl>
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>
> ---
>  drivers/clk/meson/meson-aoclk.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/meson/meson-aoclk.c b/drivers/clk/meson/meson-aoclk.c
> index bf8bea675d24..3a6d84cd6601 100644
> --- a/drivers/clk/meson/meson-aoclk.c
> +++ b/drivers/clk/meson/meson-aoclk.c
> @@ -57,7 +57,7 @@ int meson_aoclkc_probe(struct platform_device *pdev)
>  	rstc->data = data;
>  	rstc->regmap = regmap;
>  	rstc->reset.ops = &meson_aoclk_reset_ops;
> -	rstc->reset.nr_resets = data->num_reset,
> +	rstc->reset.nr_resets = data->num_reset;
>  	rstc->reset.of_node = dev->of_node;
>  	ret = devm_reset_controller_register(dev, &rstc->reset);
>  	if (ret) {


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
