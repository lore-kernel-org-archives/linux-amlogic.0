Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8971C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:00:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8923C2070D
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:00:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="seYVVySr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="q0JML7oH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8923C2070D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LasJlc6ibvI+TpbVpsO6SvNnUzmYmLe81CVbvlSfxuo=; b=seYVVySr6oteuJ
	f7EvIRSEcFCkuBQKsUB8qPt/KMyRAubrzxsNKu5zR9nrNxkRhksVL1wzSX96/IJtB5li6Oem0zWNC
	89Fu2fify/s9JQ6NG1zTdXUC7zZ7WMPSg5seI6K0yFBNMeYobAbyLGbV9vG45RxjOalI6817BlrPO
	udKi5TwLLH43V96RuuPTPibfaLutJIdZC3eh+p8QHVdocaYgcwuEVBqrqtivjKYeosop20Pk9tWTh
	cQBDWIZGJlY7CVOSaG7//3EfS8q5vhZ4j2q04rJGNF0IM4jtiAtwy5G1MMbBrUwp06OBa6ylvUhMc
	iYxHccsm3sNm7IAt+j2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5p4N-0006Yx-Ra; Mon, 18 Mar 2019 10:00:35 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5p2r-0003cP-Tf
 for linux-amlogic@lists.infradead.org; Mon, 18 Mar 2019 09:59:18 +0000
Received: by mail-wm1-x341.google.com with SMTP id t124so12004413wma.4
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Mar 2019 02:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9Zt6AwaPAgZDNLcSER68fIKEFrzS+LlLMT/Gvy9mGmk=;
 b=q0JML7oHfrD7GvId8BK6zPlW9aZtX3O5Os5XUHrdFA3ETLFQjkca8hGagR63tUukoc
 SMlWuQg6Vsd0FUfwE7jEacBBxei7V5438jBJ7fcr4O6qZGHRK2I7jAVztPBla6ZpONPr
 IciBI7P6xr+Vr4lceXq2m4mNCYjaICjUi4urXZxHCAqXf4s5T0JfNe898DXzDLYGg4uD
 AsOCp+ntl7F5dxLr2gtaFbuCNyAys54jwljzH1jC3X4Q/BU2KMcKuOS0RR7ngOktHlc7
 m9x1ycz7a1g8a7wLHQYdQsDW5pOsa8CQUSHRz52JCojv8SHZ1e9sZdR7vfiz7Uc2Ayxw
 r+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9Zt6AwaPAgZDNLcSER68fIKEFrzS+LlLMT/Gvy9mGmk=;
 b=rZJhQdYj+WJpxHhfuOWDRt9OfXwwytMXxIWyDO1m+2TAwqDWvNGmBPODpVSqbYVp+W
 Dm16FB+G1OyIGztnBvEhHklgFkUyYgW97e3UlhUJGGPQwt1myXSDASDsz5rQv4GD7KZT
 2DXxRkU0mDRRH3BDD+eScmYDhWIk82DbA8C0UUOByxHFtkmTSLFAyVjlavpjwidoi4rx
 HlSokYUvLec/bYfdNHfanf54uGpNCtRcvql347Y3tKH3H1igqoiFmaFj0lKaC1umUS3k
 q5f/8zIeznVNHiWOFExPaW4Q/H0qhzLl6TmmFuh70sbIL+q77qEEIMS1oxJQNjKpt5g8
 6Dfw==
X-Gm-Message-State: APjAAAUEdy7Vm3OEVgc3wb0qItA7F/A+oqSKtUwm84+p7AevxH7xYOKf
 zw1tYaIOYqrl3MYU/IqjlQq1+A==
X-Google-Smtp-Source: APXvYqzqWOqyB09bRcsadj/pFffAnHaKhkwCmZg3ya+8MFcxY7KtwNzjFySKIEAzGkWOBmbE0eYYiw==
X-Received: by 2002:a7b:c00e:: with SMTP id c14mr3162129wmb.110.1552903140400; 
 Mon, 18 Mar 2019 02:59:00 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g8sm5459034wro.77.2019.03.18.02.58.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 18 Mar 2019 02:58:59 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 6/8] arm64: dts: meson: g12a: Add SAR ADC node
Date: Mon, 18 Mar 2019 10:58:49 +0100
Message-Id: <20190318095851.4062-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190318095851.4062-1-narmstrong@baylibre.com>
References: <20190318095851.4062-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_025902_461494_B9DA6F43 
X-CRM114-Status: UNSURE (   9.74  )
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

This patch adds the SAR ADC controller node.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 992751024366..a99c13ee724a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/clock/g12a-clkc.h>
+#include <dt-bindings/clock/g12a-aoclkc.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
@@ -270,6 +271,20 @@
 				clock-names = "xtal", "pclk", "baud";
 				status = "disabled";
 			};
+
+			saradc: adc@9000 {
+				compatible = "amlogic,meson-g12a-saradc",
+					     "amlogic,meson-saradc";
+				reg = <0x0 0x9000 0x0 0x48>;
+				#io-channel-cells = <1>;
+				interrupts = <GIC_SPI 200 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&xtal>,
+					 <&clkc_AO CLKID_AO_SAR_ADC>,
+					 <&clkc_AO CLKID_AO_SAR_ADC_CLK>,
+					 <&clkc_AO CLKID_AO_SAR_ADC_SEL>;
+				clock-names = "clkin", "core", "adc_clk", "adc_sel";
+				status = "disabled";
+			};
 		};
 
 		gic: interrupt-controller@ffc01000 {
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
