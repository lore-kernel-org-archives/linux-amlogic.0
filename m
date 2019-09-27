Return-Path: <SRS0=3dzI=XW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61593C4360C
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Sep 2019 18:45:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A656D20872
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Sep 2019 18:45:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jhtdeIla";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="MikSGlZe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A656D20872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=xYgh8t7Xs4e/LwgCTLwieRCBEXS19hmeZJz4nVTJ8tM=; b=jhtdeIlabvy+r3aYuoScgal/vE
	galpTOrL/V2mglnkbkNNx17lo1LwyBlGPwBSRV6qH31nMFO7nfiuaAnt/yifssx4xpAJeoPJMnvxy
	P6K2chPPKyXhe5rxrOjzjPgbTVLYAkzym53CIzwyxTnRR0Vjfbv286vOL85Irasg6pQaBxBxoWmF6
	BxVP9VuukIUAHqrGU8LyQz14L+qUYFKuefkOc3vptqH6hZXvXDlb+wdaEu/lBz+jhK3dn5cRc4RFS
	6epQYOyc3mF6kvOc4Ft0bO9f6XjONYkAadPDSsaYUpLeq4yyZwzazWlboXKK6asxCNJ32UPm+lO/7
	AfKIH0iw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDvEh-0001zm-W6; Fri, 27 Sep 2019 18:45:00 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDvDj-0000Pd-UL
 for linux-amlogic@lists.infradead.org; Fri, 27 Sep 2019 18:44:04 +0000
Received: by mail-wr1-x444.google.com with SMTP id l3so4312217wru.7
 for <linux-amlogic@lists.infradead.org>; Fri, 27 Sep 2019 11:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=uFRkuroOBs+uKwTPCimySu+UhJ9t5OAbbzvyFqNj3Aw=;
 b=MikSGlZe0uqOkaubiy1RQV05Ryu/fAimSnGuIod6zI/bkIxwYw871JO1JwE51iYQm+
 4uj9azF9xbXtpyJHchneV3CO3wKJhdY0T9rqVgqLqpeMXKIj/L//AjglSvJtOTd5vEL4
 JeAGn/m7kMiX5bLtvKI3izvMAcPnpQFpuwUZIJZnK7YRsxmwaQ5NMDxjXC2xuXlZNh8u
 hON3DP8hubHBv9LVkP07y1Zg5PE6j6IIGKm0nh/Skxb6DcL0YHKdpbG3GcF1pPNEhUBQ
 IOetegYVw+Oldn5XB6Y4Ve53PBYtSEpB7wU8CO8pmuGh/UZa+NKEh+fQ3t/1QSedFd7I
 dqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=uFRkuroOBs+uKwTPCimySu+UhJ9t5OAbbzvyFqNj3Aw=;
 b=K1AZ0IBMhmJHX6pJtQcl6o8KNW68G3mGqtLi6dFZjYvwJp3zyeo5te9S5ZGUZ3Hrag
 8H+p8ToWmdBlIU73VBr5fg2lOCZKy+YbpbHnXeXTlaEHoQwAa6uyLzY6v4FEO5jQuWg9
 9DqxDvV19bOwUgE4CYu9UXOKM6dLZvTUTTC0wQw11H0ZYIC0/H+qakwH37ARq/Ownwqt
 rNFYI0dXEvYzKyeyEx6quKgMC3KxyZAms86OJz6h8v2Xk7aIXgoAz2kOtzuR0B0wN/M1
 ZlcTrJl79Lrop6L43DVdXVHsGNVEcETK2YsLoMHZwew84oVP7jMRxDCGFIZIgGVZk+a9
 VPGg==
X-Gm-Message-State: APjAAAV6HDJrl/gVb3EhWH0bbNFmIuErwU703yK9fp5TO8igtZjcKFuL
 FL7Px5LHbHwqFDkazhRzDYrZCQ==
X-Google-Smtp-Source: APXvYqywejFLNmLubXQ+lIajg77P8IR0wPRSPIhJuiMQsC6g7ImkqPZHkFpB+MQ5Po1oPHBJeOnLsA==
X-Received: by 2002:adf:f081:: with SMTP id n1mr4402788wro.273.1569609838776; 
 Fri, 27 Sep 2019 11:43:58 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.home
 ([2a01:cb1d:6e7:d500:82a9:347a:43f3:d2ca])
 by smtp.gmail.com with ESMTPSA id r13sm6246272wrn.0.2019.09.27.11.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2019 11:43:58 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: amit.kucheria@linaro.org, rui.zhang@intel.com, edubezval@gmail.com,
 daniel.lezcano@linaro.org
Subject: [PATCH v6 3/7] arm64: dts: amlogic: g12: add temperature sensor
Date: Fri, 27 Sep 2019 20:43:48 +0200
Message-Id: <20190927184352.28759-4-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190927184352.28759-1-glaroque@baylibre.com>
References: <20190927184352.28759-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190927_114400_007426_51189FE2 
X-CRM114-Status: UNSURE (   6.99  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add cpu and ddr temperature sensors for G12 Socs

Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Tested-by: Christian Hewitt <christianshewitt@gmail.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12-common.dtsi    | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 38d70ce1cfc7..0660d9ef6a86 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1353,6 +1353,26 @@
 				};
 			};
 
+			cpu_temp: temperature-sensor@34800 {
+				compatible = "amlogic,g12a-cpu-thermal",
+					     "amlogic,g12a-thermal";
+				reg = <0x0 0x34800 0x0 0x50>;
+				interrupts = <GIC_SPI 35 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clkc CLKID_TS>;
+				#thermal-sensor-cells = <0>;
+				amlogic,ao-secure = <&sec_AO>;
+			};
+
+			ddr_temp: temperature-sensor@34c00 {
+				compatible = "amlogic,g12a-ddr-thermal",
+					     "amlogic,g12a-thermal";
+				reg = <0x0 0x34c00 0x0 0x50>;
+				interrupts = <GIC_SPI 36 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clkc CLKID_TS>;
+				#thermal-sensor-cells = <0>;
+				amlogic,ao-secure = <&sec_AO>;
+			};
+
 			usb2_phy0: phy@36000 {
 				compatible = "amlogic,g12a-usb2-phy";
 				reg = <0x0 0x36000 0x0 0x2000>;
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
