Return-Path: <SRS0=AMvF=FF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 306F3C64E7A
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Dec 2020 08:32:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7987C206E3
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Dec 2020 08:32:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bFCDSyfO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="rqb2bw6e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7987C206E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=voz3XJMyclNqUJE3SsLSqRXiIHj5EAyKWVQmhGwwub0=; b=bFCDSyfO78qalTKuw/deEHH8q
	Np03sYgeLc05Mla0nf5xeRl1TSYAvnMnXUiFKqDrcx8tUin5DymbmEN/FyfH7oRADUkmHkQv/yWNP
	jC3+RwB9hEBvKvpEyRTHKzeH2DYVnwJ1UbBSQv9z46hesyNeiCumwD8jcV2wUxEkrRXcPtuoMf5bJ
	wg/1ozgEUnd9RgzbP8SnAGDNRic109IQgWqQ03KMYJ9YADAelwEGSJPY0AmGzz8giMyPrVzs93SYl
	GVCc/Al++jWqPrZIIQJ0YuJn/jwralliHTnNXF+okBoIEF+T6Qw5KjehUJ9iuNKGy5wgxzuX0wZgX
	8pJzxkE/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk14k-0006J6-V3; Tue, 01 Dec 2020 08:31:54 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk14h-0006IE-Kl
 for linux-amlogic@lists.infradead.org; Tue, 01 Dec 2020 08:31:52 +0000
Received: by mail-wm1-x344.google.com with SMTP id x22so1504426wmc.5
 for <linux-amlogic@lists.infradead.org>; Tue, 01 Dec 2020 00:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=TxYCO6cWwJuHI7h5DWT27KZsbPoNU+/ayiJlqSncKfw=;
 b=rqb2bw6eKpmf53iOTGKAcD99gWWxxeOsA8KlODalPevcpYj640jondhUuOrOR9OoKm
 8dKDV3Yu8hZn/K6RJUnVr4xfPXVIlBxG/P+W9OgHhl8TP/EsO8gBe7hQ/kEvPDwxtxI6
 EtrAJW0QwlOjcDkHciPEFope7B46Gmh8rFzVfqcCt+INzGTddWiDP3AD/rvRzb4XyjvS
 pjKn16q4Yuhkhmg2outK20lnWXFIk08Xe79TbobHlhohxOz79fKCUkgZR5WlGbmom2yE
 6IBKVu1/GzRCQGdh29DFyuMZyweI/ClTZ8Lh9gm+ElkUSGyRcYr4U5ik0sMMSufLN6MD
 IJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=TxYCO6cWwJuHI7h5DWT27KZsbPoNU+/ayiJlqSncKfw=;
 b=rJrX5t8zmPvHgZhPvHsIJPM0/RVu8uLQAuqq61MaWm3YSNJz+uzaPsceL4SUFp/3ML
 i4mJrUCnsY9sRDmHXnfUB7jodNBCDrirk02hQ/1YGgaEyLgLsWS39j44ol2biNew0+2e
 nrEguw/93zZAlwoBfuHlpYzzeucXJ/fgeTWMTNmeZCR9k4Q0sgTzkyRk06AgOPKrbSOE
 urxgPXKNbLU59oaIWpj+iIZmU904+07UvfWPw4Jj8irnart5j+S8JPIKflmunFicKys7
 YzTOW6mpydn3AhK/26aVasl6trCSm7pFmlFLd6a/9rKyl1OE4at2oGh/ybopxoaD6xyU
 9MYA==
X-Gm-Message-State: AOAM532fLxQLoQ+bbhZTlpoY991Sq6LmqfSHT0TCeGLJGzi2/VavM7Ty
 SVKYpJuVuBNyY+sUUoib0cAajQ==
X-Google-Smtp-Source: ABdhPJysze0Tk/EFsjvf7saAh4/g3+BzAjZd8SNKiyvNLDFY7ZwWNB2mQsNM5BotMYyX6kOS9bPtzA==
X-Received: by 2002:a1c:220a:: with SMTP id i10mr1501475wmi.93.1606811508544; 
 Tue, 01 Dec 2020 00:31:48 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id z19sm1635915wmk.12.2020.12.01.00.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 00:31:48 -0800 (PST)
References: <e4df74aed2a7cff09366e72c87d408f41317907f.1606782187.git.stefan@agner.ch>
User-agent: mu4e 1.4.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stefan Agner <stefan@agner.ch>, robh+dt@kernel.org, khilman@baylibre.com
Subject: Re: [PATCH] arm64: dts: meson: fix PHY deassert timing requirements
In-reply-to: <e4df74aed2a7cff09366e72c87d408f41317907f.1606782187.git.stefan@agner.ch>
Message-ID: <1j8sai7wr0.fsf@starbuckisacylon.baylibre.com>
Date: Tue, 01 Dec 2020 09:31:47 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_033151_725857_4B920C42 
X-CRM114-Status: GOOD (  17.04  )
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
Cc: devicetree@vger.kernel.org, narmstrong@baylibre.com,
 martin.blumenstingl@googlemail.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Tue 01 Dec 2020 at 01:25, Stefan Agner <stefan@agner.ch> wrote:

> According to the datasheet (Rev. 1.4, page 30) the RTL8211F requires
> at least 50ms "for internal circuits settling time" before accessing
> the PHY registers. This fixes an issue where the Ethernet link doesn't
> come up when using ip link set down/up:
>   [   29.360965] meson8b-dwmac ff3f0000.ethernet eth0: Link is Down
>   [   34.569012] meson8b-dwmac ff3f0000.ethernet eth0: PHY [0.0:00] driver [RTL8211F Gigabit Ethernet] (irq=31)
>   [   34.676732] meson8b-dwmac ff3f0000.ethernet: Failed to reset the dma
>   [   34.678874] meson8b-dwmac ff3f0000.ethernet eth0: stmmac_hw_setup: DMA engine initialization failed
>   [   34.687850] meson8b-dwmac ff3f0000.ethernet eth0: stmmac_open: Hw setup failed
>
> Fixes: 658e4129bb81 ("arm64: dts: meson: g12b: odroid-n2: add the Ethernet PHY reset line")
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> index 6982632ae646..a5652caacb27 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> @@ -413,7 +413,7 @@ external_phy: ethernet-phy@0 {
>  		max-speed = <1000>;
>  
>  		reset-assert-us = <10000>;
> -		reset-deassert-us = <30000>;
> +		reset-deassert-us = <50000>;
>  		reset-gpios = <&gpio GPIOZ_15 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
>  
>  		interrupt-parent = <&gpio_intc>;

Thanks for sharing this is Stefan,
The title of your patch should probably be modified to show that it
addresses the odroid n2 only, as it stands.

I have checked the RTL8211F doc I have, v1.9, and this one mention
"72ms at least - not including the 1.0V supply rise time" before
accessing the PHY registers :/ ... so 80ms maybe ?

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
