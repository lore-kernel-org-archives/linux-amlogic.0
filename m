Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE5AC3271F
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Jul 2024 09:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L3x+pTuO+8EF9E9CpP/YS2xwh9gy2xHMfQQ3LIGbAHo=; b=2mTOBgrwgHRYLi
	WgEBFpHguwbDYBTFfxkC57UuzmNH1CUMnU2Im2/3wQuXmmHSCNt5XABtrK7ViszJJ1lAqQ4HevSTd
	0noiw4CgC5CmYhvHNsEOvRgeNuwCrugm5qmBCfCUs5m6HeWYEcMPZu2cQbDVRsUko8CIeCEsRpuoM
	wqG8cZpL5vW54hIm13gaCTHgMcgc9TFvlkkE/fQXYdfwDqyLsvnQhr9JLQzLpl0r9g+SZZra2z3zS
	EJIQUaF0BNPmnjN5GPCGwdEgvoy99TIPYC2p5uWo9MCBsj7X+I68TfsaSrwTiCR1CJT+plFNhQ80O
	XjykQ1R+aPPZvX0RlynA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfiK-0000000Fa2m-1Fo7;
	Fri, 05 Jul 2024 09:58:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfcq-0000000FWmM-1Iy3
	for linux-amlogic@bombadil.infradead.org;
	Fri, 05 Jul 2024 09:53:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=HewTxIxxAw4d0VO0IzaF9nti4qYjTs9zA5y2utlK+JY=; b=dJHGfN1Z7/vAcaCRIKagzhdgxt
	HDOSD1ckPmNXarn36cg6pFN1cpkkNAzN4G9dWBeTtrgNlZsD7XvzCZKcUNFzlcBTBYrC7LDG5l3N+
	OxOYGzaOiJ/BTX6XtPFH21vUsaG55TbFL38FtwEio28Swfxb0a1TvjynvghbFgYgFU/X955u+IjPK
	I0SaSvw92dHT9G9BxLzCjY8Rq+Joe13wiAyLcZvXqsZQffMz/KI1XBO1QCIlx/kpSS3XVFFTZPttl
	tQi6yHqDiGOHb3pNqNlUlKhYqrCBP0dnl2a57jxDeMfm8Y03+24rJcMS5UeJDGtP1ae1r/S863jaA
	9lr09N1g==;
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPfcC-0000000AJV7-1DGy
	for linux-amlogic@lists.infradead.org;
	Fri, 05 Jul 2024 09:53:06 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-52e9944764fso1720082e87.3
        for <linux-amlogic@lists.infradead.org>; Fri, 05 Jul 2024 02:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720173145; x=1720777945; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HewTxIxxAw4d0VO0IzaF9nti4qYjTs9zA5y2utlK+JY=;
        b=YDfcobu9Jg19Ci+rJOhm1D1uCQENjvt5giyvtcikUku9y+qcZ5l81wal+lo/uaUmJA
         HVdbMPgdHELsXvS7ellG44HWKymEUsFJNG9pCsb7XVEbtiHRAwrNfLVSUZ6bK/N1icZr
         xuvky8Qzmp6Obj3dU3gJekOjblpLgh2wTM2Hy0oFiOAKnJ/0mes9a9swuAbCgr1bE1hM
         KSSS6+fByR520SPIlfzSOnomt7aqF4DzauryuNhdkbkxb/bVcJ90x6nundk2fyMdVqpn
         KjL3V6av3uCMXfygy04FrlSR2B2i85lp0Ah9hmwDB06BhFwHIYuXKwCkYgNwxQeniXX7
         OPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173145; x=1720777945;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HewTxIxxAw4d0VO0IzaF9nti4qYjTs9zA5y2utlK+JY=;
        b=vP6NTIC61o3PkHx9SkRRA3JTnOjhVCpwRklJXp9ivA37lbIT+sr1bFswGBxseIchmU
         vR2zfozDUDf5V7VJGXPg4lmNZjph7MkHvLRKf+0zkz0rbNvfN3g64ln01w6ac/0coSFN
         c87ZtL2YeMV/+Gt/lXDtTRKHc0kg58W0xnsWVq1RRIZ+RCgGoojcZkR30Ryc2y8fcMO5
         FpXnPrvhXpm3IOHZ7tPdGAZL/MIl+rvAlKpkBUZHKbsWbgYCqI4/T7FN0X5UTwsVJ9SU
         fo6ie//2lH1JW/dbNWchmOvuKSXzJqFkmjrgH8MQ7fdbYvyzqTfHnaILjwmn2KzdTM2m
         Qhrg==
X-Forwarded-Encrypted: i=1; AJvYcCVqsPxV8xcNqEpNpMLA7S0LHd2JBISdk3w+ff65/JCBoWT0Q2rT2Wf3hzzu//Q0XIOyVCaJ2uT2Z/6hTmxYIa/NwffmQCoRrYMt1QwRHsL49IA=
X-Gm-Message-State: AOJu0YzNid2AmVLijoMQ+33vgUcoyCQWjMWE5rysHW00geIJ6GsGYqHk
	WEZXTRu1g5gQ3kwwphW0vBGw/Lx7NKHLFLNm0ViRiwuF3Ad3lg7fr3+THxhMgSE=
X-Google-Smtp-Source: AGHT+IGNfSuHZVFsjxGRqi721AgFHExWikVzZX/wJrHfHopGLF9m4l1eGZxSOMp6gJxffsVUPzQnDw==
X-Received: by 2002:ac2:5e2a:0:b0:52c:e112:4b0c with SMTP id 2adb3069b0e04-52ea06133f1mr2313228e87.9.1720173145308;
        Fri, 05 Jul 2024 02:52:25 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d1650sm55528995e9.2.2024.07.05.02.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 02:52:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 05 Jul 2024 11:51:36 +0200
Subject: [PATCH RESEND 17/22] dt-bindings: thermal: sprd: reference
 thermal-sensor schema
MIME-Version: 1.0
Message-Id: <20240705-dt-bindings-thermal-allof-v1-17-554061b52fbc@linaro.org>
References: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
In-Reply-To: <20240705-dt-bindings-thermal-allof-v1-0-554061b52fbc@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1295;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=TGEUdfIgxrn5p+oeEOU3I8iRwVeJfrhCUIuhAZVBvgE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmh8IyLM7fgGzrFDU4lF7RNxv6EBHPu6d7Cyz/c
 4CXChnXZxeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZofCMgAKCRDBN2bmhouD
 1/CkD/9EEtVLnTR6HLb+RQ8ppD8kzzvgKrlRWNFNyulVlT+RxcwDrdvWUOKWp0+Wy529rcI+BQd
 kgGT76Zk08TYdy95tjLeShJw43znJlBAgXdoQpqcMYdANi3Cy7qwy1KuhaT6REsKsYLl0lTGPWn
 xdB96EUooRu49pYHGDExtWpxE1bboFwhGkQhF+U0yk3BZcPnT68Z2cPyDn+kkSjor1+eq+SLhdd
 KgnODZtv+sqS7FXy5GBAkZn5nBTKg/Aw2FN8rGyKL9DEjZxD0r5au7pi+nhVXXRkq9l2Qls8hG2
 q/OlwGwyhik9vnJmJGSEyqJHCQ5LeXWicHypvDdBQJI6NgYYxTXP763jyentekBZQgxNuKHhLKE
 kd8C7mWcvTxwQ/uYcQI/U2CUJmCndTpCjjqJ/pdfKQbt1Kgh41Ds+H0/iO0vtdvc7ph8O4lzV5n
 jR7OVueGt5+DFCEHEoQC9Q3bzDKkn52XbUixejyhNhyiuMs/MEYCxMwYW/jmOUKrCftEOFwbpFA
 6+vWwyww/34OR0DWbkr/f+2NJ0eIzeGTD3SI+t2lKPKRStxxS7J0ay86BxJeMhFy+lUpBuZUa5T
 5HhaVeWBMzKTDYo/rEBbLEUVxxJirKQgaBLueIQGp1+kir47wZidQZjkUIScpS0pSFVzMsTMbqH
 Z6z7AANGQXxg0NQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_105232_122681_0551C395 
X-CRM114-Status: UNSURE (   8.78  )
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

Device is a thermal sensor and it requires '#thermal-sensor-cells', so
reference the thermal-sensor.yaml to simplify it and bring the
common definition of '#thermal-sensor-cells' property.

Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/sprd-thermal.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
index 76aaa004c8ac..f65076fc68f9 100644
--- a/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
@@ -11,6 +11,8 @@ maintainers:
   - Baolin Wang <baolin.wang7@gmail.com>
   - Chunyan Zhang <zhang.lyra@gmail.com>
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     const: sprd,ums512-thermal
@@ -77,11 +79,10 @@ required:
   - clock-names
   - nvmem-cells
   - nvmem-cell-names
-  - "#thermal-sensor-cells"
   - "#address-cells"
   - "#size-cells"
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
