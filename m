Return-Path: <SRS0=f3iC=WQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50A9EC3A589
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 19:25:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24EC422DD6
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 19:25:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I8HUN1R3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="J3N1iqC0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24EC422DD6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nkcpwDfrH30RJ3qFZvTU1hjx+h+iJUyb9BqLBWUHeL0=; b=I8HUN1R3ZAhQhA
	lpAYrEXxCJ4hAO1MJwi91EZmDFYHjGhqGetI5coIwZzfNSsr+BT7VQ3S7XEWbzB2/MxtIm2dhOzXy
	qZEfE5gUqI+QoG2bYOeph2SnjPyZvQcHshmRIzo+n1WgLTMabWfpuk+ywc8Ug82pkxIWVuCIjKVdj
	fVuWEQvFFr1VGhdlBFwC03Mk5xgsyM0cDbs3Z87/hZhwTWzeY61dgiQyFAs+EHa5tWT4nclOvyj74
	NBXxWSO7rG6xsIQk97W/KVD8f8PZxfbbyRgW425StxYwLUk7ETxEwXTiJ/CTD0/qk3VvK9HttQgtS
	4VRc7lQOfWDOyFGfZATg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i09kz-0003sA-1P; Tue, 20 Aug 2019 19:25:25 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i09kw-0003r9-Fr
 for linux-amlogic@lists.infradead.org; Tue, 20 Aug 2019 19:25:24 +0000
Received: by mail-pg1-x541.google.com with SMTP id o13so3769343pgp.12
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Aug 2019 12:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=04NKhJxX8FlEE8Vel6IHRyr5QWy4tlrGyOfc2JJ0jY8=;
 b=J3N1iqC05G6BlmLY4sLgvPQbfCir9vXlmBgMbXeWoxCrQa0sEfQpvhYryRBxbpnicF
 KuOORxmryuKtItZFU2oRa2OxtQ6WYJdfy4KqAlR2aknhG0Ab2oSROSnsMaM5LCMBouak
 dpqJizoos6Rol3qdOszaw0O39xHjE0bLSATnqqkLejapRal6IhjmidcjQfjgrXss2r6p
 QP3mdqabnWQ/YoB+hjzaku4yxydrxtd39ko7iH9m2Er7EcnN3Q1EasG3/xHdEtFeXFTh
 sQ8AQI1cuLQogqOlgvFwDghCB/7/gQVaL+zTpm02z2j/S/W04vELGTODYaqgexISopwH
 1lUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=04NKhJxX8FlEE8Vel6IHRyr5QWy4tlrGyOfc2JJ0jY8=;
 b=uDa9pQQPZ+0a9tFuKiLtiH4NSq4UrLoGX9deWakVSefjVR6kEaEFGo6A6zz2jLeEKa
 UXwR4yfo5ebaymcrU9+bHRpEFs+x12DZEn1pXY2eOiuvH9FO4QjdRMywvi5E08qku5cv
 NicJxLtj1X4hPVf3Hj7Q+ZWAx75AJbB6dRePW34pQLsOCGY3BCvQM92Ptp4mSIeJpn3U
 lJk0ZA2XZtJL1/XDGv9hpwg/Vzq/WL+9SLm87dCbbNVZJoSTwHxAoblb+n8jyN7QvBLb
 lj4HVs5Ia05g/luMZw83yiEfSxfSEJPbZWPcJrB4Bo4MGd7AgjjmlVvAj3T4ELKSHKjb
 lJ6A==
X-Gm-Message-State: APjAAAUXXmj1Zxd9QROnqjnBBCtQzty+rmG3BhewG1ubxI09FKgLSU4f
 /q51+YG2kO8PJm4S7pzpibybKw==
X-Google-Smtp-Source: APXvYqy9P1Z7fPZd3rUvC8bVlPpzVMI8dViZMXku+yepBg0LQT84LhZxNW32ze6tSrgL8aSDhcSDjA==
X-Received: by 2002:a62:c584:: with SMTP id j126mr31758938pfg.21.1566329120713; 
 Tue, 20 Aug 2019 12:25:20 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id w207sm21516280pff.93.2019.08.20.12.25.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 20 Aug 2019 12:25:20 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/6] arm64: Add support for Amlogic SM1 SoC Family
In-Reply-To: <20190820144052.18269-1-narmstrong@baylibre.com>
References: <20190820144052.18269-1-narmstrong@baylibre.com>
Date: Tue, 20 Aug 2019 12:25:19 -0700
Message-ID: <7h4l2bej1c.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_122522_533337_34C635D8 
X-CRM114-Status: GOOD (  12.34  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> The new Amlogic SM1 SoC Family is a derivative of the Amlogic G12A
> SoC Family, with the following changes :
> - Cortex-A55 cores instead of A53
> - more power domains, including USB & PCIe
> - a neural network co-processor (NNA)
> - a CSI input and image processor
> - some changes in the audio complex, thus not yet enabled
> - new clocks, for NNA, CSI and a clock tree for each CPU Core
>
> This serie does not add support for NNA, CSI, Audio, USB, Display
> or DVFS, it only aligns with the current G12A Support.
>
> With this serie, the SEI610 Board has supported :
> - Default-boot CPU frequency
> - Ethernet
> - LEDs
> - IR
> - GPIO Buttons
> - eMMC
> - SDCard
> - SDIO WiFi
> - UART Bluetooth
>
> Audio (HDMI, Embedded HP, MIcs), USB, HDMI, IR Output, & RGB Led
> would be supported in following patchsets.
>
> Dependencies:
> - g12-common.dtsi from the DVFS patchset at [1]
>
> Changes from rfc at [2]:
> - Removed Power domain patches & display/USB support, will resend separately
> - Removed applied AO-CEC patches
> - Fixed clk-measure IDs
> - Collected reviewed-by tags
>
> [1] https://patchwork.kernel.org/cover/11025309/
> [2] https://patchwork.kernel.org/cover/11025511/

Series queued for v5.4...
> Neil Armstrong (6):
>   soc: amlogic: meson-gx-socinfo: Add SM1 and S905X3 IDs
>   dt-bindings: soc: amlogic: clk-measure: Add SM1 compatible
>   soc: amlogic: clk-measure: Add support for SM1

... these 3 in v5.4/drivers ...

>   dt-bindings: arm: amlogic: add SM1 bindings
>   dt-bindings: arm: amlogic: add SEI Robotics SEI610 bindings
>   arm64: dts: add support for SM1 based SEI Robotics SEI610

... and these 3 in v5.4/dt64 with Rob's tag.

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
