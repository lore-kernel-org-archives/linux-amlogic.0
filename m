Return-Path: <SRS0=yTcF=CJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50228C433E2
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Aug 2020 08:00:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21D262073A
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Aug 2020 08:00:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bO7AF1ry";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gw+iV3VC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21D262073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=b3mXqiKkBK2sg1dJUNQO7grH+zHJXGXLZHtbpqHv51A=; b=bO7AF1ryBnVeexeFAByTp5wOb
	szBY0Any8whijcdOcQ6OgLHpxrXu8EAsdj79qjy55+0s93mAcgemJaIxk12WMbtTiPvNR1R4+1E38
	W9lHdBewS1Y4OANlJGkdTohQeNDPKU71/hGUNJDbjgNIgHcEMKMG6ewm8wc1roaHJjniuTjuV93n+
	dqlW8JXbUK29r8XUeQAYC4yZmQ2yZNIQ5/cvge9fHtdj21tiWJs7slbPpZhRK2j0XPWGPq4jSPnGy
	6bDjkYv1YHwQCjLJkTHISKFU1RNsX8axkgZm+MFyHVaUtnoDv3NaSNHnSYnJVs+/EXTd8v402bL6B
	nBH3atzJw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCejH-0005Na-RL; Mon, 31 Aug 2020 07:59:51 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCeiw-0005GJ-19; Mon, 31 Aug 2020 07:59:31 +0000
Received: by mail-pl1-x643.google.com with SMTP id y6so2639437plk.10;
 Mon, 31 Aug 2020 00:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k+B4CdFk9Gd+ps9B74oSqsmnwlY3UVt8wl1Elm8SmY0=;
 b=Gw+iV3VCzPbHdseLXtIBeU3Mi7xPaq7mLlHGZet4W5Vg44/+hSefO84DFwQRuR4NXB
 WnMmQeWlrhuUj644V+h2MjXVjaPCXemYHe4U69QAzPwW3oOK2mHIetBGHyT73gRHvLyt
 Rm01QODybCqKg+fpieLU/TT9sQtmPdpe1iDOHN+k6oGY+8PRqiEADweuFpfOd26Mp9mA
 Q5pkTgx4rOzgNhutl0GV0J5T0DuK3lckh/Jcmtg1KSpA3XTCgmuc1Daem+Q8gw7dFg0J
 T44BvpbZ4jUSMkiEB677FEZMEig+U0+9FocZcu+6JhpCF5OSCP7Eq5+IKiOVYLK/Yikk
 3VKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k+B4CdFk9Gd+ps9B74oSqsmnwlY3UVt8wl1Elm8SmY0=;
 b=akSJFI0FD+SIvdVEMImOdg853MRJXRUrc/gd6Sdfyqd4u5ljHJgCEaVZ4egqGEho94
 sLnhNrz+fy3Be9JDkqivomfvnalh8mbi8LCXucsXpE3uellqaQCl/t0Yrpa0d485aK8S
 a5o+k55z9aV8ii4vyABuSszfurQT8S2uMRZQNuFUghVS/wOZhgpH+5XiaBt6IPuNYTNR
 Hf3JoummrJbUmNMMQ/tob8vt9sOwhsR9OLpeUDinOw3s2hxKTpma9wk9w0lRrG2fw9Ou
 xuBpmqSQ/E+7O4KUWJ2Byr/QDhb4NuzBzRShNrSPJT5jGDbkK1zd0RNIbBy3Mhe/xHj3
 egYw==
X-Gm-Message-State: AOAM532/Ln8O7kGKhI06MKKQhFdNDNRYn7kuYJotDxSyVBRx1EJXGqu4
 3JtlSo0tmGEtqzAFNqUdxjA=
X-Google-Smtp-Source: ABdhPJxM1akzJJ5PBiQPJSLV9xRX13Xf2FYVn00D9IOJBlm0VjEUERTaIw4zRZS87qSvtuFemOdjLw==
X-Received: by 2002:a17:90a:d18d:: with SMTP id
 fu13mr290077pjb.137.1598860768201; 
 Mon, 31 Aug 2020 00:59:28 -0700 (PDT)
Received: from localhost.localdomain ([45.114.62.190])
 by smtp.gmail.com with ESMTPSA id g19sm6424057pgj.86.2020.08.31.00.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 00:59:27 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH v4 2/2] arm64: defconfig: Enable RTC devices for Amlogic boards
Date: Mon, 31 Aug 2020 13:29:11 +0530
Message-Id: <20200831075911.434-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200831075911.434-1-linux.amoon@gmail.com>
References: <20200831075911.434-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200831_035930_155469_99BC8870 
X-CRM114-Status: GOOD (  13.90  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Enables the RTC PCF8563 driver used on Amlogic Libretech-pc
and Odroid-N2 boards supported in mainline kernel.

Cc: Kevin Hilman <khilman@baylibre.com>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
Changes v4
--None
Changes v3
--None
Changes v2
--Added Neil's ACK
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e0f33826819f..3d9756833e0e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -773,6 +773,7 @@ CONFIG_RTC_DRV_DS1307=m
 CONFIG_RTC_DRV_MAX77686=y
 CONFIG_RTC_DRV_RK808=m
 CONFIG_RTC_DRV_PCF85363=m
+CONFIG_RTC_DRV_PCF8563=m
 CONFIG_RTC_DRV_RX8581=m
 CONFIG_RTC_DRV_RV8803=m
 CONFIG_RTC_DRV_S5M=y
-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
