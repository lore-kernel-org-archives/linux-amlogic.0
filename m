Return-Path: <SRS0=XJ9a=TZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36CDEC07542
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 May 2019 18:57:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A6C720815
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 May 2019 18:57:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sqRxxGY9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Wkvro0PL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="VnKfwh0b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A6C720815
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/0QdpDl74znSI92zl/Kp5nSE0mlKDwu4yKRZstWFhsg=; b=sqRxxGY9RiwHoO
	4zE/8jxKvulsAVyGUbsveBExcOO4Tdw1IXCCy1a822Iue6OQ3RlzAbFPGEnSyi4xRdwEpW1DR2Vuz
	i8+yUybp1drRlcd2TqtAY8ITKpI10RdugSaTQtkzwnWDZ/hz/kKqrB6S2+XcTKHw2rFKKIS5ubHHo
	fZ4bZM4oTMmly11r5c9JKNAfGueNCiOeNdmq8POrPNn9Sqt6CeZ43wYQx9xEIM9woryczHO79WqHr
	1X/9it2TRSpFDUv5mmlOaidl7/HRt2PgOa7CWF54wLGRABHlMJcsoYzWY5gv5xLhGF6N+v0otsxy2
	urzRcuiA3Thg1FJMaz+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hUbQ9-000495-Cd; Sat, 25 May 2019 18:29:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hUbQ7-0003yY-E5; Sat, 25 May 2019 18:29:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NTuYf2SN++XrzgOo/LowMD7xHt6KeFYnBiXdbjNn1Mc=; b=Wkvro0PLpZh/p9yhKXmTh5nYHH
 2W2Id/f8Ak68LQwdtPEouQDetvEF3qsirUMbdv1mvdof2lqD99oPVvg1ibh2h/ClAT2JsB1yKUi5s
 1il9AfTR1dJfPvIjN1SBqBIxT6GNoKIQprWQkK1xRx4ipKGgGlBDVdkE+SzVLwDkdSqDb51qEZvq9
 qGA4ic74LpsYQcucFm1uTlN88eaMz/QPaITZOb0bVxxQ5IQx7zS6U+MLM/aj/dvQOB1ysr2QMchCP
 NCgHQp1Y41Xopl7NO1IF7N+sIlhOscGa1SyY6gt0ogEDjpl+8HgyPw4Him2/bCoCV/e4pBmk4Rpow
 wXB5FfGw==;
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hUb93-00025u-Rv; Sat, 25 May 2019 18:11:53 +0000
Received: by mail-wm1-x341.google.com with SMTP id 7so12065954wmo.2;
 Sat, 25 May 2019 11:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NTuYf2SN++XrzgOo/LowMD7xHt6KeFYnBiXdbjNn1Mc=;
 b=VnKfwh0bGoV85geiehf3lF7Ro/8ZshaPwzuqppSHFpjUxlW8nxcaz1HWoxyvGuTRHz
 8obIqVm7h0WsDAyI+PoOHI1yEHv+a7fGSkrf5sUrJhHMhyjVZtFCB2VVfe7dg6cEofUR
 dF3Yp4zbu3MiZn2VSAbwd77ukSrzUO/HqTAvT+lLvwLrqfIQbXDT91zKKyBLxuKgXCgK
 bbaGpLyRRMeYKs3Vm9/fMUZs+8EP+AKTGTAGqrh8Wj6NObw8RVZWCVpuoQZDIuJJsLRa
 kiK7rS/YY0lojeU0Pe3Kps2/+Oxqbt+LcAy7z44txeLaCTs7d72Dhg8lTx2lWyCosVIX
 XHLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NTuYf2SN++XrzgOo/LowMD7xHt6KeFYnBiXdbjNn1Mc=;
 b=iJh3Nb4qmj41dGSAbhjvbzaqkyziCnDsgRAPSQUluYkdopBG70qIgqhbh2suD7xeM5
 D7X1kMd9nKtij81+mER6KTej+lfDr1k6lVkijONgGVEHi1tmR+vKAjvgfeL4/kkHmAuJ
 FOdO+QCzBdor2tITUsOExUxNT5n7xEFNWnwK+Lo6iBtJTSnUWy7bWhUDFDyGNCGUqltq
 xKBV5LMLFkf6C6qJN9LKTwQL93/Ihj6gSPZZ1+Uem7J550CgECqxI7WrKyljpn9EW2HN
 meRM/eraRWFbgyuV4isfZI83MEt5oBmagblqGPnBmXdgP3UmaqAkj4pvmTMZJasZZhWY
 S8wQ==
X-Gm-Message-State: APjAAAU6BzKL07yDwqwEu7K4fKpi/YB0qRy5GI9kZrGUw+5vADwJ/u0L
 6oL6p8NbOmEX3OhALngadVuboKQl
X-Google-Smtp-Source: APXvYqxzNHr1KHGccEbFz4UmNfvsgrRoH6NuLmip3pRZHRxdOtQ8QuPVBMnJaq2uWniu0zSEdRHOgA==
X-Received: by 2002:a1c:e009:: with SMTP id x9mr4094446wmg.117.1558807908370; 
 Sat, 25 May 2019 11:11:48 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133DDA4007CB8841254CD64FD.dip0.t-ipconnect.de.
 [2003:f1:33dd:a400:7cb8:8412:54cd:64fd])
 by smtp.googlemail.com with ESMTPSA id o8sm12794540wra.4.2019.05.25.11.11.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 25 May 2019 11:11:47 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org,
 thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de
Subject: [PATCH 04/14] pwm: meson: change MISC_CLK_SEL_WIDTH to
 MISC_CLK_SEL_MASK
Date: Sat, 25 May 2019 20:11:23 +0200
Message-Id: <20190525181133.4875-5-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190525181133.4875-1-martin.blumenstingl@googlemail.com>
References: <20190525181133.4875-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190525_191150_000037_9C4C555D 
X-CRM114-Status: GOOD (  13.98  )
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

MISC_CLK_SEL_WIDTH is only used in one place where it's converted into
a bit-mask. Rename and change the macro to be a bit-mask so that
conversion is not needed anymore. No functional changes intended.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/pwm/pwm-meson.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index c62a3ac924d0..84b28ba0f903 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -33,7 +33,7 @@
 #define MISC_A_CLK_DIV_SHIFT	8
 #define MISC_B_CLK_SEL_SHIFT	6
 #define MISC_A_CLK_SEL_SHIFT	4
-#define MISC_CLK_SEL_WIDTH	2
+#define MISC_CLK_SEL_MASK	0x3
 #define MISC_B_EN		BIT(1)
 #define MISC_A_EN		BIT(0)
 
@@ -463,7 +463,7 @@ static int meson_pwm_init_channels(struct meson_pwm *meson,
 
 		channel->mux.reg = meson->base + REG_MISC_AB;
 		channel->mux.shift = mux_reg_shifts[i];
-		channel->mux.mask = BIT(MISC_CLK_SEL_WIDTH) - 1;
+		channel->mux.mask = MISC_CLK_SEL_MASK;
 		channel->mux.flags = 0;
 		channel->mux.lock = &meson->lock;
 		channel->mux.table = NULL;
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
