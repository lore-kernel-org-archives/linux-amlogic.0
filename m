Return-Path: <SRS0=9NnP=YA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A89FC47404
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2019 13:18:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A6D52084D
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2019 13:18:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W7O+lbB8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M/sXWPA0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A6D52084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vy9qdjcNacuChKFC07EOLQUuj0Kn5pYq0lGKPKsJQM0=; b=W7O+lbB8o3A+Og
	GK7MYxoDFcpbWKDeUrXfvQbCWROS7dwj+WqOrM74PqzapjpDR/5x5tAaYI1MBEDmjeq78pqtEnMIh
	NEDeVFv6rT8KSDRjb6YLWkn0aZ2Ct9qRlmBDhmdjpyju0btfTNhluEHpJI/x4sJXhMg94xsKANgCd
	0otjKQj2lsiDoOUjWBGeXSuobFq2b0xokRbs7U9yjMDlsS6gdezhSpTfA5AuZqHSziOZrTUoJwNs3
	a0YKXs2lN6qJHTmnGhLt9MrkZgdLTGeuanLFkRBy2qZpHuxWxlmUOLmaw0kFKP/K/hBmyCV+OLgJ2
	/ng9i6vdAYb9VpvJicEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHSuH-0002kr-JT; Mon, 07 Oct 2019 13:18:33 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHStC-0001fX-37; Mon, 07 Oct 2019 13:17:27 +0000
Received: by mail-pg1-x541.google.com with SMTP id z12so8190504pgp.9;
 Mon, 07 Oct 2019 06:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6es+bj4m6D0NRp6eJ86Bzn7NLYhzt0+WYGFkXdeisCE=;
 b=M/sXWPA02M0QcDjEUHDoxDu/iJZ10d3QoTkc7NCVa8WvgNxbztWLtxFmCgQTtuInB3
 7yBbsaq9qcQp5mHn0qtxLuIV0PZe9APox09UgEmLMvvr5MjsqI3BTrU89KLdHFizbG/m
 Hv3ZqhAsy2rNL6lFYqlxg7aSi1/1WrJwHD86+yakYzvRXlaeHnlifdP8QAATZTaRiUxb
 H3VavPsftKhLu0yTh0HfAcbaqrT4wsI8R+Jh/YPIqsEcHRkuEsXfsuxI7OkQo4nEcWbC
 K5+H9RMIoYgRpVOiuzTGPXzY06kDmXZPBrGbnXdDto9IKXd/zcZf1d1B/y1xLy+LGfaa
 BbsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6es+bj4m6D0NRp6eJ86Bzn7NLYhzt0+WYGFkXdeisCE=;
 b=B0+PzI4GvoLXihd79L56AERl/rcCKbXoslaER3spEM3kfzzQK30cLB6qZqsPQRaTqQ
 Op9PVcrOz4F+SUtnnIPfdWyqUWbcZHYlaV+5X6VqQXmQl8JmK8imh1EyywouodIJBzkA
 foZAjIjZ4sWu5nwNhCRvPFxZzWAe8cKU5YWfztyaDyflXAJPOxetpjWD369IMiMVl/jC
 OEUli/BKZ20D4TGIfmBav1371pAesH0r+Z8KDcNe922nR+eBfJznu1DujDGgrxghdvjs
 CY3pOFc0tqaZqjwhPGSSatnmLd7ICfnfd6uFT1RqdcKpw0kLvBMqyl/PeFrrdo0AlP/e
 m81A==
X-Gm-Message-State: APjAAAWD88vOBHuiA7FehKdW7q5Mfz7jbkZBfFGm5r6VY/3wZSjRHsMo
 OUMlSvp5/wkBnLRdVwpG+rSbQFx/
X-Google-Smtp-Source: APXvYqxmONDIX7T3YMFHU+SSe8JVCjsCt1EGkyQpLu08tdDcSrutmezf6irBwCbhMuxrdQ3HkMuugg==
X-Received: by 2002:a63:9742:: with SMTP id d2mr29579186pgo.356.1570454244493; 
 Mon, 07 Oct 2019 06:17:24 -0700 (PDT)
Received: from localhost.localdomain ([103.51.74.138])
 by smtp.gmail.com with ESMTPSA id r186sm16938650pfr.40.2019.10.07.06.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 06:17:24 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Subject: [RFCv1 4/5] arm64: dts: meson: Add missing regulator linked to VCCV5
 regulator to VDDIO_C/TF_IO
Date: Mon,  7 Oct 2019 13:16:48 +0000
Message-Id: <20191007131649.1768-5-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007131649.1768-1-linux.amoon@gmail.com>
References: <20191007131649.1768-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191007_061726_225018_77D73652 
X-CRM114-Status: GOOD (  12.03  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

As per schematics add missing VCCV5 power supply to VDDIO_C/TF_IO
regulator. Also add TF_3V3N_1V8_EN signal name to gpio pin.

Fixes: c35f6dc5c377 (arm64: dts: meson: Add minimal support for Odroid-N2)
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
index 6bd23a1e7e1d..5daf176452f7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
@@ -66,11 +66,14 @@
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <3300000>;
 
+		/* TF_3V3N_1V8_EN */
 		gpios = <&gpio_ao GPIOAO_9 GPIO_ACTIVE_HIGH>;
 		gpios-states = <0>;
 
 		states = <3300000 0>,
 			 <1800000 1>;
+		/* U16 RT9179GB */
+		vin-supply = <&vcc_5v>;
 	};
 
 	flash_1v8: regulator-flash_1v8 {
-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
