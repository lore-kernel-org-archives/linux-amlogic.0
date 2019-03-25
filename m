Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09765C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 15:07:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEF2A2082C
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 15:07:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eRvqoJf0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="cxptG/8m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEF2A2082C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qD0DFJekoZvtdoVivA/J0tt+GZ013+5cntPHx5TKKBg=; b=eRvqoJf0Y8l0Wr
	x0jlWHW9J42HNjg4TK4ESlmM0dpLB+bQE7d4kAoAiZym4kktqgcQg3TQoOCSqyVA/NQ0xgvizVFm9
	dSE3kL9u1g7fGTUFsGF575gWs/FPzp3TL1c10ej+mTo+V7fooGj1n4vhhu/YudA1GNZjXbQ8pQQt3
	7qKuJfP8qFu+E/895mSFwUJT99iNbUiYqvxBB5wHHWwjMWkm5VMd+hqKayosC9hC9/PBRWdhBkixw
	3EXSPmBiNuIe1GSLApcp6GBzWivz5HxnYkYgxwAmSQWlAnpEZylfwewD1XkA+O5pBcsc94zp5CtaZ
	OntmjoydepjfjPJEv4mQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8RBh-0003Rv-Iw; Mon, 25 Mar 2019 15:06:57 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8R4b-0005sv-A6
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 14:59:43 +0000
Received: by mail-wr1-x444.google.com with SMTP id y7so6424442wrn.11
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 07:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ufyFUHV9MYGt1xCCC/qB6iPXh5pMY/z0nQhLBwQ98yE=;
 b=cxptG/8mWah8bEph4tDrzfs4MMIET6v3/pp4JpGq68S/DTcPil9NN6P8BdHT8OaZad
 BFVZU1j4r29YVd2PLL6sNrC9qAX/SjEwD4o20qUMKOt1wPvFK3em4Z14cm3s8ffl1gLw
 xbWd1qw9ygu4Zhp1T/S+9kEegwGKnQQtM1AzahakmYv55XVv2TmDfQomTWOWB498h7EV
 XcZaFvdzm+UNsNZIByg5lI5+gaGJJjJzW85txBd/VZqoOroOqdGsb4DfB3XueJI9C/dC
 6jrC8BdaHFkGqWSTr8ZXdapj1QV7fGBWNQnReN4REIHEwKMFZSmI7dIB2JHu61B9IKNu
 EKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ufyFUHV9MYGt1xCCC/qB6iPXh5pMY/z0nQhLBwQ98yE=;
 b=V9rKGwd5wGd5kqz6/83HoJVx3RsBXitqQb0S218KMkg+U8TjSBJDsN1nIhfuAoWFzP
 LldCbL4p3M4NPtrT+r4wCdXK6cXxV/2tFtUgxUM+6vufflEOImGWSSftAMOCEFosUy1B
 SXpuBVIXN9YAikORXqA6YAT1xodIg5uexS1f2xoSSgF0U10bBJ8sqvORObX83oGQBs14
 I9OBkFU/BZNb0N4gh68Gt0kj2lRGaGeEykzHujVY5p2OFt73omYsFenNMwvv5JtnKIhm
 8KuL0Dbaw/cSGatHeXh+v5X0R8q7rtmnheqPy4zSsYHgJmW8UsO84Eb78Co3Ta5Zd2zM
 RGBQ==
X-Gm-Message-State: APjAAAU+dg9eWPBZk+D3D/RUKBZNi1Xvh1/FMlagcylP3Y8XmzeM8zJ6
 uSeg9Fprs/1IfFEoNiil0KYzOQ==
X-Google-Smtp-Source: APXvYqwQuNjHn/LKrhYAODYvi5Z6dbejaSh7FedfsWLyzHYS6Qri97GbLnYtEWnSqs8PVKGA2bswmw==
X-Received: by 2002:adf:f309:: with SMTP id i9mr11048923wro.258.1553525959906; 
 Mon, 25 Mar 2019 07:59:19 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id d11sm12836156wmb.19.2019.03.25.07.59.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 25 Mar 2019 07:59:19 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 2/5] arm64: dts: meson-g12a: Add AO-CEC-A nodes
Date: Mon, 25 Mar 2019 15:59:11 +0100
Message-Id: <20190325145914.32391-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190325145914.32391-1-narmstrong@baylibre.com>
References: <20190325145914.32391-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_075939_649913_BE4BE449 
X-CRM114-Status: GOOD (  11.46  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Amlogic G12A embeds 2 CEC controllers :
- AO-CEC-A the same controller as in GXBB, GXL & GXM SoCs
- AO-CEC-B a new controller

Note, the two controller can work simultanously since 2 Pads can
handle CEC, thus this SoC can handle 2 distinct CEC busses.

This patch adds the nodes for the AO-CEC-A controller until AO-CEC-B
is supported.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index b0ff649bca46..915e00833718 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -161,6 +161,14 @@
 						gpio-ranges = <&periphs_pinctrl 0 0 86>;
 					};
 
+					cec_ao_a_h_pins: cec_ao_a_h {
+						mux {
+							groups = "cec_ao_a_h";
+							function = "cec_ao_a_h";
+							bias-disable;
+						};
+					};
+
 					hdmitx_ddc_pins: hdmitx_ddc {
 						mux {
 							groups = "hdmitx_sda",
@@ -397,6 +405,16 @@
 				};
 			};
 
+			cec_AO: cec@100 {
+				compatible = "amlogic,meson-gx-ao-cec",
+					     "amlogic,meson-g12a-ao-cec";
+				reg = <0x0 0x00100 0x0 0x14>;
+				interrupts = <GIC_SPI 199 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clkc_AO CLKID_AO_CEC>;
+				clock-names = "core";
+				status = "disabled";
+			};
+
 			sec_AO: ao-secure@140 {
 				compatible = "amlogic,meson-gx-ao-secure", "syscon";
 				reg = <0x0 0x140 0x0 0x140>;
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
