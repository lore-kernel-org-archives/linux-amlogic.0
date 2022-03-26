Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 198C5C433EF
	for <linux-amlogic@archiver.kernel.org>; Sat, 26 Mar 2022 07:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e5iE2n4CO6chH4riPVa64ADqcJkS4e3Oo8+bXUWuof8=; b=KxnMpWCM/8hoIP
	SxCrwKp+ZeT1Hh8y7qQN399Cp8xUOqVZ4qsjPff8SMrVPc3MnsIUhpPUXWk6UGegwtiwj+p0retBp
	I5JSE0dn3mJ6kfExc1epMKYicOcmDkLL0tnzARhYPzfMRQD7wveFtHQLkVoz8XtzhdeyRCVvO6I1E
	YuZR10fUnDx9frRNK6y2h1WRBrh7xbGSdgz6W6mTwh4F4Y+FfeLpLd/2I5n6T9+GJg8JlCiru2bXM
	Fnu9RipQi2sCdvHg9XLNP8WpvUPbvZhNryevfDUDSMNmuDS95qPIKJQXVmxatDFHu+Ic8S1oN+tXu
	FOPeM7A2V9smWvB+h09w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nY1DH-003wEv-FQ; Sat, 26 Mar 2022 07:51:55 +0000
Received: from mx.msync.work ([51.91.38.21])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nY1Ck-003w2E-Ox; Sat, 26 Mar 2022 07:51:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DC36F33EE9; Sat, 26 Mar 2022 07:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
 t=1648281081; h=from:subject:date:message-id:to:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=2zutAK5IyrmEYXJesAiAG/QGzAOVj6jiOeg39kr9PHM=;
 b=WOCGB16/EuN01Uq92kXi9yNwwNdHk54bKstwjHM8cmY749WF+lhncuEzuwzxG3PKmoK8Mn
 yoUct+LwFEFwIGrp/Fc0p6PWz8ae22KsU4ZdbrnIvhfVVfp0Y7kU9WeZQ44kBvZui0IWkr
 rPJruhQyaVM/01YzvJ4MBwenSaCEmje56cIahbjpgVtlfrFw4sJb1uUG3HY2oBy91LvlTy
 NptGI1CA82jKAwwKSpaKrV7moo6k4Tu3kHy1E0IB3P7JeuUa3kDtLXdobK+ZH0OuKuDrS/
 nU50jCl/HK8Ha4Tdw2SaVNT6GS0iKkvj5T2MpDJGbbfqwsqtIWy/vNmYmd7KnA==
From: Vyacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 3/4] arm64: meson: update SDIO voltage in dts for JetHub D1
Date: Sat, 26 Mar 2022 10:51:09 +0300
Message-Id: <20220326075110.1462301-4-adeep@lexina.in>
In-Reply-To: <20220326075110.1462301-1-adeep@lexina.in>
References: <20220326075110.1462301-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220326_005127_940892_908A1C41 
X-CRM114-Status: UNSURE (   8.30  )
X-CRM114-Notice: Please train this message.
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

Fix the dts to match board's reference design:
- update vddio_boot regulator to 3.3v (Wi-Fi SDIO module)
- add vccq_1v8 regulator with 1.8v for eMMC SDIO

In the first revision of JetHub D1 the vccq_1v8 regulator was 3.3v.
All installed eMMC modules were tested to work in HS200 mode at 3.3v
supply voltage. In the next revisions of the board eMMC will be
powered with 1.8v according to the standard.

Signed-off-by: Vyacheslav Bocharov <adeep@lexina.in>
---
 .../dts/amlogic/meson-axg-jethome-jethub-j100.dts     | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dts b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dts
index 66c1eeba8f48..e52abffdf8cf 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j100.dts
@@ -81,6 +81,15 @@ vddio_ao18: regulator-vddio_ao18 {
 	vddio_boot: regulator-vddio_boot {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_BOOT";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vddao_3v3>;
+		regulator-always-on;
+	};
+
+	vccq_1v8: regulator-vccq_1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCCQ_1V8";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 		vin-supply = <&vddao_3v3>;
@@ -282,7 +291,7 @@ &sd_emmc_c {
 	mmc-pwrseq = <&emmc_pwrseq>;
 
 	vmmc-supply = <&vcc_3v3>;
-	vqmmc-supply = <&vddio_boot>;
+	vqmmc-supply = <&vccq_1v8>;
 };
 
 /* UART Bluetooth */
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
