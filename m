Return-Path: <SRS0=DmFH=4E=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 194A6C76199
	for <linux-amlogic@archiver.kernel.org>; Sun, 16 Feb 2020 17:36:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E655620857
	for <linux-amlogic@archiver.kernel.org>; Sun, 16 Feb 2020 17:36:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bdmEUxcL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RWWAnVhP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E655620857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=citkF2y3fJ7RgM/uMyAA9iL3bGkAvrJMu7bc3zvtKaU=; b=bdmEUxcL/5hyUa
	XKDtNTiBOUiiaEqAqjOsFNJoOhCYzA3aQjEPOPVeI1BbQAUNgJYt/lGTnDCmdjkIygPAxFs3i2xlT
	+OU8mK0V/erC+5ykUOWc5QgQAzpfcWMqvT+RprFl658vOsKC3YwEBxBHFAtuYL9XUbeWjht4DZKQK
	T1TQVmy/OwJQl3rWiEi0xL7EYu8a9geRd5ZTeCT/s0k+qQwwIFOvY13lrIt50tEo3Z1LCbXFwxVu0
	eSyA7QwKDajlFB0uFJQqXvoRYUd3EbZkD63J5uJgqxVY4cFbPAcwakX52J6E/CADbaGweWtNdu6da
	UfRnWdiBBZUG/isBqSmw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3Npk-0000mB-Bi; Sun, 16 Feb 2020 17:35:56 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3Np4-0008M1-0x; Sun, 16 Feb 2020 17:35:15 +0000
Received: by mail-pj1-x102b.google.com with SMTP id n96so6120275pjc.3;
 Sun, 16 Feb 2020 09:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QJBFrhbCj4MW2FP4lLqpYa6YgQUhBipNhqkx+l0iOfQ=;
 b=RWWAnVhPGKLJcJMkkbYf5cYcJx/3etaaQ5GWv+d1s/bSvHk0vsmSpKKwFpbUE//oJ/
 Jabpj7A7p1mLXVk89Qcx2Wt1btEVkJZmGrnnGOZHldBkZQ2Tujg12uJPpbsRMJxR3h8I
 O27m8W1aGX4ybUZh1+c+oDpjq7QH28Pqfp26DulN58bVSbvfa8SEpjqnMKleNrMMQWie
 3c9DpKIOXHPCa2ucbSdyGUa/O21O4H195iPdZ+rB6pybxBSH2WymvgH9G5gN2ENszDGU
 sIMHtrlTL/4uEYkwdmu6/d7jEKdsEG0//dXOhUKggEbNOFKVNA//R381eDktPlSa4H9Z
 7TCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QJBFrhbCj4MW2FP4lLqpYa6YgQUhBipNhqkx+l0iOfQ=;
 b=pnSw0+9eZS6LsPJTugKWF1WhrirhbedB5jXAtW1SARBB9Ta3PA8qHgyS3VYcW7lMJQ
 2o/hAq5BzqFlNgjdtef7eSEFODIjtxi3noElcg+s01SsVW7l4nAhPCxuzXH8rcEQQUjy
 pZ/8Eq+8zcwmDQV4kbWE/en5FIr9eIFj82BDKVgGmGaNLLSDgLmE68O4ncb3a4ljQF41
 D5QxMUgPI3noj39O+sUVRFjzaV8yTAcUUt5GAWtQoZk8eEG4tydzDdT+IUq1FA+tUAGJ
 Nbt6wdBH2VXzqwLnjlB3kmLVFmKL61K3CQ5C8c64HvMbnQe7gUwUWZ3XXqu+/0jwszhC
 XcRQ==
X-Gm-Message-State: APjAAAVQGJLncU6KUZ9TszWG8qSodASVm677RJFS4NyTVFW3CM+glwIM
 v4Anu35ujBxcYNgKq+ACTh+yWSof
X-Google-Smtp-Source: APXvYqwNQKt62HfzoPLn0vewOSTufVzWbDQ09Pjevzec938dfGoWoc0OxhdO/qd9n2HqQTUuodXShA==
X-Received: by 2002:a17:90b:28f:: with SMTP id
 az15mr15247514pjb.4.1581874511589; 
 Sun, 16 Feb 2020 09:35:11 -0800 (PST)
Received: from localhost.localdomain ([103.51.74.127])
 by smtp.gmail.com with ESMTPSA id a36sm14284724pga.32.2020.02.16.09.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2020 09:35:11 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Subject: [PATCHv1 2/3] arm64: dts: meson: Add missing regulator linked to
 VCCV5 regulator to VDDIO_C/TF_IO
Date: Sun, 16 Feb 2020 17:34:45 +0000
Message-Id: <20200216173446.1823-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200216173446.1823-1-linux.amoon@gmail.com>
References: <20200216173446.1823-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200216_093514_104576_83CEBFFF 
X-CRM114-Status: GOOD (  10.76  )
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
Cc: devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
index 353db3b32cc4..23eddff85fe5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
@@ -66,11 +66,14 @@ tf_io: gpio-regulator-tf_io {
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
2.25.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
