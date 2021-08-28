Return-Path: <SRS0=4hoi=NT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64650C432BE
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Aug 2021 16:12:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 231FF600D4
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Aug 2021 16:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 231FF600D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wsxcELU434S2oWU3v0sWZH+GSHfugB9Q/ybN0JBWLYA=; b=IOZZVuVyN+7LOH
	5qOwC/EDtJRLpbmzXV2Ne5u3ytEecfjw+BFReWAVxaeN90vVdm0uUyRjDLdVzEREzqP+G1wXFNsqs
	xwD4Rd004eMDMH/4izXfMRYHjWWaWC12XbFX6wq4V9IXP3AgoI5DlscxaOkZSN4wGDZjJNqpAZEJW
	DtXhFJhbcoTcVqF10/gr1kHwnbV2I7kwYY78d0x7wQpux09d04e9YNAqRcoK+c1gNAIj3lwZ4Rz9d
	H0Wod2cj2EvMO1A6gksNWBwo8QKxLPR5ohCQmc+VCDN8eUlrvbNA1SIHnZ0bUMuY+sfAap4tdMAUk
	yzFgUv+o9AKkmcZruAFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mK0wb-00EU87-Rd; Sat, 28 Aug 2021 16:12:33 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mK0wJ-00EU54-BC; Sat, 28 Aug 2021 16:12:22 +0000
Received: by mail-ej1-x630.google.com with SMTP id me10so20767735ejb.11;
 Sat, 28 Aug 2021 09:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zh8hDnqJsAxw2sHEwetCX3Pfnh6KEf01QqPdi2tUhVo=;
 b=RzA8y9BJgO9Uc7NUYFv1yBPc2LqFcxcEuXm/YpbKnSazwTnH19bzAHiMf+rRHnejRs
 ONzRH3t27wX6TPYw5W64WEQIEU97UxmudngkbhPJwT75ILTXUEJ/pQL0aIGNiAEhCFeE
 la8/WdCyHa+ZQtrYvf+tbL6cTTKZcGBMbgigbewRR0EYfBhC92tA5ucKp7JmAMDybg88
 C9c4hqttpyRx+ZrZ7F2U165S0IgvbnH4Vnt5Hm08QoEQL+eQKO8T20Wrd7hviDy8UZz4
 cmgPX2UyDU/00ZDgn41kLIzKP+mRy9OuDjnxbAzf0eGQ2cc0va9e1Ch7MnOIVqOiT8fW
 qMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zh8hDnqJsAxw2sHEwetCX3Pfnh6KEf01QqPdi2tUhVo=;
 b=FisY0F5gybGat3XZlWf5zzd9v/noysYEsQERaaefZ4OQ5MDmqHSXFAV2az/uoEwHv7
 9wHwo+nxpnrspPJhpXJS56gzia8DdJpF7FyEZT8F+MXn+Tv+t9/dYUe95WHCdDrA8Gi3
 vwrNLegeO9VFztGN3PTON8ixXg/kPbEz7eFH8zBQHwyCh953YHxEoUXfJUtUma+7o97o
 qsC5UFryViF+9FJkERNJoG+UJGSDUcdG/l3Kg7ZYMMOiooRgaxsU3uo/LOuqQtohOMw+
 pIlcPGJwKSEtiDjs/KGcXpiB8auFMCzwL6fwAAt7DbhpPi0S3P8qgoDO6kuMq2xWji3f
 Hr2Q==
X-Gm-Message-State: AOAM532emA1wp23eqJd8aIVC4kuD/nQ1GOipcLivqLUyKoevuAgDXsFl
 rlGpo4i36an6DGq9n2vTKzqASGmo8ImdErEPCBU=
X-Google-Smtp-Source: ABdhPJzuWi0ooqB2IgoUF4B8mSjiCIWZFx/7h6qHkEI4+ez8LFyTUS0Fe2+VVJ2DtD4r8UXiNRS9uBlCMc4AJVFdNTw=
X-Received: by 2002:a17:906:4d01:: with SMTP id
 r1mr15800109eju.471.1630167130522; 
 Sat, 28 Aug 2021 09:12:10 -0700 (PDT)
MIME-Version: 1.0
References: <YScKYFWlYymgGw3l@anyang-linuxfactory-or-kr>
In-Reply-To: <YScKYFWlYymgGw3l@anyang-linuxfactory-or-kr>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 28 Aug 2021 18:11:59 +0200
Message-ID: <CAFBinCDLmmtKztpoj5xvhwdagrH_7nJK7qUA+LOg7CWB5eCFRQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: meson: sm1: add Ethernet PHY reset line for
 ODROID-C4/HC4
To: Dongjin Kim <tobetter@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210828_091215_410299_23C45770 
X-CRM114-Status: GOOD (  15.31  )
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

Hi,

Thanks for this patch!

my first suggestion is about the patch subject (first line):
arm64: dts: meson-sm1-odroid: add Ethernet PHY reset for ODROID-C4/HC4

This makes it match the pattern of the most recent commits there:
45d736ab17b4 arm64: dts: meson-sm1-odroid: add 5v regulator gpio
7881df513680 arm64: dts: meson-sm1-odroid: set tf_io regulator gpio as
open source

On Thu, Aug 26, 2021 at 5:29 AM Dongjin Kim <tobetter@gmail.com> wrote:
>
> This patch is to fix an issue that the ethernet link doesn't come up
> when using ip link set down/up:
>    [   11.428114] meson8b-dwmac ff3f0000.ethernet eth0: Link is Down
>    [   14.428595] meson8b-dwmac ff3f0000.ethernet eth0: PHY [0.0:00] driver [RTL8211F Gigabit Ethernet] (irq=31)
>    [   14.428610] meson8b-dwmac ff3f0000.ethernet: Failed to reset the dma
>    [   14.428974] meson8b-dwmac ff3f0000.ethernet eth0: stmmac_hw_setup: DMA engine initialization failed
>    [   14.711185] meson8b-dwmac ff3f0000.ethernet eth0: stmmac_open: Hw setup failed
>
> This fix has been referred two commits applied for ODROID-N2 (G12B).
>     commit 658e4129bb81 ("arm64: dts: meson: g12b: odroid-n2: add the Ethernet PHY reset line")
>     commit 1c7412530d5d0 ("arm64: dts: meson: g12b: odroid-n2: fix PHY deassert timing requirements")
I am not 100% sure but I think you can just add two "Fixes: ..." tags here
That way this patch is also backported automatically

> Signed-off-by: Dongjin Kim <tobetter@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
