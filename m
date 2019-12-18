Return-Path: <SRS0=A4ao=2I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F37C43603
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 20:25:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 465FD21D7D
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 20:25:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RwV+H/3+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="JMGvz9LP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 465FD21D7D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6HBcWBLjWXbbM9QZSJ7ZQocgU1f0GW6kuRztn659njA=; b=RwV+H/3+QkkcSN
	cMmL7pSEKZYFC2z7Ew2o491ypTqjBz8FM7HtquJEUUDYHRCmfyzSCMSeF4ixrkflrqTxCa9N8wjl/
	l15m8Qai0Ic/tZIQ2Y8gb0BaPX+9buiDN8cK/HlwDgg6ARNZoCSRpXmo7Pi6bro7czCfIjJjsrG2V
	29UfL/3PVchIgLqTxntoGi6jb66WONsrP74Q1TiMf5JybmJUJ9mffkT3ihupvTtDqum3ifp30YLkr
	sBNGTdM9kmIuZH6Q+ejSQkNRwWIpfQIlqNsIFwSLVbVBs3PuVpKzxeEdxwJh8fhecoXo975YpRsPj
	7cb+Ioqj3TvUNpuwyuKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihfsZ-0006Vu-It; Wed, 18 Dec 2019 20:25:07 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihfsV-0005hX-OZ
 for linux-amlogic@lists.infradead.org; Wed, 18 Dec 2019 20:25:06 +0000
Received: by mail-wm1-x344.google.com with SMTP id b19so3194225wmj.4
 for <linux-amlogic@lists.infradead.org>; Wed, 18 Dec 2019 12:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0WvlYOoAD1IOta9diQC+n30t1bIYLy4c6uAUgMu9Krg=;
 b=JMGvz9LPMfSDZ7/RKUL+GMHZ0dcLW4/G4SdYnxB64Fr9ldBxGjXdsecfr4kS2nJp6F
 4HM1prGAY/8hLnhaibrv6LF7bMlZRV79ccZqMo3jnspkVh+o25se3IVe3FNi/YTACHDk
 FLUX+9uWWtItdOeDQlFNzV2oqY1O1UVI9YK49bQSXcIjkdv0SQAkSuEVuV4gt5KmN7Ue
 nBgZGtVAOs7ZkZeY6CcjODWQ7j/RXXjWn4G4Ql1FTqJgYD4lcyjBSDBpqQvh+V0DCLhA
 2+3RcaLe2Zj8J0OPZZjrKho2SWmPKXn3XnRyu2bjN8bqgiGt7LK4l6b4rSt1LzL0zPkV
 V9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0WvlYOoAD1IOta9diQC+n30t1bIYLy4c6uAUgMu9Krg=;
 b=GN3g+Ex7okXXadofqln1cYrlVDTU6431xYWmATvT8GHfF1BhUNZmi6bXdsoe0zizW4
 ry2LMWGK3cJ5+Lbc2awsf3FIOt0YenuPXVpwt4jNKUCexuh0XeAyGWX4IRPTECHG4vyC
 tNXGS//KuYySxa/C3JW2xHchqHH4b0aW17yGah1AJ/osq7TL0Bjew7j6LlC5u5c+JWZC
 CMIRR4NOM+9a26mqIQQ3/jMjp5rrYRpikxibDTWRiBHY7uxyspa9sHWxFEv7ZM/jHBpd
 VeiTO0xKIuz3cQ3jD4FNpMocqVDDYJqyXV4hzFefLgjOK4KUmIcKt6qRvP7TlCZSyAnl
 uhVQ==
X-Gm-Message-State: APjAAAWurPs1fflOOgDy/j4Mu2qxsgf53eXo7TgMMAntITpWG8qTocaI
 yMdK5tVX+S63BvgypmvxzmRx2w==
X-Google-Smtp-Source: APXvYqwTLtLgvq6+aprJN3gxmdjj1L7GXN2A1Ck97kp1XflLUXzVLhIaBeTnGRvthhFSEhIlyY1Iuw==
X-Received: by 2002:a1c:e289:: with SMTP id z131mr5158320wmg.18.1576700702235; 
 Wed, 18 Dec 2019 12:25:02 -0800 (PST)
Received: from localhost.localdomain (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id w22sm3469481wmk.34.2019.12.18.12.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 12:25:01 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH] arm64: dts: meson: add audio fifo depths
Date: Wed, 18 Dec 2019 21:24:52 +0100
Message-Id: <20191218202452.1288378-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_122503_829910_E63DBFB9 
X-CRM114-Status: UNSURE (   7.78  )
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

Add the property describing the depth of the audio fifo on the axg, g12a
and sm1 SoC family

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Hi Kevin,

 The binding documentation for this new property will be merged through Mark's ASoC tree [0]

[0]: https://lkml.kernel.org/r/applied-20191218172420.1199117-3-jbrunet@baylibre.com

 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 6 ++++++
 arch/arm64/boot/dts/amlogic/meson-g12.dtsi | 6 ++++++
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi | 8 ++++++++
 3 files changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 04803c3bccfa..aace3d32a3df 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1169,6 +1169,7 @@
 				interrupts = <GIC_SPI 84 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&clkc_audio AUD_CLKID_TODDR_A>;
 				resets = <&arb AXG_ARB_TODDR_A>;
+				amlogic,fifo-depth = <512>;
 				status = "disabled";
 			};
 
@@ -1180,6 +1181,7 @@
 				interrupts = <GIC_SPI 85 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&clkc_audio AUD_CLKID_TODDR_B>;
 				resets = <&arb AXG_ARB_TODDR_B>;
+				amlogic,fifo-depth = <256>;
 				status = "disabled";
 			};
 
@@ -1191,6 +1193,7 @@
 				interrupts = <GIC_SPI 86 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&clkc_audio AUD_CLKID_TODDR_C>;
 				resets = <&arb AXG_ARB_TODDR_C>;
+				amlogic,fifo-depth = <256>;
 				status = "disabled";
 			};
 
@@ -1202,6 +1205,7 @@
 				interrupts = <GIC_SPI 88 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&clkc_audio AUD_CLKID_FRDDR_A>;
 				resets = <&arb AXG_ARB_FRDDR_A>;
+				amlogic,fifo-depth = <512>;
 				status = "disabled";
 			};
 
@@ -1213,6 +1217,7 @@
 				interrupts = <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&clkc_audio AUD_CLKID_FRDDR_B>;
 				resets = <&arb AXG_ARB_FRDDR_B>;
+				amlogic,fifo-depth = <256>;
 				status = "disabled";
 			};
 
@@ -1224,6 +1229,7 @@
 				interrupts = <GIC_SPI 90 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&clkc_audio AUD_CLKID_FRDDR_C>;
 				resets = <&arb AXG_ARB_FRDDR_C>;
+				amlogic,fifo-depth = <256>;
 				status = "disabled";
 			};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
index b3ba2fda8af8..03054c478896 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
@@ -106,6 +106,7 @@
 			resets = <&arb AXG_ARB_TODDR_A>,
 				 <&clkc_audio AUD_RESET_TODDR_A>;
 			reset-names = "arb", "rst";
+			amlogic,fifo-depth = <512>;
 			status = "disabled";
 		};
 
@@ -120,6 +121,7 @@
 			resets = <&arb AXG_ARB_TODDR_B>,
 				 <&clkc_audio AUD_RESET_TODDR_B>;
 			reset-names = "arb", "rst";
+			amlogic,fifo-depth = <256>;
 			status = "disabled";
 		};
 
@@ -134,6 +136,7 @@
 			resets = <&arb AXG_ARB_TODDR_C>,
 				 <&clkc_audio AUD_RESET_TODDR_C>;
 			reset-names = "arb", "rst";
+			amlogic,fifo-depth = <256>;
 			status = "disabled";
 		};
 
@@ -148,6 +151,7 @@
 			resets = <&arb AXG_ARB_FRDDR_A>,
 				 <&clkc_audio AUD_RESET_FRDDR_A>;
 			reset-names = "arb", "rst";
+			amlogic,fifo-depth = <512>;
 			status = "disabled";
 		};
 
@@ -162,6 +166,7 @@
 			resets = <&arb AXG_ARB_FRDDR_B>,
 				 <&clkc_audio AUD_RESET_FRDDR_B>;
 			reset-names = "arb", "rst";
+			amlogic,fifo-depth = <256>;
 			status = "disabled";
 		};
 
@@ -176,6 +181,7 @@
 			resets = <&arb AXG_ARB_FRDDR_C>,
 				 <&clkc_audio AUD_RESET_FRDDR_C>;
 			reset-names = "arb", "rst";
+			amlogic,fifo-depth = <256>;
 			status = "disabled";
 		};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
index be00b8f2f1e6..d847a3fcbc85 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
@@ -201,6 +201,7 @@
 			resets = <&arb AXG_ARB_TODDR_A>,
 				 <&clkc_audio AUD_RESET_TODDR_A>;
 			reset-names = "arb", "rst";
+			amlogic,fifo-depth = <8192>;
 			status = "disabled";
 		};
 
@@ -215,6 +216,7 @@
 			resets = <&arb AXG_ARB_TODDR_B>,
 				 <&clkc_audio AUD_RESET_TODDR_B>;
 			reset-names = "arb", "rst";
+			amlogic,fifo-depth = <256>;
 			status = "disabled";
 		};
 
@@ -229,6 +231,7 @@
 			resets = <&arb AXG_ARB_TODDR_C>,
 				 <&clkc_audio AUD_RESET_TODDR_C>;
 			reset-names = "arb", "rst";
+			amlogic,fifo-depth = <256>;
 			status = "disabled";
 		};
 
@@ -243,6 +246,7 @@
 			resets = <&arb AXG_ARB_FRDDR_A>,
 				 <&clkc_audio AUD_RESET_FRDDR_A>;
 			reset-names = "arb", "rst";
+			amlogic,fifo-depth = <512>;
 			status = "disabled";
 		};
 
@@ -257,6 +261,7 @@
 			resets = <&arb AXG_ARB_FRDDR_B>,
 				 <&clkc_audio AUD_RESET_FRDDR_B>;
 			reset-names = "arb", "rst";
+			amlogic,fifo-depth = <256>;
 			status = "disabled";
 		};
 
@@ -271,6 +276,7 @@
 			resets = <&arb AXG_ARB_FRDDR_C>,
 				 <&clkc_audio AUD_RESET_FRDDR_C>;
 			reset-names = "arb", "rst";
+			amlogic,fifo-depth = <256>;
 			status = "disabled";
 		};
 
@@ -412,6 +418,7 @@
 			resets = <&arb AXG_ARB_TODDR_D>,
 				 <&clkc_audio AUD_RESET_TODDR_D>;
 			reset-names = "arb", "rst";
+			amlogic,fifo-depth = <256>;
 			status = "disabled";
 		};
 
@@ -426,6 +433,7 @@
 			resets = <&arb AXG_ARB_FRDDR_D>,
 				 <&clkc_audio AUD_RESET_FRDDR_D>;
 			reset-names = "arb", "rst";
+			amlogic,fifo-depth = <256>;
 			status = "disabled";
 		};
 	};
-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
