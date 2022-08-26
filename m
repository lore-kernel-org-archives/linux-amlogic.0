Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A14B5ECAAD2
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Aug 2022 09:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4UWkPGubPhMwQAuqTM91WlsSwkinnzAcjor6Yzus6Nw=; b=gV9jg3AS3A/fYw
	NYfQ2X5pED//LfPaNVLX/HJH/oDtdvgbK/hhjj3TpeVwbMKJsE7fMdQZ9sZmAF1ihu0NHw9HUHkkT
	5MM1HNLtQe8P2NDomsKARo0Q5pJ5QJYCZso0YJq1cNNfusJa/7wUQxzun4uiIuYe8wcIR9tWElHC9
	n7pv2ewDumzKZKukxeLOyg3OgjjbIj/jDQcGqTRh1Dyu4b/nITePsUhOvj1BsOM6KUMLyPiWE5VAp
	RwtzUzakqz1Zah14YHSD4Pw1Z09i9jvc5XkfOlchMydJWZz9EDCnOku5n/Le4T/czx/kJcMZ43OBD
	cJCP/M62oWEG9XfQFe7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRVTB-000T6d-4E; Fri, 26 Aug 2022 09:17:41 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRVSz-000Spf-AC
	for linux-amlogic@lists.infradead.org; Fri, 26 Aug 2022 09:17:30 +0000
Received: by mail-lf1-x135.google.com with SMTP id d23so1187143lfl.13
        for <linux-amlogic@lists.infradead.org>; Fri, 26 Aug 2022 02:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=gse99LVVZ+s0NzcFeYnNMOa2sY4Nvzm38CgGv+mxYoA=;
        b=gtgsU8JUGcfQO5lbt+pt0b3USg0WmaEjHwGR0eC2zhDnzLijjX07ZXPviwekZf/QSz
         gOII2rIE6k1XBKHB45CXOG6d1NvlfMU+LZLHkDv0ICPTC+Kt8102oOdPLiIZlH95FQaR
         TaoMxfyYFLZzTPH5LtJ74dae4iLPcJ/7n86ak3oBMZSMqL8NULQQWF45mGyq9PAvuEc+
         +353KUJZfYSzZIvzEO3KVIG/4xfFQqw+5LKeOAI3EIbwDlkaXBs4zuaKXZZ8N089Wlqj
         MkCWcFtVsaSgf8GAENWCKAUFyfDIncwQlR3KhAuRJx+GqrPBIUHiBQ8Fjd/ymU8uLjq+
         186g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=gse99LVVZ+s0NzcFeYnNMOa2sY4Nvzm38CgGv+mxYoA=;
        b=Pt5KGhJZe7f+OORQ65xsDY00WHWRsHUspKqO/60TgdLaC6ttOAkm7gw5sfIkchWOoC
         NmbsKa8um4tn704bEkr16a2/cKELfQQmQIZqhdALCLHlOsjMTKWhHFsmjWl81pjpg1hz
         7qWMqc+BnEJrxJcRrbU0C8HocO3z5l0NnCgQxEy/PRtgEMFAT3mC7phhPBoOhUQ/ZVaT
         hCO732YtpdvfjuaSMq+t8lSB1D9BbsIFryU2zE+vhJhxMw+5W+Nv/7nHkiaLnpUVZoK5
         +EmEwHUbmCPvLK8CLUna2lthsR32UUBwIJZDscLWO6sGaZYCej4ykZOWE2fcBIYI2fIw
         NKsQ==
X-Gm-Message-State: ACgBeo1hdFoY6rBF3lGu/KJU/ZCd0YID9V40EvyKUHPlztCRBdgU8sLQ
	RtTJqhy08yq9wSSW4Q4/esKZtjGnlq6+3q+3OhxHpw==
X-Google-Smtp-Source: AA6agR6VRBeoYp6RsQWAa382P3cI0h1mU+eE6bV7HbsjLTQeoWf2eodw9E095dOILPJSqLJfyOWManU8Unfk2j30I0Y=
X-Received: by 2002:a19:5f53:0:b0:492:f5a8:2da9 with SMTP id
 a19-20020a195f53000000b00492f5a82da9mr2136571lfj.184.1661505445547; Fri, 26
 Aug 2022 02:17:25 -0700 (PDT)
MIME-Version: 1.0
References: <72459a46-fd20-60d8-a7e7-076d8f321816@gmail.com>
In-Reply-To: <72459a46-fd20-60d8-a7e7-076d8f321816@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 26 Aug 2022 11:16:48 +0200
Message-ID: <CAPDyKFokmJr7e8=gvsYbBbdxceG6kCa57vbYy1tUT_b+B=8P8Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] mmc: meson-gx: add SDIO interrupt support
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_021729_411795_05751A38 
X-CRM114-Status: UNSURE (   9.00  )
X-CRM114-Notice: Please train this message.
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

On Thu, 25 Aug 2022 at 21:52, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> Add SDIO interrupt support. Successfully tested on a S905X4-based
> system (V3 register layout) with a BRCM4334 SDIO wifi module
> (brcmfmac driver).
>
> v2:
> - use new SDIO interrupt API
> v3:
> - don't duplicate checking mmc->sdio_irq_pending
>
> Heiner Kallweit (2):
>   mmc: meson: adjust and re-use constant IRQ_EN_MASK
>   mmc: meson-gx: add SDIO interrupt support
>
>  drivers/mmc/host/meson-gx-mmc.c | 84 +++++++++++++++++++++++++--------
>  1 file changed, 65 insertions(+), 19 deletions(-)
>

Applied for next, thanks!

Kind regards
Uffe

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
