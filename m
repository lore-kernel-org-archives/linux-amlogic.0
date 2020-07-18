Return-Path: <SRS0=xEby=A5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96285C433E6
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 06:59:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E04520724
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 06:59:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AUPHHPU1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WENSboNW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E04520724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=066PBO4up08RESHKbJddZF7DnqHfW2H2es6x7reyC3Q=; b=AUPHHPU1fBE0FL/r3C4UUk8Hw9
	2243BsHwB7w++QB13tCmZvgHyuJ2FVdWgG5j95vXrT1Cnb8ErItpMCqus3sqy1B0WusLOddbnnKeW
	IhhXfTN0aE0IO0aX0IQXecyfTevdK7LmJmAzY6Pqku8aYmNgiVdUHbxe5Ln/m8YLHf75j6BFiB7yC
	rOD1jwvbQ8v/KhAtY4uY9D7nhvvUvPSi+Tez6wPPjcQ/Dlth0XSR58JcZlcBZIHtjxUr6KscgXSt4
	EMXwNqbAdvefUkgzT/svcZn6r9zC57YjsQbg44tpQZJqvf9mmXmwv64lqZh6bGqpXKef7Yk9Pqt2e
	UYGbvePA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwgoV-0001pH-EF; Sat, 18 Jul 2020 06:59:15 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwgnK-0001Hw-KF; Sat, 18 Jul 2020 06:58:03 +0000
Received: by mail-wm1-x344.google.com with SMTP id c80so17763224wme.0;
 Fri, 17 Jul 2020 23:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=DR+MN9yI45B0CbPas30C2sDxsoxmrDbz6ZTE82Yi1YU=;
 b=WENSboNWqFEFKMhQ1tpuQelRMJAoIzuNKBQN5XrO86dudVwcu92a3aNhzf/hlGc70C
 99QuqYIR8SsFjoVQgDKKzVGUrP4+ay/lkffYF0gtdz02LOYtjut8md2FNXS04mJsRS2o
 FKK5iZs2FO/SJGqeip0SksH48C2emf6ivIjUSa9R48xoh6LzVmZyv0BwFC4VDA/ow4un
 S8tOWLsQGbZ5UNLWIWQIZo6hoXZwjY0XIcLO4XR/kj/wM/FZ9KF1x+/ryHYkCYaTQJIT
 mvGkLlP4D3O7uBc2jdIoLUW+EmFLc1FEDftrBQzCMOxAXBkFyApgX3u020lCf+QzlV+u
 92ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=DR+MN9yI45B0CbPas30C2sDxsoxmrDbz6ZTE82Yi1YU=;
 b=JorDZpUEJx2n/jP8vod0sEWKsB3j59EpgPHh6wSBJHhUfA3B0vrrLqrhGU7RKeTgYP
 ibKzhLbSV3pXIsu0/Dg1aK55yNkEoG1xZamrouYx+XQ8oX+DkaA4VUPSwFtXLgXqcVtZ
 haZsg87otSsiWXjFak0V7u8djiEmn8+W2sDf57hcT4/GnoBM1eM7IdxpxIu3CDdTo1ti
 9yRVVx0n8kkLXrto3g+FrPLtIqYzVH5bbOPrEWKtILdpfcl2tALuJlJeEvfu89u8DMC0
 gcgAiygFiSPwo7YAZ4JbIVkVxzjgDM9/cseOJJPaMAGoeKM48bRSNiAu4beTMQ2kwDnu
 EROw==
X-Gm-Message-State: AOAM531vtz2F4F1bXnHDn29BEqCRXLBcY4GqT881dSdqtvn20QCtoGnE
 7fy1N2DYxDhe1cUw3w7n8v0=
X-Google-Smtp-Source: ABdhPJweouzzfuZ/Hx+GE+ZOtOp3U/VJVa4dJNLXiSlFEcR7hnZHpn2pOAOKEreYUvRVMOyapB6v0A==
X-Received: by 2002:a1c:dfd6:: with SMTP id
 w205mr13231447wmg.118.1595055481607; 
 Fri, 17 Jul 2020 23:58:01 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id x5sm18749191wmg.2.2020.07.17.23.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 23:58:01 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 08/12] arm64: dts: meson: add audio playback to p212-s905x dtsi
Date: Sat, 18 Jul 2020 06:57:35 +0000
Message-Id: <20200718065739.7802-9-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200718065739.7802-1-christianshewitt@gmail.com>
References: <20200718065739.7802-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200718_025802_756203_4FA3DC57 
X-CRM114-Status: GOOD (  11.42  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add initial audio support limited to HDMI i2s.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 .../dts/amlogic/meson-gxl-s905x-p212.dtsi     | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
index 05cb2f5e5c36..40776d42bf8e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
@@ -11,6 +11,7 @@
 /* Common DTSI for devices which are based on the P212 reference board. */
 
 #include "meson-gxl-s905x.dtsi"
+#include <dt-bindings/sound/meson-aiu.h>
 
 / {
 	aliases {
@@ -85,6 +86,45 @@
 		clocks = <&wifi32k>;
 		clock-names = "ext_clock";
 	};
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "GXL-S905X-P212";
+		assigned-clocks = <&clkc CLKID_MPLL0>,
+				  <&clkc CLKID_MPLL1>,
+				  <&clkc CLKID_MPLL2>;
+		assigned-clock-parents = <0>, <0>, <0>;
+		assigned-clock-rates = <294912000>,
+				       <270950400>,
+				       <393216000>;
+		status = "okay";
+
+		dai-link-0 {
+			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
+		};
+
+		dai-link-1 {
+			sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
+			dai-format = "i2s";
+			mclk-fs = <256>;
+
+			codec-0 {
+				sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
+			};
+		};
+
+		dai-link-2 {
+			sound-dai = <&aiu AIU_HDMI CTRL_OUT>;
+
+			codec-0 {
+				sound-dai = <&hdmi_tx>;
+			};
+		};
+	};
+};
+
+&aiu {
+	status = "okay";
 };
 
 &ethmac {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
