Return-Path: <SRS0=9eFL=AY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F97CC433E1
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2020 19:03:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FB622067D
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2020 19:03:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zj5YeGuR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="gUbj2a+J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FB622067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BXFmdEXBcSXBTXRdLeh/aOy3i+moRPsAw5xpx+cV3u4=; b=zj5YeGuR4qNsCpvNT7YvCqb+s
	i0hpASr0lXcvcepFLggsGM2WgR2K5OX6dIwiYiBvxwxUv5VPhuF7Gy7QcHrd+FrqxvN+OwuHn4GGI
	H+kXYLcPDRlbsaymMwZsEBtMgZf8jDQ2RrC5ooSXeMBWWPV8ddC0r4FmqNDJhdnQ623fMJCntIm4A
	G3A8d/UliOwAV69NwxpbO/jZ2uii6h+Fa7WcssyN2Xm2Vzd3zziSrfsmAkCcnnC3qkqTe3Xpeotv2
	hTmsYrG0FXQq4AUYaSKN1VHR9fkwk0Sg+YeSCbBD907inVS2ukssOmJn96T/uZEz0T6H/gohPzxtc
	wK4o3Bvlg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jv3jz-0002xZ-Mv; Mon, 13 Jul 2020 19:03:52 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jv3jm-0002s6-6k
 for linux-amlogic@lists.infradead.org; Mon, 13 Jul 2020 19:03:40 +0000
Received: by mail-pj1-x1042.google.com with SMTP id cm21so322730pjb.3
 for <linux-amlogic@lists.infradead.org>; Mon, 13 Jul 2020 12:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=58Sm2O2hHu+C0rc7GOoPvmu+vxdu19cgV8dD6kLpfog=;
 b=gUbj2a+JCElYxBW38cLTTiCiXs4W4q03nssgQlX9sQlGhAPeEyfJh93d7Oy8nLwV/+
 OKI8tSS27cFqos1/8/cVXb0xIrFtM8ZZsrSa/hA6ttfIS5Kk1ITyy9ki4gwiUHP1TrcL
 OnJOiP45kqgHqVzgEHRDNbf7I0pYuci1ClzgKs8xKVbBvLCP5Z56fHZcnlqpEECYRjU0
 WkQTqGfHYJMB10CfEiy+Nh3sm/zh+a7bzoUFRdEu9HAM8E3q7/1+Z28tIZNjTJ6I9KvW
 3PbvdbP7L/4539cZen3VIUjXHrD6oPAXNtQEnrR/gDyKRwFmnVmswobLyHxvgOYK+mks
 aXPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=58Sm2O2hHu+C0rc7GOoPvmu+vxdu19cgV8dD6kLpfog=;
 b=hZfLQlylh0jxzFlZSmQC4ezP6za2+TXCUCak29xliovZK4/iTxHbGUoWgP6Q/EFkGv
 QDBM+NgFrhhkZ4V2HxvtpC1a+LkuJbRBwR914fLqekGOVRzEnItVNR4++OVLcn1aSzUV
 9/z76gsoaFGFefo8FlEJhAy+2Rp72pMjFVY+vd75w5SyLvqs5bdQpOtQy0Z+0/L0xzoH
 OJbjNh4tnJnv2afu9lz5rNtdxbDyyllwsNA9+EhT82TW7yFYozHAT9z5FadkKkwXalzJ
 10AkjyasNm8KxFqiivbw3tCE71uvLNW/qR+he7t/wF8aBvPvM2hpCFBOwARF92ZEqIK/
 cmAQ==
X-Gm-Message-State: AOAM533mNSAuFZG17bjUQ2Yj/0W04SDBBiZ2+8MwcVSRkdK0K0QGYWQF
 VbiSx8JnZMzUg2gJlrAQESwq7rI+kTx9uw==
X-Google-Smtp-Source: ABdhPJwlkPw/RyxHqA4cDR/H70xi7S73C28/JZUf6LrZpRMbhY/g6FDcPU6wddN0hon3fnX5VuNGng==
X-Received: by 2002:a17:902:c697:: with SMTP id
 r23mr919008plx.35.1594667015905; 
 Mon, 13 Jul 2020 12:03:35 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id r6sm15373443pfl.142.2020.07.13.12.03.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 12:03:35 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-amlogic@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] arm64: dts: meson-gx: Switch to the meson-ee-pwrc bindings
Date: Mon, 13 Jul 2020 12:03:31 -0700
Message-Id: <159466696386.22745.8204362310491348134.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200620161211.23685-1-martin.blumenstingl@googlemail.com>
References: <20200620161211.23685-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_150338_365290_AB329673 
X-CRM114-Status: UNSURE (   6.73  )
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
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 narmstrong@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, 20 Jun 2020 18:12:11 +0200, Martin Blumenstingl wrote:
> The "amlogic,meson-gx-pwrc-vpu" binding only supports the VPU power
> domain, while actually there are more power domains behind that set of
> registers. Switch to the new bindings so we can add more power domains
> as needed.

Applied, thanks!

[1/1] arm64: dts: meson-gx: Switch to the meson-ee-pwrc bindings
      (no commit info)

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
