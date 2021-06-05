Return-Path: <SRS0=xxsk=K7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAAB0C4743C
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Jun 2021 03:11:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FE9A613AE
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Jun 2021 03:11:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FE9A613AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2BLDB2CjGYJ90p6oQadC73wDCdaD3FQFzcYkUzc+sfM=; b=0l26/OGog7zeqq
	ry9HWE5cT9zHdZqJ4eDEf0P5KVv2fx08b0NUTSO+qaIK91cVCJjBlQdBb7WKiz2f+Ljn72c1Q0/Iw
	dawjbB3r+IVUmLrbmE4A1543uZ7VPQeBVFsttLHLdjDiCqfsqiFSdLcST2xXbEtTjVxX+ezG1wDOU
	3Y3qBERvk0pZLJJnB+K+G8ZOSdT3zTVIuTEn4Fc4Oy/4E+66xeEfrltR3haDTZF8Si/6IXUXEPL9U
	2U1M4skwBC/NqoNBY57CGv9gVoNX+rHaNa3ng/C4NXfakF1AtAHh3+2ojSrGe93vcXvY5g69ODlPm
	LDybjxmE4+Sg8e+r6NGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpMi8-00Fv1I-1G; Sat, 05 Jun 2021 03:10:56 +0000
Received: from mail-pl1-f176.google.com ([209.85.214.176])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpMhu-00Fuzm-E3; Sat, 05 Jun 2021 03:10:43 +0000
Received: by mail-pl1-f176.google.com with SMTP id h12so5596104plf.11;
 Fri, 04 Jun 2021 20:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o8AkX7yScaldi+7GL99EP+gl0QK2qsS9wnoAmRYrRMw=;
 b=FFrM/1R5iGYBQHayGsJtLwbbteR7lDb30n/XNp/w3NE3DfqVWgtjJa8K6fdplNUppY
 RkcYQKCSL7uFi1Ll/bEFHncMxlfub7a11UxtBnXHEWX+iKo9F1uWudp4IyI9OKsUHfJl
 N/JY2+CDOzkDKhbWr1qtNL8P6sf+HsGm+RDSFDm/ZOn77tRlcU9uoM13yPsMl6jA35Dv
 XlT3AIKfTuYT+TTjvegpMe87fAz7hvQSUcKpmTiNwa96qZ0Grt/yPX00HQuQqcs9CjUu
 yVNUONyVzXb6MFvwC+KK+IKzwiAe/rn+Zdli+OP81w6LE3bq45ua65ulOSlyszp/peUw
 wC8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o8AkX7yScaldi+7GL99EP+gl0QK2qsS9wnoAmRYrRMw=;
 b=nLX26xKZWQTC61jdXP6aVndlxs9F7NBI65xmB7kMSYmkL0Pj8b+U0amf6F2hroBYKw
 Og371EbrW8aRGwO5K6EF1opOm3+ztF80iftNTk4f48YFqHXnthkFIqvNoF6gi0bRBJn4
 duiYGbcDYVHgu+v8LhfuQNtl1a5MbcjJb/It0IU4nJk+bOksXTreBVrD/RpXGuXAHObm
 h4a2nb6Io4ImXhZG+7d8WRuLQdAtDncjphZEhijqiKSNTIJl7fOvroA0A9YkN2Z5SHtc
 igasyH5m1xiyVHQxXbEkyEdo9cXH/0qAyMQbfVtx4bE7IqXc5nmvvsQQKqlfoL0CNFPL
 fbXw==
X-Gm-Message-State: AOAM532kpBonH2lLNcpTszHfTPy9Rxi9OW/fOEwODJnoNRlDMVq1rlee
 eYKXkCnXQ68oKD6MwYUoT44=
X-Google-Smtp-Source: ABdhPJzr00o1PC13aCExWnGG81e/h62Rw/VeROmwoDXzaPLthMT4gRPMvIJThlVCjjWqbFh0RAej1A==
X-Received: by 2002:a17:902:f546:b029:101:fa49:3fd5 with SMTP id
 h6-20020a170902f546b0290101fa493fd5mr492855plf.34.1622862581649; 
 Fri, 04 Jun 2021 20:09:41 -0700 (PDT)
Received: from localhost.localdomain (199.19.111.227.16clouds.com.
 [199.19.111.227])
 by smtp.gmail.com with ESMTPSA id d15sm2720005pfd.35.2021.06.04.20.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 20:09:41 -0700 (PDT)
From: xieqinick@gmail.com
To: robh+dt@kernel.org, narmstrong@baylibre.com, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: nick@khadas.com,
	artem@khadas.com
Subject: [PATCH] arm64: dts: meson: vim3l: add NNA node
Date: Sat,  5 Jun 2021 11:09:15 +0800
Message-Id: <20210605030915.411391-1-xieqinick@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_201042_502595_9C3931F3 
X-CRM114-Status: UNSURE (   8.11  )
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

From: Nick Xie <nick@khadas.com>

Add Neural Network Accelerator device tree node
for Khadas VIM3L.

Signed-off-by: Nick Xie <nick@khadas.com>
---
 .../dts/amlogic/meson-sm1-khadas-vim3l.dts    | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
index 06de0b1ce726..8a4abb61432e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
@@ -14,6 +14,29 @@ / {
 	compatible = "khadas,vim3l", "amlogic,sm1";
 	model = "Khadas VIM3L";
 
+	galcore {
+		compatible = "amlogic, galcore";
+		dev_name = "galcore";
+		status = "okay";
+		clocks = <&clkc CLKID_NNA_AXI_CLK>,
+			<&clkc CLKID_NNA_CORE_CLK>;
+		clock-names = "cts_vipnanoq_axi_clk_composite",
+			"cts_vipnanoq_core_clk_composite";
+		interrupts = <0 186 4>;
+		interrupt-names = "galcore";
+		reg = <0x0 0xff100000 0x0 0x800
+			0x0 0xff000000 0x0 0x400000
+			0x0 0xff63c118 0x0 0x0
+			0x0 0xff63c11c 0x0 0x0
+			0x0 0xffd01088 0x0 0x0
+			0x0 0xff63c1c8 0x0 0x0
+			>;
+		reg-names = "NN_REG","NN_SRAM","NN_MEM0",
+			"NN_MEM1","NN_RESET","NN_CLK";
+		nn_power_version = <3>;
+		nn_efuse = <0xff63003c 0x20>;
+	};
+
 	vddcpu: regulator-vddcpu {
 		/*
 		 * Silergy SY8030DEC Regulator.
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
