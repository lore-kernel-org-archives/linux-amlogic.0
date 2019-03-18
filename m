Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1708BC43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:06:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA2E420693
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:06:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TE/VDHGK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="pjZEBxgS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA2E420693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i2vscMfHbaGB3lgYybwkHuQDExaebYu4eb0QPV+VoJo=; b=TE/VDHGKnnGsyl
	YUwwnXJtRISog7KRFJustfKmjcacnHi5n7QYc/2wZezj4NWbQ6GYbPkChV0jPLgOAENYgVFm7mBct
	4AM0N0RZCWaPC+6FsqTeRHayVzK4Nn+IDjjzGmRHBkhEEyk9haVZMaijOr8ZSgj+RIt01y8nR/xAD
	3AluyQ5OaXP+RvqNxZlDoGMyQD3h9KS0ngLu2e9trtR72/botLqZSlZCll6DYEIUO9rlsbD0dVWP7
	ytXPVePiswN1gY++m4bhiYLsgEJZkqD8bnqfLxrLMXRzm8xDzLcMDDHt6YexEobFNpxWv121LRpBR
	GFSCHhZJ+v4rnGD2h6TQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5pA8-0002SW-4h; Mon, 18 Mar 2019 10:06:32 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5p8m-0000DX-Hw
 for linux-amlogic@lists.infradead.org; Mon, 18 Mar 2019 10:05:15 +0000
Received: by mail-wm1-x341.google.com with SMTP id z6so1757292wmi.0
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Mar 2019 03:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+Lj23NNiwvSBJgMpzQcSPJzZg545AVVfKByrCGsDrxU=;
 b=pjZEBxgS8pDyJKPJyYPMJsl4jtmuTMtXSTrFKCbjfK6b8j0zavYifZkaCuPsnbcfZc
 bs1HomnxbXllocZBvjHF5KeF9XtBvXbsTz1HajSARlCJQk6Mwl/TnOeMML2285CKG8wS
 2EhpMeGuV8O8KQBm/el6YXUdmx+aBcGGtV6UvsyedYDLGztNJe+9rvKcHtx8EA9YVVMT
 cwFTcWtu/WFS2SXk1uqz1Bfw/KaL4NfIjWr8BSBDhj07PuJtNm1s+WBbcNE2aapXklUf
 /tk4YNhoL0OPzbeHa3WfQ6sn7ehilJONJrI6NUdM3R8ivyM8WViM5Qf6wVtsX56a8OO5
 eBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+Lj23NNiwvSBJgMpzQcSPJzZg545AVVfKByrCGsDrxU=;
 b=IU/PcqevPMYwim7R62UgMXJMk8a0J20i8JAvpijQEnQEDCjs7/HWroD9YaU+soC3XC
 B9VUMJqe+u/XId16AJTdoQqVH0czcWU/TswHR9P1hrmEC78WGS2knXVtGDwRNJ+pLj5t
 PKry0zwtl88VzDxgD2uHMW2GiJhRKIgbhVUN0O9MuIhi25pdeSsw9X0fQXuepojSLQ2/
 IJ2luerQ9mPIV7quspkcTiB0mHdOqk7kw7baVzklyVsXtTEclAfE7vkumQAPrGffpYQF
 BnG3tNqDz0VSbYMT7XED1AkGP1HJQCRedfimClTI87yL7mpuM0ViNJI7BqkhFzvw7SKZ
 mStQ==
X-Gm-Message-State: APjAAAWK46zkO479Y3cMqmfUCZz6YSIBS7K7Ma+kRxksrnDfgSUXPY4R
 EITV30pQnbBoht5JyYIWKUQ7ww==
X-Google-Smtp-Source: APXvYqzodbCpdIVd3EV70tiQabqEr/bJqrYH1Q7vuNdrLgFe2wa22kGAg6tQ+gzQ+Fj10dA0Wcf5KA==
X-Received: by 2002:a7b:cc10:: with SMTP id f16mr10132433wmh.49.1552903507142; 
 Mon, 18 Mar 2019 03:05:07 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id i11sm5216800wrp.40.2019.03.18.03.05.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 18 Mar 2019 03:05:06 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 07/11] arm64: dts: meson-g12a-x96-max: Enable BT Module
Date: Mon, 18 Mar 2019 11:04:54 +0100
Message-Id: <20190318100458.5619-8-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190318100458.5619-1-narmstrong@baylibre.com>
References: <20190318100458.5619-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_030508_954187_9D8A155B 
X-CRM114-Status: UNSURE (   8.95  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Enable the Bluetooth Module on the X96 Max Set-Top-Box.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index 5c37930b09e2..bc152b1863c3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -90,6 +90,18 @@
 	};
 };
 
+&uart_A {
+	status = "okay";
+	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		shutdown-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
+	};
+};
+
 &uart_AO {
 	status = "okay";
 	pinctrl-0 = <&uart_ao_a_pins>;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
