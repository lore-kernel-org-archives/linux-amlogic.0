Return-Path: <SRS0=BR63=AB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D15CC433E0
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Jun 2020 16:12:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AF3F23E52
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Jun 2020 16:12:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KcomqGP1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="B6X/0atv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AF3F23E52
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ubWzGJCE5nwwVocMzH3fsSRPmFwkLMxAY5PSgWWdGa4=; b=KcomqGP1ZTzbiT
	S5w1psbsPIWv0F1OEEeSfKmPg7/EduBXjQ+O7uwZMZEyv8iOzrLdQ1Z71wiNC+yAP60vsQmFsPQPO
	5j0ai1ZRF+RM4U+O1+B++QYaneTQfk9LFUkk7CjfOSf49go5OmGKoSEN/T6iSdf4mtdJSq3gUbt6W
	lIuLJ4ZTmdiFAJaPBqiXQ28UgTBCwg92P/XySPKAEdzbll2KLCnyrxPpP8uh0PYaCVvD4CFZkah+b
	jg1HZme9DDvTJoH6LO0R62bp5UG6XjliPPTftlc0H8qzMkPB/fluU/UgHeU6Vtnl8rNOH79aZlJ1q
	7hj8hJBoTIicTZlfBujg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jmg6k-0000bN-9V; Sat, 20 Jun 2020 16:12:42 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmg6h-0000au-RO; Sat, 20 Jun 2020 16:12:41 +0000
Received: by mail-ed1-x541.google.com with SMTP id d15so10141117edm.10;
 Sat, 20 Jun 2020 09:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZCPVTZi3Nez6HPxmWh69ZvSZD8QNf4zRgd1dOnXR2q4=;
 b=B6X/0atvwu5PDQMgnwBR+YORpKDe80h1eseaDVzLQOM5L7klltwWI8b3WRKZq0fORw
 R3XeciWi1LsZ6DiNRmZPqebM9FEUSBAcUD6ezRH0gH5PHEq0h3mXguqGFOnjNCNzqp+k
 BwkOY/SOBocOyYLSB3z4Jz0ZnpPp0ymkBA77NW4D3pwxL/e/4UeKeNLcsbs7J3Czaxsi
 fpeYAxqXNH46uaHhMjf945pK9oxUXyFMgt6pDyR0W03dQwwhTr2mIo5jD8XEa9AZuKOw
 qpjQ2yfvKuaKLRxvy+k6GjLGbqe1HW+mF0KDSoCD4E0rfQK8VeqoCnKl4MQtd7H6jOCe
 NOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZCPVTZi3Nez6HPxmWh69ZvSZD8QNf4zRgd1dOnXR2q4=;
 b=gR2fOqEOIMuLLcc8/hpIaBgBjTIgNKmeVEhutH0ZQ08BHX/Iabc1oCSE7b5HKo3RII
 j03J64+KWyJdtpPr/BPWVoKWwAJRRIengf+RKQAaPmp3V92pzFX4a5bAbaY+ohDr6Nka
 SgQVdXbEBppcTLIMh7CrIGv8/MxGHE4HuwcEPetGxhAv/8Y/abXGPbyWsP5/jxwN6CoR
 9fyErWl2m+Fck515sC6qEQiGD72EltpV5Q5nRM99MWKzPgphTzrtSEzJTv0j7tvOJp2e
 XmOX3si40Knj6pi8yEUB1NN5y/B5YF04aiCBOPTXmIMa3iHxEltb/GD0SFyEZw5H5W78
 NkpA==
X-Gm-Message-State: AOAM530UxvxtpKhmuRfzBRb98UisG3Q+Sn/Q6QDfhf9THiKuixk8ymH3
 tLMAY+uahmTr/AZ/YZXBxNEwOA64
X-Google-Smtp-Source: ABdhPJyZq7M9k7FRfwFPq1K7C3ijD1E9uIne9dkd1rv1jDJiRYZCeSUaW7C4KJ5nPciOUoUTbKYnPQ==
X-Received: by 2002:aa7:cb4a:: with SMTP id w10mr8446600edt.46.1592669558069; 
 Sat, 20 Jun 2020 09:12:38 -0700 (PDT)
Received: from localhost.localdomain
 (p200300f1371df700428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:371d:f700:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id i9sm7648405ejv.44.2020.06.20.09.12.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jun 2020 09:12:37 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH] arm64: dts: meson-gx: Switch to the meson-ee-pwrc bindings
Date: Sat, 20 Jun 2020 18:12:11 +0200
Message-Id: <20200620161211.23685-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200620_091239_885507_6B95E84C 
X-CRM114-Status: GOOD (  10.25  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 narmstrong@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The "amlogic,meson-gx-pwrc-vpu" binding only supports the VPU power
domain, while actually there are more power domains behind that set of
registers. Switch to the new bindings so we can add more power domains
as needed.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi   | 18 ++++++++++--------
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi |  7 +++++--
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  |  7 +++++--
 3 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index ba63c36b22e0..0edd137151f8 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/power/meson-gxbb-power.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -60,7 +61,7 @@ simplefb_cvbs: framebuffer-cvbs {
 			compatible = "amlogic,simple-framebuffer",
 				     "simple-framebuffer";
 			amlogic,pipeline = "vpu-cvbs";
-			power-domains = <&pwrc_vpu>;
+			power-domains = <&pwrc PWRC_GXBB_VPU_ID>;
 			status = "disabled";
 		};
 
@@ -68,7 +69,7 @@ simplefb_hdmi: framebuffer-hdmi {
 			compatible = "amlogic,simple-framebuffer",
 				     "simple-framebuffer";
 			amlogic,pipeline = "vpu-hdmi";
-			power-domains = <&pwrc_vpu>;
+			power-domains = <&pwrc PWRC_GXBB_VPU_ID>;
 			status = "disabled";
 		};
 	};
@@ -438,12 +439,6 @@ sysctrl_AO: sys-ctrl@0 {
 				compatible = "amlogic,meson-gx-ao-sysctrl", "simple-mfd", "syscon";
 				reg =  <0x0 0x0 0x0 0x100>;
 
-				pwrc_vpu: power-controller-vpu {
-					compatible = "amlogic,meson-gx-pwrc-vpu";
-					#power-domain-cells = <0>;
-					amlogic,hhi-sysctrl = <&sysctrl>;
-				};
-
 				clkc_AO: clock-controller {
 					compatible = "amlogic,meson-gx-aoclkc";
 					#clock-cells = <1>;
@@ -552,6 +547,12 @@ hiubus: bus@c883c000 {
 			sysctrl: system-controller@0 {
 				compatible = "amlogic,meson-gx-hhi-sysctrl", "simple-mfd", "syscon";
 				reg = <0 0 0 0x400>;
+
+				pwrc: power-controller {
+					compatible = "amlogic,meson-gxbb-pwrc";
+					#power-domain-cells = <1>;
+					amlogic,ao-sysctrl = <&sysctrl_AO>;
+				};
 			};
 
 			mailbox: mailbox@404 {
@@ -574,6 +575,7 @@ ethmac: ethernet@c9410000 {
 			interrupt-names = "macirq";
 			rx-fifo-depth = <4096>;
 			tx-fifo-depth = <2048>;
+			power-domains = <&pwrc PWRC_GXBB_ETHERNET_MEM_ID>;
 			status = "disabled";
 		};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index 03c25b9facff..ea50dd434887 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -748,7 +748,7 @@ mux {
 	};
 };
 
-&pwrc_vpu {
+&pwrc {
 	resets = <&reset RESET_VIU>,
 		 <&reset RESET_VENC>,
 		 <&reset RESET_VCBUS>,
@@ -761,6 +761,9 @@ &pwrc_vpu {
 		 <&reset RESET_VDI6>,
 		 <&reset RESET_VENCL>,
 		 <&reset RESET_VID_LOCK>;
+	reset-names = "viu", "venc", "vcbus", "bt656",
+		      "dvin", "rdma", "venci", "vencp",
+		      "vdac", "vdi6", "vencl", "vid_lock";
 	clocks = <&clkc CLKID_VPU>,
 	         <&clkc CLKID_VAPB>;
 	clock-names = "vpu", "vapb";
@@ -867,7 +870,7 @@ &uart_C {
 
 &vpu {
 	compatible = "amlogic,meson-gxbb-vpu", "amlogic,meson-gx-vpu";
-	power-domains = <&pwrc_vpu>;
+	power-domains = <&pwrc PWRC_GXBB_VPU_ID>;
 };
 
 &vdec {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index 60484bbc7272..beb5fc79d186 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -783,7 +783,7 @@ external_mdio: mdio@2009087f {
 	};
 };
 
-&pwrc_vpu {
+&pwrc {
 	resets = <&reset RESET_VIU>,
 		 <&reset RESET_VENC>,
 		 <&reset RESET_VCBUS>,
@@ -796,6 +796,9 @@ &pwrc_vpu {
 		 <&reset RESET_VDI6>,
 		 <&reset RESET_VENCL>,
 		 <&reset RESET_VID_LOCK>;
+	reset-names = "viu", "venc", "vcbus", "bt656",
+		      "dvin", "rdma", "venci", "vencp",
+		      "vdac", "vdi6", "vencl", "vid_lock";
 	clocks = <&clkc CLKID_VPU>,
 	         <&clkc CLKID_VAPB>;
 	clock-names = "vpu", "vapb";
@@ -902,7 +905,7 @@ &uart_C {
 
 &vpu {
 	compatible = "amlogic,meson-gxl-vpu", "amlogic,meson-gx-vpu";
-	power-domains = <&pwrc_vpu>;
+	power-domains = <&pwrc PWRC_GXBB_VPU_ID>;
 };
 
 &vdec {
-- 
2.27.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
