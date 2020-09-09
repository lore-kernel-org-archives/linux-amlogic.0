Return-Path: <SRS0=GF6O=CS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84DE6C433E2
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Sep 2020 16:05:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3269F2067C
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Sep 2020 16:05:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bHRvmj+X";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="cvL1h9nX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3269F2067C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Zt0fTUDDFk74MEMOwoJpzOQaofTEKhzIJlIoTo4FE4g=; b=bHRvmj+X2ImOtwiQgfB333Hkm
	9quo6JiX4XQDbCtqEAeb5l9RCGyd5NzIGRVb5i6/ZPnpltgXPWL4bUi5jukRFgSD5bQTQAhqoyFQ7
	ksM1RExtnZ3FfxM9fHxaFtiBCtgskCbSTUC9EAN4gpEMeiCJH1SFKHFH1P8jevjQJwzfxkgN8szuT
	+PvTuHuDTE29ABVGZ7wvE9nH+YNpLMIDzKJ2OKkZ+VWnJmiab+FDfwqZ99DJkr1/OcV/+fdgWjyaz
	i2gW5vDa9uX57nO7KhkPPr2xv7BW0yUW5uB8h1hOLGssH/xa/geGIIo9kAwc8qVHztRhyeaDwtG2D
	clvj6/X9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kG2aa-00022Y-JP; Wed, 09 Sep 2020 16:04:52 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kG2a8-0001sB-6I
 for linux-amlogic@lists.infradead.org; Wed, 09 Sep 2020 16:04:27 +0000
Received: by mail-wr1-x441.google.com with SMTP id a17so3564950wrn.6
 for <linux-amlogic@lists.infradead.org>; Wed, 09 Sep 2020 09:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vgg0Drz8zo+lQwM7EXGGKvLI+hvN7gZtyPm/VP553No=;
 b=cvL1h9nXfB4PJJq/e8iaVIE0lAtZEUldzYk7G+DOxesgjcyeh3lFoH6VUV5paWo+2f
 zoG9gGGz08+6riwAqPHo/ywfIUNhU4++BcaE+qmrxWeEd0j7g2fegHMwaHzhaDHxjW42
 I4yDbXnXVKRe/0gOMyvit1ZWZJ62T/FavpV8vlp2kiWJ8aBlqfJhHJtEdyn/NHARRKfr
 sKEplMXQD6sQj3j3oqXWGCd2c4/z7NyZL5806d5nPJSsNP6wNvMmVMAIkJJ/3WuX4OH0
 kHhG9xK7XEd8qiS29ZeN4LcrAlS16vwjfDFcb3tU6STTC1W0/9vGCnwX04FZk1n9Rnb7
 mgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vgg0Drz8zo+lQwM7EXGGKvLI+hvN7gZtyPm/VP553No=;
 b=BWtgMDejVJ/Fguqvzv+0nFvqK7/AlQmYSKAUD4i+8xkmMXadqbXZhD+NxFlyC9iYa2
 Z4mtzcVQ6HcyFGYJuREg4CM8XHpx9O2G0pV6IfQyw9+FkS4aHgdThn2AacMBCawvorbM
 eNqI9z9AuNHFNYuvp4jTxzyT5QMaG1Fhbn4V4c8d4XaFiFlnUA9PzeI8hiptfSFxfNRw
 wwrqEG/is/5uxe1jtwQpZh4HWVDqNq4E0UbcCr8fAR+nWzZaLFFB5nvRz7/KGneDIox/
 dz1mRcWcVJuyaZf3NjBk1scpiftoNrAcboaaCzDJXsVqLLnwx+02Hi++72fMcMPlquaC
 aRzQ==
X-Gm-Message-State: AOAM533bHVBoQdqTdhig8WOnaNpGxDE2uiE2hQ5OiQIl3/F6KX2gDhys
 iMsYodqrHW48wrD1AI8XNC5UcQ==
X-Google-Smtp-Source: ABdhPJyhA56ZPn7zhGV+NzrFhVIB0ghngJMEVy9ru3brR2WQ2skP9ky+KN8SoHdCYCH1eesOk/Ra6g==
X-Received: by 2002:adf:fd90:: with SMTP id d16mr4743738wrr.52.1599667463126; 
 Wed, 09 Sep 2020 09:04:23 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id y6sm4850700wrn.41.2020.09.09.09.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 09:04:22 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 5/5] arm64: dts: meson-axg-s400: enable USB OTG
Date: Wed,  9 Sep 2020 18:04:09 +0200
Message-Id: <20200909160409.8678-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200909160409.8678-1-narmstrong@baylibre.com>
References: <20200909160409.8678-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_120424_300340_E40EE92C 
X-CRM114-Status: GOOD (  10.24  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This enables USB OTG on the S400 board.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
index cb1360ae1211..5f131debcbad 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
@@ -584,3 +584,13 @@
 	pinctrl-0 = <&uart_ao_a_pins>;
 	pinctrl-names = "default";
 };
+
+&usb {
+	status = "okay";
+	dr_mode = "otg";
+	vbus-supply = <&usb_pwr>;
+};
+
+&usb2_phy1 {
+	phy-supply = <&vcc_5v>;
+};
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
