Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371EBE9A048
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Feb 2026 10:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KaBo4r7bRHvnVuw0enj6ovmbd7/+ce8vn9fu7zJh8Cw=; b=2R9W18ya3N4t2v
	4xxfp/ZJzOOojoxzzMxV9j9myIHXQO+yTI5iKyUVSmcge1f9tNtJl8xWsS4RShmTwkQJVYSVUpzyr
	HVy1C7S5l4VE+3nDIa7DoLCMTxosMTtMRrxQcBC5VM0qaNXhz3mKgv9yv6UWUoLkVLoCqz2P5GMUi
	BuxPZD3RiAsd24mj/fYinXjP41h9AF8XpchRngMWsKsXtABuPzcJqoI7CPwQiYAXFTzMxZy2CAF8y
	j0ICDXNwCWtm39eO82esDGgM31+UDwjuWYwoGwK8BbaOkxS7GqOwrNeb3NwhJ++5yeQWlkz8TLYnS
	RpVnzYiiDLFN2UtElLIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt1O3-0000000BEZS-3zwN;
	Thu, 19 Feb 2026 10:35:59 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt1O0-0000000BEYW-1N9R
	for linux-amlogic@lists.infradead.org;
	Thu, 19 Feb 2026 10:35:57 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-8230f8f27cfso384727b3a.0
        for <linux-amlogic@lists.infradead.org>; Thu, 19 Feb 2026 02:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771497355; x=1772102155; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EYzdCHN+ZDO6pwEpgPPlsnEbhBhJZMjBDcc1b5CMUoQ=;
        b=BRD6vbJFyl28tymsvzYRzwl7dpTN2F7wMP69aCCGgY/Oi6Q1Y5+9wZqv2QFsrPLlZb
         sLv63KgwngKEFdliXs1Vv8c9E5i/0o8DTfGKjB1SKLxJzwgJ81q8RBPfBUz8a6f8sg8E
         ceO0arC/+Sk4kG0dyEYo6J76gL0SkLrfM+sC/QpTdoIUZvMB4NCfUA7RU+QrUz9aXoTJ
         zr95x22k4gQqp0AHLOxUx/Hn8dIKxP68DK5czJKs9fJ5Qs+QfvCAgWvo/0bXRB9uCsR3
         KuG2WAbDQc+crjy83/4yjIfNXxYZ9s2psZXkwL9LhDZvVSdFAAayDPJMNMd81tZA5fvA
         lHCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771497355; x=1772102155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EYzdCHN+ZDO6pwEpgPPlsnEbhBhJZMjBDcc1b5CMUoQ=;
        b=Pug17myJ66vqd/R4gavBzXflJKD+KtH2oNfgQaqgxrWimGsb0keKKsAFguHR5qTCb+
         Ge+7TH+SqVu4GDv2fStDXLUmmxl4u++0wVtWOUBjsHzL25mfpDBSgsFklYAFHRAL/jux
         N/kwJ3J4pnykau0rNLWUkieZMjCrFDHeJseBMZI/fLzmLAu9YBOYehnJT/AyAZTUjoFa
         BeV0Y8saXV2YLJq36RSujB9VmcwXFJuNfh4LCY4KK+sIblERq4gKTm2LYybEPkL3hIWl
         SKpzZiQuVJg23AJp+GgNyAnO62NplxTEl1vzW1xHs34ZdOx82gUsC7i2vQL7v4zljS5U
         03HA==
X-Forwarded-Encrypted: i=1; AJvYcCVnq535/FRbP/m4p9Q1lKRqVATSkRW8P2d1Wvnw0VA6xvVL/DxFNMcTs31n76CYlRrHkPTgLyg1vG+YNOYj@lists.infradead.org
X-Gm-Message-State: AOJu0YyHvDV+bqReuElnI/MlwXjJCC/py6y1gDPAd0qHSBO9sYiFt195
	zN3GeKXHTJP2mpOKs71Imvbt73C91b9BTi8ffQufbMi9A+imoe68oHIc
X-Gm-Gg: AZuq6aIJFuZHkOVgPl2qzAaANuJFn0G6qHxqBp/j0WxjelatmgmGsKI/DOKvbO9clRP
	xgXL0Oq/+hoUFfZZQX9aYz6z1UE4oEhJXcRiHwI/IGbwFUGYjzLyY1e9io9mV8ajd6uTt+fkAxd
	EjkJeVrSKq7ELfLRpI/QE3gVn2Br/gloCwWBzlu9WJTQo2VFHBNuCAvidnA0O4xvJ2VpocTsKM0
	gKe/fcdxKuiWWqYz5YfAYZulzpoW+p4B4kF5s0aCi3OtE937f/Fp/TSZrlrQjAWO69tCHMEcVcv
	znmQax6pmkmTQalb+Qhd4cZ/KLfIpgtLugYuioOIAZjXj33KHkVaXqKYWbJ7B47V5AuftYTIqvZ
	Ezq7s7p4sfLnIxq1Xhr65g/JDD66NNO9EFgBA7ejM6WhabtBamq++cpxNFICZR5xmZj0fpo16vf
	gFvn/t1cdk4CBkh3spm5U=
X-Received: by 2002:a05:6a00:846:b0:7fc:da5:f85c with SMTP id d2e1a72fcca58-824c95a2037mr18253105b3a.38.1771497355027;
        Thu, 19 Feb 2026 02:35:55 -0800 (PST)
Received: from rockpi-5b ([45.112.0.78])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6a2c881sm19780678b3a.13.2026.02.19.02.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 02:35:54 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH] arm64: dts: amlogic: meson-axg: Add missing cache information to cpu0
Date: Thu, 19 Feb 2026 16:05:46 +0530
Message-ID: <20260219103548.18392-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_023556_355258_9785CD3A 
X-CRM114-Status: UNSURE (   9.34  )
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

Add missing L1 data and instruction cache parameters to the CPU node 0
for the Cortex-A53 caches on the Meson AXG SoC.

Fixes: 3b6ad2a43367 ("arm64: dts: amlogic: Add cache information to the Amlogic AXG SoCS")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index cc72491eaf6f..f1f53fd98ae2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -72,6 +72,12 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
 			next-level-cache = <&l2>;
 			clocks = <&scpi_dvfs 0>;
 			dynamic-power-coefficient = <140>;

base-commit: 2b7a25df823dc7d8f56f8ce7c2d2dac391cea9c2
-- 
2.50.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
