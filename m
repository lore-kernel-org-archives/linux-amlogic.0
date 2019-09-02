Return-Path: <SRS0=Oax9=W5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 984EEC3A59B
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Sep 2019 08:59:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 699FE20644
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Sep 2019 08:59:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fSRWH17m";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZSjtEc9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 699FE20644
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fxqmmzsWdXkpuUa2YN8SURlTspJAT+9tMTIKwpLLywU=; b=fSRWH17mYgtohp
	O5OAWF7kQgrnM7Oua607u+vqw3Y5EamXqkYekVFETyKGPfhPrqz2suyOXBNU4YakkJJ0x99pPaDPr
	hguBMFoJKTQWY9/oflUB7ue49gu6cpYMuYoKlSAoXViqTtcJPEEiMH1RLI+by5cQAjk78rfgv39zs
	J+q9BWu+EZYjt4pm2zSTf16EoAK/Gwi49VntzMNYVkZCQn5MUzl2AbtcdrArGfJbAFmWGpEltZVjn
	cTwuI9mgSj4fEU1gThqltcBALYwgG8pBdc0KFxy2AMJ7j7rqcLZjpSXS/Q+Y49afQGLX5/C27QGif
	L0sllTk6fTZgCIu9FwzA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i4iBR-0004p2-QX; Mon, 02 Sep 2019 08:59:34 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i4iAb-00047s-Uk; Mon, 02 Sep 2019 08:58:43 +0000
Received: by mail-pf1-x443.google.com with SMTP id q10so3613195pfl.0;
 Mon, 02 Sep 2019 01:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Evc5Oocb4Bzm/ej/oCNbe7g2Kw/0/LCaIG/fqce+EF4=;
 b=YZSjtEc9my+Zw5OYisr9t38RV2Ii6+D8ie4L8pPbYsDAVb+zlcz5b2PZHhtKhzsadA
 Q/q70gecmRu1o5gzfudJdASqtiSKf3O2+ULNZzy1Qj02blosRLcnkzYThmEY6B4VIhcS
 U7QveRl5LADdmiLcvQur4QWXZ98/Kx54zOgMZQHeePm8M0LvVnvDWM7aV6KyNjoMf3d5
 eIZFWwnGzaMqP24Eccspd0GjKIR06mNVqp63SCDnx6F7PuWjzKqLNInmYHV+dvl2q19m
 MlO+xrPE2zkiF1HzdqpndD2HeQAUTVifo+xNXmKxAyAeYKmZZh0+QGtXcxaX4wdWlXDq
 s8gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Evc5Oocb4Bzm/ej/oCNbe7g2Kw/0/LCaIG/fqce+EF4=;
 b=K9jgdhk0HKx9bXfytnHOVQBEOD3xbF6vDAPF5LXYSMQqxzDD0u2R5PhB2QH8YIZcR9
 Dyglm9Jh+Ku2lbIQH9sSRh+qHBJ6eZAE6pnPLvSSVYDnhKbyZS8Wt7UlT5lxabXHNoWT
 4lK5eokMCId1opJvIcY7sBTuD8pVAjri3lfFsYAgLc6FSDJSoS9mBi6yx6VLZ0B8/E61
 AxhDxLbiLnsAAaua7as0pZq0sM04TIGjw/88Tl8DEl+tqqaj1L/QgKsvCaD+pJa88Qld
 NtV+DrXYLokZ4Mj2viNiSZU1vIdffSz4eBWvmWjytRYRYxNQj61RnbFKiAvmGPsgMGse
 23yw==
X-Gm-Message-State: APjAAAXpLLzvzC37wrSie9pz1K7qWHBYMwiyjIjUdv5sAubq478bDh6q
 WVTXams2ZoX1LCNZc+QcyYE=
X-Google-Smtp-Source: APXvYqylOpDpihTs4Yfbu+0WeAi5mvhaQO6NnrVMoTglbxIZFpO1NtjwH1v0mc7Axr7ak3OLF5U7Mw==
X-Received: by 2002:a63:5765:: with SMTP id h37mr23673532pgm.183.1567414721301; 
 Mon, 02 Sep 2019 01:58:41 -0700 (PDT)
Received: from localhost.localdomain ([45.114.62.203])
 by smtp.gmail.com with ESMTPSA id y6sm6313117pfp.82.2019.09.02.01.58.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 01:58:40 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCHv2-next 2/3] arm64: dts: meson: odroid-c2: Add missing
 regulator linked to VDDIO_AO3V3 regulator
Date: Mon,  2 Sep 2019 08:58:20 +0000
Message-Id: <20190902085821.1263-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190902085821.1263-1-linux.amoon@gmail.com>
References: <20190902085821.1263-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190902_015842_034578_34D2BEC2 
X-CRM114-Status: GOOD (  11.50  )
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

As per schematics TFLASH_VDD, TF_IO, VCC3V3 fixed regulator output which
is supplied by VDDIO_AO3V3.

While here, move the comment name with the signal name in the
schematics above the gpio property to make it consistent with other
regulators.

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
changes from previous.
- Fix the typo.
- Add the comment as per Martin's suggestion.
- Added Martin's review tags
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index b763b76820ba..ef2c3b74415b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -67,17 +67,19 @@
 	};
 
 	tflash_vdd: regulator-tflash_vdd {
-		/*
-		 * signal name from schematics: TFLASH_VDD_EN
-		 */
 		compatible = "regulator-fixed";
 
 		regulator-name = "TFLASH_VDD";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
+		/*
+		 * signal name from schematics: TFLASH_VDD_EN
+		 */
 		gpio = <&gpio GPIOY_12 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
+		/* U16 RT9179GB */
+		vin-supply = <&vddio_ao3v3>;
 	};
 
 	tf_io: gpio-regulator-tf_io {
@@ -95,6 +97,8 @@
 
 		states = <3300000 0>,
 			 <1800000 1>;
+		/* U12/U13 RT9179GB */
+		vin-supply = <&vddio_ao3v3>;
 	};
 
 	vcc1v8: regulator-vcc1v8 {
@@ -102,6 +106,9 @@
 		regulator-name = "VCC1V8";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		/* U18 RT9179GB */
+		vin-supply = <&vddio_ao3v3>;
 	};
 
 	vcc3v3: regulator-vcc3v3 {
-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
