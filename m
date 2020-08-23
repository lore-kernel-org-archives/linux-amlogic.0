Return-Path: <SRS0=3P0p=CB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CCC9C433E1
	for <linux-amlogic@archiver.kernel.org>; Sun, 23 Aug 2020 20:26:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EF0B2075E
	for <linux-amlogic@archiver.kernel.org>; Sun, 23 Aug 2020 20:26:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OKtgSWQh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="LOCA5F9z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EF0B2075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HVAIqbw3qHPLMLARQlJSjOvMB/BBvsYpoQMa4BDE8ok=; b=OKtgSWQhMnllsJ/3Tfl9PSdPS
	EE7QC4aJ94DgWu4zdSdLD4Kkx2UWH7npTfZos8CsxH1AEWXFG0DZc20+DMwI2NfeUegwUf93nPVGU
	umVBImy4F2LLx5nMkBDAu8isk/r/t1lAZqi+q0E+ouiIwx4xB7TunaTn4md+jgLu0JGpA3eqFq0fH
	IgGIJLwsiKNpfQSCcTAl+wBcSziDMJ+8imi8GO7xhqCOK8xFjmCahU7o3nTNo+lSOCuecWBLlJNRF
	s64g6H61LJt4no1YLPrbtwwGhI49UUXKRMTFKTojfF4jM+3b8MrLh3E0SMKcIMUNZ5C/9y6MY5LCz
	oW75WoPoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k9wYZ-0005zH-Nz; Sun, 23 Aug 2020 20:25:35 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k9wYT-0005wN-Dd; Sun, 23 Aug 2020 20:25:30 +0000
Received: by mail-oi1-x241.google.com with SMTP id e6so6485868oii.4;
 Sun, 23 Aug 2020 13:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9TTMAabZtXv1v/W56KRwCsWEu0W62vMUeZGZ/7Bh+hY=;
 b=LOCA5F9zkZeu/VxnhLT/ohqejrrx0vUJBviVgbDnnXSUMAL6Om4blNy0pkN/flamIh
 JLHMO60twH07UtWSXQSLAAtRkuw7rx6lc1PbAtNUW2vZILgcv/AGjhsQhD6n1+U7TDcL
 DEjmGbOTCF+VRUuEmXb8DSijTsGSrnn2C9UNAXAWz+ZYx8ptKUxkqsYhKD2tOzRhC+Zx
 PtPC2zfYnl8WCnCl2w6qeSwC5BOZP638NFvIZRoVbrqr31wSI7FIf3t+mkojoEOfmzBx
 TURQ1n09qFm/IzU140Eu/azyYy0h/MRCIa0QNDkiOJhyEG+P1HaKiyhz6w1X1H+tRxN2
 MpQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9TTMAabZtXv1v/W56KRwCsWEu0W62vMUeZGZ/7Bh+hY=;
 b=B788JH4E/vzzggw3xxEDXuqESzmlwnx88skVD3T+kQM9oLo+DGihjGf0NjYaDP7mJ0
 4XjnSX7guCOESZczFzv9cZ0XJzUd4w6Gudtd5mAzvon5/pdePKGkFaBwh7XbToONmkeG
 XHSLNGVse65z0W5HqKilsoub5M4YOGF863bCGtXAXhPRr9cx6ZzICpHwjL8hXGRIP0Rj
 kIFkQpczPI5AqzFSDCUENPMqdDZEXBmHXqI5unGazZTVnO1cx7UEo8tkJtbs9ioHn0Xn
 tkdLdunSagIoft+Rzn/FIE6B4RhHT0OJ82LEps1mahjZdVoofK15/9mKqy6xYIG6RoDG
 44mg==
X-Gm-Message-State: AOAM532bv4Y2O9gAzAqMOAzM/Q/QoVuW8VaP5YTXyZiTVVbbuzUVI9St
 gAViGoWpEKFKS/ZYQFMibA4eWW2IoSk02cS+fYg=
X-Google-Smtp-Source: ABdhPJw3d/plSErAABmhYra+1g0qqd4u7sUS7YJXUXBwRuTrlHBHP8cR0UlEC6wPuJiJFLg82tfpPMgphT0uWr9mQm0=
X-Received: by 2002:aca:72c4:: with SMTP id p187mr1325629oic.141.1598214325855; 
 Sun, 23 Aug 2020 13:25:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200815181957.408649-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20200815181957.408649-1-martin.blumenstingl@googlemail.com>
From: Thomas Graichen <thomas.graichen@googlemail.com>
Date: Sun, 23 Aug 2020 22:25:12 +0200
Message-ID: <CAOUEw13NDv9NoFphwLjSzwNpYp8RpVmfXjd0oR8AXNFQHrvcBw@mail.gmail.com>
Subject: Re: [PATCH RESEND v1] ARM: dts: meson8: remove two invalid interrupt
 lines from the GPU node
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200823_162529_597896_2D3D77DA 
X-CRM114-Status: GOOD (  18.41  )
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, Aug 15, 2020 at 8:20 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> The 3.10 vendor kernel defines the following GPU 20 interrupt lines:
>   #define INT_MALI_GP                 AM_IRQ(160)
>   #define INT_MALI_GP_MMU             AM_IRQ(161)
>   #define INT_MALI_PP                 AM_IRQ(162)
>   #define INT_MALI_PMU                AM_IRQ(163)
>   #define INT_MALI_PP0                AM_IRQ(164)
>   #define INT_MALI_PP0_MMU            AM_IRQ(165)
>   #define INT_MALI_PP1                AM_IRQ(166)
>   #define INT_MALI_PP1_MMU            AM_IRQ(167)
>   #define INT_MALI_PP2                AM_IRQ(168)
>   #define INT_MALI_PP2_MMU            AM_IRQ(169)
>   #define INT_MALI_PP3                AM_IRQ(170)
>   #define INT_MALI_PP3_MMU            AM_IRQ(171)
>   #define INT_MALI_PP4                AM_IRQ(172)
>   #define INT_MALI_PP4_MMU            AM_IRQ(173)
>   #define INT_MALI_PP5                AM_IRQ(174)
>   #define INT_MALI_PP5_MMU            AM_IRQ(175)
>   #define INT_MALI_PP6                AM_IRQ(176)
>   #define INT_MALI_PP6_MMU            AM_IRQ(177)
>   #define INT_MALI_PP7                AM_IRQ(178)
>   #define INT_MALI_PP7_MMU            AM_IRQ(179)
>
> However, the driver from the 3.10 vendor kernel does not use the
> following four interrupt lines:
> - INT_MALI_PP3
> - INT_MALI_PP3_MMU
> - INT_MALI_PP7
> - INT_MALI_PP7_MMU
>
> Drop the "pp3" and "ppmmu3" interrupt lines. This is also important
> because there is no matching entry in interrupt-names for it (meaning
> the "pp2" interrupt is actually assigned to the "pp3" interrupt line).
>
> Fixes: 7d3f6b536e72c9 ("ARM: dts: meson8: add the Mali-450 MP6 GPU")
> Reported-by: Thomas Graichen <thomas.graichen@gmail.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Tested-by: thomas graichen <thomas.graichen@gmail.com>

sorry - looks like i missed this one

> ---
> re-send of v1 from [0] because it was never picked up
>
>
> [0] https://patchwork.kernel.org/patch/11582619/
>
>
>  arch/arm/boot/dts/meson8.dtsi | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
> index 277c0bb10453..04688e8abce2 100644
> --- a/arch/arm/boot/dts/meson8.dtsi
> +++ b/arch/arm/boot/dts/meson8.dtsi
> @@ -240,8 +240,6 @@ mali: gpu@c0000 {
>                                      <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>,
>                                      <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
>                                      <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>,
> -                                    <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> -                                    <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>,
>                                      <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>,
>                                      <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>,
>                                      <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>,
> --
> 2.28.0
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
