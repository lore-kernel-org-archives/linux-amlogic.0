Return-Path: <SRS0=ycqe=ON=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42951C04EB8
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Dec 2018 22:57:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BD5D2081C
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Dec 2018 22:57:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W6FDrrRQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="aFWyZEgf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BD5D2081C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O1vxV7gXMZYwZy5D+T18CkW9ONGLYWxa9PoVr/Zs7iw=; b=W6FDrrRQUxUMm3
	KBOKQ59v2Xrm8Z81WJrCvAaIjuC4BLcVV0TqUqMw2wwAH9+chy54ITYdLXX108kHm6QHYGLSJlxv3
	XbYFAr+Q8HZD50gYA824L2khj+F6Kf8bS1o9xpwrsQ2/K9CKVLPEc6lZe3885T+gDnVEnVOzFCPtI
	iHjcxZwGAJBB1mbewMVz9GKtcnqYecVh6AHUSUz2Qy/5aw5b5tkkAFHykQisjYw8x1amWEnPLRjD4
	t5bk1lbL35zthZXVVgTCEI92aEKUDnUi4TPEUL5carJRQuuR7LAk3HtYEQnNtz/9XmOUXGHsS1qHw
	UD/K2edOZrPFJNht1fIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUJcy-00081s-5h; Tue, 04 Dec 2018 22:57:16 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUJct-00080a-Ud
 for linux-amlogic@lists.infradead.org; Tue, 04 Dec 2018 22:57:13 +0000
Received: by mail-pg1-x542.google.com with SMTP id z11so8065335pgu.0
 for <linux-amlogic@lists.infradead.org>; Tue, 04 Dec 2018 14:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=i2+DMdcqApk+P/ibwUlPG7DwsMjp64Zc3yUJQHBMHY0=;
 b=aFWyZEgfq6LOKbj6IYfpCLMrqkbjMFvlqPMPBJ3UT3DEIJWoF+jM7nkcBBgjG7nsrz
 Ersn/K4kQLJcjbf1WsNwCxVrd/uShiziJ2vTj+9Bl+4Bfm0Qj6uwA195N8fxkwExLyXZ
 eJSHkBKA82jwWaCG231rFA6XJAdutD5X6T1n66Asm1nBT84xNWjOwgF+r+pLfUTLWP5F
 fqXDz55dJPVh4SX9bh4TP/UJrB3dAsl0LJhdLeuILkR0qgUfZ9FFIM5gMxSnLrNBUBcE
 IJfQL3AGWPeET/HdKzUGatwTmsjS1aUYOZ/3XCNgqC0txB1AUNdYYIvTEvpi3glLEJn7
 fYFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=i2+DMdcqApk+P/ibwUlPG7DwsMjp64Zc3yUJQHBMHY0=;
 b=Z0gWp01GnGEvU7dl2BxbfTpmoFI1vFYerDACEATd6eA9BlUqnCQqoMKZTbSwOYw6jh
 CLoHV/zBXva0MD8vn70njr7KGajMm/rOMmVXq6jhctFWvxFpdII42Bj4DCoGf7WcD4iH
 qTiIzQzGArZ+pYVStdMg+ppb6WrTafpTrEZITsSppLT8qugY2FxfkkBQsWGQ7X77wN9t
 U0e17+Qmq7p3FPB2zWmBAaqZh8zEK14rKid499H6fN6MirwNebJPvF1H75n27rB0lQxH
 Bs51NHqGPaXbeV0JdAl9u86qMjk3h/AUSuk9Imx7KzlmVYvv36uh0vLBsktVejEr3TtP
 OCaA==
X-Gm-Message-State: AA+aEWb53L1ExnIT2mUDjfs3Ej55DroG59+G6hxH5ipoKDBJ0wE0FNgU
 oj2Zsm+vcH8Xpb//MeLPazHFDA==
X-Google-Smtp-Source: AFSGD/WWbFVWwo2zBRfzf0u7jHSRlcR67IHNdkb2x8ANhs877IRNQNfZi7VqKWl3tT8dcXP3ESPJgQ==
X-Received: by 2002:a62:6f49:: with SMTP id k70mr21800069pfc.7.1543964220889; 
 Tue, 04 Dec 2018 14:57:00 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id z7sm32354657pga.6.2018.12.04.14.57.00
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 Dec 2018 14:57:00 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>, robh+dt@kernel.org,
 mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 jbrunet@baylibre.com
Subject: Re: [PATCH v2] arm64: dts: meson-axg: Enable watchdog on Meson AXG
 SoCs
In-Reply-To: <20181123144541.15114-1-ccaione@baylibre.com>
References: <20181123144541.15114-1-ccaione@baylibre.com>
Date: Tue, 04 Dec 2018 14:56:59 -0800
Message-ID: <7h8t14dhok.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181204_145711_992547_1E4D7EBD 
X-CRM114-Status: UNSURE (   6.06  )
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
Cc: Carlo Caione <ccaione@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Carlo Caione <ccaione@baylibre.com> writes:

> Add the watchdog node also on the AXG platforms.
>
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
> V2:
>  - Remove amlogic,meson-axg-wdt compatible

Queued for v4.21 with Neil's tag (branch: v4.21/dt64)

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
