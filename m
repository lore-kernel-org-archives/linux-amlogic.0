Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A1FC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Dec 2021 13:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hk6T3fXtgNig2GtbNoh9fI8rLY3t1oywQviSHraj5hE=; b=aTEEjXtXOi2slP
	jdw4EkRyjyFYLFv9H5ym3DEz6KoYRGihBRiYAVJzdoS1zyThl3RcssEHNn4TUcgsb/eYzmA2y09bi
	Kg4bVpLedZUV8ANeumOAtd5ssQgD0wmB/KlR/HylSAsWlSAIKs7t36l7kryalo023nmAfXKe1880C
	iFMvPnllW1DUkhYfqJO+Q6TkTh2o0BbJ9COAmFCGpc8+l7zQVOiwEZrCLwkwBrcl4dL2/FPg4DMFF
	Mna6rGN2whgzgYGxNSs+9gKqycSa95Ks+NG/QyCLozCIY9oxxIKl9hT5plkB9G+0NFp3rKj7jfJYg
	J2OYz9rBiA4o/YZAxVog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwlL2-009fau-01; Mon, 13 Dec 2021 13:25:56 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwlKu-009fWU-IG
 for linux-amlogic@lists.infradead.org; Mon, 13 Dec 2021 13:25:54 +0000
Received: by mail-wr1-x436.google.com with SMTP id a18so27029604wrn.6
 for <linux-amlogic@lists.infradead.org>; Mon, 13 Dec 2021 05:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=RGPKFGhr5F/E/uf8UwQ+T3hkhLoaT6Ka+qKxD0TAy+M=;
 b=JRkDFvB8MdbonLD5orH08ZpszbX+Hsq3f2nwGXw96fpGnPaqFoDrqvRETDKF5sU6KK
 xv3lQs9hvrmLFrUwoek0ZdOCHIuojptCQ1yWZHykSwAgLE/SK6SBW8pbq4FqAu6g9nWv
 924DpmYSw9ztdMDswaJf/WeLEqNSOOnxXB79SMBeaPNt8+ZkHgAD3h7s6ihu2/KyXDHx
 vg3QHBv5UPPh3eocemTtBBTTBzaqVjFJQV3N5wg3P+YsDm+0LqQNe1yuhHyH/jGmUPsq
 Z9s8l5gopJr2ohzjBHONWx2A7IsPSOM+b/Ws8sScQj3jhDNEsgf+fPLbKBmk1rPPAI0D
 0Evw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=RGPKFGhr5F/E/uf8UwQ+T3hkhLoaT6Ka+qKxD0TAy+M=;
 b=qiMJZ+SAX8/xgWc6S1oJly2hRuMxx7QldFyaNK0FHo+qPTW3b6VsHkNlFvZBh0PoOY
 btkshjNqZvVR2Mmr3z25YCHL1aF1Ldrbfirlwz6cVXupb79tdS3uMqlWSQrrF81kD/fr
 6pZKHL0YkqPKtoHGEJiW6GLsjfg12gMRz9oAbE2nrN3jaPGAaRvkMwcK8m1an8K01gaq
 qgCdbg92NyNFhwT/a9Iz6QHHFdkzCM5rfmUp9U0VdMCGbPR+ZxVJnmMX3qwTrKGJIh0y
 aC0kA1O0ugk9wyAHOU47Q/p2SyV85reHdzSYnCqCWYGG9bloFaGl+GHxaUFeR2UGBhdN
 88qg==
X-Gm-Message-State: AOAM531gfUyRkB9EjnsYFvDx6cwpGm/N1+CZemtKcEjlfE9zPCXYFT3t
 rjTmAccRDXe4jIFzb4Jw9XsWzg==
X-Google-Smtp-Source: ABdhPJxzzui67Mz+e62UPdxoEnqUeAe7pmkET3SPW+dmE86hGQS6DQJSsCelC6Y5tYdI7kls55z4kg==
X-Received: by 2002:adf:eb0f:: with SMTP id s15mr15577018wrn.690.1639401946598; 
 Mon, 13 Dec 2021 05:25:46 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g198sm8086757wme.23.2021.12.13.05.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 05:25:46 -0800 (PST)
References: <20211213070330.3351505-1-rong.chen@amlogic.com>
 <2021121319503910358221@amlogic.com>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: "rong.chen@amlogic.com" <rong.chen@amlogic.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Neil Armstrong
 <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 --to=1131046452 <--to=1131046452@qq.com>, 45581586 <45581586@qq.com>,
 linux-mmc <linux-mmc@vger.kernel.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, linux-amlogic
 <linux-amlogic@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mmc: meson: initial ocr available by default value
Date: Mon, 13 Dec 2021 14:22:25 +0100
In-reply-to: <2021121319503910358221@amlogic.com>
Message-ID: <1j7dc83acm.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_052548_733523_04E5F684 
X-CRM114-Status: GOOD (  19.73  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Mon 13 Dec 2021 at 19:50, "rong.chen@amlogic.com" <rong.chen@amlogic.com> wrote:

> Hello,
> If 3.3V always-on power source for vmmc is supplied by hardware boards fixed, don't need regulator in software, so  .dts unnecessary the link between regulator
> and MMC controller vmmc/vqmmc. 

Controllable or not, your vmmc/vqmmc regulators should be described in
DT.

There are several examples of this in arch/arm64/boot/dts/amlogic/*.dts


>
> ------------------------------------------------------------------------------------------------------------------------------------------------------
> rong.chen@amlogic.com
>
>   
>  From: Martin Blumenstingl
>  Date: 2021-12-13 16:00
>  To: Rong Chen
>  CC: Ulf Hansson; Neil Armstrong; Kevin Hilman; Jerome Brunet; --to=1131046452; 45581586; linux-mmc; linux-arm-kernel; linux-amlogic; linux-kernel
>  Subject: Re: [PATCH] mmc: meson: initial ocr available by default value
>  [ EXTERNAL EMAIL ]
>   
>  Hello,
>   
>  On Mon, Dec 13, 2021 at 8:03 AM Rong Chen <rong.chen@amlogic.com> wrote:
>  >
>  > The patch will add a value of ocr supported by the controller,
>  > to specify some of voltage values are supported.
>  Can you please share some details on this topic?
>   
>  We already have many boards upstreamed which work fine without
>  manually setting ocr_avail in the driver.
>  In general there's two types of boards:
>  1) boards where the regulator can switch between different voltages.
>  One example is the Odroid-C2, see meson-gxbb-odroidc2.dts [0]
>  Here we specify:
>    vmmc-supply = <&tflash_vdd>;
>    vqmmc-supply = <&tf_io>;
>  &tflash_vdd is either turned off or at 3.3V when turned on.
>  &tf_io can be either turned off, 1.8V or 3.3V.
>   
>  2) boards where the voltages are fixed.
>  One example is Radxa Zero, see meson-g12a-radxa-zero.dts [1]
>  For the SD card the board uses:
>    vmmc-supply = <&vddao_3v3>;
>    vqmmc-supply = <&vddao_3v3>;
>  (meaning fixed 3.3V always-on power source for both VMMC and VQMMC)
>  and for eMMC the board uses:
>    vmmc-supply = <&vcc_3v3>;
>    vqmmc-supply = <&vcc_1v8>;
>  (meaning: 3.3V always-on power source for vmmc and 1.8V always-on
>  power source for VQMMC)
>   
>  With the information from the regulators the MMC core will
>  automatically detect ocr_avail in Linux.
>  Or in other words: your .dts may be missing the link between regulator
>  and MMC controller vmmc/vqmmc.
>  Can you please double-check this?
>   
>   
>  Best regards,
>  Martin
>   
>   
>  [0]
>  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts?id=2585cf9dfaaddf00b069673f27bb3f8530e2039c#n354
>  
>  [1]
>  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts?id=2585cf9dfaaddf00b069673f27bb3f8530e2039c#n333


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
