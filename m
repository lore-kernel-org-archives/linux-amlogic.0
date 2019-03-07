Return-Path: <SRS0=Nbbq=RK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CA11C43381
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Mar 2019 15:14:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D19420840
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Mar 2019 15:14:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ofCXvFRX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="x05kA46l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D19420840
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Gbwr8ZPptEkEdvUq4ZBlWFqJykjmeKHWdFmNbarBHc=; b=ofCXvFRXXkvc8F
	vTUMqVBl/odQ8FIfF6R1tlLNHghZeCtEsNbVpA7bvoS16rE43vl38FIkizYi5/UknHlFHZqUm9ej+
	ff+VRBQl7UGhwgj7+coh/Isss7I6BYjseszlJnV1pH3U1RSl59yT7auNHiXdg653JGvVHHYCvKSbU
	h2Ls+PHsOnzQMeWvmIBOkkxfqgWjES9wHVT0UeSSQRvesalJpnVEIiUr+WzvVHSi72fjeH9VrYBDa
	V793b4g6rbMR1JnWcyikogzZ+L5MdCwyTAz0GcsrP6VIeRvzfNYNER0oZE/TpUjSKwyay6aa3ISkT
	rYH0ipKYbKS8QfZBhamQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1uj6-0004LV-O6; Thu, 07 Mar 2019 15:14:28 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1uiS-0003RA-Ih
 for linux-amlogic@lists.infradead.org; Thu, 07 Mar 2019 15:13:52 +0000
Received: by mail-wr1-x441.google.com with SMTP id l12so1399184wrp.6
 for <linux-amlogic@lists.infradead.org>; Thu, 07 Mar 2019 07:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pTKXutykj7vwY0VfsJAxh3ulcw4nav4DaRakY0rdQgM=;
 b=x05kA46l6Ub4SgMg1oVMBKRlw00P7ZOno653ZCbKjWvjaDW16/H9sw2Dll+a2S1WJG
 nay07eixuRsFC7gSdhiytqqDHI1n7wNlZGm5NIeeTOg2oCywv1YYaZFp2ifDLZg0GZJf
 HHLcrrgpjniUmnTKjbHYO7541ksgK5V7UzI9BdLl3+T6PpbtDT13uk4qkrkvqKpZXLTe
 CeRHB58iXswzThnyVz24DkXSDsDAHXYAerJyFmkeAeS5BalCu1Gfwu4tyYFzZQqsanzl
 cw7Y1aaea2Py1muGyTOapWwmBWgxOWZQnGabDE+e3xOagxNMBJaNdbvLkm/G3sOC9Tsz
 KBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pTKXutykj7vwY0VfsJAxh3ulcw4nav4DaRakY0rdQgM=;
 b=PDhsrJ9fvcUu18lP3mVDfXFdpYSdvZX3oKJFZbHtTxHh2ONrj5fMUv2vT1GWDBRdSF
 NX4FMm67mdXPkcXSznYBnTexHLEJtHuGBz1PpEKznaXmLbf9fxC6YXdca/SdEC3FdRWQ
 ZWOBdB8P7CddRjdHnG3nzsihR1RqjSg/7wl6JNb2UgsHBp33F4NlHVaESDnDoI3GUOGQ
 P7sqzPFfC/AE5ILv0ERO2uGDZ/wcr7n2vi/FjiDZtW8B4c8jLR2m+9rWuq2Qpj9LyI7G
 ptK4WyVhSRVbnrZDxuN6xz7SapvDFqLzB1F/AHi74GcIVoB6KjXD9z9QPa8DYIjMEnq1
 CReg==
X-Gm-Message-State: APjAAAV3/P0Ub6ikfgQgYRAUOUCeunSREdbiwYZKuLFhZhh0BXw0LwcM
 pVo+YsZbV1dUmLm44ENk4Ti+Gg==
X-Google-Smtp-Source: APXvYqzrBJHweFCZ+0W1kt+i0Xl1xJ7WPNLiGJgYkl9B+D0E4iAQkHB6LHd2tmZvp6+b3Fxkei0iVw==
X-Received: by 2002:adf:cd04:: with SMTP id w4mr7310512wrm.25.1551971627071;
 Thu, 07 Mar 2019 07:13:47 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id r15sm5756563wrt.37.2019.03.07.07.13.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 07 Mar 2019 07:13:46 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 4/9] arm64: dts: meson: g12a: add uart_ao_a pinctrl
Date: Thu,  7 Mar 2019 16:13:36 +0100
Message-Id: <20190307151342.7381-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190307151342.7381-1-narmstrong@baylibre.com>
References: <20190307151342.7381-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190307_071348_612267_97C83762 
X-CRM114-Status: GOOD (  10.67  )
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Jerome Brunet <jbrunet@baylibre.com>

Add the always on UART pinctrl setting to the g12a soc DT and
use it for the u200 reference design

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../arm64/boot/dts/amlogic/meson-g12a-u200.dts |  2 ++
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi    | 18 ++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
index c44dbdddf2cf..f2afd0bf3e28 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
@@ -25,5 +25,7 @@
 
 &uart_AO {
 	status = "okay";
+	pinctrl-0 = <&uart_ao_a_pins>;
+	pinctrl-names = "default";
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index c141cc7f6b09..f8f055c49f9a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -177,6 +177,24 @@
 						#gpio-cells = <2>;
 						gpio-ranges = <&ao_pinctrl 0 0 15>;
 					};
+
+					uart_ao_a_pins: uart_a_ao {
+						mux {
+							groups = "uart_ao_a_tx",
+								 "uart_ao_a_rx";
+							function = "uart_ao_a";
+							bias-disable;
+						};
+					};
+
+					uart_ao_a_cts_rts_pins: uart_ao_a_cts_rts {
+						mux {
+							groups = "uart_ao_a_cts",
+								 "uart_ao_a_rts";
+							function = "uart_ao_a";
+							bias-disable;
+						};
+					};
 				};
 			};
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
