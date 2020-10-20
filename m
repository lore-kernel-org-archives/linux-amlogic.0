Return-Path: <SRS0=scox=D3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F22AC433E7
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 12:09:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB44820BED
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 12:09:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N/yofLSF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="MgBruow4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB44820BED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eVMNr+Xx/dYiDcMnTqeQQOvHC8RiUVgLjkHDL1JPMds=; b=N/yofLSFji8LTksC8aS1T60WOK
	b5BzMheI4NuPJBX1TqZhH0ZvAnRiV/jACCxdCn+k2GFExITOV5m4GeEbOPEvYszUpLY97xYNrL1O8
	srFF7H7aAV+iw3PuUjqbPap2jUVcVEUzVuHaF2vVZjRklgFyfvzJVAkxZ5gbPAw/CGUE09mz7302/
	5aS55BxK9b7tImZciui0Lz0/LBO+oqoy9A2dUOqFOMvpcmMQ2Hy7a3/UlZJKhYkkC/gN1Lmz4EYqy
	vq2u/VAoB8spq1gSTwdv+ZBtsUO3DUoFUp2nGcmHxO+3WsrMTetvuL1Yak0HBaowLlCR9qM2ana/0
	J7iIaiBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUqS0-0000jq-H1; Tue, 20 Oct 2020 12:09:12 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUqKv-0004pw-KA
 for linux-amlogic@lists.infradead.org; Tue, 20 Oct 2020 12:01:56 +0000
Received: by mail-wr1-x443.google.com with SMTP id s9so1797726wro.8
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Oct 2020 05:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2gfqE4Zbkh5Lcg19ZhxoF1Xl/vo9JD6QrpOKZu//If4=;
 b=MgBruow4GBjUkLxhyLeZpDEx3hDjFQMfJNV+Kheh5hUPpbnOEzaXY0lrCio3y+HmyL
 4dC2SJz0yeHTGPHWIWOWwGyHtKnk3P/UM8FaEtYj2qzjmx4FVT+spQGPbOhuCg0E6BLz
 7GvNoVgB5Uzib/jjHaa821cXnXU+wY/UnYIK9+K6DdHbpl92yJ2BRzgAmwXkzZUBUnN0
 YbcmdQpyU3R3UaRTmard/coRidSvMrt3x112Rg2+CP5yAHIZh1g4HExK8cEiok7YB13b
 Hyf2oqS2MyqIgpUuHqiVOIDfH15jnYPU7sOPTmowO1DVKw9jsB3aXWzDxl9+szbKFm6p
 BpSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2gfqE4Zbkh5Lcg19ZhxoF1Xl/vo9JD6QrpOKZu//If4=;
 b=uU4qvwJUx6VsJc4lMbafDqFTX6ByPClqBEoASv6u9f/G0FDOnPwviDcyCrg02UODbQ
 baTAhJBpGZz9a7uWW5kQ8cMbxrtH0Iuj12kyoXw+tTO2St2OyiLpIPepsISBbaTkK4Dy
 KVjm6P4Jmh5ufcSwG8wG/d7Q52mF8e2AiphI0uoVFk7MLUkxrw7sxwAGSp/Ujf+FBRTv
 /RvchllAe5DPp1cn/vWd92eotGY8pJtm5rvkktMAmlhfGLLhuV/4RFTH+Zh1ypsoFe2k
 lWc4w9lfd3/qWkdleC+4bwapKuUCUyRgX12iVdHkmxBH1k144fxFW+/rb9avdIn6taLY
 cyLA==
X-Gm-Message-State: AOAM531gFucoQfhSOb8u6cL214cAI22sk5hWmZ4HSRtV2znfSI2/0Htw
 itVyLVbfJbnV2V3etlMIR3Bz3QykGMv71Q==
X-Google-Smtp-Source: ABdhPJwYsAEY697v1x5cu0ayp0Ec2C/YVhqqChvB7hmBccgNvdxMoWINpe055G0INBwpz53FMea+8w==
X-Received: by 2002:adf:ce8a:: with SMTP id r10mr3315537wrn.188.1603195311447; 
 Tue, 20 Oct 2020 05:01:51 -0700 (PDT)
Received: from starbuck.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id 67sm2402264wmb.31.2020.10.20.05.01.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 05:01:50 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH] arm64: dts: amlogic: add missing ethernet reset ID
Date: Tue, 20 Oct 2020 14:01:41 +0200
Message-Id: <20201020120141.298240-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_080153_945429_6BEDDDA4 
X-CRM114-Status: GOOD (  12.46  )
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
Cc: Anand Moon <linux.amoon@gmail.com>, linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Anand Moon <linux.amoon@gmail.com>

Add reset external reset of the ethernet mac controller

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 2 ++
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 ++
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi         | 3 +++
 3 files changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index fae48efae83e..724ee179b316 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -227,6 +227,8 @@ ethmac: ethernet@ff3f0000 {
 				      "timing-adjustment";
 			rx-fifo-depth = <4096>;
 			tx-fifo-depth = <2048>;
+			resets = <&reset RESET_ETHERNET>;
+			reset-names = "stmmaceth";
 			status = "disabled";
 		};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index c95ebe615176..8514fe6a275a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -224,6 +224,8 @@ ethmac: ethernet@ff3f0000 {
 				      "timing-adjustment";
 			rx-fifo-depth = <4096>;
 			tx-fifo-depth = <2048>;
+			resets = <&reset RESET_ETHERNET>;
+			reset-names = "stmmaceth";
 			status = "disabled";
 
 			mdio0: mdio {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 0edd137151f8..726b91d3a905 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/meson-gxbb-power.h>
+#include <dt-bindings/reset/amlogic,meson-gxbb-reset.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -575,6 +576,8 @@ ethmac: ethernet@c9410000 {
 			interrupt-names = "macirq";
 			rx-fifo-depth = <4096>;
 			tx-fifo-depth = <2048>;
+			resets = <&reset RESET_ETHERNET>;
+			reset-names = "stmmaceth";
 			power-domains = <&pwrc PWRC_GXBB_ETHERNET_MEM_ID>;
 			status = "disabled";
 		};
-- 
2.25.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
