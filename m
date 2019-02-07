Return-Path: <SRS0=fppM=QO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B71F4C282C2
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Feb 2019 15:11:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87E5921904
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Feb 2019 15:11:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XQHD5dRA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="GPVCVZAg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87E5921904
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hRqoW+TtZUbVFAhmjLmdr8mL4m5ZZsa1eaGusXtsfug=; b=XQHD5dRAc6tK6t
	6BUyfkM8ozk84L9bqc/KyayDAGf60c+ZP/AK8NlpY0Wx9/L3L3gprk0Gz84Jp//BMsyXnkjB0ddWi
	/q/83YpsUqo9WZdKK1BY5U9US1RCzDe4GOJE2DTFW6UPA/Zou97xXY1edLTalL9L2xgrDTcnAIIXB
	jJ/LDrdFsLGt3tEX7nzo3Um0QY8aO0RnRG4+YaqMXKqegonaWDQ/YTeQ9tL7fHjx2ecKwtlRsNUvU
	bTLpvelgUSRNfJE4Z5IVmbZU66CMgb0hDxHLAQjhpoEbsHjs9RFO/I0oXoYpgw4aQuk8bHQam6NyD
	XNfAgOK5CrPKmwLnXlKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grlLD-0004Fn-8s; Thu, 07 Feb 2019 15:11:51 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grlL0-00044R-8L
 for linux-amlogic@lists.infradead.org; Thu, 07 Feb 2019 15:11:39 +0000
Received: by mail-wm1-x344.google.com with SMTP id a62so202365wmh.4
 for <linux-amlogic@lists.infradead.org>; Thu, 07 Feb 2019 07:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=1Uwwg9nLiHV0sNyKWuMQpb+u5rQNp1/DEHna6HgOtUk=;
 b=GPVCVZAg+/LBCFmAt8FdqOl+kCQ7bzQRHivENkHLLDsXGkoXC4EQ14tXsuHiUqLykR
 a4hZ78G7aYUrskEfXf15t+Ex0JFQurVWskpEfIawYwZhZKzCj10cuWdfP9kCcoj/jIc4
 5N+SzUHnvujLph6chwQjom2J+G6jX9LZvy8aVMtq8gW8vOu9NwW1JW7+hI6hDfTmyNtt
 cgDdWcOl6p6Bx0ImZl0IiiFrGGQ/iF0HjIYEhqczWhJ2qB9WSajNlyLbdVB/WqHmoclr
 OGQmnluAvyYbyn3iXl780ufioptvQ8xSAukXxXcgSuz0/bCu+vPTUiGh9j4DcSGr32bl
 YHOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=1Uwwg9nLiHV0sNyKWuMQpb+u5rQNp1/DEHna6HgOtUk=;
 b=umiChoLWJ2vfKX+3/WZcSfnoCSkXC/3JMeW802qdPAn0gAUSi1zuRsbCoB1m9I2U4S
 3wP2AX6Q7jI+UREK+MHc4WiJQHlBskLLI5Qx7srQilHLyzFQW9G2D0UVi0eZtP+1Y41W
 b6Vr0HxmCT+OARWMwDPZdhcUCbuhTy6ALYxp0xM7BsjFayECyBRaBCFBB44IT1mw5dQH
 paO8EvFTmyUJ9s/ycshUyTSatehTmBC6QZuEjH380+iUPMb4ayhmitaGZBLjqt3b8HKW
 kVtu/6iVWlPA6rF2T0L0DEgas2jse+eaLE4meRoZImqd8MNlstnxsUI3VE8pPV+/Piod
 bO8w==
X-Gm-Message-State: AHQUAubUdaNnaPNCFITEHWQufVuloiGtDi+V5D5hhz5bKwjJIvhCA4QK
 REvecBntFmUWCj8OWsBsPIktz4Zzb9A=
X-Google-Smtp-Source: AHgI3IZrWNwrZmdcBEdPshlxOJzdBIXDneiPR4oAfp+6+6a8rdHXFSZimNdpaGcmEe/TgVWu5yhRmw==
X-Received: by 2002:a1c:ef11:: with SMTP id n17mr7733770wmh.112.1549552296549; 
 Thu, 07 Feb 2019 07:11:36 -0800 (PST)
Received: from boomer.baylibre.com ([2a04:cec0:1103:b081:462c:a008:349b:2f3a])
 by smtp.gmail.com with ESMTPSA id
 z11sm37119374wmb.45.2019.02.07.07.11.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 07 Feb 2019 07:11:35 -0800 (PST)
Message-ID: <8852692ccf2903e93459e3347a0a072d37e5a84c.camel@baylibre.com>
Subject: Re: [PATCH 0/2] clk: meson: Add G12A AO Clock + Reset Controller
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Date: Thu, 07 Feb 2019 16:11:33 +0100
In-Reply-To: <20190204091331.9298-1-narmstrong@baylibre.com>
References: <20190204091331.9298-1-narmstrong@baylibre.com>
User-Agent: Evolution 3.30.4 (3.30.4-1.fc29) 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_071138_314094_23844239 
X-CRM114-Status: GOOD (  13.49  )
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 2019-02-04 at 10:13 +0100, Neil Armstrong wrote:
> This patchset add support for the Amlogic G12A SoC family Always-On
> clock and reset controller.
> 
> This adds support for clocks on the Always-On domain like :
> - Always-On UARTS & I2C Controllers
> - CEC Controllers
> - SARADC source and bus clock
> - Infrared Decoder/Encoder bus clock
> - USB 32K reference clock
> 
> This also adds resets lines for :
> - Always-On UARTS & I2C Controllers
> - SARADC, Infrared Decoder/Encoder
> 
> This patchset depends on the ("clk: meson: rework drivers dependencies")
> from Jerome Brunet at [1].
> 
> [1] https://lkml.kernel.org/r/20190201125841.26785-1-jbrunet@baylibre.com
> 
> Neil Armstrong (2):
>   dt-bindings: clk: add G12A AO Clock and Reset Bindings
>   clk: meson: Add G12A AO Clock + Reset Controller
> 
>  .../bindings/clock/amlogic,gxbb-aoclkc.txt    |   1 +
>  drivers/clk/meson/Kconfig                     |   2 +
>  drivers/clk/meson/Makefile                    |   2 +-
>  drivers/clk/meson/g12a-aoclk.c                | 448 ++++++++++++++++++
>  drivers/clk/meson/g12a-aoclk.h                |  15 +
>  include/dt-bindings/clock/g12a-aoclkc.h       |  43 ++
>  include/dt-bindings/reset/g12a-aoclkc.h       |  18 +
>  7 files changed, 528 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/clk/meson/g12a-aoclk.c
>  create mode 100644 drivers/clk/meson/g12a-aoclk.h
>  create mode 100644 include/dt-bindings/clock/g12a-aoclkc.h
>  create mode 100644 include/dt-bindings/reset/g12a-aoclkc.h

Nothing out the ordinary, just a minor comment on the bindings.

Acked-by: Jerome Brunet <jbrunet@baylibre.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
