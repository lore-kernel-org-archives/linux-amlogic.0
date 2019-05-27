Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9999DC04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 13:23:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E9A8208CA
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 13:23:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Dya1aMIX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Hg2CCl48"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E9A8208CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Aqpr5FbyzMs1CMRD9Bn+P6cx84YG3S5I5kxfr1tueXo=; b=Dya1aMIXnzpX/z
	HuFGS87BdMoGFhd16rViR+OxFRY7ir9iGe8AidlBMMqvcq9nt/oePCrCwYe8VAIjzL73qS035ULPG
	M+CQHbAzua5L1BI5P1haVZsEupVAwsmQPGkRy2tBro5cAWGIP2b8/b0ok8PXBeFpsSRPTA7nzE4b6
	lkeFUyp+0bbQT1V8bE6y4vNS9QJSv1q2bIg5rKS7bh9kXdhRjDLn6PJm/usIGgW9kaTtQ7pjqkjPd
	4kmPvs7skaCzfwWmreWQPEZ83MVyovTA1X2qQ0U+LxrRejZpnviwjnJk5q7mhCbsS+Lxd477isk7r
	qHgDCP6YanSaSYK9HRLw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVFag-0003Ap-78; Mon, 27 May 2019 13:23:02 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVFZn-0002A0-Sd
 for linux-amlogic@lists.infradead.org; Mon, 27 May 2019 13:22:11 +0000
Received: by mail-wr1-x443.google.com with SMTP id c2so1726096wrm.8
 for <linux-amlogic@lists.infradead.org>; Mon, 27 May 2019 06:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1CiRqWREkgXuihOBunUI3fz+CBkOdeZkmwsLz+vnX0Y=;
 b=Hg2CCl48NNB6AMXkrTWKa8IdPcIBCv4b8IP+DMrhifc8ubYGhMOkLQyDLeWo1LLLZu
 JjN42+xp70/Pq4+VvnuCgjCMy/fujF0c5f9W+02piqOcWB6Vuq6txI+u/Qy7+sDhh9tI
 J3HJIJ4xRyWnBOLDLZ0ZNjq9saFTrJe+p4mGJ2WI1pa1UCWbWHskqAlTPksoWQGPl6q3
 gtzJglAvTqLuWJXateDZ/fmZHv9A5d8CUlk8xc3cCXdQrJVSMd0TBaGGEuWiF3opdJfI
 doDO5PCC5S7u50ZOE1D+dRos4HDFw4O0CYZhd6VXJ4eQRKXg59Q1YJdhmTBggPvZ73dx
 8TPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1CiRqWREkgXuihOBunUI3fz+CBkOdeZkmwsLz+vnX0Y=;
 b=XipDKpK8IzSr9el8KaXMmgCQOCOSqA/uqNGpyItpkpwezlF3GIVoDmDkBaCjvS5aES
 PTtN+vySPvK7gbm04y3rftVaL9RYwFlnkur5/F+TysbIPjAjDddGqDfO2USs9NSKcl4A
 I/NGKT1JjuDW0zEjhQsho09bDAybpmcFFt0YqJKgIZCJFvn+kSSqiJs+2u42yS0uv6lQ
 lLadXI+hQmDt2E0Y9RNqUA2JKQJDVAJKpDphWzWScu8Ca5e6PI8yaOnibshOft9S33gm
 I41AqW6yG1RixFnRjREM9/0+n1ASBSOOVUg3hEw9reqL49fe7Y9sPJ17Dv7zv6SiXU+q
 dbQg==
X-Gm-Message-State: APjAAAUgEocZ2qNN1LwT3eKVXqxUxKgeJ/3RLOvRhBOGgH+jq643T7oT
 GBxNaxa8B36Nwoz4ExopEaO0cw==
X-Google-Smtp-Source: APXvYqzC4VmNhq9v3nbo8eE5sL9A319fsc//sxkeiH4qYeTzgim31C30hxhgbJLRajqBnZV/wSwEmw==
X-Received: by 2002:a5d:4e89:: with SMTP id e9mr3774964wru.72.1558963326098;
 Mon, 27 May 2019 06:22:06 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id l12sm7019836wmj.22.2019.05.27.06.22.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 27 May 2019 06:22:05 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 04/10] arm64: dts: meson-gxbb-wetek: enable bluetooth
Date: Mon, 27 May 2019 15:21:54 +0200
Message-Id: <20190527132200.17377-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190527132200.17377-1-narmstrong@baylibre.com>
References: <20190527132200.17377-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_062208_313078_028BDB2F 
X-CRM114-Status: GOOD (  10.00  )
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
Cc: linux-amlogic@lists.infradead.org,
 Christian Hewitt <christianshewitt@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Christian Hewitt <christianshewitt@gmail.com>

This enables Bluetooth support for the following models:

AP6335 in the WeTek Hub rev1 - BCM4335C0.hcd
AP6255 in the WeTek Hub rev2 - BCM4345C0.hcd
AP6330 in the WeTek Play 2 - BCM4330B1.hcd

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
index 45e306da2154..9ef6858779c1 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
@@ -249,6 +249,19 @@
 	vqmmc-supply = <&vddio_boot>;
 };
 
+/* This is connected to the Bluetooth module: */
+&uart_A {
+	status = "okay";
+	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		shutdown-gpios = <&gpio GPIOX_20 GPIO_ACTIVE_HIGH>;
+	};
+};
+
 /* This UART is brought out to the DB9 connector */
 &uart_AO {
 	status = "okay";
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
