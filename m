Return-Path: <SRS0=7wMv=6U=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5D9CC28CBC
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 May 2020 22:17:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7911920753
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 May 2020 22:17:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OwU0oLuS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="g1GtLVMo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7911920753
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I5ZzN7qySjcQziPjmRfkCeYgHES82a1Ex3IXYnf50qo=; b=OwU0oLuSp5le3m
	yw8lbzDCXvQNzDyZmfMMfmHrolwTHq1fpaB8i9K4b+NTliXhMGUcmh4Liou+d0FAbW5xINMUJ/Ov1
	A6Iexh425UMqjiRX2VKcRKlOTVyzYsfmtF2juqvq1UVGcYTVzHzKa4yZNUw3kguuYIrTZNmf7RKyM
	uIxfa5O05g/wh4c1+29v2gj+3pErpITZWR1l5Lx6FsW2rt72YtVIfBA05tKixUk8A8WnVsnNoBd94
	CEDiU5K6e0m0vqsRGZ/AQEWSE0tfRFfQ8pSCS9uIfpgy9h8uQGwNMbOtsLUGi4K3bZpc1Q5l+tsKg
	NfPtmXtTf8ZUzY88UkFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWSLt-0004Kb-7Q; Wed, 06 May 2020 22:17:17 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWSLo-0004C9-65
 for linux-amlogic@lists.infradead.org; Wed, 06 May 2020 22:17:13 +0000
Received: by mail-wr1-x442.google.com with SMTP id e16so4004147wra.7
 for <linux-amlogic@lists.infradead.org>; Wed, 06 May 2020 15:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yN0HCUrRjQ5k4nIyeYJ90SMpOcbw0Xs0uvSCaOCg9cY=;
 b=g1GtLVMo3JG+hMTJIYH7JtCwyL8aI+OBkx8gezaZeT+5RwkRCBpJjWLsts3xv1MvCt
 YsuA9Rh2vrNc0RSzFGYnCnVF9HM/ZWvMO/xO/1aVV41l7+kAVqAaXqKcwL3t6c0Mkv1G
 10d+pHeAcs2BBzUQO28s+eB0HyIj+B8mZgmf8mSyVoJKhONA8XEBeN28YQVHxaii00t0
 ZDpcq0+FSAUo7+kkfM0TC8lihNBdlYrF326cILDZwvdNy6VjPtDerwC6YCWITiP0p2vr
 f/Fba1HRUctpQgx0Nn3np43yNY3pQHDpT0Z5mGhkTimFJfwImjTQ2zBr1BxamYhFri43
 zeKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yN0HCUrRjQ5k4nIyeYJ90SMpOcbw0Xs0uvSCaOCg9cY=;
 b=Cl6yNVkloDQNZCWGvVV1JLiAk3o4Y30jXjQGpW2JFCxI0dmI8JO2N2hmE3Bm7dVRtJ
 p3TBkyIHZIT25nWLbj9DxaU7V/8R+AJRfZkUd/Ioh0YfwKJLqc6XxoSxV5EW+GKKP0Pi
 byeRKy+uwY2qLTJrGEJXLuu54Q7pNcM0Ye3tz22sYioFPAMEPCU8UQdLILafNeGpPoVt
 nyFdHV+Jf5w4p/CPATNEMQZlWis7saLXo/lxfz64nWrSLAs6xXaAzFTtwy5bVfE1XNYl
 jYeXRVGgDUuWIGrEEleQaNI3QRj6rKX71ype2oUSikeG1RZN1Z54V+rk98aEQNcMHH8x
 Wl4w==
X-Gm-Message-State: AGi0PuaVZk/9pGhgpmtNZTSxgzvsQ8d81+nCqEmXWly52+Td5HuJzzsU
 SvgMoN5pD8/ZDSD1m3nrxUdWyg==
X-Google-Smtp-Source: APiQypKmKkIATkCvRuA6L8tzWAVJ4EhdRo2Hu+9i0pkUQ8voHESzNMdPvDDbS2uufpAwDrHl0iKpoQ==
X-Received: by 2002:a5d:6acc:: with SMTP id u12mr12845202wrw.198.1588803430684; 
 Wed, 06 May 2020 15:17:10 -0700 (PDT)
Received: from starbuck.lan (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id f5sm4760671wrp.70.2020.05.06.15.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 15:17:09 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 6/7] arm64: dts: meson: g12: add internal DAC
Date: Thu,  7 May 2020 00:16:55 +0200
Message-Id: <20200506221656.477379-7-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200506221656.477379-1-jbrunet@baylibre.com>
References: <20200506221656.477379-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_151712_234936_E33FE017 
X-CRM114-Status: UNSURE (   8.91  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

add internal audio DAC support on the g12 and sm1 SoC family

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index c0aef7d69117..593a006f4b7b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -250,6 +250,17 @@ hwrng: rng@218 {
 				};
 			};
 
+			acodec: audio-controller@32000 {
+				compatible = "amlogic,t9015";
+				reg = <0x0 0x32000 0x0 0x14>;
+				#sound-dai-cells = <0>;
+				sound-name-prefix = "ACODEC";
+				clocks = <&clkc CLKID_AUDIO_CODEC>;
+				clock-names = "pclk";
+				resets = <&reset RESET_AUDIO_CODEC>;
+				status = "disabled";
+			};
+
 			periphs: bus@34400 {
 				compatible = "simple-bus";
 				reg = <0x0 0x34400 0x0 0x400>;
-- 
2.25.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
