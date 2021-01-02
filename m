Return-Path: <SRS0=HjQf=GF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86CE2C433DB
	for <linux-amlogic@archiver.kernel.org>; Sat,  2 Jan 2021 20:59:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B7692075F
	for <linux-amlogic@archiver.kernel.org>; Sat,  2 Jan 2021 20:59:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B7692075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MNk6pR8/hqhaopOJW5jV5+ef6oBQRJWNwrOZoeqwSJg=; b=B8YKFCT4V61MvU1G0M6FN0UOm
	jCSP1hpkwQ2OZmnn6J7hok22PuSTWso6fjGBAtiu36I8clJaabEZUt7Vx5Hy3/1MIbar8CJz98WVu
	6kgo9qx2HSm8D6otxpJqX4XrYJvcbOEbU3Y0dBp8cUZq0vo0RGngKG77rNbgXJFJ7L/ZvlfyqeFd8
	kCV76QdzJZlMK0fsuL4B7Uv4uDpiOc3DgZTcuQOASGf3Skm0zPgKTO9TTRjdBGw8SA7WIb06qAmvz
	ByXHxQuIrBLsfMTwFGqzjs2tt8jb7/mStk4mrMTXp/sA7DT2NzX3zLcRKGOJeKQDymc94C0lKNI6E
	osx7aYLzw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kvnzs-000312-0R; Sat, 02 Jan 2021 20:59:36 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kvnzd-0002vq-4l; Sat, 02 Jan 2021 20:59:23 +0000
Received: by mail-ej1-x630.google.com with SMTP id jx16so31408484ejb.10;
 Sat, 02 Jan 2021 12:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ERICeQSZcNW4MB6A7lizIDnbtJ/5pY6iLgvFd0MYB0M=;
 b=LX0x+d/wlnC1sZkRyYDjLBXqvw+HuipbZaDas+tMA4keheA+uAaQE+3Kl/waQBgQ/N
 NqmZd+VRa4fSSQeigZ4/xaqBdNLfxiCOvqLbHtkOleBVsvfmO3Ef1bDnt2fzVP3vGzqc
 DJ5KrVZKX64j7gFgKarV0K2+m2F+P0wAQzJbvRVkFVOb8YJKxEpop59hBP6s+D6HcaVb
 hJMHSEb9wTAxjT99DwV+9HVQ9ZaxxqPqfryPdsqL94c7x1apQFpg+kq6E1t9v0jZ2p3E
 BxyS1HxwblLEu4oGe6+/lNGLJZxIQZBLwTumuhTpyeyI6omjo+Zx6XNR+Mg/yYKaQZlV
 cUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ERICeQSZcNW4MB6A7lizIDnbtJ/5pY6iLgvFd0MYB0M=;
 b=YZ9VpkPViQnQC3wIETs25S0UAw52f4+Ohgcm8frGCcjonhnBIks7FGfzJk5mIFChiL
 10wtMPjDlFeJzGy3VgHt7jXfAlTn8AzdfOv/nY+lLbflG2lTfz8k3EzwDE63EIjcYxKs
 X88fzuTvEXUgoNclGbb7Ip6pstZeyX3wiqgal+AzoT0ckIpmYCnVxalQIds+azfM7DlR
 UbaJC0naqnjevBuMjffy380DRF3+gKKYRx64Ikzdm3jdFXjAQ8D34fDrJG9m63gc0Ehf
 YcWvgxPOiP2ZYAf7a17iFX3L3LFGpOUIqJxBaJPfcjCGi9lErjxyXgn8cLcU7Vr0nyiO
 rsaA==
X-Gm-Message-State: AOAM530fe+ugCGbs90CGEHMGl/XZFLo4Bfy4YUF32d3WYZNQv7fwXaMR
 k9VrsVdSgUjfT2DGYJQNoqw=
X-Google-Smtp-Source: ABdhPJx7xaUlcxjSoqcvq9+XCcHQA5d78D+yTzqO/Pl9D22nN2gd8ZHAQ3He1/KK3+GczWCzZh8VbQ==
X-Received: by 2002:a17:906:d87:: with SMTP id
 m7mr60523857eji.108.1609621159822; 
 Sat, 02 Jan 2021 12:59:19 -0800 (PST)
Received: from localhost.localdomain
 (p200300f13724fd00428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3724:fd00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id v18sm41420617edx.30.2021.01.02.12.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jan 2021 12:59:19 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-remoteproc@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v2 5/5] ARM: dts: meson: add the AO ARC remote processor
Date: Sat,  2 Jan 2021 21:59:04 +0100
Message-Id: <20210102205904.2691120-6-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210102205904.2691120-1-martin.blumenstingl@googlemail.com>
References: <20210102205904.2691120-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210102_155921_288005_997895E1 
X-CRM114-Status: GOOD (  13.96  )
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
Cc: ohad@wizery.com, devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The 32-bit Amlogic Meson SoCs embed an ARC processor in the Always-On
power domain which is typically used for managing system suspend. The
memory for this ARC core is taken from the AHB SRAM area. Depending on
the actual SoC a different ARC core is used:
- Meson6 and earlier: some ARCv1 ISA based core (probably an ARC625)
- Meson8 and later: an ARC EM4 (ARCv2 ISA) based core

Add the device-tree node for this remote-processor along with the
required SRAM sections, clocks and reset-lines. Also use the
SoC-specific compatible string to manage any differences (should
they exist).

On Meson8, Meson8b and Meson8m2 the "secbus2" IO region is needed as
some bits need to be programmed there. Add this IO region for those
SoCs as well.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson.dtsi   |  7 +++++++
 arch/arm/boot/dts/meson8.dtsi  | 21 +++++++++++++++++++++
 arch/arm/boot/dts/meson8b.dtsi | 21 +++++++++++++++++++++
 3 files changed, 49 insertions(+)

diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
index e0ca5f08d07d..8bae6ed0abb2 100644
--- a/arch/arm/boot/dts/meson.dtsi
+++ b/arch/arm/boot/dts/meson.dtsi
@@ -200,6 +200,13 @@ aobus: aobus@c8100000 {
 			#size-cells = <1>;
 			ranges = <0x0 0xc8100000 0x100000>;
 
+			ao_arc_rproc: remoteproc@1c {
+				compatible= "amlogic,meson-mx-ao-arc";
+				reg = <0x1c 0x8>, <0x38 0x8>;
+				reg-names = "remap", "cpu";
+				status = "disabled";
+			};
+
 			ir_receiver: ir-receiver@480 {
 				compatible= "amlogic,meson6-ir";
 				reg = <0x480 0x20>;
diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 420324ea2ad7..157a950a55d3 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -369,6 +369,14 @@ mux {
 	};
 };
 
+&ao_arc_rproc {
+	compatible= "amlogic,meson8-ao-arc", "amlogic,meson-mx-ao-arc";
+	amlogic,secbus2 = <&secbus2>;
+	sram = <&ao_arc_sram>;
+	resets = <&reset RESET_MEDIA_CPU>;
+	clocks = <&clkc CLKID_AO_MEDIA_CPU>;
+};
+
 &cbus {
 	reset: reset-controller@4404 {
 		compatible = "amlogic,meson8b-reset";
@@ -496,6 +504,12 @@ mux {
 };
 
 &ahb_sram {
+	ao_arc_sram: ao-arc-sram@0 {
+		compatible = "amlogic,meson8-ao-arc-sram";
+		reg = <0x0 0x8000>;
+		pool;
+	};
+
 	smp-sram@1ff80 {
 		compatible = "amlogic,meson8-smp-sram";
 		reg = <0x1ff80 0x8>;
@@ -631,6 +645,13 @@ &sdhc {
 	clock-names = "clkin0", "clkin1", "clkin2", "clkin3", "pclk";
 };
 
+&secbus {
+	secbus2: system-controller@4000 {
+		compatible = "amlogic,meson8-secbus2", "syscon";
+		reg = <0x4000 0x2000>;
+	};
+};
+
 &sdio {
 	compatible = "amlogic,meson8-sdio", "amlogic,meson-mx-sdio";
 	clocks = <&clkc CLKID_SDIO>, <&clkc CLKID_CLK81>;
diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index dbf7963b6c87..c02b03cbcdf4 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -320,6 +320,14 @@ mux {
 	};
 };
 
+&ao_arc_rproc {
+	compatible= "amlogic,meson8b-ao-arc", "amlogic,meson-mx-ao-arc";
+	amlogic,secbus2 = <&secbus2>;
+	sram = <&ao_arc_sram>;
+	resets = <&reset RESET_MEDIA_CPU>;
+	clocks = <&clkc CLKID_AO_MEDIA_CPU>;
+};
+
 &cbus {
 	reset: reset-controller@4404 {
 		compatible = "amlogic,meson8b-reset";
@@ -464,6 +472,12 @@ mux {
 };
 
 &ahb_sram {
+	ao_arc_sram: ao-arc-sram@0 {
+		compatible = "amlogic,meson8b-ao-arc-sram";
+		reg = <0x0 0x8000>;
+		pool;
+	};
+
 	smp-sram@1ff80 {
 		compatible = "amlogic,meson8b-smp-sram";
 		reg = <0x1ff80 0x8>;
@@ -628,6 +642,13 @@ &sdhc {
 	clock-names = "clkin0", "clkin1", "clkin2", "clkin3", "pclk";
 };
 
+&secbus {
+	secbus2: system-controller@4000 {
+		compatible = "amlogic,meson8b-secbus2", "syscon";
+		reg = <0x4000 0x2000>;
+	};
+};
+
 &sdio {
 	compatible = "amlogic,meson8b-sdio", "amlogic,meson-mx-sdio";
 	clocks = <&clkc CLKID_SDIO>, <&clkc CLKID_CLK81>;
-- 
2.30.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
