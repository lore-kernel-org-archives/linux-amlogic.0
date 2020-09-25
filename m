Return-Path: <SRS0=7OpP=DC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC4F2C4363D
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 07:31:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E00B2311B
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 07:31:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rXiXWzUT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="pzwFXYCz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E00B2311B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KRvI9dHQLoIvqGCkmQ1omYqSAdZIWS9KzF8kgjJlpFw=; b=rXiXWzUTxq0U5dLfEzg12QVET
	vOJMqUyb6rNrf/dPHPwWVqhDc9hMvZTCSVUGHWsA4wPLcZjpqSnONy75IOJL8GR8HULl0gchiV5pn
	RLD4KC1IFqvI7O6rugA8nW7S7P4MKY+5yhDrMl7Vtx7Ly4UPEWmDmrMdAZKBG+EE57jNrRdS3jMwb
	ZPEWegSejG8jm+6x7Q3k7gMTc/pfwMVf5RIgtYONr9lzyGNXahWP7j0LHJeJtuXStLph04TssYcaU
	p9cE1ps5O5FvJU/KBRKypSXd2s6le85ZeuMcUPSQmX/AxDF+iWOxousJ0GyZCk2zbt2OGlkX/ZEYv
	E01E9YPAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLiCZ-0000jn-Iz; Fri, 25 Sep 2020 07:31:31 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLiCV-0000i3-No; Fri, 25 Sep 2020 07:31:28 +0000
Received: by mail-ej1-x644.google.com with SMTP id p9so2274552ejf.6;
 Fri, 25 Sep 2020 00:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q/nsln8uCL2jZ2YNTI+Z+HE6p0bio3wjBPlgzoNnPDY=;
 b=pzwFXYCzz9oSeS/D7ZP1IH04hn/IKmpBaG3+fZj0Lf7Y97nS+abTAYsj/1C7SYisrb
 4RY70z8jCZM3YISvuroWLa2QC0jcpl6jvcsy3pxAqh6J6Rbe9sEBRhohj3ZUbFGcI9Cp
 FVo1VsjFXprP7z86VMKwY5QXb7ynhQOru5myEOKokzFg/2/5Wb57xEkNHsztdMHcRe/C
 P1dv1OfwMviMeB4ceUduc3uZFlCCMNZG4y0MX9vI1ph64t/I0rFG7jQ3SiiXx0QqNo5y
 +CPs4kkITJObJFiFDHLhNSrTAXErSnA5DhSOXmFX9g+zn1PmjwF9yBSBQoFLZE9v7WGJ
 PL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q/nsln8uCL2jZ2YNTI+Z+HE6p0bio3wjBPlgzoNnPDY=;
 b=UbvESm0ibpg/VyRQp/k2CDeuTI3zKVPQ3OsbbQ3JYqN++EC48glwGiTnH0z46dEG41
 5676hoEK/S+2eN4MqBxp1ihWPxWn5ipAoHHwncjpm1d3z2YNCVTAj0Loiu6nDtHfLTtC
 L5A2Pz70VgroSvJTqNsREJRKGvbdcMYpIjQSmQNQU1bTZ0+IIpbhOOMkLZEcO3dGzrzK
 dF5dDWqqF25XoNebP9L0eeuYstj64BVdsX0dcf3qyi23Tov9SP+ApYmaygFYFU64MrnV
 CdwfLHZKVQvUjR5ioK+Vdm6vBfLlSt7zNGOY0a9cXGQGLSXJTSOZWoSWM2fLoq36MPwN
 THvA==
X-Gm-Message-State: AOAM533qG8rTQzlrBfVZLFnlp27yXoQZwZihUSDU9/vypSAKupL0d3QT
 cbuE6zhXzJghqEXeqpctPZV2eDWi1a13pWG6lhU=
X-Google-Smtp-Source: ABdhPJzJjHU+hyv4iRkRjRy20B6asyj39Ew26X4S50nuLfsIkVNLeN1t4qiY8E216P3raQCdxC39+JrSkBifH1fb28g=
X-Received: by 2002:a17:906:af42:: with SMTP id
 ly2mr1345909ejb.362.1601019082036; 
 Fri, 25 Sep 2020 00:31:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200925033017.1790973-1-art@khadas.com>
 <20200925033017.1790973-8-art@khadas.com>
In-Reply-To: <20200925033017.1790973-8-art@khadas.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 25 Sep 2020 09:31:11 +0200
Message-ID: <CAFBinCC+iTScTc76aFmqJ0NyhKB9pVwqVjFqBQvcQPVBE34izQ@mail.gmail.com>
Subject: Re: [PATCH 7/8] arm64: dts: meson: enable RTC for VIM1
 meson-gxl-s905x-khadas-vim
To: Artem Lapkin <email2tema@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_033127_783551_17AB9C64 
X-CRM114-Status: GOOD (  12.29  )
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
Cc: devicetree@vger.kernel.org, gouwa@khadas.com,
 Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, nick@khadas.com,
 linux-amlogic@lists.infradead.org, art@khadas.com,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Artem,

On Fri, Sep 25, 2020 at 5:31 AM Artem Lapkin <email2tema@gmail.com> wrote:
>
> enable RTC for VIM1 meson-gxl-s905x-khadas-vim
I think the commit message should always explain *why* the change is
necessary (what problem does it solve?)
for trivial changes the diff itself explains "what" is being changed

[...]
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
> index 8bcdffdf55d..354f21d4171 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
> @@ -98,7 +98,7 @@ &i2c_B {
>
>         rtc: rtc@51 {
>                 /* has to be enabled manually when a battery is connected: */
why do we need to keep this comment?

same feedback applies to patch 8


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
