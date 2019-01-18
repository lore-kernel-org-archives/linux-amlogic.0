Return-Path: <SRS0=part=P2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 654FEC1B0F7
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jan 2019 21:59:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 346622087E
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jan 2019 21:59:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="REUnDd9p";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="BLmigqZB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 346622087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C3ne65VTRqx8de+Truwu2SmJjv825/XkJleWLkti1+g=; b=REUnDd9pPvrb9b
	Fu24s5iWreBGFk9vP3AYQKYYG2RCTXJ7Joot+b5tpVFg/2AgaK6iZkFmsHjhM4XtQwBdowzyfD58Q
	nR+78zdhblw1FZCznjEhEM/62fM2m4DVDM3kj/6mygWxwCwzAsHoZWEqnEmtBx6WExeMNUJMqw3Eo
	YBhye7gBYfFuYbLtvg1yOqo8kksjRlDYs+Ij9uQfU3YV86oYTmnrtTa74dulpFXEmib48Q7C+Fpiw
	uON5Xopws3Q4QjAZMxn7CdNPk6ycJ1r8jMoFWbt9I+RYTDr4XLfvldyRfE7WqMyUpWEJ/OKmeOZPi
	s8qbU9Diffe/Wb+6mSjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkcB2-0006y0-AA; Fri, 18 Jan 2019 21:59:48 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkcAy-0006vs-Qn
 for linux-amlogic@lists.infradead.org; Fri, 18 Jan 2019 21:59:46 +0000
Received: by mail-ot1-x344.google.com with SMTP id v23so15728192otk.9
 for <linux-amlogic@lists.infradead.org>; Fri, 18 Jan 2019 13:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HE+d4pn8R1S0TXQHgoAYCtz3osRElnBuppy55K+02hQ=;
 b=BLmigqZBc3TiOhPbuGJk9gnC67arWjIiFpBd95sC+D5mOIBoxfIj7GuyapSJrdu9EP
 DQ9m6W0AY0+O+bHvD1GTZwZ9KpTcYibhFqR7dvsikRaQArn187ZHeFcj/dLL6RRL1Lze
 stn2HWlOX+eYFPeBiv7l4qT2YtlDUqXZtv7/kRpNkmgAVxZKq/9Ce60lEYf1sGdhCy7I
 KluyvFDlxpJPXsUah6KBisB6GvIdkYPpRvxNB1lCj1xLpL3uPzgSXllxghuAh9HnireV
 I2GWvvCLHhMVQrxc6KuCVL5QPsfMG4I7psJ1cSgQ6EHAUBimVa2wvW1pzmNiWGg7pkOy
 WLUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HE+d4pn8R1S0TXQHgoAYCtz3osRElnBuppy55K+02hQ=;
 b=OVywAa7+qwHba2JGvrihdyf0MoOlwGglfWXWk+RTi7PSrVyQT1L/rSBz+xBtys9sqi
 ctlYaGxzac0pB9Pgng5y9qbqohoFgRVYl6EZ7ec+AMqXXmmdrtC/o6oZ2LNrwix+WgSz
 SXoNY0Wa+Npqw/CvlsDlyRvhVh5sycJR75IqgUGNVxP4I0aWJyIlF6+YqJsfK3hpifum
 0YJFQvlt11+vy3arrm+agxqQQ6KIhLgGgQ048yzXhUFHSiSisl0K0gunNsdL4L5z4HN4
 NYcNmdHcArDQAjZMHG6B5Fd/jLbtOo8xvDyjogaUmCPjU38/ZfgCtwl1C/DwHZAh6qQN
 Fpfg==
X-Gm-Message-State: AJcUukcNLOkLX1oFt/I4WT2MpLPngjXjFRglXVh2/fJK/pa4Z1NNTs79
 vXpJssXMyJaOf6jI1pCzLzeQgPTaOHesRhiVJjM=
X-Google-Smtp-Source: ALg8bN4tx7TZmQq7l/bpqJTnxnZSWuDTCkF/OiYcuTZg+odXhBUJ8JTOiRVoAegqkm8XQIw9ZGNxuJR/Ftrsk/RWLlc=
X-Received: by 2002:a05:6830:2115:: with SMTP id
 i21mr13289563otc.237.1547848782499; 
 Fri, 18 Jan 2019 13:59:42 -0800 (PST)
MIME-Version: 1.0
References: <20190118103423.15075-1-jbrunet@baylibre.com>
 <20190118103423.15075-5-jbrunet@baylibre.com>
In-Reply-To: <20190118103423.15075-5-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 18 Jan 2019 22:59:31 +0100
Message-ID: <CAFBinCB=SEGQzLaqbUMFGoc_LpnJtMd-V4ao9a9JhcFKzmYT6Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: meson: g12a: add clk measure support
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_135944_869361_71E971FC 
X-CRM114-Status: GOOD (  10.87  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 patchwork-bot+notify@kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Jan 18, 2019 at 11:34 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> Add the clock measure device to the g12a SoC family
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> index bd24de947a5b..59900ddb7b43 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> @@ -193,6 +193,11 @@
>                         #interrupt-cells = <3>;
>                         #address-cells = <0>;
>                 };
> +
> +               clk_msr: clock-measure@ffd18000 {
> +                       compatible = "amlogic,meson-g12a-clk-measure";
> +                       reg = <0x0 0xffd18000 0x0 0x10>;
> +               };
I'll wait with my Reviewed-by until we have a result in the G12A bus
discussion in "arm64: dts: meson: g12a: add clk measure support" from
[0]


[0] https://patchwork.kernel.org/patch/10766427/

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
