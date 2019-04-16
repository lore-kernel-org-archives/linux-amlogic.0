Return-Path: <SRS0=v2ss=SS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67CABC10F0E
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Apr 2019 00:40:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37CC92075B
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Apr 2019 00:40:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pU7Y3gig";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="kv7JC1pY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37CC92075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5rNSkNaFafUUNaRRZiPOncXTyFD/6Vq3GgRqSoFEASM=; b=pU7Y3gigOUggVL
	gJy+fVfeclUSRG96T9/2rQBJ43xVzk2wXpsDgnnDht1Wh+qm57ZeG2EUoFWNjXBr4zmEqzBcBPN8N
	yYvOB0t3Mh8dO/p5DFbzPezlHQtXEjQs8PXg7RjdPlAyThEXkZ8/959NBzyGx1Nx0Ryi4lCMPXsrj
	XKx+8RU0Gbr7Of7gdI9CvhduG8pnQiNse4sOKItV/agbNsfVeA8FoBu+5UMjsFyimlkjQmzrKmTTX
	wd6OboM5iOJJcTASu6OtRdGcJRI4sHfSTU882NgvSVuR+8SOPAQUyTc17Xth7CHlTxWBMYnsXln/z
	dQli1jzrGJ3ZCBSzh+nA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGC9P-0001mA-KN; Tue, 16 Apr 2019 00:40:39 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGC9N-0001la-5Q
 for linux-amlogic@lists.infradead.org; Tue, 16 Apr 2019 00:40:38 +0000
Received: by mail-pf1-x42c.google.com with SMTP id 8so9473394pfr.4
 for <linux-amlogic@lists.infradead.org>; Mon, 15 Apr 2019 17:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=XXAeaOLyklZCk/VyID8RrVHWu0+omv5PykIy/BvoF6o=;
 b=kv7JC1pYXi8BVezCoSU2PV8eTx325GmroN3DqUWhE3VneCjDfvGKKGwKxbQ5lVdkk6
 Fci44xERlGq7tG+CSlrfcT6zq9I9yq/HN9MUtrEcU0Jvrr9iyOKNaC58qK8m18GcJNJG
 unh7KlVCSHaD/Qr8j4T630pW926BcQF3xemf4c5ax5rQEIwMYqOPc9A117IyLwjXvOML
 GderRvbqT+Y+lEFGZVrtHkpWux4/BEo4IuS+x0izZ5MUKSOuA7U6B6sQYuu3h0St9zD/
 3kBGRSCLDKCa1KnA4cXg9NQ6JnTVxt2p6uqlp4XV9bLY6xmUZb+u0P8u/xUeTEhO9Xgr
 FXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=XXAeaOLyklZCk/VyID8RrVHWu0+omv5PykIy/BvoF6o=;
 b=R4EE8NFgORuWpqthmEHVou9fqoYYXui7VWSxQROnR2u/SyIQjspdQbDbNhf+GMOnlR
 YskUDzjoy4TKA/AS4RJlt4JQGwzamC0N8RSZZ4YCPo4hEXnUBha0qTKK7uCvVyU6whkx
 BjI1giGxjiK7KVEr/t+tjR7G6esNAbXUMmbg3C9xijb7Kp7snTTqb3P4vsjqNl78lOlJ
 CkmzdEuDbuqy9XVDAOQ8A6mxh4vkK7nlGdGUe8DglVssMVeU+SLg5N1Z2RMSBCciViQu
 xFzxYP7Ryuu/G+L6huPoiM+iphIts7Jl0JJtS/kAI4d12BGhjtwP8hEfEoLoFfTBxl9o
 0Mqg==
X-Gm-Message-State: APjAAAWqQ3ejmNq9IA9u8dvMMVdc36JDFlhuh13nEittOd6hNcxjZ0b1
 BwAls8IuOphGPHfBkgeDX9JTfA==
X-Google-Smtp-Source: APXvYqxGC1aDJs2lK6cDNlOEhqArl1ID8pMrw0LeYJfZwebaRyO1y9q5T7ESU4XJVAlSCPknn4UwgA==
X-Received: by 2002:aa7:8252:: with SMTP id e18mr78234501pfn.105.1555375235775; 
 Mon, 15 Apr 2019 17:40:35 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:c45e:7ed8:c242:3563])
 by smtp.googlemail.com with ESMTPSA id a12sm58965761pgq.21.2019.04.15.17.40.34
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 15 Apr 2019 17:40:34 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] soc: amlogic: meson-gx-pwrc-vpu: Fix power on/off
 register bitmask
In-Reply-To: <20190401074801.10414-1-narmstrong@baylibre.com>
References: <20190401074801.10414-1-narmstrong@baylibre.com>
Date: Mon, 15 Apr 2019 17:40:34 -0700
Message-ID: <7h5zrerddp.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_174037_208760_7E28DD91 
X-CRM114-Status: UNSURE (   6.30  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> The register bitmask to power on/off the VPU memories was incorectly set
> to 0x2 instead of 0x3. While still working, let's use the recommended
> vendor value instead.
>
> Fixes: 75fcb5ca4b46 ("soc: amlogic: add Meson GX VPU Domains driver")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Queued for v5.2,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
