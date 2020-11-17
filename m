Return-Path: <SRS0=6jDt=EX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E3F6C63777
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Nov 2020 08:45:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0072224655
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Nov 2020 08:45:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BaRK7cLI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="SazKex1e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0072224655
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Gvip+Eo/PcLJ861lwbiHJ1AXTUzqWM2J9Bi3Taz0680=; b=BaRK7cLInFgcQZ7JFnLWMPYIy
	uu99UWWbYzq8SHe+G+Qt9+MSTMaFdsWQnlhRB6Wj2Yb1ZeimZ8jBYjvjLoT2J0zPjVDI50fr3u8fq
	3DB/fXknbuv/5/7egaqNsmEqgK1SqHI0gfXae8Ap2DCgIQbRusifpdkwe8GXHOCgKaFo6Nh85zk4h
	XD/vkm0zt8xmYYjG7U6tqDR7Wr77O6/BofJP8GznmCKKCcH8Jxs1UT2AKBKrOD73ZTNB0Qh6svRtF
	4LZe0cX8FYxJXbBay/mb5K36cnJFBFNgzAdWRy0PixYcfenUgR2chL/6JvVlRjG7AcvCJ/948bEmX
	4T7yAjnbw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kewbr-0002Cw-F4; Tue, 17 Nov 2020 08:45:07 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kewbb-00027r-3c
 for linux-amlogic@lists.infradead.org; Tue, 17 Nov 2020 08:44:58 +0000
Received: by mail-wm1-x343.google.com with SMTP id 10so2435266wml.2
 for <linux-amlogic@lists.infradead.org>; Tue, 17 Nov 2020 00:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OwtNdHIPSabqM1aRDu7jm8OQIX10dof411XMNae48b0=;
 b=SazKex1e8Dpmw0wCTWs/sE3RvrSt39qvTnKOgvciTfR2KM6ODtIkjEjiEHadPqDO3w
 gIW1sSOWuZv0I5EqxfJRNuRzkehDdoh35By/7es9E8jN25NeIbwIkmRSVwgNZ5N+i4xx
 sM0qeH/Cd/5tqEK1EDL8DV5WeekkhzmO5phFKmA6EzLzZTjWtld1jqCx6VAelDipUuQT
 EVZbqLRovTKGmpD9omMqEXI6lza8GlO5eECVcxCyaLWsw9kTb1KKDntjSPOCRJLW2+S9
 01MtZ3HMu0hm3oAX9cfe3x0/AJxdiqyPrkfWtZPpyZzDsqhuop9RAQmEv033weo6aP+y
 7FNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OwtNdHIPSabqM1aRDu7jm8OQIX10dof411XMNae48b0=;
 b=bCM7nmkg67M1KLcz5M0OPld+/2DH/Nm1H6JYZBbXWx+EwBxseIZLuTHpZjF3aKvqsF
 ChuhzjdBZs8nhwvgb9EpAVdapLjzwGOJ2A4XdPfXcDSjzvWWv9XkKKvSpeQgBLZpg+md
 2zaazRm16qa+wS3rq6mc/6d9reUHtCHz6DzwkWaHwMpU3Nt69BJpHnGBrc5POQrmzpsx
 GGQYsFpx4QNArb/FonNw8c7NgyhfjussjSETTzl/Ey6H9aDwyyb9d1fkz9RHpFJTzwOg
 JtdlsniP3+VLvSZh/8hR7t3LaGEHWLTRWABYEBTqL9r5iLAmd/0Wqhc+0jH2y6y8ILWg
 alRA==
X-Gm-Message-State: AOAM531nGpl0ahVwjUf8dJ/enpeWXhQ7WWRE+pua++4HPDyaxu5JF3l5
 6WzIaFRsg7SYtbOV18MbGMcxEA==
X-Google-Smtp-Source: ABdhPJyAd4+8h6Wy+fGQVwfIOyVyIO3OsEfT/liATAfN1Meh5H0R1ljGHSFXg0TujlFI1mvpl4eu0g==
X-Received: by 2002:a1c:1b12:: with SMTP id b18mr3063879wmb.119.1605602690049; 
 Tue, 17 Nov 2020 00:44:50 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:1561:9f4b:5829:8e26])
 by smtp.gmail.com with ESMTPSA id s4sm25631423wro.10.2020.11.17.00.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 00:44:49 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: hverkuil@xs4all.nl
Subject: [PATCH v3 3/4] MAINTAINERS: Add myself as maintainer of the Amlogic
 GE2D driver
Date: Tue, 17 Nov 2020 09:44:39 +0100
Message-Id: <20201117084440.578540-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201117084440.578540-1-narmstrong@baylibre.com>
References: <20201117084440.578540-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_034451_233610_DE82526F 
X-CRM114-Status: GOOD (  10.31  )
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
Cc: linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e73636b75f29..db93156dcaba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11412,6 +11412,15 @@ F:	Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
 F:	drivers/media/cec/platform/meson/ao-cec-g12a.c
 F:	drivers/media/cec/platform/meson/ao-cec.c
 
+MESON GE2D DRIVER FOR AMLOGIC SOCS
+M:	Neil Armstrong <narmstrong@baylibre.com>
+L:	linux-media@vger.kernel.org
+L:	linux-amlogic@lists.infradead.org
+S:	Supported
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml
+F:	drivers/media/meson/ge2d/
+
 MESON NAND CONTROLLER DRIVER FOR AMLOGIC SOCS
 M:	Liang Yang <liang.yang@amlogic.com>
 L:	linux-mtd@lists.infradead.org
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
