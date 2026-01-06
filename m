Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0743C47BDF
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Jan 2026 10:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ck9gelO6txejmojGpfoXuHotaMZAReYOR/ygKvMW2gE=; b=l2uWaqiKv38y/w
	4TXXMGYaIia1TYB+9aD43xan/r1PhbctXZp6L6MDfzfxupoKCu5Bw68jiwu2Ms6jdZ0WYH/Tee9tD
	gvi2Ma+mTEaVwUEKFawMXSLbH29HY+pIM7yHK0OehfhCURYsJsvr34NyhZs/w4Fj8jdlIfdDe3A1e
	BY532gOkH/LvXtOoyG0YwVlaebIG2doHj9GeqAlWBjKdcJWovGIfa1EuBmOhqlItRLjfJ5S4yjdBC
	1GXffgOWwHaH1OBALd1QshQ8IVRjW/LB9sN8c4lYLolXAuXnflzUkixJpQg0mVlCubGBd02zHtJDD
	i9yw9oMt0aUdU4n0rBHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd4Fs-0000000CnFl-0gSP;
	Tue, 06 Jan 2026 10:25:36 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd4Fn-0000000CnDw-1973
	for linux-amlogic@lists.infradead.org;
	Tue, 06 Jan 2026 10:25:34 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-430f57cd471so362458f8f.0
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Jan 2026 02:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767695122; x=1768299922; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0qANYzoev4CDFAFriC0/ymDfXiPKNr8QETcgvp/u6vU=;
        b=qs40OGf/hgWta15M31cEvkk14FmdU66h3yTTwY+wrm2gnJYP65pqdp3gET3bUj+twQ
         Z5APIwfwYgPhpdtx80mbVhO2JIXptqZRLqKBbkIXYRjlHec3LRQNCc1YZEzMHtcJbPeU
         4fG1fsLk43z6xSgXMpuywojymXEd6oFp9S1D0zFrX2IoZY786YE8PYUjwukcm0gjA6fT
         FCqG8Ylng2ULqpOdWu/ebWh/qVTE6D5Dkzs1jx8+Oc3fQfDPEDqJzBaV99FLWPOZUp9Q
         /ipKuJZhtEA04bfIK37mq4jiJ9/YPxQGl9p6RyJHtHpf11GJwoTHdR/hcmZh1GEBCpSE
         Iyqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767695122; x=1768299922;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0qANYzoev4CDFAFriC0/ymDfXiPKNr8QETcgvp/u6vU=;
        b=GgbTTpKc+qqYUoddFYhvzZPMU4fU2yA9IvwPeduXkbJ/X3Oi86N7YZZ0M1PcnIamzH
         SYI2oJyfO3bfUARtHxbtA5DIhlnVsrqMX+DFQJDDAIYkUBiBYiZ/k9VHz8FKBOq6tHoL
         kY5P/V+lfVh9h1ECDR9pP4m2MqAuBW/TXvEhsvgmLS7g4TjqTIMVTg22F8rQe/29wLkx
         VUiT2NNVUkNRdr9YdOSGrjkiy3jDiaTiGonJEshygbOGTLra/MWOlorXqfhLIEjE+IEb
         ALPZ4J8sEButiT1QgE3iIWUn1rSfqGj24dyogqrWoQsYMpI2X9aolzzhxTV8An/b4DxZ
         SXAg==
X-Gm-Message-State: AOJu0YybvNO8zbhd0GRDpkWK3kDPxswHB3q9AUEDbvV05TtgqLbt3ONj
	tlw/aJyRV1jsqIx7KXf7GptbxLaO21czhfsWU0NiDtJBibSuXTtEmJQMnPhBbM8kREU=
X-Gm-Gg: AY/fxX5V9v1IPRtptRjzCrkgArhw23zrzF2bkqT3U9gfXk+Ec623BlhJpmI6UwfAZ0X
	JOXHho7M7ygVhWZCXhBcjJV3hyIg8WqslbE1ZLKxPRp2wx4jfsJahXMI8s6YqpkgD4hr4JUvyST
	N2UFkZJdAdQ2ex+Qo38SvN/rQbDwc7VRJobLhyFaL2AdTbzAcKHwT/sM08A4sixrwO8P7eOIdYm
	agerKo7wNmCCqsKcs3EEJZIIh65Sx9R5skN/xLxy0decNdnthV9culHP0NXN6MbtwVMG0CijDag
	n55PVD++o6C/jz2Vn/mAoPSgaUn0Ojj7+DuJ3frGjrwVlKYZos0N7YgbhUUZYNPlSNrU5XAhCRx
	C1XsKzeBKrwhLBfWLiOFv33CniZLmQ4FuE656xyyCr4yWWb6DlpSgH95xU5O7XRE5GweI93esDB
	JaPvEYj0NAxA==
X-Google-Smtp-Source: AGHT+IEv0FV/dLsQxvu+BoaxabRvTrsfnnhhr1sy/Eszfp34wH82WJypgYYqe5SNFW9OsYmIAalYIQ==
X-Received: by 2002:a05:6000:26cb:b0:430:fcbb:2e6b with SMTP id ffacd0b85a97d-432bca3f1c9mr3845176f8f.27.1767695122452;
        Tue, 06 Jan 2026 02:25:22 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:e12b:7496:6c81:d3aa])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-432bd5ff0b2sm3584447f8f.42.2026.01.06.02.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 02:25:21 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  jian.hu@amlogic.com
Subject: Re: [PATCH v1 0/3] clk: meson: small fixes for HDMI PLL OD
In-Reply-To: <20260105204710.447779-1-martin.blumenstingl@googlemail.com>
	(Martin Blumenstingl's message of "Mon, 5 Jan 2026 21:47:07 +0100")
References: <20260105204710.447779-1-martin.blumenstingl@googlemail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 06 Jan 2026 11:25:20 +0100
Message-ID: <1jfr8jdomn.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_022531_421968_FF7C34A1 
X-CRM114-Status: GOOD (  16.09  )
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

On lun. 05 janv. 2026 at 21:47, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Hi Jerome,
>
> this series contains two fixes for preventing HDMI PLL OD /8 on
> GXL/GXM and G12A/G12B/SM1, like the downstream driver does. See:
> - downstream GXBB code: [0]
> - downstream GXL/GXM code: [1]
> - downstream G12A/G12B/SM1 code: [2]
>
> I have verified this on GXL (Le Potato) by setting HDMI PLL OD1 to 0x3
> (which should result in divide-by-8). The resulting frequency reported
> by meson-clk-msr is double (meaning: only divide-by-4) compared to what
> CCF sees.
>
> These are not critical for now since the CCF code-path for the HDMI PLL
> is read-only (as drm/meson directly programs the registers).
>
> Additionally there's a cosmetic fix to use the HHI_HDMI_PLL_CNTL3 macro
> instead of calculating HHI_HDMI_PLL_CNTL + 8.
>
>
> [0] https://github.com/hardkernel/linux/blob/0e658067af67835a625e41e289effc4ee390d62f/drivers/amlogic/media/vout/hdmitx/hdmi_tx_20/hw/hw_clk.c#L505-L627
> [1] https://github.com/hardkernel/linux/blob/0e658067af67835a625e41e289effc4ee390d62f/drivers/amlogic/media/vout/hdmitx/hdmi_tx_20/hw/hw_gxl.c#L501-L553
> [2] https://github.com/hardkernel/linux/blob/0e658067af67835a625e41e289effc4ee390d62f/drivers/amlogic/media/vout/hdmitx/hdmi_tx_20/hw/hw_g12a.c#L671-L721
>
>
> Martin Blumenstingl (3):
>   clk: meson: gxbb: Limit the HDMI PLL OD to /4 on GXL/GXM SoCs
>   clk: meson: g12a: Limit the HDMI PLL OD to /4
>   clk: meson: gxbb: use the existing HHI_HDMI_PLL_CNTL3 macro

Looks good.

I'd like to add a comment like this in the code

+/*
+ * GXL hdmi OD dividers are POWER_OF_TWO dividers but limited to /4.
+ * A divider value of 3 should map to /8 but instead map /4 so ignore it.
+ */

(and a similar one for the G12). Is this Ok with you ?

>
>  drivers/clk/meson/g12a.c | 13 ++++++++++---
>  drivers/clk/meson/gxbb.c | 19 +++++++++++++------
>  2 files changed, 23 insertions(+), 9 deletions(-)

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
