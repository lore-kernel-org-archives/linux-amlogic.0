Return-Path: <SRS0=Oax9=W5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BE7AC3A59B
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Sep 2019 05:50:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B26C21897
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Sep 2019 05:50:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hlZoNg7w";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MAIvwr6/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B26C21897
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VXHmlvLaqnZT+W973/LzOEMvjnz9GTb5zTCOfropHEE=; b=hlZoNg7wzspcdA
	ZBRo/Gudv6AL0f3u5A2HT4zyJ/44Jq65kcfn23i6r89K29g589G3ilByZZP+P2L677+4ApAbIA89S
	WU3UsHok6UH+ML2qG7yrcLTOUoTfQ2FrA/iIJohRhdgfX2ATlvRLoFF4qGOWF4SbpJlOuRiD4t1Th
	k4+qCYMXGsXrso/e3DX+uMsTaSdNK2uSn3IjhW30e5ri+bA08WWiLlA5AuyoDi1CBdkWnjr6MxaUV
	gTcM5eD1aTbvFGtgjdauQ+sAiuBl8MQt03dTjnjCWfdCkwhXtOkknZlCda1Sme+Eh+7xKju1H5weh
	Dkr8T7ItWyuM5W/Ek3+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i4fEQ-0002nE-Dj; Mon, 02 Sep 2019 05:50:26 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i4fDx-0001Ex-DG; Mon, 02 Sep 2019 05:49:58 +0000
Received: by mail-pl1-x644.google.com with SMTP id w11so6187625plp.5;
 Sun, 01 Sep 2019 22:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ikV6lemlNYdFpEeGQSYqb+rV/obqc+rmipJrPne+LAs=;
 b=MAIvwr6/8HrrYhQuIYpsBU0n0QRmouCFyUCeHgTs67GyIPGWan6FxktGY+LZYjzIvu
 PrwVa318B6qjN5QnsMN0pRREoNTd895ozDy4yXB0TRykCShhlG7ml/M97o3vFnkMHyfC
 qZigYBE9JwJvzsHoDP6hgvcxSlNKIRfUWz5Isd33sWtUVCNdePIxgSMqXjodFkzk5kdo
 94fDNtxSV88R7FTXr4MPwvAPyj2mxMylpSj34ORawW3vXxOMocG5FkKe2DQQSWvvJURU
 r2B5H7aRmLlE6TmP5yL7arlb9uTThbWFrJNIS7YDwbogQXUKL3Rj6Xj10xRta2FyZ2U0
 Ml2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ikV6lemlNYdFpEeGQSYqb+rV/obqc+rmipJrPne+LAs=;
 b=fh6FFaKCujpCrR7yE2hYDGdP9mVUbkZdqMfij+BxktpRZAu7pwafuOlJQjnA4sf167
 /qekuUBvkSN2YPlL9izHq3YK5c8r3gSqYPEMWfOs+mTEUbpOBdH48Zr7V2pdq2DXbt9o
 2TFtMU3799v1cu7i3sK32YpmlH136sj7wFkg9uulyzicygyX+45hAlWyNcAwu+EuVAZb
 NCnlZhjofJAKmS1FXYb9eaqsZCj6u/6dkcio2KULp4nXb3yh3f5O6vabrwvnPn0Pkiiw
 dU0eMzFua/CHiy0m29IQ2n6EhGCau6AOQHdXBXmd8ymFPX0eutN+XFOIegPJl34SXho2
 zgvg==
X-Gm-Message-State: APjAAAVBt//KZGxGJo+RDxg495woTGIiJD3iHgE0V3XvghianKdy3GHr
 cK4mHoYIEXZM5bBmwnu/Tkg=
X-Google-Smtp-Source: APXvYqwmjDYBb+/h+lox38LRXgnKxFGbWgnCBcvK3a32iq8PnRmY1WQ3TIqaar+s+iJEVbDqoBGVeQ==
X-Received: by 2002:a17:902:7246:: with SMTP id
 c6mr339002pll.190.1567403396634; 
 Sun, 01 Sep 2019 22:49:56 -0700 (PDT)
Received: from localhost.localdomain ([45.114.62.203])
 by smtp.gmail.com with ESMTPSA id 136sm16533912pfz.123.2019.09.01.22.49.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Sep 2019 22:49:56 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCHv4-next 1/3] arm64: dts: meson: odroid-c2: p5v0 is the main 5V
 power input
Date: Mon,  2 Sep 2019 05:49:33 +0000
Message-Id: <20190902054935.4899-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190902054935.4899-1-linux.amoon@gmail.com>
References: <20190902054935.4899-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190901_224957_643544_29483312 
X-CRM114-Status: GOOD (  10.08  )
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

As per the schematic Monolithic Power Systems MP2161GJ-C499
supply a fixed output voltage of 5.0V. This supplies linked
to VDD_EE, HDMI_P5V0, USB_POWER, VCCK, VDDIO_AO1V8, VDDIO_AO3V3,
VDD3V3, DDR3_1V5 according to the schematics.

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>

---
Rebased on linux-next.
Added Acked by Martin.
Fixed the commit message to add misssing VDDIO_AO3V3 and VDD3V3.
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 6039adda12ee..0cb5831d9daf 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -50,6 +50,15 @@
 		};
 	};
 
+	p5v0: regulator-p5v0 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "P5V0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
 	tflash_vdd: regulator-tflash_vdd {
 		/*
 		 * signal name from schematics: TFLASH_VDD_EN
-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
