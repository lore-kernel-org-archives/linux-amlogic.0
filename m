Return-Path: <SRS0=Pv2c=KA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA8F0C433B4
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 May 2021 07:33:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EE0D611EE
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 May 2021 07:33:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EE0D611EE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bA/ZYXy5qMR/xK6nWmRJ+nkne1+jcXLZnU3Me4qhlNg=; b=TV8s5e5riaTJHdkXJltUDxfLz
	JECXp0CwP6xztFsXm75ANTjt4aK4Z3Q8t8pginHuRTUx2e6hW/f8UDdgTg3LjySZtMb8Vp4yVLnOh
	ySCjEUumOtQ4qDke66ROgQIVQJ/4TRQEiLwAJ5TApL0AISZoZUkdTbGCc8lVsAYZEeYX0quQJjBtd
	EEbm9bZdVt2B+RQLc3tFCHnjtvTtiHaZ2AqDYvijwkyFE1S6H3fhKC2tw2OLLtRrfjUB32S1Qv8ZZ
	SHVb9ZF//dREBU8G7NX1eaLwhcK3rea0wMNYMu3lzY1ZEcLY+2aOsADFmDEUSBsVylfvjpTqxfS+3
	uG02fxO9Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leC1o-000UKV-Ef; Wed, 05 May 2021 07:33:05 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leC1h-000UGK-IM
 for linux-amlogic@desiato.infradead.org; Wed, 05 May 2021 07:32:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=dAsKBCUtWvT2TBc5FQFA2vVLxfmKKkbA3qujbzupPfM=; b=v8NKn8C8l7bG/IXtoS619/tNAT
 jxrNdEfZnbunOuCemE7gVzTwrGY+D7GkGlcNH15YxfF0dxxgjn6zg+plQUL/eFDauD9dEMVCuBHZo
 JcdSJQr3nZVbYvY4YL1Bkw7hin0sIk/tInTU+8qeR1n+srBHQaBdAjRCu6h2mGloc7CLFYGkOBQWD
 1jV35j9x1BJFUFzS/QlLHLgk4zdPl5KqOl7ew3Cog8P45mqDU6/HkK4M0h/vpcOpo/VYZdZiPYKhR
 r3e8N6ANJ2UAOSZPY5B+y9w4Y1Rk56vyTM2rSv0c+xCosYCKX7qV3FBYIptMgWSfblwMx0ubQY9vq
 ad2adf5Q==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leC1d-004XCj-CB
 for linux-amlogic@lists.infradead.org; Wed, 05 May 2021 07:32:55 +0000
Received: by mail-wm1-x330.google.com with SMTP id
 b19-20020a05600c06d3b029014258a636e8so499159wmn.2
 for <linux-amlogic@lists.infradead.org>; Wed, 05 May 2021 00:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dAsKBCUtWvT2TBc5FQFA2vVLxfmKKkbA3qujbzupPfM=;
 b=iINUI414yX3eussPTaoAOO/pvWn2l543f33G792rYFl8TrHaiBlx0oOXjW8Zoru1bR
 m5Nwmv53xQzUcZFoN8y3HJgLUZeBCvtziEGuxH4nhY4t8jwW7IHLgSLbGUjGLeFUlMmf
 zNaOCRRBS1ySiIN+sZv4zMYTGUwYSXZylbFkb9wzX6TCSR4NY/bc6Avan0J097BrbgNC
 ILP3MQ0hccqeSDX7z9Lxz6ikB8U8Sw+Cw3QUmmsQnlEYlsF878h4rXO11Gn53LpJiIfi
 89NVprSE8XcYcM4qXI+8k2yfAZoumAtknaaad1Tq4vENs7GKa6/sqalADa+y0rjeKfp1
 fxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dAsKBCUtWvT2TBc5FQFA2vVLxfmKKkbA3qujbzupPfM=;
 b=G+gH456xlcLYnkpsT7RR3n3tKyV2js9mL6ItLxgGQY1IYJTPQZzdnTt0GMJ1NTA/z9
 U6vlOBmuGWfGpcHGaCLGK5keuwsHf+mOyOPAyGmumwb9WpmJFcZ8jSSx+G7B6GHhFHnz
 3t+VPGMWPiWrkeEr9KUvMfsxMg5I92GEqmE2abhiPcHh+pzd4ePasZlSQzQOW0+hCkmL
 ZDR0RZWLJeOukYdyQABZbECbZ8TtC+Kli0ZA7TUlCXR8euFG2QBhwgLnswxmhR99o+IJ
 6faT8RW6F0XFYOZ2oHnVt1EJrUW6UpLP5smn08O93nUiukwBbMJK2HhNBbiJwjM7VsKB
 fCUw==
X-Gm-Message-State: AOAM530RfiVcaYh+YzCNh2PG8DY9N4N3o+EPq89Zpx68xxEeiFuJh3IH
 2C9DJb52afBKb3AZXAGB6B9aMA==
X-Google-Smtp-Source: ABdhPJzqHOMYla5K+XJkfuTYUrMwN70FjFmu1iVV0CWcNwNdmacC33Gs82x7AwQkSoUY5EDQEJXfYw==
X-Received: by 2002:a1c:540b:: with SMTP id i11mr8478873wmb.40.1620199972006; 
 Wed, 05 May 2021 00:32:52 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:6eb3:66ab:cb1e:ef0])
 by smtp.gmail.com with ESMTPSA id
 v20sm4965663wmj.15.2021.05.05.00.32.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 00:32:51 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 1/3] arm64: dts: meson-sm1: add toacodec node
Date: Wed,  5 May 2021 09:32:46 +0200
Message-Id: <20210505073248.3816183-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210505073248.3816183-1-narmstrong@baylibre.com>
References: <20210505073248.3816183-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_003253_428949_C163B783 
X-CRM114-Status: UNSURE (   9.71  )
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

Add toacodec node for Amlogic SM1 SoCs.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
index c309517abae3..3d8b1f4f2001 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
@@ -401,6 +401,16 @@ tdmout_c: audio-controller@580 {
 			status = "disabled";
 		};
 
+		toacodec: audio-controller@740 {
+			compatible = "amlogic,sm1-toacodec",
+				     "amlogic,g12a-toacodec";
+			reg = <0x0 0x740 0x0 0x4>;
+			#sound-dai-cells = <1>;
+			sound-name-prefix = "TOACODEC";
+			resets = <&clkc_audio AUD_RESET_TOACODEC>;
+			status = "disabled";
+		};
+
 		tohdmitx: audio-controller@744 {
 			compatible = "amlogic,sm1-tohdmitx",
 				     "amlogic,g12a-tohdmitx";
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
