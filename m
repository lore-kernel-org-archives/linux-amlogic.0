Return-Path: <SRS0=sb2I=QW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C079C43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Feb 2019 23:05:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFA2C222DD
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Feb 2019 23:05:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CfRA7D2t";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="mKyYOEYG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFA2C222DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yzfVvMGEX8+XzkCDbhm/m5zi5trfOpKCKBqtku0fN2A=; b=CfRA7D2txzTnc7
	EVyMSqzoA+5mK9UE+tSqbNrPVjuKCVPVpDGo+EDlTPCZSdH8UB6m6Vo6psX64wxT1iEt7/SG/gHc2
	B/Yp5GPbaeZ6td0gRkUMolXGOD6/bzEBbBfrbF5uOa882RBWVPnjxqCmP2MmPh8GYC7kHu4/EQfT5
	Ic/fbWMtcsJVt+f4w+ug507tVqGhj6GBBKM//qEsncR/ExcMsmdZ4upsFnyLrfCUmSx4uAbmAsHkP
	RAfvu63katmu17m7hTBgBw9K2C1JI8w4eysCwrid+cnVacgQned96JMvNvvzIDFmAUM2NCXky338b
	1/n7YKvrFFAzAD+zPfZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gumXV-0007ja-SS; Fri, 15 Feb 2019 23:05:01 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gumXS-0007ih-6r
 for linux-amlogic@lists.infradead.org; Fri, 15 Feb 2019 23:04:59 +0000
Received: by mail-pf1-x442.google.com with SMTP id c123so5536839pfb.0
 for <linux-amlogic@lists.infradead.org>; Fri, 15 Feb 2019 15:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=WSBuT6eeQ81XnwL/J514wr3YHctzw6fgCGrNbp9Fw8A=;
 b=mKyYOEYGysQ02rbg9zTJCtGpUtqEmkPOBZPDfD/TrrCiQCUqOML0i9OeDGPOCFylT1
 OcAiRI3yycSycviATxmGVwMUimOv/ocvFmRul4CLBI/zKFhmYZcaF+jB/qkgVg9vZZ8C
 qvXdYWK0Pqq27NpTkPleQeIdDqlOSMwRpw0aGiBnIRA1J4Vie5bsd56LOtCYD8cHG440
 Cj0Ots+heHC+GawwpE0apoZvkzcM1UuMEXt9weNZips6tymmPS7kkDJ/uHfKmcA8g0GF
 hijgO/LinXsP9lJKVh+2XbYlJw/uAx3PNd6mzhHLnFndDBglc8muo7Lx3RD6tR4yCEUw
 Havw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=WSBuT6eeQ81XnwL/J514wr3YHctzw6fgCGrNbp9Fw8A=;
 b=N+jfZNuqf3hKYA0hHRysUBeZYdxA8MAiMwlXWr0toMl4lzN6osXRupIo4KquI5Qh5Q
 UD+oOt8KDVWk6q0VN6v7Av+4GUKvqPWN5Pf5iIfADxU6W7GvZZftwqwFZfizFuGeAHI4
 PBH0q26qDF9CCZHHjxVghgxGQc2Sbu5AjSu9B6xFBXz8ZSeOb0U0TtKHk3w9qjc64Q/I
 r5cs5iVbNq5789JkbujrN7/NauSErCy5e13pqApdKHIHqfarwWUQujGFHsDgIAje2o0e
 z6QSW2KgO4c6bhtHgoCSUUfZna3nfXLIHHCr4JUlKQfPBNdo7GqKnsZ+TnPxYWMyCb2w
 E/5g==
X-Gm-Message-State: AHQUAuZys+dZ7IYTmA8YKecWMKY0zIdQmrLLdztJj5Ip13rRKLA+D5Bg
 mcPaRM71S01DsEd8G26+J3ufBURkRM4=
X-Google-Smtp-Source: AHgI3IagsKX80wDJARjGhBna3390K6ophwXiS8XXMlS6DB6Rt8jQvSgdgN49nfZHBdxod4PUAX/drQ==
X-Received: by 2002:a63:a:: with SMTP id 10mr7557891pga.121.1550271897540;
 Fri, 15 Feb 2019 15:04:57 -0800 (PST)
Received: from localhost ([2601:602:9200:a1a5:100f:5904:cb2b:8631])
 by smtp.googlemail.com with ESMTPSA id 64sm8799726pff.101.2019.02.15.15.04.56
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 15 Feb 2019 15:04:56 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 2/2] arm64: dts: Add SEI Robotics SEI510 Board
In-Reply-To: <20190212140259.9537-3-narmstrong@baylibre.com>
References: <20190212140259.9537-1-narmstrong@baylibre.com>
 <20190212140259.9537-3-narmstrong@baylibre.com>
Date: Fri, 15 Feb 2019 15:04:55 -0800
Message-ID: <7hy36girfs.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190215_150458_261866_65AD91AB 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> The SEI Robotics SEI510 Board is based on the Amlogic G12A S905X2
> and has the following features :
> - Amlogic G12A S905X2 SoC
> - 10/100 Ethernet
> - USB2 + USB3 ports
> - Micro SDCard Port
> - Audio + CVBS AV Jack port
> - HDMI 2.1 + CEC Port
> - ADC Touch Button
> - Far-Field Microphone Array + Mono HP
> - IR Sensor
> - IR Emmiter LED Array
> - RGB Led
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

[...]

> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 0821fed4c074..2709f7ede908 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  dtb-$(CONFIG_ARCH_MESON) += meson-axg-s400.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-g12a-u200.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-g12a-sei510.dtb

nit: not sorted alphabetically.  I'll move it bofore u200 when applying.

Thanks for the new board support!

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
