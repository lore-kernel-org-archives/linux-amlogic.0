Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ADDDC25B75
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2024 08:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LWQraaxCmQwTdMhGIk1ngI5I76oA7o9GjxG3VeAUbjg=; b=v+UJkz/1h00hgg
	OACApjuXbWXnYDFQvEW0ofRpV49aYkVO4hKp0nQzflezbfEcuhvXCvfIR6mFeHkMhvrquEklhbI4Z
	d9EKu9JMSXffkV+Jgl5k1rAI3DSFxlPe4DHpwJX48lXd1u5MVwLuAVL2+Ggz7V/3/uVmM67w2RUO6
	YWEM3TEOB2eSm7y1JomOBmHfQEiLQzYV5zVCKC2rFyYVsU9j0eQNmHJe+QpBWtRSZKMWvWmpGhv2s
	XTkFatMsMmykBunJi6VdJsVyYUm/BQ8RsScq0fN0+gPg5HBAqoW3W8R5FHKqXw9KIJ/09c+t1pEdX
	HkaNdhYFZep3CZJrWh/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8ns-00000008ump-0oJF;
	Thu, 06 Jun 2024 08:49:00 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8nI-00000008uJm-0tE1
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Jun 2024 08:48:30 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-52b8b7b8698so877331e87.1
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Jun 2024 01:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717663703; x=1718268503; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=27gmnNsoJ6HXtUPU106pR+r/c1X658WZeUED3nGHh/Y=;
        b=SduKQ6zqDw7OjVSYZSArkILhz44vwd3Y+rvMPSO/zhaVvCxzQYoTyMaF1McZtqevRV
         v1xFwrypCVDy/njaatpkgbiSsjS5xe6rRfQvR/NHogUQRS5sIgMt2XYqf1R9+aNfSz0Y
         d52xoReIzn5u0whD/gSzQmreQ9JzV3SrI2kpcHAvgGj+cqJj/Mt4RYcJaAmOSSPpj8nu
         /VWcmDJuHEjmc3mDHDHi6dcwkkxrjCgx/sZao7rv4Orcc7gbAQYsECcxfAWR/bLkoqQd
         RZpudqRezNyEBkFsG29BibJaoUQXRsDhqSBlKy+IvBv2sd3ERoyd1Q5OKEzraVZwhbvD
         7saQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717663703; x=1718268503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27gmnNsoJ6HXtUPU106pR+r/c1X658WZeUED3nGHh/Y=;
        b=quxyYVO9XbsAwpLfWTZg6swxqLlQY+ZajaIl5jSZTr9w1jHjo6OK/1nrs+DYmvVJhX
         FzWLG2P7foC9fsaSVOA+7GNl7ACCDYKDlvw3TrBOAyC1g+hDeuwYIrmdMsNl017RDJDp
         JCevZUcjsw04GWmWtzjt5KPX99QUaRTRhoGMxFI39dxLwpRSVTrHNBJRTpeMdUWwjlDh
         t9pSb27Rx34GkYYEJpT5K3/SjvSUAQ2/d1Q8IrEhE7Hp1Fkxkkf3xTHW86CjUJ+IwEL+
         LkYtl4314d5Xx/REWid3YmfbZCRdZ1eI9QwMBHY+TrFSv3Lz0KDJJ9l24yqhYOMn2o7x
         Qwdg==
X-Forwarded-Encrypted: i=1; AJvYcCWoxIRWofkBnoZooMTgjcE3DXsZYoUchfPSKNLlgcr13f0gXdrdAlyzCgL7UH3PY6XHyO1om+FmNQR0IWmjpAD+ICKj1lQzbaeBH/yFFfLMWSk=
X-Gm-Message-State: AOJu0Yzh47Cai/Ht9wmZtUcofLG1bGtjChMQk1LFYQJou/KeyMxUNcIv
	+83FZ7RuC9pnaCrrlxcH/NT3UFDdG8z9h1RZsh82RMpfVB+Bo9rothlLt/FUyqkRR7WGPxqdl0L
	j
X-Google-Smtp-Source: AGHT+IGXDaDltuNvg0lnLePu7p+2cIQ5/S3LaYhvqarTkyBrf/S+D5/CYg6sscw7EIkStVWmrItywg==
X-Received: by 2002:a05:6512:2255:b0:52b:7a10:4690 with SMTP id 2adb3069b0e04-52bab4f94abmr3324133e87.61.1717663702699;
        Thu, 06 Jun 2024 01:48:22 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215c2c690dsm14227445e9.34.2024.06.06.01.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 01:48:22 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 06 Jun 2024 10:48:15 +0200
Subject: [PATCH 08/12] arm64: dts: amlogic: axg: fix tdm audio-controller
 clock order
MIME-Version: 1.0
Message-Id: <20240606-topic-amlogic-upstream-bindings-fixes-dts-v1-8-62e812729541@linaro.org>
References: <20240606-topic-amlogic-upstream-bindings-fixes-dts-v1-0-62e812729541@linaro.org>
In-Reply-To: <20240606-topic-amlogic-upstream-bindings-fixes-dts-v1-0-62e812729541@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3277;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=23uf+y06e6zrelJODSL+O1c7OCV/TWnd4Br3Dn6tpoE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmYXfNU8ucarOPkFh8o6TGaQoMaB26+xAPHT38nBTg
 Rbm/AjuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZmF3zQAKCRB33NvayMhJ0Q3CEA
 Ckw9qqht8eI238qxR5P1bCG3tBQVZ0hC4gZzckFjYm6TJLzPl96awB59aa7kt8FWbTPVe5qVW3udqy
 tsgd1aH8Q1GTlNe8264ESOtPHHZq1XF0VbTicSVj41ZAgurVbquyo2rkboJzWOQOn8VoBUQIJ+vzCf
 UKpSmpTe6xBdnJnYkyZn7bKFlqJS9wFpEmTZQb64/seSm7Dk9h+Eh3pd/pSHjtblCY0zDsKtoxNRvq
 u/P74ZSsIbp2W2hPleyoICoDek+DpzkoJsdpJUfTioLLLzY82xoskn280TyXHgGqPRTdLz0y5QOT+g
 v6Y9IRzaOr+nv/qQe1bm60S7tezZktoUnm8ZySrXjVpf/TYnvAFjbHh+SMXpD1/0YVcX0Fn5R6uG+v
 bu5u08e2QtTVConfEsXOfYEZsPi2J08mLSwOoZfrxge7BrgIQSr3ZIiRX6n4n6R1VGlbUtyNri0SJ6
 f5eX8lxYvq44yH1jRKJ289IxNCd9R1upvE9IsvXS1mdMC6zlW6bSgiyLQs50mSIwG9aBZeAmHL5bYd
 S7cRU9FatM2XX67118sXNYaJl2wUBDY6mVThirWBkaKliCg4QacmRdoFJdULbjPrWoLF9V7q7s+hCn
 ygBodb8/DQh9Q+FpOkU96+6ewosL6jNsk1Dk6YZ5NXEfeMqMdD7GKbZIbFzQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_014824_391665_13E0C3EA 
X-CRM114-Status: UNSURE (   8.48  )
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

This fixes the following:
audio-controller-0: clock-names:0: 'sclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
audio-controller-0: clock-names:1: 'lrclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
audio-controller-0: clock-names:2: 'mclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
audio-controller-1: clock-names:0: 'sclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
audio-controller-1: clock-names:1: 'lrclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
audio-controller-1: clock-names:2: 'mclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
audio-controller-2: clock-names:0: 'sclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
audio-controller-2: clock-names:1: 'lrclk' was expected
	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
audio-controller-2: clock-names:2: 'mclk' was expected

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 6d12b760b90f..e9b22868983d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -25,10 +25,10 @@ tdmif_a: audio-controller-0 {
 		compatible = "amlogic,axg-tdm-iface";
 		#sound-dai-cells = <0>;
 		sound-name-prefix = "TDM_A";
-		clocks = <&clkc_audio AUD_CLKID_MST_A_MCLK>,
-			 <&clkc_audio AUD_CLKID_MST_A_SCLK>,
-			 <&clkc_audio AUD_CLKID_MST_A_LRCLK>;
-		clock-names = "mclk", "sclk", "lrclk";
+		clocks = <&clkc_audio AUD_CLKID_MST_A_SCLK>,
+			 <&clkc_audio AUD_CLKID_MST_A_LRCLK>,
+			 <&clkc_audio AUD_CLKID_MST_A_MCLK>;
+		clock-names = "sclk", "lrclk", "mclk";
 		status = "disabled";
 	};
 
@@ -36,10 +36,10 @@ tdmif_b: audio-controller-1 {
 		compatible = "amlogic,axg-tdm-iface";
 		#sound-dai-cells = <0>;
 		sound-name-prefix = "TDM_B";
-		clocks = <&clkc_audio AUD_CLKID_MST_B_MCLK>,
-			 <&clkc_audio AUD_CLKID_MST_B_SCLK>,
-			 <&clkc_audio AUD_CLKID_MST_B_LRCLK>;
-		clock-names = "mclk", "sclk", "lrclk";
+		clocks = <&clkc_audio AUD_CLKID_MST_B_SCLK>,
+			 <&clkc_audio AUD_CLKID_MST_B_LRCLK>,
+			 <&clkc_audio AUD_CLKID_MST_B_MCLK>;
+		clock-names = "sclk", "lrclk", "mclk";
 		status = "disabled";
 	};
 
@@ -47,10 +47,10 @@ tdmif_c: audio-controller-2 {
 		compatible = "amlogic,axg-tdm-iface";
 		#sound-dai-cells = <0>;
 		sound-name-prefix = "TDM_C";
-		clocks = <&clkc_audio AUD_CLKID_MST_C_MCLK>,
-			 <&clkc_audio AUD_CLKID_MST_C_SCLK>,
-			 <&clkc_audio AUD_CLKID_MST_C_LRCLK>;
-		clock-names = "mclk", "sclk", "lrclk";
+		clocks = <&clkc_audio AUD_CLKID_MST_C_SCLK>,
+			 <&clkc_audio AUD_CLKID_MST_C_LRCLK>,
+			 <&clkc_audio AUD_CLKID_MST_C_MCLK>;
+		clock-names = "sclk", "lrclk", "mclk";
 		status = "disabled";
 	};
 

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
