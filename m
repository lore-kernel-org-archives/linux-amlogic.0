Return-Path: <SRS0=x2rd=6D=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0727CC3A5A0
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Apr 2020 05:40:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD00D20753
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Apr 2020 05:40:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uZv3iWPI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y4hAnc57"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD00D20753
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=IwYjq1FzERhS20MrecUayk6QBbE4cYwSEhpynZQESls=; b=uZv3iWPIh7aRR87Zy6lbC6OgEE
	9xOOXxfyuKce47lyTcvIH3NL55BdMYgeIsUHTFt0MKZoSU7zQozuUWZ3AWwVegQmy2dbpWlabY0sr
	8NnT4ndIYYpM3D8FwrUJCTz/zWbcm7n8Lboe3vCKMrfnr2N6HHJmPl6iiw9VafGqlYTGF/uVUoMbP
	eibhPvD29M6ijpiCK8so398IRq+85cn2w+pZCCxay9JWf+Tec6VGwWSPYqFKh3RqJRG/j0Qdc72ey
	6MnWo9DgKDAwBFfmkszH20nm3CXAE8TGM3ilQ0JQTCLLKaC6CfzZUD4j+DzuecqDXkmg43Cu7LvXe
	ICtVo6+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQ2gp-0000TB-SQ; Sun, 19 Apr 2020 05:40:23 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQ2f1-0004mU-AV; Sun, 19 Apr 2020 05:38:32 +0000
Received: by mail-lf1-x141.google.com with SMTP id j14so5190010lfg.9;
 Sat, 18 Apr 2020 22:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vLg2vS6vbwaLD4bumFzJqQXM6o/qVInbvW6e8omW3YI=;
 b=Y4hAnc57B0cQGO5KZdXkt8myF8rs756MwxTr2Wb53uR/s6pHoG8gBpRjjlLJ1BedYE
 kYTNhe2Urdazuh7+wpOx8wGOiVAuq+k+FvDjK2CcjZ0U66PKJ4UGbFqik7Xseb6eb3r6
 S5WnLC3Os4lrpmkX3+22D3rMyrbQ/ifijc3VIDPaOfOkk+rKb4ifW8S392xRDbQL99ZA
 I7xbacArb/BLsSU/O/qMutriu6spjY8aM1A9Wr6JL/4TaSBXLU28tmR7+QUrIl9I2ITP
 tCOoyyNG5ez7zKmNDOh41N8RzsrCfTJ9aQKCmhhQnLqCC4at6fd9KNOCRkRluyoN750x
 KB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vLg2vS6vbwaLD4bumFzJqQXM6o/qVInbvW6e8omW3YI=;
 b=VdikAmX8mGfZZp/CWD6F4VFvJXXhSP/G7NcmxtESRzEkLDZF0Dh0uBUtR3X7qSstK+
 odoq8ONxXz3aRs82lrc23eiDBZpFgIpPe/upgPGmwhpurTOGCYX7wGfZX58bh7lGdkVt
 kl8afx91gjot+gFOCF5aNEsBxhiwHxUIUSoFWhcemfaR5w6sG2FdASWFjNay25OCR/gl
 uwisu52PO2Ea9o97DqkWDV7bOqQOWi/565CPRSEVODCMy+87qdO402beC2RpWOKqixu5
 zn0qaEd6DmpMmOauk3KHp5/k7ZiB1nhQ7nwOKV9A9bgu3zQjsy0Sg+AVIUD/Ry8CCjN3
 6x2A==
X-Gm-Message-State: AGi0PuZtNVElDwBghSB7mG2dpbqsJ5iMvQ+pzT+jzMMUylHunI1brVOi
 faiDeVu7pcImITOItshX6Tk=
X-Google-Smtp-Source: APiQypIaK3mv2I1tg6U9iBlWpxXNzg5HvmZEysNlupNPr+cXsUEVaMbshur0i4d37ESxnGuvIbB+Vw==
X-Received: by 2002:a19:43:: with SMTP id 64mr6462595lfa.67.1587274709684;
 Sat, 18 Apr 2020 22:38:29 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id r23sm20416619ljh.34.2020.04.18.22.38.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2020 22:38:29 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] arm64: dts: meson: convert odroid-n2 to hdmi dtsi
Date: Sun, 19 Apr 2020 05:38:13 +0000
Message-Id: <20200419053815.15731-4-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200419053815.15731-1-christianshewitt@gmail.com>
References: <20200419053815.15731-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200418_223831_424059_86FB4494 
X-CRM114-Status: GOOD (  11.09  )
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

Simplify the N2 device-tree by using meson-g12-audio-hdmi.dtsi

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dts | 89 +------------------
 1 file changed, 1 insertion(+), 88 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
index 169ea283d4ee..e75d859e76dd 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
@@ -7,9 +7,9 @@
 /dts-v1/;
 
 #include "meson-g12b-s922x.dtsi"
+#include "meson-g12-audio-hdmi.dtsi"
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/gpio/meson-g12a-gpio.h>
-#include <dt-bindings/sound/meson-g12a-tohdmitx.h>
 
 / {
 	compatible = "hardkernel,odroid-n2", "amlogic,s922x", "amlogic,g12b";
@@ -205,65 +205,6 @@
 			};
 		};
 	};
-
-	sound {
-		compatible = "amlogic,axg-sound-card";
-		model = "G12B-ODROID-N2";
-		audio-aux-devs = <&tdmout_b>;
-		audio-routing = "TDMOUT_B IN 0", "FRDDR_A OUT 1",
-				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
-				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
-				"TDM_B Playback", "TDMOUT_B OUT";
-
-		assigned-clocks = <&clkc CLKID_MPLL2>,
-				  <&clkc CLKID_MPLL0>,
-				  <&clkc CLKID_MPLL1>;
-		assigned-clock-parents = <0>, <0>, <0>;
-		assigned-clock-rates = <294912000>,
-				       <270950400>,
-				       <393216000>;
-		status = "okay";
-
-		dai-link-0 {
-			sound-dai = <&frddr_a>;
-		};
-
-		dai-link-1 {
-			sound-dai = <&frddr_b>;
-		};
-
-		dai-link-2 {
-			sound-dai = <&frddr_c>;
-		};
-
-		/* 8ch hdmi interface */
-		dai-link-3 {
-			sound-dai = <&tdmif_b>;
-			dai-format = "i2s";
-			dai-tdm-slot-tx-mask-0 = <1 1>;
-			dai-tdm-slot-tx-mask-1 = <1 1>;
-			dai-tdm-slot-tx-mask-2 = <1 1>;
-			dai-tdm-slot-tx-mask-3 = <1 1>;
-			mclk-fs = <256>;
-
-			codec {
-				sound-dai = <&tohdmitx TOHDMITX_I2S_IN_B>;
-			};
-		};
-
-		/* hdmi glue */
-		dai-link-4 {
-			sound-dai = <&tohdmitx TOHDMITX_I2S_OUT>;
-
-			codec {
-				sound-dai = <&hdmi_tx>;
-			};
-		};
-	};
-};
-
-&arb {
-	status = "okay";
 };
 
 &cec_AO {
@@ -280,10 +221,6 @@
 	hdmi-phandle = <&hdmi_tx>;
 };
 
-&clkc_audio {
-	status = "okay";
-};
-
 &cpu0 {
 	cpu-supply = <&vddcpu_b>;
 	operating-points-v2 = <&cpu_opp_table_0>;
@@ -351,18 +288,6 @@
 	amlogic,tx-delay-ns = <2>;
 };
 
-&frddr_a {
-	status = "okay";
-};
-
-&frddr_b {
-	status = "okay";
-};
-
-&frddr_c {
-	status = "okay";
-};
-
 &gpio {
 	/*
 	 * WARNING: The USB Hub on the Odroid-N2 needs a reset signal
@@ -472,18 +397,6 @@
 	};
 };
 
-&tdmif_b {
-	status = "okay";
-};
-
-&tdmout_b {
-	status = "okay";
-};
-
-&tohdmitx {
-	status = "okay";
-};
-
 &uart_AO {
 	status = "okay";
 	pinctrl-0 = <&uart_ao_a_pins>;
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
