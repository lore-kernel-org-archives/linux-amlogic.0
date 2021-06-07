Return-Path: <SRS0=pha3=LB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B61C0C47082
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Jun 2021 06:55:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79EC761208
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Jun 2021 06:55:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79EC761208
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3eEUWSTK0+WIVxbi0kLpm1AEWpkEhAK1WKouOLPVz0o=; b=ZISCQwlIn0dP0m
	kkgwWUJWnSRLteR3iELiDVh11IlLQm68dRPJZ8N+Xmw+BHLQWsGGXp0aqDVMnNkGOEbdX3pMmQhVh
	eVJN3/iY5R0iakomXOWVO52Eb1Bfdyg2LdSL6B346QLRBLUV/HK+GF7uqIjEPBjPd6Dbq6dfyQqtG
	ldKH7GHqu1Vx6ByBCaXptLczq5UCos8XXrADbURhvyVgNs77UR9BQBKMAPzMGoeAw8SddGrORu2/C
	fq+TRaz5ftoHqQeo0mFlW0i/PR9zR91HViMLDOCbQK1Dp2EjYZ1FNlWYISngWTloKmSMLJfl2HiJ/
	8Xt1nfNvMFnkyGUPugEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq9AL-001pYn-CE; Mon, 07 Jun 2021 06:55:17 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq99r-001pP6-Qp
 for linux-amlogic@lists.infradead.org; Mon, 07 Jun 2021 06:54:49 +0000
Received: by mail-wm1-x32d.google.com with SMTP id f17so9277286wmf.2
 for <linux-amlogic@lists.infradead.org>; Sun, 06 Jun 2021 23:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cRBSOx180b/8yVnDTJgXllPZieNx41tmIQu1Fr+M/y0=;
 b=fsRDhwznO0x5xyw455Mz/u9rpjsQk+roBybCUodlgB79qyjxwSPOIOWhCdOwOovxzb
 jUQ49quTUCJYZFKlckYneez5sj1A7GQA1DT1TBpUTFWpmCkrswqjp2FsK4CaAOg+43Jp
 Ax1HAG17raxgZW5CHToxCTxgQSheBCqgwnxNCKs1Kei/8oBHP37ivsN86/eBMZ6YJR1n
 8tirequ1SrWpLM1zAFHg0gzeugfeDUdbKGFo1cWX7YzttoFqRzzrtwm+RR3HBW/2jl4q
 djj3BjxZWeKxwdCv3Q1pytTUVQywfFjLvpY3vPR32yyINBb6DaLoonm632PcnIoX64oK
 8aaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cRBSOx180b/8yVnDTJgXllPZieNx41tmIQu1Fr+M/y0=;
 b=omz5RCFnsTfp89Kryyrn00mbwsy+vnDTpWxvzOvUqVJ0fZsAaPO3N2Ryk+PErphbe7
 R3cICdjsPkhjOo0/SShaLFmm77KTVaUtV+GaY1kR4h629qfSqbSPxGbPEfU+QhoreuA9
 UTe+0trAmifjp4OWCyGwtoklsTHqOZk8dRYnTKM7S9XE3NyqbDpc8cxqJwSYQAUJn2GC
 YD35XkkulQ6+E0yg38lptqbXldzXrM2aXw+gddl+gIfDMQG/RFEeiI8jqSbQRnswBLz8
 CWFgxOj8HExweoSm7EEDai+m1AWLgmtuUAcbeW7Sq1NJD1EzpWurBr7Sk1mowfCfb1Y3
 7Ekg==
X-Gm-Message-State: AOAM531lqFoe89i1qD/vyOV0CABZKruPHfDnJqwXf+hB3nnkX4ick/3u
 gDu6kTxjUjZ5uVU87yODSZWT3A==
X-Google-Smtp-Source: ABdhPJyDGxyR9IzsEaiyY0U+isINphgNDkB6KtHKRrnbNjwJ9w+o/v2PB/imHNlCNV3+IFKvhTVhiA==
X-Received: by 2002:a05:600c:4ba1:: with SMTP id
 e33mr9597480wmp.39.1623048886601; 
 Sun, 06 Jun 2021 23:54:46 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:7c1f:1c9f:555e:7398])
 by smtp.gmail.com with ESMTPSA id
 l5sm16145742wmi.46.2021.06.06.23.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jun 2021 23:54:46 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, tobetter@gmail.com,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 3/7] arm64: dts: meson-sm1-odroid: add 5v regulator gpio
Date: Mon,  7 Jun 2021 08:54:31 +0200
Message-Id: <20210607065435.577334-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210607065435.577334-1-narmstrong@baylibre.com>
References: <20210607065435.577334-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=854; h=from:subject;
 bh=e5HwpRzORbnYCuuj9Al0sdpop+blxy0nlslXu8zzo9s=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBgvcJArOTRfLm5KMYAm4Gk49/w4dTCgkXImCBFEesY
 MA5e84SJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYL3CQAAKCRB33NvayMhJ0fEdD/
 91Sbp+cA72Pa1nKQjFl4lIyHt/uAm83qdGLx0WpyJ6guR2phAa8I79ISM41G8ccSTWjUXTvnoIwWq5
 zAear9Ja5GXreXstcysapZEqjCuMKgiLQzfXHN1Qq9IifFbv86GoS/VmSCS2BQ8wMR9ke3UFK3QlGj
 25F3U2NI2/cNsWJVLlfg51VD02zHTLidIWw/GHVQK+ePs5XSeKjxXtS36qt0f4PvzGICHAQekeYim1
 MvbP+wfiC9z/BC59AVvvIAJn3tkRMddaNmVybsAJNN1pUhcM8A9Vx0/KPAg9n/+2gbjy7J4oKWaJVA
 t1ve+pHW80lsp357Bwg/Rt4MYC7MRQZmNS5PKMGlXGph0/mqJxpKFv0Ed36+4WIofFO19khQMEiv49
 m8cQZtaMD25pCgB6zz2t/u2Duw4/gi5w67lrUbGFZ7c8VPE+FI7QNkGmyHYna+Szv8/pko6O9dYQI8
 dOUci15YFBMLN+6HQ20nvbowldNlL53X9ROTiCHN9MU7dpYcZY4aSQ40eYaIwVYDiaw4u34yK/M3u8
 v5W8kaZcFXfPQAhnyOhs2Vgj+NU9KsZUiYXk96Xq2bxgwJJ0evWDY5aPdGVio5TUwo/vD2IuWJNAIr
 sKoJkK/AYneNZkZj7CXBZkoCMrXzwyXKtrIK/0jwRArZ9WxHKiMcBMDnuDHg==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_235447_905291_15BCBFC4 
X-CRM114-Status: UNSURE (   9.56  )
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

As described in the Odroid-C4 & Odroid-HC4 schematics, the 5V regulator is controlled
by GPIOH_8 and in Open Drain since this GPIO doesn't support Push-Pull.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
index e64359163331..fd0ad85c165b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
@@ -83,6 +83,8 @@ vcc_5v: regulator-vcc_5v {
 		regulator-max-microvolt = <5000000>;
 		regulator-always-on;
 		vin-supply = <&main_12v>;
+		gpio = <&gpio GPIOH_8 GPIO_OPEN_DRAIN>;
+		enable-active-high;
 	};
 
 	vcc_1v8: regulator-vcc_1v8 {
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
