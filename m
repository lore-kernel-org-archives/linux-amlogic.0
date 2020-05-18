Return-Path: <SRS0=WPS6=7A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCCB4C433E0
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 May 2020 11:24:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DB9C206D4
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 May 2020 11:24:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FjU6Th2G";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bhIr6KoP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DB9C206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rjORxEHHh2LYfY4S/BEgjS49MZWOq1RWiJtE/i2nHuY=; b=FjU6Th2GYDwg4G
	c/69NbYV0zmaxWV8G0kjTUWCl/CaHc+GPGJYTkxS5n6H3BORAwdzQOa2yp+xU7XeSXQrugLOoY3HE
	DLSqSVzC6B3OvC28feE6v0uFtUVsnU9bVnltkAAFm+75rB5HvxLjlELXYFDs2Jy8KIBpLesJ4OHzP
	wl/a02bphpz2jRBQiCwnzDzmz4Aci7vdQ1LPdhTXJIb5ZkpWs4cMb9Ry0Po2CV+2MSE7eWRtB8JSc
	DhroJS4HQmbjS4diuqVh74vrxNBQ86zKnRANF3kauv+B1hOiMSZECiVHRmXKzfm9aSzF+imXv46sd
	0m1T5haxTxI0OYUTkhvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jadsm-0002Bp-32; Mon, 18 May 2020 11:24:32 +0000
Received: from mail-ua1-x941.google.com ([2607:f8b0:4864:20::941])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jadsI-0001fu-5w
 for linux-amlogic@lists.infradead.org; Mon, 18 May 2020 11:24:03 +0000
Received: by mail-ua1-x941.google.com with SMTP id i5so3304650uaq.1
 for <linux-amlogic@lists.infradead.org>; Mon, 18 May 2020 04:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4NrexrNb88DzhWjg1accwpxlE36qK5WbdKw5yFdpiOY=;
 b=bhIr6KoP/7JDIFZg1/+ZJ7uB6Eo9CU1AHTOjy0RHtzeKoIXN4B8VDJFJfXceiP6WPI
 5KoDw0IKcM7T9T2Y1Tpv1T9izX6ADCWSKvxniWt3I47DFWSkEzd+E6rlQzNSPud8gv0A
 ptjAyBqcVVoGuFxzS3hJf6RB8vD0ZPhOmdWuy68O9hXNmoGOwxfHkQRKhN8RJBIg9HWd
 ifb7HH0WM+H1evmtDuSa7Tuuno0O5JpT3i5UOsmcFdmJumgoStOIi7p5avLb22xSDROE
 ILTz9YQKvwc/+ZdSj/PAojpBHM4Snyc6S9t6s1h+xrEzqK08DK1y+6gJ6JodWtXtCvju
 983g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4NrexrNb88DzhWjg1accwpxlE36qK5WbdKw5yFdpiOY=;
 b=dRAegMzleSKcmvZNpKbRRKAyywRs1DXaH9azfz1nC1ayhW1/IjT4D4HRANZouJqn95
 gUCATbZJPAFkq45sBwJPjsZ4DbeTAXZwDm2IHg+KmOKNy4asX4P0Ad3kImovSSVGBSUU
 0h1n4I+YM06ggPOY6+8g3TKQ1nhm5Uj4/Bl3hD7dAWrUlWYyACGhemxJw4U0MTfJAmU8
 HxPvAzlJe8j4LBE4G5OMnEU7TKgV/GkshlyDNcS1dfLAwiBDd6LzvKhuq3NSykK53ata
 FofouNW3EEs3SUEKrb8jTzNSvcczcWuPPb4vzwLTe+kjtt5kT+z6QmAAUoL/SBNfqz54
 VZxQ==
X-Gm-Message-State: AOAM533XjF4oeBjS5+EoEnD2F7wxf3hGwV/waqKh7Qy2il0JoX1V3UIu
 MAszyz+aIUN2bNI7X7EE7KcKoHe+/WU/aVxtVAOObA==
X-Google-Smtp-Source: ABdhPJwQhXupbBSuJ+hHwMN84vnYBg4shImkGSdF0QuDl2EYLw84KTUNHMpMakjTHXlNhtlZdKXb8AP0fPGmjtmCvzg=
X-Received: by 2002:a9f:26e2:: with SMTP id 89mr10991422uay.104.1589801041024; 
 Mon, 18 May 2020 04:24:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200517222907.1277787-1-martin.blumenstingl@googlemail.com>
 <20200517222907.1277787-2-martin.blumenstingl@googlemail.com>
In-Reply-To: <20200517222907.1277787-2-martin.blumenstingl@googlemail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 18 May 2020 13:23:24 +0200
Message-ID: <CAPDyKFpPXNB6mvovCH73BbtvKS=GPpUoBxn_0_EfbudebjZDWg@mail.gmail.com>
Subject: Re: [PATCH 2/2] mmc: host: meson-mx-sdhc: don't use literal 0 to
 initialize structs
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_042402_242269_C81863C9 
X-CRM114-Status: GOOD (  16.37  )
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
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 18 May 2020 at 00:29, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Kbuild test robot reports the following warning in lines 56 and 87 of
> drivers/mmc/host/meson-mx-sdhc-clkc.c:
>   Using plain integer as NULL pointer
>
> Drop the integer value from the struct initialization to fix that
> warning. This will still ensure that the compiler will zero out the
> struct so it's in a well-defined state.
>
> Fixes: 53ded1b676d199 ("mmc: host: meson-mx-sdhc: new driver for the Amlogic Meson SDHC host")
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/meson-mx-sdhc-clkc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/meson-mx-sdhc-clkc.c b/drivers/mmc/host/meson-mx-sdhc-clkc.c
> index ab0d6c68a078..e1f29b279123 100644
> --- a/drivers/mmc/host/meson-mx-sdhc-clkc.c
> +++ b/drivers/mmc/host/meson-mx-sdhc-clkc.c
> @@ -53,7 +53,7 @@ static int meson_mx_sdhc_clk_hw_register(struct device *dev,
>                                          const struct clk_ops *ops,
>                                          struct clk_hw *hw)
>  {
> -       struct clk_init_data init = { 0 };
> +       struct clk_init_data init = { };
>         char clk_name[32];
>
>         snprintf(clk_name, sizeof(clk_name), "%s#%s", dev_name(dev),
> @@ -84,7 +84,7 @@ static int meson_mx_sdhc_gate_clk_hw_register(struct device *dev,
>  int meson_mx_sdhc_register_clkc(struct device *dev, void __iomem *base,
>                                 struct clk_bulk_data *clk_bulk_data)
>  {
> -       struct clk_parent_data div_parent = { 0 };
> +       struct clk_parent_data div_parent = { };
>         struct meson_mx_sdhc_clkc *clkc_data;
>         int ret;
>
> --
> 2.26.2
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
