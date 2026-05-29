Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8D0CD4F54
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 May 2026 14:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pQLzHVpcoL7V9HFT42kY8a3tB3fhJdYoiLJvnxfGqM4=; b=GogjisduJsZl04
	zQLUK7pWO3huzMZOkgVIYm5+wEcqip/vjGPXZYs9AX5mCpgoZjDCsIyMKq0FpGOkk8IenoWW7q87j
	4mOyqb99q66EWp5QNAMQ6KWr6QDOkLShloKvzf6KMdaq9+K70Q/hh6b7Vu3fOZscT98yN8UFBzPmB
	56t46iDn5pUfaRM8mmMjmgRXYZ+v1hHXKHePSCO5GJHGcJpexmwJjckWZ5zcaux+V8SWMsqMrhy05
	MphESUsLP7J8uIgXP5zKKNG5HOoOEwsWqo8jKey2gnwAaIBKTSss6dqc/En8n5x3ngnTyafbbk94f
	jjbY2+3NFteZTW+cp/Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxr9-00000007UQs-3zxi;
	Fri, 29 May 2026 14:06:35 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxr7-00000007UOU-24vx
	for linux-amlogic@lists.infradead.org;
	Fri, 29 May 2026 14:06:34 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2bf114b0cf9so10632615ad.2
        for <linux-amlogic@lists.infradead.org>; Fri, 29 May 2026 07:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780063593; x=1780668393; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGqxYO2Oa1YzQdRB279ndYOf99EMUYTgi9douNfsaII=;
        b=XAVI5T6ZyTYXzkQ1q4hvahSrHOQoRfNHdru6rvEwccmB6lEffvcfMi1RNHJsy+HnPL
         BEhe7eFn/IJVTyV3W1hNuWMsPqzl/ukUeNhRmsfIPZNZLKLK9zRmXnvHK1gADCELNeZm
         L6sq/NGY81L+4X5IEESO8wnNXdoKAxKP5TDBylPi7SVmfhS+VxSEAE0yPzpNRtWmqKJb
         DkEDiL6PNW82YudpPJmv4ILyXpZ/WZNkqQQJjoc7GawdrC2RYBjqgmxDHuI+I9d0Phsm
         xiBQNn+OzJLt08PoGqFwzsfu32k4B2C2vvvVX+DbmDWAottdPSGymdF0/jXki6EmCBp/
         q9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780063593; x=1780668393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kGqxYO2Oa1YzQdRB279ndYOf99EMUYTgi9douNfsaII=;
        b=socfe4u45U/ts4Lp/1wcNM7bXbjHiR13Eh1N5OmIWrH/mICZ01CsicFuZLUgJko9SD
         L38uxfX30YJjBE4NlieZo6rCukPtqwoeqRHsh1RaoGvxnqgLRoxHbC9KRPmgzumlIt0K
         k+5LTGm0faB8Xugim2Gbfd149n4sQtIJZjwCLKdfZXXKsq+vnwInVFiJLBWQ6b7SEteJ
         Aw1/Is4AW0nxuSlVjL5yVxDXzInY231y8uwXVrJmOGyItcd2N8ZQ0vhG6h6Yo2TkldAp
         AoLB1MUQcB9hbSooipxrLTb0qL5mOCCXrAf83EmaTKnmEUHe/SXN38r5Yb0pZFqxzvGQ
         G8Jw==
X-Forwarded-Encrypted: i=1; AFNElJ9eU2LlsyxDmfrpaPYsQy56v8pTTaYTFGXyBgv9rD6IglDUiIAHhQEihLaSiwDKmNOEHJYSeh16Q+0G6ZSp@lists.infradead.org
X-Gm-Message-State: AOJu0YzC1v2j0DrFtHk8c/qS49FbQw8GZasncAsct8+vfdwtKBtcx5zm
	xb5gTjlkDG7yYPFgedwPHTXMS1FY8lPzk6DaVeEpzrhfb6JulwrlUlRB
X-Gm-Gg: Acq92OFM1T89ahWfEIWGAwfYoRm9NMs1FQp7uR1yh6FVLZXbGtDr2HrlYDi36QqczAx
	xiDmSH1NcUG3PsCMFXucjIbzZuds77AZnhVnaBkwp7VItwsffH/l08lVegaWrqV5239J8p9JDvl
	RTcVgLAUVVEPsi+BHlFoFmLSA4GlRMKL/HchV/eHn3V4f8FU/eVUuq67F3NJAjAT+yDuz7ZM1Sn
	KmZ6k91Xb6jPKUebLQAImbQCOoe2k3dCj3YF/QwOwe2/JBU4U4LKs3m4jFrooDtCWRANxc5w+pp
	RGjtDeNf9ge1rdmqiV4bSpebZyzZKys7BY6YistNuwsWE0tGO6ACSz8PMMAPX8j+brl0eu5LIjR
	uynmxNs5h4H6LhuY4VH/68WgxGFIWHK2xbavP35Cfgn6ry/ioBJi1aGZHbnUNNWkLYKZGvETsn7
	56sXWVAck0x/uNjXld5m6AX5QxpQeCXNmUl3Q5hvBM4iPPUIILr749He4SaMf+
X-Received: by 2002:a17:903:1aa4:b0:2ba:9e1c:7cbb with SMTP id d9443c01a7336-2bf20be24e6mr40686275ad.34.1780063592523;
        Fri, 29 May 2026 07:06:32 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a5f:4fa1:cc65:18c0:209b:38a4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c51f80sm22926645ad.80.2026.05.29.07.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:06:32 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: amlogic: meson-axg-s400: Enable pcie_phy
Date: Fri, 29 May 2026 22:05:59 +0800
Message-ID: <20260529140605.1070764-4-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529140605.1070764-1-jerrysteve1101@gmail.com>
References: <20260529140605.1070764-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_070633_533311_AC4DE389 
X-CRM114-Status: UNSURE (   9.11  )
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

The meson-axg dtsi now disables pcie_phy by default, so enable it
for the s400 board to support PCIe functionality.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
index 285c6ac1dd61..7ba249cc3d56 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
@@ -448,6 +448,10 @@ &pcieB {
 	status = "okay";
 };
 
+&pcie_phy {
+	status = "okay";
+};
+
 &pwm_ab {
 	status = "okay";
 	pinctrl-0 = <&pwm_a_x20_pins>;
-- 
2.54.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
