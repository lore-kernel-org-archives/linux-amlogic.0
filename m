Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF95C4332F
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Nov 2022 11:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QWLWzyR2wkofkvEVQzWwF8Upkl63IGg53tgwTOzSNLk=; b=s7TEa8MBJdgHRr
	Z6ExmHp28BcgUyriy4d9ngpU4INkngZBVnX4Ry4jkF2kkHWke41MVtEnEC4vKnT5LkkroycK0PJsf
	LJnxdWZ1Lq8K74MMEB7EBVyMQSFrXSkqPy9oiLTBpzbXMGmQ7lgxm8k0hJbnI7IydTN/c9EjaokeZ
	M65pOD40aah7g3fLtnI0OCrYypNIUlZ8g9Ll7jnDhY1S6Gh0tryJ/NqfakxbGlqYBqqe+qnwkndgt
	YF2FouHU7X2gmHNpOKl1w0BWEdylNGSeFVfI8IuJT8rJtM8Uki2tx+x4gs6p/NtlqLrosyl2wq701
	E2zPzc/tRlw4hOQYo9xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyWmN-00G2f5-OR; Fri, 25 Nov 2022 11:21:59 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyWkG-00G1ah-Gl; Fri, 25 Nov 2022 11:19:50 +0000
Received: by mail-wr1-x434.google.com with SMTP id q7so5396360wrr.8;
        Fri, 25 Nov 2022 03:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7PfQ2W7+jfq13mv60YI0ZFUsMp5wOyJ2UsW2Qs+puQY=;
        b=SbOHS903mNOpnILtR4C6Hka3wbt9VO8ZuT7xkiYlMrLPpfzFTRq/BYRgVS/iJ8W9cy
         DvWv19s6RhNIRBpVLu8cwh1cDiYGNe6tGXBnRrlNI978OeboQKWWz2bF0fgIZt1W5Stf
         mE02QjarGeHFH8aLwY/H9J4EzBPZDBgFlSfewGntNzf7EHZodWIE8G+gv6jT6CRvICW5
         qzZUtGHrDaMGlqXsNb0o4uS51N5omZkkcQA+ERrSSFeNPd2W1cOSNoXaYJvbwHAbeiv2
         yBZ0wZIF86RreFLmbDlM8pU8lL8haqJo1C40g3y4eNxwvHzRn5NTyHXDJSGPG+OP82x0
         BQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7PfQ2W7+jfq13mv60YI0ZFUsMp5wOyJ2UsW2Qs+puQY=;
        b=atY5d/EgKzTP4M/5m71gVMuD8Je3qmcdaivB17/k8JuPBPDApwu2SRJSbUfp3WhOmc
         IKUkLVOXzjaGPa95vOt9x/jnATNzgNDBkML3cPsDRy5mUZa3a1CnAp8RnF/MvxN95ZpL
         IUEewtP9F7xM4b/mpsw8UoNozzdsZ4Pbi/vi8/x+o5hhnj7uFjUM5B1oPkzBI7KWhqQG
         Ep/gsRhiw2IO+91eMuI4aKvey1JhPl3CTvCuMBPffBicIczuC+G360R/enkx6XRqsuAz
         pAULWzDHYW/QRhtG89Hn0V+/tqsAo+RI9PPCPz+THMGeXCvpXsUlZj9FKSmA85BN4kSb
         /MEg==
X-Gm-Message-State: ANoB5pnewtaBFEpdBrKRmsjrk4p9vyaVTjzRRf2+NTLpIi6sHYdHufkv
	cVQ7n4sQQqSNZti8PyLmiSE=
X-Google-Smtp-Source: AA0mqf5PgDcWrGG/qlTS1d5khO1RXvIht00dzCgwzfFVqj3/zuybOqlxIFU+3NcsYBK3ngzF7dm6Ng==
X-Received: by 2002:adf:e8c9:0:b0:22e:33dc:3bf1 with SMTP id k9-20020adfe8c9000000b0022e33dc3bf1mr23477456wrn.316.1669375185693;
        Fri, 25 Nov 2022 03:19:45 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
        by smtp.gmail.com with ESMTPSA id v11-20020a5d4b0b000000b002368f6b56desm4207406wrq.18.2022.11.25.03.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 03:19:45 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: 
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 5/6] arm64: dts: Add DT node for the VIPNano-QI on the A311D
Date: Fri, 25 Nov 2022 12:19:18 +0100
Message-Id: <20221125111921.37261-6-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221125111921.37261-1-tomeu.vizoso@collabora.com>
References: <20221125111921.37261-1-tomeu.vizoso@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_031948_582238_ED4CA683 
X-CRM114-Status: GOOD (  10.62  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This "NPU" is very similar to the Vivante GPUs and Etnaviv works well
with it with just a few small changes.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi      | 10 ++++++++++
 .../boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts  |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index fa96fddf4633..13c79676a356 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/reset/amlogic,meson-g12a-reset.h>
 #include <dt-bindings/thermal/thermal.h>
+#include <dt-bindings/power/meson-g12a-power.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -2485,4 +2486,13 @@ xtal: xtal-clk {
 		#clock-cells = <0>;
 	};
 
+	npu: npu@ff100000 {
+		compatible = "vivante,gc";
+		reg = <0x0 0xff100000 0x0 0x20000>;
+		interrupts = <0 147 4>;
+		clocks = <&clkc CLKID_NNA_CORE_CLK>,
+			<&clkc CLKID_NNA_AXI_CLK>;
+		clock-names = "core", "bus";
+		power-domains = <&pwrc PWRC_G12A_NNA_ID>;
+	};
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts
index 124a80901084..73f3d87dcefd 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts
@@ -15,6 +15,10 @@ / {
 	compatible = "khadas,vim3", "amlogic,a311d", "amlogic,g12b";
 };
 
+&npu {
+	status = "okay";
+};
+
 /*
  * The VIM3 on-board  MCU can mux the PCIe/USB3.0 shared differential
  * lines using a FUSB340TMX USB 3.1 SuperSpeed Data Switch between
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
