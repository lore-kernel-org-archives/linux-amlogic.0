Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B43D29FE7
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jan 2026 10:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CrWSyL+FCsjv70x5Hq0cFkN7JqOAqRXEfAqdRie7cBo=; b=PXDheqn+RGHuR5
	277EuWLV3Zt7fsPql2B0HjsjwNMVE79Dy/YB9jZXuvJxAuXRYU0h3tKBexpBkUshJv0N+XlPDOIOr
	68I2QakRgv9YdpWKZcqSG8RYQUJ46vNqCD2viUlWezHxlAxSr5PYfBzRdmDzTsAw8XUq4BoGxGmt+
	NXohztlD64pg9e5vy4h4D3hkpRhhK6Qm1nKs9nOd1gHMHR6BOc/jUyNmwxLCIBojTeC07JocZwT0M
	jSe5O2HBtBOgm+NB+E6rPhlTTeArnSkno2xkSV4YKwPoWTAzx3sSFPkTZWobQGPBNbYqf0fqtDTHD
	y3+gQVs40GqafKwOPE9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfyLr-00000008qUC-3wmk;
	Wed, 14 Jan 2026 10:43:47 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfyLo-00000008qQX-3UhJ
	for linux-amlogic@lists.infradead.org;
	Wed, 14 Jan 2026 10:43:45 +0000
Received: by mail-wr1-x443.google.com with SMTP id ffacd0b85a97d-42fbbc3df8fso4632747f8f.2
        for <linux-amlogic@lists.infradead.org>; Wed, 14 Jan 2026 02:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768387423; x=1768992223; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4so0a8WT2CR2TaRPtxXWnlX+M8XXOTE+f9HZTDZHm2s=;
        b=woZW7STTcBUvr3h/E2Izdhgl5j6fSKgJZV7sb+hVLgNOEWQNU19hjUwVANsOkBKgwa
         CpATAmJSQNRRuY4zfBdKEfBJpKtJH4isAE2pX7NSo6aCCur3H34r+GG4WPeN5IYyCGno
         MLor9yAqYlQ1U1fUEJZmbykKTbpxfLwfm7H/A3L9WwSMN9PqZzqvAAf0xf0ay2J79fko
         KTJf/LXAnVUDpPhZSieQGbiZr2OU5+odyEdB2w9/N2rGxRH76baX6fV5mTf8h6YNWZso
         7QfCEyMz/6GWegUwHjWZ/mXOIyMmJCyGvQyo524cirP/Vgqgiy8ekw2iSti9Nv08xMr9
         VD5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768387423; x=1768992223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4so0a8WT2CR2TaRPtxXWnlX+M8XXOTE+f9HZTDZHm2s=;
        b=PKKAC7nn9gJ+I7l6K5Ka1S8yjh7qimM9pFfyV2ScuUvf4We5GvX9aInSIffMSeKpm/
         XJkdkOT/2G0hhtvRBOUzCfJ4qZeWORU2MJbGhHKYVycJbgrQJBPNzySwadKheJllD2u2
         MilDGrj1Z5V1axBef0IjT9yWO8PHJp/uLH7nttHL4b420LDK5VJ2sDKKsdE42hQ6NWUt
         vFa3FLDaHFR301LWaH4omh3UCxWWhjgSVN9ebQUv6AtEsLAoMCubl2KsjZAg9HQhII8I
         pdngvsOByww74XaMChzGlS6RJpFVFkCSVSX+/p1K284B6Wn6raQXzU34FpmJSE0T2jTy
         8kqA==
X-Forwarded-Encrypted: i=1; AJvYcCUV2MDQQeBGGrvUYqgKCsI0WVT6XLj1SfdIIvQJuPTE8LP7+osNvX3tvZpNo8ombnj6GZuC3d8eZBU3aXQ2@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw6uQALi+FShxjl3Hy3jbmh2F3smT2/s3tHK7WzXUflFn/CLfj
	cmfUs/LarLnqESW7070noheApZqWoVn6GQzgGznLjPqM3O6rbjoONl/3VyDALD/6jpw1dwlNYUk
	+N5FirqM=
X-Gm-Gg: AY/fxX7y0bt3SrN/3dwyctsYbBNBVB0JvaR0UL0tg8rNsYhHHKsJ/TdCdtzh7HnN8u/
	6cHjp/O8KGKSgc63e4HvjEyXPlzcWt8O+RRp1GwXY6h3TdH0zC6UcWkQjWGvLf9NAdAA+HGt/LK
	nDbu1Hjx7cZTogDYd9RwgAgZy1/5SbyntkJhMz3uz0Tnf8vW7akFu+OUtsmk/B9er+/CYmH9avv
	SkjUyhlMybjzEX2u9Sh7HSgy3rbEbPI4+LLaq74jun9N4cmFzxIeZ1Wyp6eZXpGSdnSC54uTtlN
	q8tI0oDoFrUKAahJqUq41WcYnL5ZS3PqvYtYSHiU8d//2S6TBVCeX3w8dZd9y8JCGmFz8+vBEXs
	FJDYoXl3MgiJKG4tZQ9bDlDl+K6VDwOHim03KxuPp2ya08lHnfBqCZggIjURTGoYZKiivQeT5pN
	fEXQEGT4bJLiBb/NA2oH+H
X-Received: by 2002:a5d:588d:0:b0:432:851d:35ef with SMTP id ffacd0b85a97d-4342c547dbamr2693184f8f.42.1768387422890;
        Wed, 14 Jan 2026 02:43:42 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:f2cc:bd72:2de3:86cd])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-432d286cdecsm35818726f8f.7.2026.01.14.02.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 02:43:42 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 14 Jan 2026 11:43:12 +0100
Subject: [PATCH v3 2/2] arm64: dts: amlogic: s4: fix mmc clock assignment
MIME-Version: 1.0
Message-Id: <20260114-amlogic-s4-mmc-fixup-v3-2-a4d3e136b3f2@baylibre.com>
References: <20260114-amlogic-s4-mmc-fixup-v3-0-a4d3e136b3f2@baylibre.com>
In-Reply-To: <20260114-amlogic-s4-mmc-fixup-v3-0-a4d3e136b3f2@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Nick Xie <nick@khadas.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1920; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=4okCO5nn232mOuyf3EnlQ/xwKykNnPdvcOnvM4JNIi0=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBpZ3NYatEmmShZe3hPb4vYNDwK6REixcdUgkwbM
 7DeSvwXB76JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaWdzWAAKCRDm/A8cN/La
 heV3D/4kz6OAG4nqNZrPcYi/eDYNZS74ELTkhDDo4ERom0PQCUECsVyo5vn7l8IBKFvvqqsWQk+
 M5NzJb01Nz7F6xPZZYX/kfAEW/Ck8M5dnYntGlDw4Ql/wAYOvvXKH3VN8oyQhM85pyK4VNAYyGN
 /fQ9UjWakylCiuu8MFMpw9HT1NS8ZIiKPDEA/OKskz7BxDAz3B3IDW8Yqy8c0GVU9qJNaEflgSh
 uVjPN0P8Xfw7SYgs0oonjvPqIzI5GLPW22tVYGyPQ9alKBs/W1tJopHGRPGF0oYGKadvYm3IEJm
 1ahCcoqEQprH+jIH5/0nyWLz55KwfZAgz9+0bD0OLmIkmKyFfC1mS9TCdHqokQTTJkzkPt3d7xX
 xgkArQtY626XXF7dw5GFHmNM0Mk+PWWsC0X1r1oHTexWL8xC8Peb0ZEvVXmIIq5evyDJsjdXWsG
 0xyezinOjekluDa8T6AX2g6UvBcKz0YtPTcw9q2je9e2uQ4TinMGdMtwcSzRYxIZcT5R0l6lFSC
 vbXXBzqlh+sLWfWgHU31GERsUI+XGwC4IesAHUa3PuBtP78rjRc911BpPGB1mTB6Q9he0ktwgUA
 vckGo1SoVivU0dqGjprYsv0zOhdjwE5LvKgY0d7q0t1WOIFTVU2QaMz3py22fL4sC3NV2OObaV6
 boYyUgagUYVU18w==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_024344_913020_62594E86 
X-CRM114-Status: UNSURE (   9.90  )
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

MMC A and C are mis-represented as having their "clkin0" input connected to
xtal while it is actually connected to the MMC clock, probably in an
attempt to provide 24MHz to the device on this input.

Fix this and assign the clock to 24MHz to actually provide the required
rate.

Fixes: 3ab9d54b5d84 ("arm64: dts: amlogic: enable some device nodes for S4")
Tested-by: Nick Xie <nick@khadas.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index f314f07062ab..dfc0a30a6e61 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -819,13 +819,16 @@ sdio: mmc@fe088000 {
 			reg = <0x0 0xfe088000 0x0 0x800>;
 			interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clkc_periphs CLKID_SDEMMC_A>,
-				 <&xtal>,
+				 <&clkc_periphs CLKID_SD_EMMC_A>,
 				 <&clkc_pll CLKID_FCLK_DIV2>;
 			clock-names = "core", "clkin0", "clkin1";
 			resets = <&reset RESET_SD_EMMC_A>;
 			cap-sdio-irq;
 			keep-power-in-suspend;
 			status = "disabled";
+
+			assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_A>;
+			assigned-clock-rates = <24000000>;
 		};
 
 		sd: mmc@fe08a000 {
@@ -848,13 +851,16 @@ emmc: mmc@fe08c000 {
 			reg = <0x0 0xfe08c000 0x0 0x800>;
 			interrupts = <GIC_SPI 178 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&clkc_periphs CLKID_NAND>,
-				 <&xtal>,
+				 <&clkc_periphs CLKID_SD_EMMC_C>,
 				 <&clkc_pll CLKID_FCLK_DIV2>;
 			clock-names = "core", "clkin0", "clkin1";
 			resets = <&reset RESET_NAND_EMMC>;
 			no-sdio;
 			no-sd;
 			status = "disabled";
+
+			assigned-clocks = <&clkc_periphs CLKID_SD_EMMC_C>;
+			assigned-clock-rates = <24000000>;
 		};
 	};
 };

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
