Return-Path: <SRS0=twEQ=DJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 806FEC35257
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 23:00:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5488206FA
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 23:00:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jEq1BnvE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="B1baeRIt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5488206FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=okKkP8Vr3pqKd0+Jjjgo+l5dd8gxhvmkQVygv0/SCck=; b=jEq1BnvETcpSxEtk5LK3BaPAX
	xSYQ/WXJ5aMf0+tzj6pBPlIUfUU5AiN/N2jVQB7ZWaGDoEFWxcZsOi7/d6EAhv+ZmFfw++ZX/FG5j
	hIv9cx2JQRtpBGIH54BuDdmWvdzdBxuMOv5b0+QbEv/zVH1o64i1/aoJ9/oSBptCCTkA1Vid4yK/2
	zpZ1XqP2GiHVFnRz8dyW3LogR2wkP1m7ttVTAuIOoJ6N1/GlNhJSe5DuQabFb4javSmAmJ0Mp1euD
	pBA6L06DG9Hg1ZW1eUb+5GEZYlRJJ3q+rD4AcjkrJ6F3Ll0QierdLVlSzGRzOyaV8zsDwNOgX8T3t
	43l2+wFNg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOU2N-0001od-IP; Fri, 02 Oct 2020 23:00:27 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOU2K-0001ns-C3
 for linux-amlogic@lists.infradead.org; Fri, 02 Oct 2020 23:00:25 +0000
Received: by mail-pf1-x442.google.com with SMTP id w21so2373962pfc.7
 for <linux-amlogic@lists.infradead.org>; Fri, 02 Oct 2020 16:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=JuO3l5D3g+3T4SopoCD1TZFCSQFWdr/9/z0cbTHWU18=;
 b=B1baeRItQM93CJgK/YQaUbahw9W1IYNY7bMP2HAJr7olWXk3R7xYuQbTuve+4PtRhi
 j9be8RFID77t45nV1YB8hFQ4gHp1lYjQkDZ58bSVGkCBmcDxrLnn3MYI+6rVhemK78si
 BJ6RKv0c7UBvMtfkb6NQmugokTqrIlAuj0PgM88zx1UQXOXQV7wgudSSZgexyFcaWX0F
 Oqy38o3bX+0R1OKQdWTl8HMo5FwTNdkw2tMa337wAL/zr4RhPn0nLFZmSYL/Fqp3NYri
 4vHrJxiBOdZhK7U+IMIxPjlnl7qzGyWhMkDd7dXcHtq9UYXQi+ofXtIf6lKw/fjf1OQs
 6vaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=JuO3l5D3g+3T4SopoCD1TZFCSQFWdr/9/z0cbTHWU18=;
 b=opWZNNLpBzKlOwbNN0wbCHIpAcZpnqbbsKhJbJUeQ4W6lL292TYfDdcgZw3JQ3Fr4Q
 zFFewgsGkCaVTKtE3lFmYJZSNVWDuQkohBe5Y7gB1sOOZInIULsWAqFiAsne/yCAqwgq
 P77vVIa/ULS1nFE1h46wFsGgqZCHWF6cBvQyICilCdUjMg5w/D0E5Zlu/71MXjzg1FGB
 ZWf8bOU4h+EmAnMu+3P4QCqJsQbV65ZnTDFJT06YuYgDZ7S1YxPiw1jGhkA+9/1l/M5V
 m9g/+T7naueCjKvpJL1kAegKuWhrELFPeaqxsyFWzg/3DGz+M76VXQm9qSz3HUVwDeKx
 IqjA==
X-Gm-Message-State: AOAM532JRv/YpnBISLYf6xtKt0+ZuqmeMqoAYEG6TSWtLtTWmHObItvX
 d9042ovT1asn48Tek2+BUNoyGA==
X-Google-Smtp-Source: ABdhPJzn4JlwbkeCh9IWyceUYlpcHYJn0xrj6G9mjjr10oe8uHor+PZAi4+w1vypBagk+phU6kVkOw==
X-Received: by 2002:a63:c74f:: with SMTP id v15mr4169592pgg.143.1601679621965; 
 Fri, 02 Oct 2020 16:00:21 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id t3sm2616889pje.43.2020.10.02.16.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 16:00:21 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH] reset: Add reset controller API
In-Reply-To: <20201001132758.12280-1-aouledameur@baylibre.com>
References: <20201001132758.12280-1-aouledameur@baylibre.com>
Date: Fri, 02 Oct 2020 16:00:20 -0700
Message-ID: <7hh7rckzcr.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_190024_452563_D8D79C89 
X-CRM114-Status: GOOD (  15.19  )
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
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-usb@vger.kernel.org, Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Amjad Ouled-Ameur <aouledameur@baylibre.com> writes:

> The current reset framework API does not allow to release what is done by
> reset_control_reset(), IOW decrement triggered_count. Add the new
> reset_control_resettable() call to do so.
>
> When reset_control_reset() has been called once, the counter
> triggered_count, in the reset framework, is incremented i.e the resource
> under the reset is in-use and the reset should not be done again.
> reset_control_resettable() would be the way to state that the resource is 
> no longer used and, that from the caller's perspective, the reset can be 
> fired again if necessary.
>
> This patch will fix a usb suspend warning seen on the libretech-cc
> related to the shared reset line. This warning was addressed by the 
> previously reverted commit 7a410953d1fb ("usb: dwc3: meson-g12a: fix shared
> reset control use")

Could you also send a patch that shows how your new feature can be used
to fix the problem that was originally fixed by that patch (and still
exists, now that it was reverted.)

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
