Return-Path: <SRS0=+CC3=YH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D529C4CECE
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Oct 2019 15:09:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB5B52133F
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Oct 2019 15:09:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SHpesIKY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="PPcP0ZPA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB5B52133F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=DLHs1r83WyYjWA/zilBtGr8x1yaHcrPgwXn5RUDW6SI=; b=SHpesIKYsWxLC/60I1nvS0TtJj
	guA4M3qTwfIw1IKx8n5zuIuDeqPNop7rC5izzxmoEGcZpZ4SasA5gNZRn67bbv0In0a/Q2Qn3tvBA
	ECvUcJ/I90ouc6Gt84D+gMpiPwes7+3ZoOt5+W9Mu27YbQTFmpWQBIK8moHHBgkITCwNwFTkfsPpa
	qJMTMbR6PDSnNY6Rf2JPc+f8yQA1x9Mnf0aQuPQzBGCqnVKILHsbZW4OqUSC6JiT84CwYGcyKL2Na
	Zg9GbKVHxkL0gQygng2bqXJaqdhaleElyWAQjnqUGHdMotps/SG2psSjl4Oga4uSJZPFpUF/gEHgN
	X+bcwn8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iK1yC-0000nb-J1; Mon, 14 Oct 2019 15:09:12 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iK1y8-0000ml-T5
 for linux-amlogic@lists.infradead.org; Mon, 14 Oct 2019 15:09:10 +0000
Received: by mail-wr1-x442.google.com with SMTP id h4so20193815wrv.7
 for <linux-amlogic@lists.infradead.org>; Mon, 14 Oct 2019 08:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=e/+zgzvz7cdRSfGr8CbomtgDWC7Xf9aC4mhPjEtGzjI=;
 b=PPcP0ZPAsk7CO8rwGRm94KGORWc2VFlrbsiIWKL44xuhF9fnPgHdg4Id/W2Ja4LD7U
 0YUPDhPGflxds0PEAhO1dir8ynybpSVMTvd6FBG0k+xA3/JkNy76rsQmWcwkudCW+JaG
 L2TRa1YZxB18ga5TFK5aij+Bl8WCVr5+tpeN72R/2B/R25B9pec+94NXmBEZs/i18eda
 cOzbcNoo3btYabqNXdl98+qctW8LTmhpk5DDXGL6RYdUeEldltF/nxI19BIfUGKXgFzR
 ZxC2PfuMZtaAAmk+zlLjD1COK8Vxu3ITfp9bXWImewjXaDC6mtfkGVwKHW8MNtH2kFCn
 ftAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=e/+zgzvz7cdRSfGr8CbomtgDWC7Xf9aC4mhPjEtGzjI=;
 b=IWw2xHQuRvye7GjmSaFFs4QjnJUtdOqGxnKWznV7PU998WHlFuecD1xiuIuQR/bR0L
 XqyH6gSLO9fN6dWpayBIcwQyY8W31bEg7ZGuTFu5QqFGTDaXNaSIlz9PomMsFbMpamyv
 MdcdgpSgDuKM5Fj3v+bZoO7oqZ2yyygH8UtYZpdE4ba9RMCLEdgiYS9rRnjeXsMLHzCG
 cpr2B2n0edCP5iQEGhCI0axCGVBRTOo2y1cWCZyrnc0bFFEojX1OVv35xAwG6KhDgXgZ
 LeJ0StGu7JfBHhRtSUibGktF1AD9J/7m89N5XC6bjvAsCtePyhokOc/i48oGG4q9VAAM
 3FuQ==
X-Gm-Message-State: APjAAAWPwoYuAvXLYEk3KPsW0IWyrqH67quBmu8t5vq+wbz2cLbM/bP+
 WXS2vO4Zqq3MI9JI1VKXRHMyrA==
X-Google-Smtp-Source: APXvYqydjsG8U+zYFq0mECW81Lw/eZ84pU47/75NLBZW1j95nCqUR8IryrSfNyGJASnYpIQfA+BMFw==
X-Received: by 2002:adf:92a5:: with SMTP id 34mr24903377wrn.337.1571065747515; 
 Mon, 14 Oct 2019 08:09:07 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a4sm14961234wmm.10.2019.10.14.08.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 08:09:06 -0700 (PDT)
References: <20191014144316.18696-1-yuehaibing@huawei.com>
User-agent: mu4e 1.3.3; emacs 26.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: YueHaibing <yuehaibing@huawei.com>, narmstrong@baylibre.com,
 mturquette@baylibre.com, sboyd@kernel.org, khilman@baylibre.com
Subject: Re: [PATCH -next] clk: meson: axg-audio: use
 devm_platform_ioremap_resource() to simplify code
In-reply-to: <20191014144316.18696-1-yuehaibing@huawei.com>
Date: Mon, 14 Oct 2019 17:09:05 +0200
Message-ID: <1jpniz1i0e.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191014_080908_945498_293F7431 
X-CRM114-Status: GOOD (  10.96  )
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Mon 14 Oct 2019 at 16:43, YueHaibing <yuehaibing@huawei.com> wrote:

> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/clk/meson/axg-audio.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
> index 18b23cd..d7d7cff 100644
> --- a/drivers/clk/meson/axg-audio.c
> +++ b/drivers/clk/meson/axg-audio.c
> @@ -1016,7 +1016,6 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
>  	const struct audioclk_data *data;
>  	struct axg_audio_reset_data *rst;
>  	struct regmap *map;
> -	struct resource *res;
>  	void __iomem *regs;
>  	struct clk_hw *hw;
>  	int ret, i;
> @@ -1025,8 +1024,7 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
>  	if (!data)
>  		return -EINVAL;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	regs = devm_ioremap_resource(dev, res);
> +	regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(regs))
>  		return PTR_ERR(regs);

Applied, Thx

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
