Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA81FC43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:08:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8804120693
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:08:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZYNwB78B";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="elbZGVcJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8804120693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7q8a6veWJlarELUv8d0KUSxdMDU0xgY7PhXchi2PnOU=; b=ZYNwB78B5eoXda
	TQ7iDjM60VV+mVrp2pzl4cLMbIXjxIoSagmsAXVkTvCNkcybBcCI3pXp9QsiGlnHGvvgfyUcP9fIp
	syZdrVCQuFZwsgrA3UyN9dbR3JznITckx/ok+40rb7Son/KXQPIcP9RKBs+QSRCN6YS4VzhH4R5ej
	PVzCQxM620YzXEu4Aolzz8ifTCkVGlQb5J+aJvquZfchy7rhm33o/oFdtEuKL425LUJvTArEw5ahl
	V6pNlyK8yo4Y+P4TXqRlCLcZHLgNKAYwWN1ILPI/ytYPTLU83KlPaMoEsIuMQgKQOhBG2PQXOb+8o
	CPNSKkHB/+A3hM+bdoag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5pBT-0004A2-Is; Mon, 18 Mar 2019 10:07:55 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5p8q-0000mE-VK
 for linux-amlogic@lists.infradead.org; Mon, 18 Mar 2019 10:05:20 +0000
Received: by mail-wm1-x342.google.com with SMTP id f3so12435377wmj.4
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Mar 2019 03:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9GObn4uv/LM1BtjvUD8arU4OqaFNJ41INPjbZaoMAVI=;
 b=elbZGVcJhcGwRNgZIxl4MFrmm3gWFgEidwms3mu//qxVnxyLWaUvK8x0JTCCas+bV9
 uygsXyy4NhpyBEOAzlepzLa+3gZ3TE1IuZLdj3LkBWD+T2fNnjfe4aU6FpKBGH4ungEG
 BcN6EHyeLdElSOle77dCXFo0AAeNi3WfpN1yGSHnpmKuMZPqW2wOr8WN8OGweVQDm22Y
 hMfsQe/S3aKFPDBm/2apq/S/XXNXNPY0nTQH6hhC6+zH2wc0gD5PL/z3wo0q7Lf4gl9H
 Azdro+i70MZG76WXwNZ08A9bE4EnfglqlXWKYWCLFpvHl9d2T9riS05slJyOjUsvLAdY
 t7yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9GObn4uv/LM1BtjvUD8arU4OqaFNJ41INPjbZaoMAVI=;
 b=LoB01vldA7l4GOqkLT9NFTCTqvczlzCjph/h7G/xF5m8m2e0avBwk2H2om2GxGl+ap
 pGUFQxxn4khE+yCXVyJBU32qBW1raUVuqjZYb0A5Ae+vJGBUutsQxIv8COuhebhBhbmj
 N7ZONc1f6Lo2bx8Nyu6jQiEUvogxiiLEf49wl/fuUCki3F5ahfT1VmFG7Aqstbg8mxED
 70IoFZGuv4SknktKjppkY4mzERD3U7tHP2IguKBnC1Ki3Z1bxcNqQ2GPa2ZGoiYipGQk
 yiECZCrUgpj7oDEHNcbJeT3Y1ExfTaSaS3gMa6QL6R9HlPPOON2ZMfjD8al7vdtvmd36
 809A==
X-Gm-Message-State: APjAAAUWYbU9rttHAy6hI5CfQjfWs2EknyoiIKp2Hu+u3jvoyf7SNgTR
 sc+4pI4jynF7YVOQYRiAXfufAA==
X-Google-Smtp-Source: APXvYqzNvpG1L663xGIz3PBfy4ggoyJ0FBb/h7m17k1nF9dI6Gn3KC7L/AwlWHX5NQwvxVmTkVbjzA==
X-Received: by 2002:a7b:c4d5:: with SMTP id g21mr3826565wmk.133.1552903511125; 
 Mon, 18 Mar 2019 03:05:11 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id i11sm5216800wrp.40.2019.03.18.03.05.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 18 Mar 2019 03:05:10 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 11/11] arm64: dts: meson-g12a-x96-max: Enable USB
Date: Mon, 18 Mar 2019 11:04:58 +0100
Message-Id: <20190318100458.5619-12-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190318100458.5619-1-narmstrong@baylibre.com>
References: <20190318100458.5619-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_030513_369924_ABD1D090 
X-CRM114-Status: UNSURE (   9.67  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Enable the USB2 and USB3 Host ports on the X96 Max Set-Top-Box.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index bc152b1863c3..b9721bba9255 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -107,3 +107,8 @@
 	pinctrl-0 = <&uart_ao_a_pins>;
 	pinctrl-names = "default";
 };
+
+&usb {
+	status = "okay";
+	dr_mode = "host";
+};
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
