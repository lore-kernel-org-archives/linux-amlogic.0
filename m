Return-Path: <SRS0=rBUq=TP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACF05C04E53
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 May 2019 11:38:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BBE82053B
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 May 2019 11:38:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tmvy0RGz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oaroJl5N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BBE82053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y+erZrM4S6bJf7ii9zQMlepoVq2WKzTjublyxB/ew1w=; b=tmvy0RGzZuqSGd
	g5W5hgW6KFMuJcPWveV29t7Ab57CncCHkdPrptuC1v0h454Re0R9s7JLCPRdXyGkonm2fyAGzQWko
	2mC29mMyudHfRNTj/xXjSoEuFawgINJ4gCUqWaWK25wo9eHTn9vUVo/6tqt3XYaEFIzOhVfeM8qYr
	NoNsARpxKeiiC3CEdVhtuUF9/Onj20wYs0peUSSq47OdF1gZU3cX1ujS5R/pm0ke8b5SPsMY4Hzro
	7jX8UnR8Pn5stxZs8xVmeT+hAQ4D8jIo6QjQDkYi49Dv1cJCDpQixFRRBlTG5vb/0uJF/Is2LqpQO
	+myYMpOYV0BRn5bQOGCg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQsEc-00035Z-1y; Wed, 15 May 2019 11:38:10 +0000
Received: from mail-ua1-x943.google.com ([2607:f8b0:4864:20::943])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQsEZ-00034V-AH
 for linux-amlogic@lists.infradead.org; Wed, 15 May 2019 11:38:08 +0000
Received: by mail-ua1-x943.google.com with SMTP id s30so888463uas.8
 for <linux-amlogic@lists.infradead.org>; Wed, 15 May 2019 04:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qhei19leC0v0ZA7DjLdtqOfvCqcIJBYFgz9DlYcngkI=;
 b=oaroJl5NO9j75iHIVOTNAlnBr/aL4E1ohUkTQsEeea3XZJ4vkAJGhQEDeBrR6d9ESr
 zglYQaxjZnMOHQ3PUAzn9NB1Y1VnE6M/XP5FhlAis8HoPvrB2vebngrgqVa63OIQlFjj
 3QJBzbCLyw2i4gU1XWgA1ofiQgv26zC0eaoEgMsgG+D/RcTaw4TZ64Sk8h/VEN093i2D
 VBSUyrGXyWK7qYJQizQPcwPjf6UcDtZ0n8pIPGoRQfW3jieIYYVPlhywkXl3NSklXSgi
 blezqhaxahIUTuQ1COcVUiDME7s0xvpY2+3SXnOQNVSUFpIJH4Fs8c0pf+ZNxGB28k6K
 xqKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qhei19leC0v0ZA7DjLdtqOfvCqcIJBYFgz9DlYcngkI=;
 b=e9MEVuiFNYSqZFD3yo1nlp3EeXOduAGyjj+A765BJfx5qRQHZhhSNo3x+IU418r3sQ
 gmvM8XkSs5XCt/HY88fAwiyWhqa5VFtzm8gvmeo49ugBV3ivD6NWs80Liye5+ikBuGX5
 qlJgHng9EWfNqv+YN7+ptgMjN4jlM0ZwzOxG67ZxvfNQVD2JSxEadtGmf9Y6fLPxz/XC
 9ZX4D2oLLKpQQfFpWTl28JzQrzP96LfaL3EtiW9jCicX3PObCOb47njMpg/V9MObXovC
 GpN3S03OIKBXH6eBVLckyyd/ZOrSf0mmmm6BhZjPE/hqIOJhe7K6tN8IOk94WsHoMegb
 jPMg==
X-Gm-Message-State: APjAAAU1sNb+c6I00T1VEEP8q7KwskqIEiSOURNhqiABvWdoQX+KXjkQ
 mw9+m+JPdgo1cZgVjqv3tj1za6hzZKFRQqeW+J628w==
X-Google-Smtp-Source: APXvYqx2ho4ZoBSxolOdsewMdtUC+zzflgrlf7FvoPJG2+KVlkzz73geamFsVboy/g6Mx0Z2VtH6zsmbje4Xwvjdgv4=
X-Received: by 2002:ab0:2399:: with SMTP id b25mr300951uan.129.1557920285743; 
 Wed, 15 May 2019 04:38:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190513091548.16674-1-narmstrong@baylibre.com>
 <20190513091548.16674-2-narmstrong@baylibre.com>
In-Reply-To: <20190513091548.16674-2-narmstrong@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 15 May 2019 13:37:29 +0200
Message-ID: <CAPDyKFr9HVLNpqncs6YhGvqPdXCk6mtVSPVcWDvmnrKiNB+ACQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: mmc: meson-gx: add ddr-access-quirk
 property
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190515_043807_364813_65034076 
X-CRM114-Status: GOOD (  15.63  )
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
Cc: DTML <devicetree@vger.kernel.org>, baylibre-upstreaming@groups.io,
 Kevin Hilman <khilman@baylibre.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 13 May 2019 at 11:16, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On the Amlogic G12A SoC family, (only) the SDIO controller has a bug which
> makes any DDR access from the MMC controller fail.
>
> Add the amlogic,ddr-access-quirk property so signal this particular
> controller has this bug and needs a quirk to work properly.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt
> index 13e70409e8ac..f8914dab06c6 100644
> --- a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt
> +++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt
> @@ -22,6 +22,10 @@ Required properties:
>    clock rate requested by the MMC core.
>  - resets     : phandle of the internal reset line
>
> +Optional properties:
> +- amlogic,ddr-access-quirk: set when HW cannot access the DDR memory, like on
> +  the G12A SDIO controller.

As stated on the other patch, may I suggest to use DRAM instead of DDR.

Moreover, please mention that this is about the internal DMA support
of the controller.

> +
>  Example:
>
>         sd_emmc_a: mmc@70000 {
> --
> 2.21.0
>

Kind regards
Uffe

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
