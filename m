Return-Path: <SRS0=wRYZ=SA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A48DC43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 21:03:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D85CE20657
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 21:03:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ThR5nLGT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="vAxkn0Pu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D85CE20657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lON32K9FFNl1nxHk3QUnyrtU8fTnxuvrfpyb0oP6mAc=; b=ThR5nLGTAPp8fV
	+Y197Ir6B6vmFicLVeuBp0Inko4ZeMvIhR7LoZMI1RvLYIGo8ifDwQrJRBlvlY6NolAQp5qNFfIZ8
	DpEEcv69kPbx09MjQZSwGEkOgM19U6EK9zr+je6SiP7en8ZEc98tz4ExyoktVYwHCK2Q5lYrH3sNu
	UB1v0hi6xjUOfV3E3vLYXWFJwVjhIb2OFmbF8cluAzSDgVFecEqv/6mvXHQkeqDS742c2f6AMF0b+
	TCsZKsRi+28DiypBCtAumo2CaiHNqsVsT8Ir8Xu7y66zr0hTXzjDO9H9DUREttuzPvDZYD/jrABI+
	thi5SoTMXP7yhslzIfzA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9yed-0000CP-1v; Fri, 29 Mar 2019 21:03:11 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9yeZ-0000Bl-O8
 for linux-amlogic@lists.infradead.org; Fri, 29 Mar 2019 21:03:09 +0000
Received: by mail-pl1-x644.google.com with SMTP id y6so1559932pll.13
 for <linux-amlogic@lists.infradead.org>; Fri, 29 Mar 2019 14:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=Vt85FaSQvqSIgKmDkeu3cTPdbJWz0R1Jr3LXR2DaZMQ=;
 b=vAxkn0PutHy75vymlaYCr9b6cXJFoQ5sN7eMLjCm6t6xKUjJK52dgImDwhTiPFaFcF
 Y3QzWSJx21qR4zu44IcoJaWpkLmTiYG4DrN1UcfUeSnqtb4SQypbrdqCsH5uh+oPRtIx
 i2hvC5oydY9vyyhyQc1HbPgS2+7DuiZ+pNZZs9qoCLEiq7YuiMyfib+bpuZHJmEerlTB
 T0IavAV9MH0or2fli4yUfSFqKtmtB4SxHC6kzfJoNe2Iwgx+6ennrsbBtcQMHWuH3omI
 yyvgMt5+1QgzX5XXoSjBxT4Qi9CecSpcV+0sZVNupQxFpoqisNtFRze+F5Bs9YoJSRXm
 HyAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=Vt85FaSQvqSIgKmDkeu3cTPdbJWz0R1Jr3LXR2DaZMQ=;
 b=GUgkKgj4ZPoKr//qrRB+cXqBFo7On/RuxvYO0WjiFLe3bEeK9OFm3VfFHiunor9Q+Y
 s3Tmg2CpRLYi+1dfPQz4HEu4NK6UhAET4ivos6W3KpqxPbqPZtT2zh6D7mOw/+s3UmSt
 DWdb9BiArczTvOsdG8pTMunI3X9+svT/9XufjJ5+lAp25fUdMFK68a+KYsk/yGRdFvol
 Mv9wY9o7Bho2KdhkE3PSmY6ucvQVKybnnJKZGeTIZCuXfYMsmJ6UFCeU6BZtXx2NN3RY
 oSlmjZG/QVG/w3hWCfVao3gElApw38yitcdJ8qF75q+Nuu7m7oLjlZ0Y8Mfh2MLK3YR+
 MJlQ==
X-Gm-Message-State: APjAAAWj8qG7mZf8bA6lGNI99Kyerv9NCqhoPILbyy6ae345NOG1G4B1
 5prKQvokAP9N2BDs/5AfmcYCgQ==
X-Google-Smtp-Source: APXvYqzOT9qF0rIQW7Sax/XLVqPEkN0JDYAgoPre6kteLlO417SK5GBon+3AATWMw2qP3k3H2MoEjw==
X-Received: by 2002:a17:902:bb90:: with SMTP id
 m16mr52733859pls.49.1553893386859; 
 Fri, 29 Mar 2019 14:03:06 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id y37sm4086752pgk.78.2019.03.29.14.03.05
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 29 Mar 2019 14:03:06 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: arm@kernel.org
Subject: Re: [PATCH 1/1] ARM: multi_v7_defconfig: enable the Amlogic Meson ADC
 and eFuse drivers
In-Reply-To: <20190328205122.27092-2-martin.blumenstingl@googlemail.com>
References: <20190328205122.27092-1-martin.blumenstingl@googlemail.com>
 <20190328205122.27092-2-martin.blumenstingl@googlemail.com>
Date: Fri, 29 Mar 2019 14:03:05 -0700
Message-ID: <7hftr5wfzq.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_140307_791426_AB3878F9 
X-CRM114-Status: UNSURE (   7.90  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> With the SAR ADC driver ADC measurements can be taken though the IIO
> framework. Additionally the SAR ADC has a channel which is connected to
> an internal temperature sensor. The calibration data for this internal
> temperature sensor is stored in the eFuse.
>
> Enable the SAR ADC driver and the eFuse driver for the 32-bit Amlogic
> Meson SoCs so we can expose the chip temperature to userspace through
> the IIO hwmon driver (whose config option is already enabled:
> CONFIG_SENSORS_IIO_HWMON=y).
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Queued for v5.2,

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
