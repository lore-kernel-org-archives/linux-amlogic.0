Return-Path: <SRS0=6jDt=EX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C441FC5519F
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Nov 2020 08:45:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6512224655
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Nov 2020 08:45:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jPqir2MA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="UwXYEJoj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6512224655
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=10FmbF2nsTfxreUdzHefBc4vMIg16vYQXDUkljOiG1U=; b=jPqir2MAHYVvGdFdGemiMOkqI
	F5R3pzzRS9S6AOpXZfU9l1enKiKHkva5WDw2wkNrHJr/27fIZw3+S0XQjANp0LEv+u1YQqcA/cV1j
	ZzhodCf59jxg7yKyj9Zdub68iLiDlpLqhUPfu4OR5qKbTYNU6eRAlHB7mn2dlszQD4zSpztQ7eBgv
	Px4R5wgM2VMkLS3hfk4nBq2cBk3xOO8iOFCqqLdjSisiy0Ag9ZIbcAYk5ag1V8k3mAgUqwVRZifal
	p5O2mR+lPp5cbTofFX0/bVOBbWRjQVsq8nnJ52qSomrjCH1kCG0JMFAB2DpBYggtOcdd85qfrmkOv
	cNZ7zvGWw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kewbw-0002EP-H6; Tue, 17 Nov 2020 08:45:12 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kewbc-00028j-J5
 for linux-amlogic@lists.infradead.org; Tue, 17 Nov 2020 08:44:58 +0000
Received: by mail-wr1-x441.google.com with SMTP id m6so5119604wrg.7
 for <linux-amlogic@lists.infradead.org>; Tue, 17 Nov 2020 00:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MLQVEogLPpntY7/K46szj62exzsJj4q8MDOgKu+50fs=;
 b=UwXYEJojzUWxuZWpoyALqr99KGTx93FqzgQE0G5qJdDTQq4GMPGDSFwSpEeMm/xeXp
 Hl099niw1Dj7HM0JGkXGcXV2NY/Ojnrg5xr7g00JeztTpcgM2Q7HOwIl/32oCg2rCvzP
 Mjvd8ZytXAMUIEgWGndAVc625d/Zm/t3W2wEln66xGXULcLjz8EHZKcw9dgiP4eAPlJi
 rfhvftbtYSlWVm92G8MGHc5PQ/KiDN8MRWbvEAmCdfpjKgCZpZAtdsQ59SwkyU0DtxA9
 3qsQP9DhgXVix2xiTF31NQaK+H7G00lLxmqE8Okonti3Dvy0zA+uToYhYTCoMMz7WZft
 4J0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MLQVEogLPpntY7/K46szj62exzsJj4q8MDOgKu+50fs=;
 b=g0t1Yp/CuERnzoVXzXiEY06OkHxe6vLmRTWAOy2duTOYXVhJZm9RU5TZu9yrc51L/j
 DXnHdraVtmn5v9Wxg/Vvl06bXKViXyUFnhaTNLczYRFEgZFnQbVLxxdoInrAPEWOafUo
 +hZsCGOGd5xpe3UqCv8l7+fDaiuTX7Cobr7Fwu7kaXwHf7dYHp3RoL1x13KmZlsXzMhB
 bQqJSccXBX6eQ6maGFDpc0yeAbP2i45Rr1Ie+GyJZ+63meb66HpKtz7YgrGpkkD+e/7H
 XpNysSMvNlVq2hRI6tDibqYlsTq2pnTXLJHnCUj6LyvPsd9YHHPxvGPUGo9zg9bViBWt
 BiaA==
X-Gm-Message-State: AOAM532y1LIPKoOmZOLbWdc+6Yb2BsCHJttr8yWN+B4qvk7ipy3cur1I
 hkf+kZwz4vzpJSrXSjHZV6IKAA==
X-Google-Smtp-Source: ABdhPJy4mPCg/pB0fVmr1u4LTHLg4BZ8blydsOJL6dwkknwKcwDSczWGuEad0rzYeHrP98k4eq/aGw==
X-Received: by 2002:adf:f607:: with SMTP id t7mr23588748wrp.169.1605602691496; 
 Tue, 17 Nov 2020 00:44:51 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:1561:9f4b:5829:8e26])
 by smtp.gmail.com with ESMTPSA id s4sm25631423wro.10.2020.11.17.00.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 00:44:50 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: hverkuil@xs4all.nl,
	khilman@baylibre.com
Subject: [PATCH v3 4/4] arm64: dts: meson-axg: add GE2D node
Date: Tue, 17 Nov 2020 09:44:40 +0100
Message-Id: <20201117084440.578540-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201117084440.578540-1-narmstrong@baylibre.com>
References: <20201117084440.578540-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_034452_778389_A4161DA0 
X-CRM114-Status: GOOD (  12.24  )
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

This adds the node for the GE2D accelerator unit.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index b9efc8469265..376f5c3f6188 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1563,6 +1563,15 @@ saradc: adc@9000 {
 			};
 		};
 
+		ge2d: ge2d@ff940000 {
+			compatible = "amlogic,axg-ge2d";
+			reg = <0x0 0xff940000 0x0 0x10000>;
+			interrupts = <GIC_SPI 150 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc CLKID_VAPB>;
+			resets = <&reset RESET_GE2D>;
+			reset-names = "core";
+		};
+
 		gic: interrupt-controller@ffc01000 {
 			compatible = "arm,gic-400";
 			reg = <0x0 0xffc01000 0 0x1000>,
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
