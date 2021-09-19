Return-Path: <SRS0=Tn3k=OJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 665D3C433EF
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Sep 2021 21:32:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D72060EFF
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Sep 2021 21:32:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D72060EFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dVDvyMXVRkSlG8OGIjNF5wglp8E44WRUCFkd6wzUnhE=; b=mFAhRD8fejS65j
	ZqBoWwDUwlKmV5iTGl2BgXUPLp1sfGi8Xn6NkSjJdh5zJa6kIwEhWOaNL+/i9ToY49iBMiIcCD08H
	PuppdBpqDjcb7zJo0XqMO34k//upG8LMI8Zce2hnSZlAVR3sHcLSZ/a83WxNOYX+z8tN39yQmx7Fr
	e9nAlQcNkrxlADL48l7tNbdvyOOZWHTXRadfq7mQ22sC1tsBtZbDX5BJ03Te5ykYR7dtrHOn85Das
	15fuKA0ZE/JPdww9tPcnQ4bRTq6Bvj4er8mZ4VLFvytDnA7pkRNw4P/nbXouMM3aVXrZ+NAMZhd/B
	7LShMGVUkuS19RARTUMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mS4Ps-000F0f-GM; Sun, 19 Sep 2021 21:32:04 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mS4Pf-000Exs-K0; Sun, 19 Sep 2021 21:31:52 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 k23-20020a17090a591700b001976d2db364so11228099pji.2; 
 Sun, 19 Sep 2021 14:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S5wcLSMUUek1zUXBGHTi9rruAn4oSmVgDe1fOAA1Xkg=;
 b=Y/N3J24yLgRRME487s1w+trnRf3GM3/ZCj+Rz0s4m3s5uVhn1oKBO4wnKRmwVf2M+Y
 ofxcScY2nKHlydUwPMx4fL3DH4W14o8mAL43MB2rmcJkE0gMakXGyW3+8CJ4OZUeK3Vw
 aUZS4plpLVwhl0dOlAsTMQfmF3ptb6dnDti2Gigp4awhgnvwVM+1hyiM4s7r1WQcSirD
 8CCBnBdkuCIF+4sCpLQk7nY8fABo4jJz8NjuxXBqq6o8XbrEnoT7Xc7qCCi346YFJEbC
 yYKL629szenYQULrk3mL1t665kaNh/77sedCQIce/Z87Q+RxcKAARLDY1JEfTgaFzWLM
 dVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S5wcLSMUUek1zUXBGHTi9rruAn4oSmVgDe1fOAA1Xkg=;
 b=DLbBjYiSx8kFZxmu2Zh08RLtDuWq9Gh1h33t0rARyo6b/9saaj3onk0apPxRhxjcGo
 vR5Xv05ulD39Zdyq8wikaxSf8phrQxWcagss3vESqub+rN6nKNE8XkLt02I73nyYKEZz
 ror2oOFbwO+xzNRXygxUtIt4z/9wWF8qTpzmO8ll0RODfr4Hn7rVvDaw5V06ys5iUsnX
 VFyeoNtOyIlr1PzZZJbBsJ8mAcw0qZEiSzyhZcWKdkiAnYPhyA34wdTWkhYBhymKZ4+q
 1/3YNHweoaWx+ePh35D14T54R+s8OOhKorqo2zpcy2JsKDckvV/ZK+9u3CW1P1hpLXW/
 pQ/g==
X-Gm-Message-State: AOAM5322+4LVqqH4wKNbTVRgTqplieCs4B54GKP5AtIvAmDUzUBFlyo7
 fcuvMhWhS562WZSgDYJXKt3IVFVb7Cz8kQ==
X-Google-Smtp-Source: ABdhPJwJdFeXtYKqEAT69skINXiw+B63LnASvCir2sKFfBwsrp57j29JzZL2xt/mcCWwRHR8uXQQIg==
X-Received: by 2002:a17:903:22ce:b0:13b:9a00:f090 with SMTP id
 y14-20020a17090322ce00b0013b9a00f090mr19799864plg.11.1632087110550; 
 Sun, 19 Sep 2021 14:31:50 -0700 (PDT)
Received: from archl-c2lm.. ([103.51.72.29])
 by smtp.gmail.com with ESMTPSA id m9sm11973459pfo.44.2021.09.19.14.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 14:31:50 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: meson-g12b-odroid-n2: add 5v regulator gpio
Date: Sun, 19 Sep 2021 21:31:34 +0000
Message-Id: <20210919213135.4928-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210919_143151_718846_EFDDAFE3 
X-CRM114-Status: GOOD (  10.33  )
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

As described in the Odroid-n2 & Odroid-n2-plus schematics,
the 5V regulator is controlled by GPIOH_8 and in Open Drain
since this GPIO doesn't support Push-Pull.

Cc: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
index 4f33820aba1f..e8a00a2f8812 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
@@ -99,6 +99,8 @@ vcc_5v: regulator-vcc_5v {
 		regulator-max-microvolt = <5000000>;
 		regulator-always-on;
 		vin-supply = <&main_12v>;
+		gpio = <&gpio GPIOH_8 GPIO_OPEN_DRAIN>;
+		enable-active-high;
 	};
 
 	vcc_1v8: regulator-vcc_1v8 {
-- 
2.33.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
