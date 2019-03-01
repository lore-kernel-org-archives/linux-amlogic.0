Return-Path: <SRS0=o/5p=RE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4B27C10F06
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Mar 2019 15:26:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84CBC2084F
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Mar 2019 15:26:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KqHwo9Vi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="IXhew6MT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84CBC2084F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8US4eB3Uh8MTX2m3FwNjEkq54FanWq3rV/D10+O0x6U=; b=KqHwo9ViMdv6FZ
	JuMV8cdqG0pFZ7Ni/3vsAvRoCX8PmIModjCY952pnXV3yoEuNJa87rmjohUSbZFa28YnnzquDPNy3
	atRSU15/1193W60f42SVTPruhOjZ5fFfKVnDltOFqZ3MMJ/4HKBs+Tnl0vbgTJ11ejMUNyTkzBl4/
	llTv6Y70QShfbIwq8UYv4A9QqYvJUUiDQFV0fIOxq5gJF82l+Y47I0ZBMh7x88P9g7rCrfEB85+Do
	cQn0XlQ9AEcx4ZH3S8kSZ3Ss0Usfmjgkr9k0RRfYsr82pmhwqr3RjbVIaQ+sJQPIp4b739r+rLY+K
	r791NgEeUSm5JRY2LYRQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzk3D-0001oV-DS; Fri, 01 Mar 2019 15:26:15 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzk3A-0001nl-7K; Fri, 01 Mar 2019 15:26:13 +0000
Received: by mail-oi1-x244.google.com with SMTP id q81so19771661oic.5;
 Fri, 01 Mar 2019 07:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Eo/srFU45IxuxtBCG8At/eXT5H87tGwGcm2Tw40UFaY=;
 b=IXhew6MTfxtgTGysBeJTR/WH9W3klE/KOn1YHkjIPoo2E4ME5R5v8RYo9YElu++OxL
 qatmKu7r9QhS1wir0vjzeDZP2bvHvJq/Sg66d5LY6n6Gv8GcPUbG4sdSC/TKIEs8vCIi
 1sRpLH9Y+pPEKXALLty9o+JqmeB6qhiMg+uSMECbAJksp0AYWVwBT/C/YWOdpbbLNPgX
 19fwjyBKWwHwLxgcYolwXpHMZy7bJme/vG+wluBwMKv641gf241olLuuULjs/fryaB/A
 xc6pMe/9gMTtyK/LrCRIKkEpjLp6FTl1IXatoZkAtDVjvNaxvS7mwAaAQOlYTYYq5fPc
 veDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Eo/srFU45IxuxtBCG8At/eXT5H87tGwGcm2Tw40UFaY=;
 b=rpa9Nuf2v9su8jVW0oQ9v1GRMwYxGVZJ3sNbFeTLfUXFyn8wHXlzGcuvMX9VdZgYco
 NF+QQwPYvMYkHH24VQZEPRdyS5Ucf69YQhtgTha+tJPxPt+UU8oadnJ2upGIe3bBA9C8
 eBOrL/pZlp+uxKS30QTIRdrTOpJm65G1Sm55RIH2DQ9jpDG/I5pU+PMzw/7q4sBNFeDj
 Qzx7IBokNh0sAPcSp+UQLKk9S8NoX4cnBmaXfR6Llt7muuF7kd2lSRNFAkQUU55M5tFq
 WGs7njrENFJtNRIfNh26kCMUJh+S9MC9B7+4qMVhcJg/P3vMpIU4Dy9WXGySapYhTtCo
 U7SA==
X-Gm-Message-State: AHQUAuaDdeL3KCdcexzC3VzD78U5OSo54+ODYK5HgbUSYmRsiDfIZWOQ
 NjZ3bv8FqZiS5/5SVSWe0ET94AJdTKJSgW0kiRU=
X-Google-Smtp-Source: AHgI3Ia/gBXpSXXoWmv5YgxOzWpusVnInHAPZntpMsTmQ2OXzN9wY8kdKtf3VLzihLpVCAjaxauz0Ibiq+R0o16YTEQ=
X-Received: by 2002:aca:4205:: with SMTP id p5mr3716145oia.15.1551453970803;
 Fri, 01 Mar 2019 07:26:10 -0800 (PST)
MIME-Version: 1.0
References: <20190301102140.7181-1-narmstrong@baylibre.com>
 <20190301102140.7181-2-narmstrong@baylibre.com>
In-Reply-To: <20190301102140.7181-2-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 1 Mar 2019 16:26:00 +0100
Message-ID: <CAFBinCCtmykL-ccWd9cporEOmxeUKC-RgrP3wfuSuYoAEjrGWA@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: meson-g12a: add cpu clock bindings
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190301_072612_291620_C81AEF97 
X-CRM114-Status: GOOD (  13.91  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Fri, Mar 1, 2019 at 11:22 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add Amlogic G12A Family CPU clocks bindings, only export CPU_CLK since
> it should be the only ID used.
is this also true for the CPU post-dividers (APB, ATB, AXI, CPU CLK TRACE)?

> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/clk/meson/g12a.h              | 24 +++++++++++++++++++++++-
>  include/dt-bindings/clock/g12a-clkc.h |  1 +
>  2 files changed, 24 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/meson/g12a.h b/drivers/clk/meson/g12a.h
> index f399dfe1401c..4854750df902 100644
> --- a/drivers/clk/meson/g12a.h
> +++ b/drivers/clk/meson/g12a.h
> @@ -166,8 +166,30 @@
>  #define CLKID_MALI_0_DIV                       170
>  #define CLKID_MALI_1_DIV                       173
>  #define CLKID_MPLL_5OM_DIV                     176
> +#define CLKID_PCIE_PLL_DCO                     178
> +#define CLKID_PCIE_PLL_DCO_DIV2                        179
> +#define CLKID_PCIE_PLL_OD                      180
how are these PCIe clock related to the CPU clocks?

> +#define CLKID_SYS_PLL_DIV16_EN                 181
> +#define CLKID_SYS_PLL_DIV16                    182
> +#define CLKID_CPU_CLK_DYN0_SEL                 183
> +#define CLKID_CPU_CLK_DYN0_DIV                 184
> +#define CLKID_CPU_CLK_DYN0                     185
> +#define CLKID_CPU_CLK_DYN1_SEL                 186
> +#define CLKID_CPU_CLK_DYN1_DIV                 187
> +#define CLKID_CPU_CLK_DYN1                     188
> +#define CLKID_CPU_CLK_DYN                      189
> +#define CLKID_CPU_CLK_DIV16_EN                 191
> +#define CLKID_CPU_CLK_DIV16                    192
> +#define CLKID_CPU_CLK_APB_DIV                  193
> +#define CLKID_CPU_CLK_APB                      194
> +#define CLKID_CPU_CLK_ATB_DIV                  195
> +#define CLKID_CPU_CLK_ATB                      196
> +#define CLKID_CPU_CLK_AXI_DIV                  197
> +#define CLKID_CPU_CLK_AXI                      198
> +#define CLKID_CPU_CLK_TRACE_DIV                        299
> +#define CLKID_CPU_CLK_TRACE                    200
>
> -#define NR_CLKS                                        178
> +#define NR_CLKS                                        201
shouldn't all changes to this file (drivers/clk/meson/g12a.h) be part
of the patch which adds the actual clocks so the dt-bindings patch is
independent of the clock driver patches?
in this case the subject should also be updated to "dt-bindings:
clock: g12a: ..."


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
