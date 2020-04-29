Return-Path: <SRS0=SdFN=6N=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A25CEC83004
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Apr 2020 19:16:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A826206F0
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Apr 2020 19:16:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PS/h9sHk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="fvrS0VEE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A826206F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pkqNEfdFbPrpXf5D93zIgBGOH6o9ND+4WLCssXbdHgs=; b=PS/h9sHkbPyzFs
	+J1UmHtVRE/iF/iReBE1cEg+AWfFMQCQi++5YvcvJVq1VuMs2KLny9y15ESywCbipPS+bN0uLZB7E
	qQA6b0egesh9Y/bqyc9nfodk5kuzQFfO4H6S/Dm+eJYiTzswbMfYGLS8c4AFxJm9yCkn1aOxfhcxs
	OSavzhEqgTE1yDQ3HS43jlPsFP03T7bBejVjh0gfWQM7QVJU5sUAtlqJc/xj9pGYjU9Z4VxeqXsdS
	Ec1pEEqspHLknMbAZ6ZwMZqat0dm7p9B6qSifKpaPGUEaLHJE1lXqf7ZOs1R2adxlHUhtgBiYNxUd
	p6hF9uMZ/32MYBRxaTXw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTsCD-0001aC-2R; Wed, 29 Apr 2020 19:16:37 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTsCA-0001Yp-43
 for linux-amlogic@lists.infradead.org; Wed, 29 Apr 2020 19:16:35 +0000
Received: by mail-wm1-x341.google.com with SMTP id r26so3288044wmh.0
 for <linux-amlogic@lists.infradead.org>; Wed, 29 Apr 2020 12:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=uTaxYC0jwA+3Mf6QeyL0kxKKg+CdYcd/49GGY7p9esY=;
 b=fvrS0VEE66iO7kf6DfmoKB0rXIEmgiuWit2Fu+SmZkTgV6Cz07n/xX2l0Biwa1hAvY
 1rEHDzYF+Wb6TaiiZhFSD0G25jsO/9oCpN6WJ4Ofic0d8qZck24SS0b83d80Q2n9lC+3
 vjSpHa8acnnKltv95KH9GXphftHAkW4OfVrBeuHMhJsh5bL/o9sEXRrcQ4PmoeoTOuxh
 oaZK3GiZEZ4cHhxuzNnpKkAiHeBNLqjCNqWK4u0sg/S2vdTywv30jYvWIP2vHJQZCUTv
 NXkpzzCTNxpxeraY4yOZeKvak+SgmC9CpSWq/NTkuLEhMo09VG1wovwqUeGDWA+/+8Nj
 MxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=uTaxYC0jwA+3Mf6QeyL0kxKKg+CdYcd/49GGY7p9esY=;
 b=VDsOBmFxU/b2+IKs/07iURgBEaBgdmDqZV6g33uOiGLHb/BBWjZoY0KWVBKoXBF704
 DT9vRa1gLGtVLK5gd+YnlmxVfdV9yUFTboQBD+snCMvgSX02ibHJa8QuOxGcmZisWGLF
 WM46sOgBKXYOx2agiGk6L35ffKor+bzh31f3/28vTSu2yhAiU12zsdCuc46CEiFTi10Q
 tjxgHCOlOcjXtCtTcl+vtaXZOvU7FsrIoGeiwV47OnKew6O+NhihN09JDa8t8KWWv6kv
 5qy3ugachbmLRNG4pagkyG8CRTWKyvniN3MC3NGe77iDsr1RY0kxJtmVGhMs6kxGsPwV
 50tg==
X-Gm-Message-State: AGi0PuZTg7EkwQwyEWAVTBDoFp/nDl3oG+Zo5ObL1PpaKpefcwSrw8eJ
 qHCuYoqq03IQklNfcXGxfWrvKw==
X-Google-Smtp-Source: APiQypLJ0zeDoIhCzi097XAozrXJsq0a0rW6Z3NDWwTzdI9ZLjqD2jG0z5naNye1gwdLaN6JoAuAiA==
X-Received: by 2002:a1c:2e07:: with SMTP id u7mr4865638wmu.74.1588187792498;
 Wed, 29 Apr 2020 12:16:32 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id e5sm235982wru.92.2020.04.29.12.16.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 Apr 2020 12:16:31 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, lee.jones@linaro.org,
 jdelvare@suse.com, linux@roeck-us.net, srinivas.kandagatla@linaro.org
Subject: Re: [RFC 0/8] mfd: Add support for Khadas Microcontroller
In-Reply-To: <20200421080102.22796-1-narmstrong@baylibre.com>
References: <20200421080102.22796-1-narmstrong@baylibre.com>
Date: Wed, 29 Apr 2020 12:16:28 -0700
Message-ID: <7h4kt2ksqb.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_121634_175822_B00099AB 
X-CRM114-Status: UNSURE (   9.95  )
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
Cc: linux-hwmon@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, nick@khadas.com,
 linux-amlogic@lists.infradead.org, art@khadas.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> The new Khadas VIM2, VIM3 and Edge boards embeds an on-board microcontroller
> connected via I2C.
>
> This Microcontroller is present on the Khadas VIM1, VIM2, VIM3 and Edge
> boards.
>
> It has multiple boot control features like password check, power-on
> options, power-off control and system FAN control on recent boards.
>
> Thie serie adds :
> - the bindings
> - the MFD driver
> - the HWMON cell driver
> - the NVMEM cell driver
> - updates MAINTAINERS
> - add support into the Khadas VIM3/VIM3L DT
>
> Neil Armstrong (8):
>   dt-bindings: mfd: add Khadas Microcontroller bindings
>   mfd: add support for the Khadas System control Microcontroller
>   hwmon: add support for the MCU controlled FAN on Khadas boards
>   nvmem: add support for the Khadas MCU Programmable User Memory
>   MAINTAINERS: add myself as maintainer for Khadas MCU drivers
>   arm64: dts: meson-g12b: move G12B thermal nodes to meson-g12b.dtsi
>   arm64: dts: meson-sm1: add cpu thermal nodes

These two could/should be sent separately from this RFC series and
queued for v5.8.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
