Return-Path: <SRS0=Dn2N=WI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8BA5C433FF
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 20:31:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBEB020651
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 20:31:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dLH5GVRn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="e3gKu9VE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBEB020651
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LvP8oi+M5Kk7Hfty2BFLhb3OGc6Yh6/aODPB1aliEn0=; b=dLH5GVRnKv5164
	JgpQa9spfUqYHF3VEPsVJv6npMuBcUYpJo0k1JFGZFZRRZNtiOQFd+PSPTehSSfXZWxVCLwMIsJa9
	zC06HOfBGsGGS6xbAd7q9LpYnPm2cd0GsFkljilyV82Xorgeo7PyCXrlJ3u1sbRgOpSd3/x9S19w5
	GgvvYjHeGj1nVkAASqCHyHVXgz/DPsV8gjtTye8RqaURaeLji0kqygqYqg+K9fASZO2HEjo6acN2C
	6SE1VyOYVmbEeLsBQ4kKHpgpDeBK38rU+HYVg3WE+gVHsFL3PcguqHYBSHgvkAbgkuXNPOo3CGu3H
	6mN6rzIfGmpns7Xeq6xQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxGyV-0000YH-Jb; Mon, 12 Aug 2019 20:31:27 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxGyS-0000Xg-BI
 for linux-amlogic@lists.infradead.org; Mon, 12 Aug 2019 20:31:26 +0000
Received: by mail-pg1-x542.google.com with SMTP id i18so50063768pgl.11
 for <linux-amlogic@lists.infradead.org>; Mon, 12 Aug 2019 13:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=8/dzomfKZtMmJBCxwZthQlRqMx3W9Dc6DXlVE3ZOJ98=;
 b=e3gKu9VE3T9jzG9hciNyK0x0OK+iti0j4JSgrsCMf1iFhV3LZxpdlCtga8J82aXRgG
 hvN47PEvUiGgWu8qPwec45iUvVohkyDRCeOKQlZ+j0QJq/llZ/iSO1yjlkjP79wjNqaL
 I3jwvEphQJvT2hCtGhPMo2S5MpDyy2RagsceziAKt0EGRJzgKrMjZMFuCqNpvLJKNERU
 zJZm+6b3YPKnWbjB8eeLgrmCjBBAmY8F7G+ANNwgl+Jig575o5Yf1c8mXiN0JDVe9ZfR
 gAs9EZkIsp0Hg29EhVVzpqIp6kVkuDF3AhjBo9I70LREOI6yLLo/3UyHrLwdQWj8zo0c
 yD2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=8/dzomfKZtMmJBCxwZthQlRqMx3W9Dc6DXlVE3ZOJ98=;
 b=NBbdcNGf49sXvW54OdCL8WuLo6ABsGin34PcnyN8LetUvXp1esowrkV/Wpu7F4TaEX
 lSn/cZNLMoN19XGgoiaPI+6woFN/V1Qp9KW+V4O9BkSnrzZVzKWM9dZxcdBUX+12Kphu
 qzTO/ZLcY5Iuuk1yPGWNWjg/3sb4uJKQGdxsYvj2it9AUeg6GBaWohTilCOINfDuNBFT
 +dgoyhZN6QjyjJvm+5dUnP6C1vPmlnto7/TjXvDtl0MzkXecM8d2yPiBV17cyA3mAhf+
 Irwql3OkEGSJv2VtLNUclk9H0EYpy/3J1HXrh8NbIgkatczfL8rRx4MZw0aqH+1Klclx
 pgww==
X-Gm-Message-State: APjAAAUhHs5y9zKX5yAmpO6ty+B0Ftqvj0JfBXbLmm7nKpOy3R0/+OpW
 d217hUl4sI6GPLNsNNctRk/QEA==
X-Google-Smtp-Source: APXvYqzRVx7zE/aBCc9H6C7hScAoLaJmDfXikuBGTg+k7m7mx2eKPJSF/Mmu1eyHEj3FG+3hh9tBqA==
X-Received: by 2002:a65:4b8b:: with SMTP id t11mr31505067pgq.130.1565641883048; 
 Mon, 12 Aug 2019 13:31:23 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:14bb:580e:e4d6:b3a8])
 by smtp.gmail.com with ESMTPSA id h195sm5229140pfe.20.2019.08.12.13.31.22
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 12 Aug 2019 13:31:22 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2] arm64: dts: meson-g12b-khadas-vim3: add initial
 device-tree
In-Reply-To: <20190812074857.8133-1-narmstrong@baylibre.com>
References: <20190812074857.8133-1-narmstrong@baylibre.com>
Date: Mon, 12 Aug 2019 13:31:21 -0700
Message-ID: <7hzhke15ye.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_133124_384888_4ABC53E1 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org,
 Christian Hewitt <christianshewitt@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> From: Christian Hewitt <christianshewitt@gmail.com>
>
> The Khadas VIM3 uses the Amlogic S922X or A311S SoC, both based on the
> Amlogic G12B SoC family, on a board with the same form factor as the
> VIM/VIM2 models. It ships in two variants; basic and
> pro which differ in RAM and eMMC size:
>
> - 2GB (basic) or 4GB (pro) LPDDR4 RAM
> - 16GB (basic) or 32GB (pro) eMMC 5.1 storage
> - 16MB SPI flash
> - 10/100/1000 Base-T Ethernet
> - AP6398S Wireless (802.11 a/b/g/n/ac, BT5.0)
> - HDMI 2.1 video
> - 1x USB 2.0 + 1x USB 3.0 ports
> - 1x USB-C (power) with USB 2.0 OTG
> - 3x LED's (1x red, 1x blue, 1x white)
> - 3x buttons (power, function, reset)
> - IR receiver
> - M2 socket with PCIe, USB, ADC & I2C
> - 40pin GPIO Header
> - 1x micro SD card slot
>
> A common meson-g12b-khadas-vim3.dtsi is added to support both S922X and
> A311D SoCs supported by two variants of the board.
>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

This still has a build-time dependency on the CPUB clock patch.

Looks like Jerome has sent a PR w/tag today that includes that, so I'll
merge that tag and then queue this patch.

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
