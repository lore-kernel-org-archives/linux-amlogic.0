Return-Path: <SRS0=VErV=K5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7AEEC47082
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Jun 2021 18:21:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BD1E613AE
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Jun 2021 18:21:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BD1E613AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W/q5AHg2Jj+WACXI6+I2BvpKjDPoxMa24hUuhpsqLQk=; b=S0HqTyTVENpL3i
	sLYeNJquGy9e6T4Jn0Wij3DI3rQ7rjX9jRaasbqyk4hGb7sfKNewD4Y6TGqXM0NuH+B7TnndYqtS6
	5FEOagPCyhPB/pyyojkfizrCCQU/6O5blZffcm95RiLGKJEBVIl2lhohx9howBM4R0J2GMBGCe3V4
	jZ8VkuP+3bF90xHshl3/zx/nZzVaml1gVjdIgPNDdjMbkHNvH4A7IwKrP7bkEdHd0uQnwOUF5cbvS
	SLg+P3W1Wd4Ob2uFSj8Ai4VyBttAc3EIJUmJ1cUQo/sh/0X24oOhBtApW9XjYGQQF2jBpOPZXmEkA
	OH6q7h1IW5FX33lLuEpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loryT-00A8zS-6I; Thu, 03 Jun 2021 18:21:45 +0000
Received: from mail-ej1-f47.google.com ([209.85.218.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loryQ-00A8xt-Jd; Thu, 03 Jun 2021 18:21:43 +0000
Received: by mail-ej1-f47.google.com with SMTP id g20so10712531ejt.0;
 Thu, 03 Jun 2021 11:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ADVoquzaV0LEIwvO5Q6pqef0DTPmXc23DXJhuut77RA=;
 b=D3lf5UiTa9SvEkPsI7imOnzwWcIjbYO0/a3Jg5VFaj5MCXTyhcZE8yWE3TahpqWTaL
 BtMiAQBRWV/HT2ZqmwV7DKqnRaAV5z89xM8bYnRlgXqiu7qHGs7hCIHq+dNPV2h0ycmg
 4Wtv2CqkZFuFOjJVuZCM30nlPpJpaaG7Loc+TycbjPboJkkVo4Tl3JcPO5kdIZRw8BBA
 RVoQ6Nyh55iZXVVaADPdjkCwz09FJZwxSlbZ1AzWI6JdaymZWSKH7GVAdiJwluQthYRw
 jRDjtjPiCB59t1wPaKFngQ9RNCNxLtF09VgWweFwVT+wnBpFOTI0+kiodG4m0gqCsg3b
 P7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ADVoquzaV0LEIwvO5Q6pqef0DTPmXc23DXJhuut77RA=;
 b=ke+4mGffwUtjvPSWlQVvqGajFOM76L90W92rP5RWZOkrz1el6W4alTj8nvZYxwx0/r
 E8ntj42bke7odHJB0B0QOlmPgYF/oUywYNtW5AFU22cBKFwC5P6TVqe3Txo3CQpNULQP
 q5RElzWhVRMYZQfUPb9CeI2/OubND3g88Gz4gkxeI375EJCLQ8Cpm/yrD1RDxlJRI0gL
 K6GXKGAH/rDGu28iDAc7z1KBUucJJr3mbheGA3ahoRJRAqTusjZH4T4cBFiiuXXe/3BS
 h/1p/Lq8ysWyRV1yzvkiQVQHiNVrQFFHG+gZry/3FG4Pt3rL5i5iyfXTzht89Y8K6P5H
 O5sA==
X-Gm-Message-State: AOAM533h19/MTDWY13gOYMUdJMJZoKf8YSgxFXJcX+OUMU+FhpdOdNRx
 6nTzPfW0JnIy51DaN/9FNmsbkLXOGfG586f6N4Y=
X-Google-Smtp-Source: ABdhPJw2MzrYlh8vu+LAt1q2tmMgENbP3bjmsOtbZJwHu9NzmzZmm5ZNkJTKCubMB3ZXF/AlchDhFRYZtvDSHiIspiI=
X-Received: by 2002:a17:907:2d8d:: with SMTP id
 gt13mr633877ejc.162.1622744440824; 
 Thu, 03 Jun 2021 11:20:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210601084830.260196-1-narmstrong@baylibre.com>
In-Reply-To: <20210601084830.260196-1-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 3 Jun 2021 20:20:30 +0200
Message-ID: <CAFBinCDeo=Mc=hjSuan_zE=SsZnz=vdjOwBY178PTnNcJBJK0g@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc3-meson-g12a: fix usb2 PHY glue init when phy0 is
 disabled
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: balbi@kernel.org, linux-usb@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_112142_694252_B7B0F702 
X-CRM114-Status: GOOD (  10.75  )
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

On Tue, Jun 1, 2021 at 10:49 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> When only PHY1 is used (for example on Odroid-HC4), the regmap init code
> uses the usb2 ports when doesn't initialize the PHY1 regmap entry.
>
> This fixes:
> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000020
> ...
> pc : regmap_update_bits_base+0x40/0xa0
> lr : dwc3_meson_g12a_usb2_init_phy+0x4c/0xf8
> ...
> Call trace:
> regmap_update_bits_base+0x40/0xa0
> dwc3_meson_g12a_usb2_init_phy+0x4c/0xf8
> dwc3_meson_g12a_usb2_init+0x7c/0xc8
> dwc3_meson_g12a_usb_init+0x28/0x48
> dwc3_meson_g12a_probe+0x298/0x540
> platform_probe+0x70/0xe0
> really_probe+0xf0/0x4d8
> driver_probe_device+0xfc/0x168
> ...
>
> Fixes: 013af227f58a97 ("usb: dwc3: meson-g12a: handle the phy and glue registers separately")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
