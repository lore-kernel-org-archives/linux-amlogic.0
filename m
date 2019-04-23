Return-Path: <SRS0=V5Bc=SZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F99FC10F14
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 13:37:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1890214AE
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 13:37:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q0qALtzq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="gJzTtPJg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1890214AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QSzXS16YDxWe7a71dvZu7TOA1dPDGjl7YJHI4hIhMlk=; b=Q0qALtzqionMDI
	VIN4vVdDtpJn5N/W94IvKtSqnmYW0G+CF0D+zooAgEKRNgfGZidrK1PqKi64eVCoyZHZlaZLCRmV3
	tTI0E74uM3Kx6WJx3AXslsRCLHX4QQ9yVi06M+ea/AvnTUzb/lCdH/8Yj/mvS9K91fkgRXt839egJ
	K2S2DFCEn651wM9h3kkoIXa7Iz/jjAJgNw3axr71Rx0yxub4U2GSLiT12bZ3c2rxwNwyYMnymkDMC
	4ZQXTg5gLbNH6vNbSf2vfzv3D4jCxQSHTwMOBDyxmoXbYxTv+9+9hqCLXg6fJZJAEmsIYFtpsURjR
	jhvmoVvjlSJvI4YUy6Wg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIvc1-0005Fa-D5; Tue, 23 Apr 2019 13:37:29 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIvbV-0004W1-8C
 for linux-amlogic@lists.infradead.org; Tue, 23 Apr 2019 13:37:00 +0000
Received: by mail-wm1-x343.google.com with SMTP id h18so112452wml.1
 for <linux-amlogic@lists.infradead.org>; Tue, 23 Apr 2019 06:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gRRPPW+odTXhFAsU3nebrJ3pOmtPg3fz+kt7pkJ+hYg=;
 b=gJzTtPJglsNGltcuceOwdXvOWFbCDbmX747W7KKaMS3ah7BRPXloumV42Gcz31twrI
 vLF3guTu/Gj9LL9+JRBnnPynnexpUE3RM2MtyZ/at+BWmm/Oo1eWoYXHGw8LrpDcp8vp
 zafctJYCwhDa37OgvOcEKGEl7pww7qYgX+P666OtM8SUn2AM8XdTyT++njYpMGakVh5N
 2bxEiYcjA+WGB0cwnkT/t9ATkkFqfSY3fswWO6XI5Wl5/jIzyUR7MCHbcRcyzMbUm6n4
 7zxDLrrAbSXwsdMRBi0/VHKwW90VrV0D22+bk4EevE2u7VsupA/qlfmNcX3nYQvngd8b
 4cQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gRRPPW+odTXhFAsU3nebrJ3pOmtPg3fz+kt7pkJ+hYg=;
 b=N78+acMJDKoQRFVUJbE7YClAJc3eKO+ssLTbvN6ZfIR5HMVb6SZZBbY2nNsXQfXi4p
 HynUZlTKM1kxQcnGISqtWy6o/h7eHLxlYaYQnaFr7dyv79v8uQ6AjekdN2EhckSMvPPR
 pFuWDeCkiVj+fhEyF4bTsmeRT+MG/02GbbNAysqJQu3YWt4LH56qBzNK2ymd/9haTVSf
 whDwgAvdSK7MEjHIvZWJL5GSzU2goxW7ghyxqfQXTzvdbV+1yxgz22GvrbkbqZ5liZN1
 zH5ssUyvXurSvB4cmSW0nlm3jIBAWxcgaDQT7wR+3Lp6OD7leQEAvVHSm0FqXMb0/7pX
 BEWA==
X-Gm-Message-State: APjAAAWumMNas8iI0e+QETMu3shliIN+PcRTKQrtVOC8eCNWygPDSiJb
 lvt1tou8jJWEK8IMPMuJkCFMsg==
X-Google-Smtp-Source: APXvYqwUIV2m/OArUl29VTuMNyASRUnqvFVA1Fu4IdEoT3PxqLHfOe86tDQJBu9mpqHGoGeury9v9Q==
X-Received: by 2002:a1c:20c1:: with SMTP id g184mr2464872wmg.137.1556026615465; 
 Tue, 23 Apr 2019 06:36:55 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id z20sm13509543wmf.34.2019.04.23.06.36.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 23 Apr 2019 06:36:54 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: thierry.reding@gmail.com
Subject: [PATCH v2 3/3] arm64: dts: meson-g12a: Add PWM nodes
Date: Tue, 23 Apr 2019 15:36:46 +0200
Message-Id: <20190423133646.5705-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190423133646.5705-1-narmstrong@baylibre.com>
References: <20190423133646.5705-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190423_063657_523114_2D4AB67B 
X-CRM114-Status: UNSURE (   9.24  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-pwm@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 baylibre-upstreaming@groups.io, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds the EE and AO PWM nodes and the possible pinctrl settings.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl<martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 179 ++++++++++++++++++++
 1 file changed, 179 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 9f72396ba710..efadd78aa747 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -202,6 +202,94 @@
 						};
 					};
 
+					pwm_a_pins: pwm-a {
+						mux {
+							groups = "pwm_a";
+							function = "pwm_a";
+							bias-disable;
+						};
+					};
+
+					pwm_b_x7_pins: pwm-b-x7 {
+						mux {
+							groups = "pwm_b_x7";
+							function = "pwm_b";
+							bias-disable;
+						};
+					};
+
+					pwm_b_x19_pins: pwm-b-x19 {
+						mux {
+							groups = "pwm_b_x19";
+							function = "pwm_b";
+							bias-disable;
+						};
+					};
+
+					pwm_c_c_pins: pwm-c-c {
+						mux {
+							groups = "pwm_c_c";
+							function = "pwm_c";
+							bias-disable;
+						};
+					};
+
+					pwm_c_x5_pins: pwm-c-x5 {
+						mux {
+							groups = "pwm_c_x5";
+							function = "pwm_c";
+							bias-disable;
+						};
+					};
+
+					pwm_c_x8_pins: pwm-c-x8 {
+						mux {
+							groups = "pwm_c_x8";
+							function = "pwm_c";
+							bias-disable;
+						};
+					};
+
+					pwm_d_x3_pins: pwm-d-x3 {
+						mux {
+							groups = "pwm_d_x3";
+							function = "pwm_d";
+							bias-disable;
+						};
+					};
+
+					pwm_d_x6_pins: pwm-d-x6 {
+						mux {
+							groups = "pwm_d_x6";
+							function = "pwm_d";
+							bias-disable;
+						};
+					};
+
+					pwm_e_pins: pwm-e {
+						mux {
+							groups = "pwm_e";
+							function = "pwm_e";
+							bias-disable;
+						};
+					};
+
+					pwm_f_x_pins: pwm-f-x {
+						mux {
+							groups = "pwm_f_x";
+							function = "pwm_f";
+							bias-disable;
+						};
+					};
+
+					pwm_f_h_pins: pwm-f-h {
+						mux {
+							groups = "pwm_f_h";
+							function = "pwm_f";
+							bias-disable;
+						};
+					};
+
 					uart_a_pins: uart-a {
 						mux {
 							groups = "uart_a_tx",
@@ -418,6 +506,62 @@
 							bias-disable;
 						};
 					};
+
+					pwm_ao_a_pins: pwm-ao-a {
+						mux {
+							groups = "pwm_ao_a";
+							function = "pwm_ao_a";
+							bias-disable;
+						};
+					};
+
+					pwm_ao_b_pins: pwm-ao-b {
+						mux {
+							groups = "pwm_ao_b";
+							function = "pwm_ao_b";
+							bias-disable;
+						};
+					};
+
+					pwm_ao_c_4_pins: pwm-ao-c-4 {
+						mux {
+							groups = "pwm_ao_c_4";
+							function = "pwm_ao_c";
+							bias-disable;
+						};
+					};
+
+					pwm_ao_c_6_pins: pwm-ao-c-6 {
+						mux {
+							groups = "pwm_ao_c_6";
+							function = "pwm_ao_c";
+							bias-disable;
+						};
+					};
+
+					pwm_ao_d_5_pins: pwm-ao-d-5 {
+						mux {
+							groups = "pwm_ao_d_5";
+							function = "pwm_ao_d";
+							bias-disable;
+						};
+					};
+
+					pwm_ao_d_10_pins: pwm-ao-d-10 {
+						mux {
+							groups = "pwm_ao_d_10";
+							function = "pwm_ao_d";
+							bias-disable;
+						};
+					};
+
+					pwm_ao_d_e_pins: pwm-ao-d-e {
+						mux {
+							groups = "pwm_ao_d_e";
+							function = "pwm_ao_d";
+							bias-disable;
+						};
+					};
 				};
 			};
 
@@ -445,6 +589,13 @@
 				status = "disabled";
 			};
 
+			pwm_AO_cd: pwm@2000 {
+				compatible = "amlogic,meson-g12a-ao-pwm-cd";
+				reg = <0x0 0x2000 0x0 0x20>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
 			uart_AO: serial@3000 {
 				compatible = "amlogic,meson-gx-uart",
 					     "amlogic,meson-ao-uart";
@@ -465,6 +616,13 @@
 				status = "disabled";
 			};
 
+			pwm_AO_ab: pwm@7000 {
+				compatible = "amlogic,meson-g12a-ao-pwm-ab";
+				reg = <0x0 0x7000 0x0 0x20>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
 			saradc: adc@9000 {
 				compatible = "amlogic,meson-g12a-saradc",
 					     "amlogic,meson-saradc";
@@ -533,6 +691,27 @@
 				#reset-cells = <1>;
 			};
 
+			pwm_ef: pwm@19000 {
+				compatible = "amlogic,meson-g12a-ee-pwm";
+				reg = <0x0 0x19000 0x0 0x20>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			pwm_cd: pwm@1a000 {
+				compatible = "amlogic,meson-g12a-ee-pwm";
+				reg = <0x0 0x1a000 0x0 0x20>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			pwm_ab: pwm@1b000 {
+				compatible = "amlogic,meson-g12a-ee-pwm";
+				reg = <0x0 0x1b000 0x0 0x20>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
 			clk_msr: clock-measure@18000 {
 				compatible = "amlogic,meson-g12a-clk-measure";
 				reg = <0x0 0x18000 0x0 0x10>;
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
