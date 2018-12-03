Return-Path: <SRS0=94bh=OM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 657BAC04EB9
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 09:04:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3443F20848
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 09:04:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TVjfPXx5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="PrcowEFG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3443F20848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uIFLMorvfnOOEBKzV+T4GpfMWR1UXziZsJxI8YTYsHg=; b=TVjfPXx5+M8ilI
	F2pSC+YNsktAyb+OmCHkJW6a99rhqDAzFqXiEjReTqUADOCdh4XYGhYmP9ZWaXNf/URwRg0GRBfG8
	AoGQbtrpPJ0/HFg3HVn7PSU3FXRlZE4MFfdVQ4/BO1irFIun3NfnGAkR02U5QKKzpAgRJO01lOltM
	594VQuBhbFMPE4H/3XWh1R4WvoLjrTHy66BfUHEAZfPHtpGAnMOb8jCd9XTZhVdlVPIALvUlpsNkr
	+gCy4GfNEEPvXhnTnkKM3TQoF3t+LnBOW9WHmm7U4/vhYeYcdE05noBXPdrK59aGdNZaUSesvhJtn
	P62SRqPjqc7MAF5rNdCQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gTk9Y-0004e8-JG; Mon, 03 Dec 2018 09:04:32 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTk9V-0004cl-EQ
 for linux-amlogic@lists.infradead.org; Mon, 03 Dec 2018 09:04:30 +0000
Received: by mail-wm1-x343.google.com with SMTP id y1so4833638wmi.3
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Dec 2018 01:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cbnSiiPTo0rBRXWRA1YfNnwbcPdqPK3l2FuBoNPldeY=;
 b=PrcowEFGPNg0nmtcm9kzyAoF+QEPJ+QDUuYHeJS8NGcUtNVnjRmu+Y0QaKuOpqe870
 g0G1foHKRO1PWeNzBVI0bjh8G89ymUvWfER1vbB0/euDQrEqzEXRCK4AYKiz2uFXSC0v
 0xOtWoUwEdaFiDBJpbjQvG9ta1qNVpOSd5ix63paEn7yR1ytVsSjh81mgEnfYh+xHHBX
 54g4lu9p4ShOcJOUrq30+LCn+Q9mNU7tY2c1irWryh0fKw5DeASoVfBgFrWCk6JKuSSz
 J6JRin/WFiFilsaN08/zp+2gVvK7BRqbvjgMBC+OxrK6694X6gMgkJQYZiwquxWadP2T
 8mlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cbnSiiPTo0rBRXWRA1YfNnwbcPdqPK3l2FuBoNPldeY=;
 b=Zu4zlp5yDzYetYgTDPLuMCQDPW8FcJRlgaAEf9Gp6znz06z4UVa4hIvx97S47wHuYB
 Y4ccAVywff3O/VXmzbKXKjPbv1Whia28dVjpZoCy6UgBT/sUsNU0OpssVe4460tUa0p3
 hQ7W5NRei+21a8mDC1vm6E5qjqme8kfKpUH8R043yC0Ftbfpsf7Z0ZPNI/Uo4cb9PolL
 PS9X1dmWeP7jdASljpfxvPzBOoeWUAnwTQjxED7F2oWoKJi5qe5tz34+CfZ+bhFy3tfN
 UOrXswWhsy9aXIERcOO/oYhqjKT+MYvmzezdVeWyYsqmAblKBOVV758fK5kKCNPU3r4m
 070A==
X-Gm-Message-State: AA+aEWYy9Zqa0hIMKmk9HHD7HypHudoILUEMlj7gOvxyWzRJr4ONrq0E
 MyoIqUDgltc8egCuSjGMkS5JRWDmnfpUd/pznJsJzQ==
X-Google-Smtp-Source: AFSGD/W17aijUKSMWrK8NheWjHNT7aphL3KBMaR1qrlV92JKfqe8BFLyo+nld/HeoLoHcjlq1FnwaNI27mvU8+BVpMQ=
X-Received: by 2002:a1c:af89:: with SMTP id y131mr7335459wme.137.1543827856276; 
 Mon, 03 Dec 2018 01:04:16 -0800 (PST)
MIME-Version: 1.0
References: <20181128100734.6536-1-narmstrong@baylibre.com>
In-Reply-To: <20181128100734.6536-1-narmstrong@baylibre.com>
From: Maxime Jourdan <mjourdan@baylibre.com>
Date: Mon, 3 Dec 2018 10:04:05 +0100
Message-ID: <CAMO6nawdGnr2nPvsZGT4WcnuetdvN=-e7j0SNWbCRvDBFw8GJw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/meson: Fix an Alpha Primary Plane bug on Meson
 GXL/GXM SoCs
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181203_010429_488840_F0B6AD15 
X-CRM114-Status: GOOD (  13.84  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,
On Wed, Nov 28, 2018 at 11:07 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On the Amlogic GXL & GXM SoCs, a bug occurs on the primary plane when
> alpha is used where the alpha is not aligned with the pixel content.
>
> The woraround Amlogic implemented is to reset the OSD1 plane hardware
> block each time the plane is (re)enabled, solving the issue.
>

typo: woraround -> workaround

> In the reset, we still need to save the content of 2 registers which
> depends on the status of the plane, in addition to reload the scaler
> conversion matrix at the same time.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
> Changes since v1 at [1]:
> - Fix flickering and shaking by moving reset when plane is disabled
>
> [1] https://patchwork.freedesktop.org/patch/263550/
>
>  drivers/gpu/drm/meson/meson_plane.c | 12 ++++++++++++
>  drivers/gpu/drm/meson/meson_viu.c   | 27 +++++++++++++++++++++++++++
>  drivers/gpu/drm/meson/meson_viu.h   |  1 +
>  3 files changed, 40 insertions(+)
>

I can confirm the fix works on GXL (aml-s905x-cc), tested with
LibreElec, 1080p resolution.

Anything using alpha on the primary plane used to be randomly
"shifted" with black patches, and this was particularly visible with
subtitles.

Things seem OK now. Thanks!

Tested-by: Maxime Jourdan <mjourdan@baylibre.com>
Reviewed-by: Maxime Jourdan <mjourdan@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
