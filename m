Return-Path: <SRS0=ULSD=UF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5E41C04AB5
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2019 17:30:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F0592083D
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2019 17:30:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tL9DrMb2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="wm/5HuCV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F0592083D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NDyJvL24eXWnuTCpM00qT3CtG6+jeBY8XX4vaBTq05s=; b=tL9DrMb2/yO6r7
	0Flsr89mM9xz0cHVImhgVoUQFkz4wY4ZV7cCbNPIDihAKBsWPOVKEM6WUASTNYMFfRUfGzLDSJjGj
	Uaqjk7hItQdUFNyxMwxIoojAFzfetkaZA6E7QQNk3bo6Fz9DqxV7DJl4c+LFKjXa31VNLXHOQ7ObI
	iho7EpA985BJH9XAvDtyCHe7K8ywVXpXXTrIL9QbflgLf9RI3AHKhZa3uv349+I4MQStRZZOqNyQ7
	ti/UiaScYw36kPd0t2nxPN4Au2UAL1mUc//KANJMBJ3qDBltKX4vseGPBFjf6FblT5jHyLZxhHGAu
	AUwoqtIBjVtZndcHz13Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYwDW-0004EM-Go; Thu, 06 Jun 2019 17:30:22 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYwDO-00047R-86
 for linux-amlogic@lists.infradead.org; Thu, 06 Jun 2019 17:30:15 +0000
Received: by mail-pg1-x541.google.com with SMTP id h17so1755921pgv.0
 for <linux-amlogic@lists.infradead.org>; Thu, 06 Jun 2019 10:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=Er5DZ+jmgl4pACBM9mSuCYlxA1ZXYVy+Ri46ksNsKNU=;
 b=wm/5HuCV6OCqFPMj5n7IL5mdjhSWRNBQjjf7DDWELSUHyHSEkxAJJUzCUh5K1Q/PrT
 1rU9XPLawCPwYK34YEcRmd16u3HynW0SaTlCWw1xW/8f0xJXLaJFv5Amj8aU+x3jBRGZ
 OirbFJ6smfoYmqM4vpdeGuUA2Diiozc28Ql/BUymxNlyCnF3U3NuNesy19sKjTxlBCZ9
 xYkQgCVNc212j+aq83vwctLQsFzBYDYeCb21vGVD1yCTxbTMQZP9cLHvVL8JSwKlQeP+
 HhhL48FMk2LjvcQQ5bdf6g41dqIbXtWQEnc9Q7xerefNu0gaXl87goSWT899hImcaaCN
 b4UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=Er5DZ+jmgl4pACBM9mSuCYlxA1ZXYVy+Ri46ksNsKNU=;
 b=Vmt9CnNOWfk0dj4qogBJhGSCkWBCxjIfSITo7TH4qwOeY1KvKrUESOiNeY5kXSkk2W
 XCL5Cryf1mENTDGSChZSzp4aD0MgBiukVA/LLuL6wfr4TZzQyRm/uzKLBH323DDKN3IM
 gR3JTZkCPOOa5bY9zqO/e5jjnZsRE9GO/+UJLbVcbE1AXYv9OFB9WWjb9NGxIj7AE4g4
 O1Qu28NIC22ACyXQJ0GWn4XauYbsnxFnEtQIs2w6tBimS8SWdnWLyjLytlt6f5Rf9WdP
 Qo0XD7/tSVZ+A33rRqrF9WV5dJ7j+vgOToqUROaWfzRXICM2x6gecuNBoT4o2butTFhL
 Telg==
X-Gm-Message-State: APjAAAVKRUruaRhdGPn0KpbEuBg+GLrbfC+6LuRbvXDG6/U9mt8koP2+
 Grk2/AFk+krOoiR6B5DmHfjpSA==
X-Google-Smtp-Source: APXvYqxcHDkEaPOHT2K2CyUbipGrVEDze7r7eLCeuaNBURmbKlAo/gGUVa+qM337klyNBaUWwbt8aQ==
X-Received: by 2002:a17:90a:6505:: with SMTP id i5mr924412pjj.13.1559842213424; 
 Thu, 06 Jun 2019 10:30:13 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id o70sm2769938pfo.33.2019.06.06.10.30.12
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Jun 2019 10:30:12 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/meson: fix G12A primary plane disabling
In-Reply-To: <20190605141253.24165-3-narmstrong@baylibre.com>
References: <20190605141253.24165-1-narmstrong@baylibre.com>
 <20190605141253.24165-3-narmstrong@baylibre.com>
Date: Thu, 06 Jun 2019 10:30:11 -0700
Message-ID: <7h1s06ei58.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190606_103014_299498_C0851FD7 
X-CRM114-Status: UNSURE (   7.70  )
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

> The G12A Primary plane was disabled by writing in the OSD1 configuration
> registers, but this caused the plane blender to stall instead of continuing
> blended only the overlay plane.

grammar nit: "...instead of continuing to blend only the overlay plane."

> Fix this by disabling the OSD1 plane in the blender registers, and also
> enabling it back using the same register.
>
> Fixes: 490f50c109d1 ("drm/meson: Add G12A support for OSD1 Plane")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

As noted elsewhere, this driver is also full of magic constants used in
register writes which makes reviewing this kind of change for
correctness that much more difficult, but since that's already been
pointed out elsewhere, and it's already on your TODO list, it should not
block this important fix.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
