Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547B4C61DA4
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Mar 2023 15:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iNmw746IxgcOor1nhUrJR9Mg4R7T5VcC53EzMFw7KR8=; b=xwwFFA3e1Vikyj
	vi1HwX/CrR9jFBU/uGKk4buJ0yikFt8fKMeN+Goh0/g8FZmVtj5cYVyojoOaCnSg0P0+v9kqjbRjq
	HxqvYmr3yBn6rlFHgUbLItRsu8fAnPN/S8x+oTwR273hwRKz/nxqsAsmGGtfEYffdIAslPS4M9AT6
	jpalyZJjXK1Cky/CLHADUO2U13/atNd0MyRMRkxpOOgYcp0AUzbfxSO0fVDbg3wgmjzURKJtcbaix
	pCygWnTJJrxyecKr6rgfoQbuTrNlhy2Ax59uPY7W1NhlIf3wnewzTn8Ud91MB25r3agA2/VHz00pJ
	nZ1vMo9Lpjem6tWpU4Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcT6E-00Du7O-0p;
	Wed, 15 Mar 2023 15:31:34 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcT6A-00Du6O-2r
	for linux-amlogic@lists.infradead.org;
	Wed, 15 Mar 2023 15:31:33 +0000
Received: by mail-wm1-x32f.google.com with SMTP id k25-20020a7bc419000000b003ed23114fa7so1327922wmi.4
        for <linux-amlogic@lists.infradead.org>; Wed, 15 Mar 2023 08:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678894286;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=HAuSI8fbf7EjZnoEFKw9ekptMB+UHMwvd5cIIOc8Nq0=;
        b=kVC3ewfF9E9iXAXtUnrnDJjZ84FVvmCPd0CzgEsXl/0VH3ZIw76/aZDK3CcqX+BWXj
         GvIYyXIcob1C28cz+e0yDEnsMV4wFL1X2i/HIthW9va8ef4oSFk//DaP9Zou/Fbnc4dw
         +ElKez+J8IKzFJHf9OS2hUOpm+Sg3ZCpdOjDnHajtK+cnb9nwyURW5HPNvTYVkSOTCFe
         tDOAAKj4CdfBI9bJlwN6tJ2y1HaKQTcO/1RudRnS9MFhCjt5iuRfUWYJ7TmgL7sQPXPx
         Wh7am538u5wgqUT4hsTgbDITsosO9JTKmBHfC+RE1PVgipClplyouiqI9C3aCbP97+y2
         kwGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678894286;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HAuSI8fbf7EjZnoEFKw9ekptMB+UHMwvd5cIIOc8Nq0=;
        b=Ktouhfa/lfU0qHDNR+gte4krYYPSEdKeHESZtSZZIc8Gl5YfidV5UrTluLXf70l5nT
         uiuW7os/VIZjGPkY7NqaMoyCeR0QPeKCK70N9O9+Lhe/iKPBk+78n4aZx2V5NBQ8uh26
         FipwjcfCbaLKcz0pw9TH5Ns6NNgLAwyLQfGoFI7ndx70jHCEBgAO9JVsi6MiFSlrwsDK
         SYYG4IhFbWMfme6J53AT1j/ifgwAMhPQeDLTap33dyO3EbUU5kt6Pxr+QKRL8uI1By1m
         JqfNJ2K1u+K3q6lamWVTdhZRfohuh60uYVyfG0plcH2XA64hPotSD3MHUxo4owjA7Jd3
         J9CQ==
X-Gm-Message-State: AO0yUKWBRMZsVAHRwq3HiYhnw6BUNsmNIiDPsyJzxdtEFz/vQX273KiP
	6a0mk2fVAg7r22teNq8TEWiUIA==
X-Google-Smtp-Source: AK7set//NBBiirSk/SotcHjXSzOBy6juc2x591Eu3xI+gLXsnPeVz8IBxWAd/Pnyw6ynhUCofUt15Q==
X-Received: by 2002:a05:600c:5408:b0:3ea:ecc2:daab with SMTP id he8-20020a05600c540800b003eaecc2daabmr20277290wmb.3.1678894286579;
        Wed, 15 Mar 2023 08:31:26 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id e4-20020a05600c4e4400b003e8f0334db8sm2315660wmq.5.2023.03.15.08.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 08:31:26 -0700 (PDT)
References: <11a8a0c8-a5b1-8f38-a139-97172ab7be68@free.fr>
 <0696106f-8d70-6410-999a-fcda6c5b39c2@gmail.com>
 <b6971cd6-80f2-522a-64fb-82b126500010@free.fr>
User-agent: mu4e 1.8.13; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Marc Gonzalez <marc.w.gonzalez@free.fr>, Heiner Kallweit
 <hkallweit1@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Pierre-Hugues Husson <phh@phh.me>,
 Rong Chen <rong.chen@amlogic.com>, Yang Yingliang
 <yangyingliang@huawei.com>
Cc: MMC <linux-mmc@vger.kernel.org>, AML <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH] mmc: meson-gx: increase power-up delay
Date: Wed, 15 Mar 2023 16:27:19 +0100
In-reply-to: <b6971cd6-80f2-522a-64fb-82b126500010@free.fr>
Message-ID: <1jcz5axc8j.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_083131_135983_037FC70A 
X-CRM114-Status: GOOD (  24.30  )
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


On Wed 15 Mar 2023 at 11:20, Marc Gonzalez <marc.w.gonzalez@free.fr> wrote:

> On 14/03/2023 20:45, Heiner Kallweit wrote:
>
>> On 14.03.2023 18:24, Marc Gonzalez wrote:
>> 
>>> With the default power-up delay, on small kernels, the host probes
>>> too soon, and mmc_send_io_op_cond() times out.
>> 
>> Looking at mmc_power_up() and how power_delay_ms is used
>> I wonder what you mean with "host probes too soon".
>
> Hello Heiner,
>
> Thanks for your interest in my patch! :)
>
> I should have added a link to the thread that led to the patch.
> https://patchwork.kernel.org/project/linux-wireless/patch/c1a215cf-94be-871b-2a8a-3cc381588f83@free.fr/
> Start at "I have run into another issue."
>
> Basically, I have an S905X2-based board.
> I built a small kernel for it (with only a few drivers), that boots really fast.
>
> mmc2 (SDIO controller hooked to WiFi chip) would not probe at all,
> unless I added lots of printks.
> Basically, calling mmc_send_io_op_cond() too soon after the controller
> has been reset leads to the CMD5 request timing out.
>
>

I tend to agree with Heiner here.
This patch is backing a contraint only reported on your design in the
driver of every AML SoC supported, for every MMC controller.

I think you should look first in your vmmc and vqmmc regulators and
their setup times.

"fixed-regulator" have properties which might be interesting to you,
like
 * startup-delay-us
 * off-on-delay-us

>> Are you sure that the additional delay is needed for the Amlogic MMC
>> block IP in general? Or could it be that your issue is caused by
>> a specific regulator and you need to add a delay there?
>
> The eternal question...
>
> I have only one type of board. (Actually, I have a reference design
> that is slightly different, so I should test on that one as well.)
>
> In vendor kernels, they add delays to the WiFi drivers.
> Maybe they have run into the issue, and they're just fixing the symptom?
>
> Default value for ios.power_delay_ms is 10 ms.
> msleep(ios.power_delay_ms) is called twice in mmc_power_up().
> So raising the delay from 10 to 20 adds 20 ms
> to the latency of initializing SDIO/SD/MMC controllers.
>
> Would you be willing to test if the problem manifests on your board?
>
> Regards


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
