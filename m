Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1174D38FEF
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jan 2026 17:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EUcox0FCNRBUT4WhrLLxtgghzTzIdNeO//Qeu7jQ0UU=; b=OkXGdmNFGpzzRs
	FUqQo+8ut73Z3DOA68i250BNz4V7hNOvGBYAe73gv/bx3ewbHzPAj3eUcLrZrWXak2Q5y984mRjPx
	P03EhO5O4ESIbGGzwyovWsdyflcc10VLXuAzQib1B7ZLaxfifnD6JXfKFKFrkSv26/If8pIQNn1IL
	WOOETLyoirXBAruSLJiKtkC4uFVrwQxN+1R9zleTx27y/rje0jrctTXO8Mkl1AktqnDGX7mSOBP4k
	RK17eU8mTsK5LRjPwDPY/KM1eSbELP4fgqooj9ZIgmaKQgoT5prFIXFvC7L91EK9qTXcqxenLLPIG
	HCbgFU7UiYTShKvrUm3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4NE-0000000A3ZO-0kn1;
	Wed, 14 Jan 2026 17:09:36 +0000
Received: from mail-wr1-f68.google.com ([209.85.221.68])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4N6-0000000A3QG-0RqZ
	for linux-amlogic@lists.infradead.org;
	Wed, 14 Jan 2026 17:09:29 +0000
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-430f3ef2d37so48781f8f.3
        for <linux-amlogic@lists.infradead.org>; Wed, 14 Jan 2026 09:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768410566; x=1769015366; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sLZ+PvAjnR7DEP7BUAREJ2OVzk7/JAMCQdO1bdqxiqQ=;
        b=ysMqd2QjGvujjCSUXh3cIvc7rcGo9faR/uViY7TXGV371ZBvJcx0k7BysEadjjWDgX
         FUCkBNk027yCXGk+ULNro7ogvPm+ivPzW3DtUoEH3JGSL2Asl0JDCrnjf6W9pnvWEsk0
         2DjalY29dU013ZUlAp0t+2ARlbq2Avp13qx7Pr4HB/HQhgMBnCSpwtW0ilO9o9oj+lGg
         I94tOpZZeoqwYNzYbissgNE337pGbNbb8SYEjgNT2cnSbe1+n64weYwrTeK61SF2HKuN
         4Iw8HQ3uC6zZCFOC+o0y2plnAEpwpP/iMkmkarGoDkqdf1i+kxDphs3YpzClipYfNbP0
         AnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768410566; x=1769015366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sLZ+PvAjnR7DEP7BUAREJ2OVzk7/JAMCQdO1bdqxiqQ=;
        b=WnH2/eXH30xwEMfB75S4Mlb3D9982SNtWz9oqopefg54NXnWUE+sZeQBDe5JLe818F
         owRjaofduLQciPqG9Co9DqImDCjwdJsTPm6hBAVCMZkxdNem7Cowi1VEWuV40aeeGbqY
         xZggPfeUIKAuj6Nymr510QWv8Tk/zfZcAT+2uiPiLNP6OmDbNmzXw8PylJoazL2JZuUj
         ESiBKhJOnQvHYHvaEBU5+kScffAM3DtjyhY3n9hyBzasdlQA3oJqKHeinvbIy3PAsqAx
         JjElHk3G4llgMG20iKdUGKFHHmI9mPOiZ5K3B3skA3dd+3QbPCRHF3kTU1ML5GeGRPch
         Qufw==
X-Forwarded-Encrypted: i=1; AJvYcCUB/jdgFpcSiBZ4dfea7CY/i+mSZjY//O6OKgUG+9xwOHdTC1v6DjunDzw8kfmWe2aKkOoc+Esdb+mT11mN@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm7fMTlquGLMJFupq88Oo7lKfXSY86I8XjPC0Kn3IClUwZ8WGz
	7FuJVjSihApsuR2TAoqhd1ZxjH58zvRF3VIn9Z0lQvqmIluaEAfSw1y4wlqHkdfSW1U=
X-Gm-Gg: AY/fxX5KdplWM89k14xYUUKpg69rC2CcHR4dhPM8HQZQS7GRQYRyPtO97Hy/8LhhPiZ
	cE3PxLS2wejgnW3BPVXuvY9TjcFA73JD3DPf8UIFE9c4E0zuxV1F5C/H3+VJxl5tpUPE8UrgTre
	LzQ96oKQRKy7yXmc762CjHAtpS4ATzMoP8EA5A4Y/COkQ1zX/bLcRYjVNdBSWSOFHfX7QswHJqV
	TCjxRGzKCNBuYNghHx3OBkIrMGw/BqaxMC9pFlKpnDt7OrRFLJOmIFSHbMZb50xJJ3LETq/3/zL
	zakCTbg14GcoBomFtJ3Fr29mUix7TFdD8LswyUK7bdtKWLF7PwbSKOwsjYIIeRXsNtZXy+bYoNq
	fEYg96g0hBTR5kt8ua8B8mIxVI8fq7B+k+n6EvmXYoV/Z1mJYxsixcz7Y9oxamBxplneYcpnSZC
	yoxqvzRQNbSQ==
X-Received: by 2002:a5d:64c5:0:b0:432:84ef:715b with SMTP id ffacd0b85a97d-4342c3905dfmr3372260f8f.0.1768410565786;
        Wed, 14 Jan 2026 09:09:25 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:d3d1:7ba4:2f56:d18a])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-434af6d909fsm356157f8f.31.2026.01.14.09.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 09:09:25 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 14 Jan 2026 18:08:51 +0100
Subject: [PATCH 4/6] arm64: dts: amlogic: gx: assign the MMC signal clocks
MIME-Version: 1.0
Message-Id: <20260114-amlogic-mmc-clocks-followup-v1-4-a999fafbe0aa@baylibre.com>
References: <20260114-amlogic-mmc-clocks-followup-v1-0-a999fafbe0aa@baylibre.com>
In-Reply-To: <20260114-amlogic-mmc-clocks-followup-v1-0-a999fafbe0aa@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Yixun Lan <yixun.lan@amlogic.com>, Nan Li <nan.li@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2593; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=9p95wrx4RVIpeGNcY2S7+iJZeATm0jJX+K1/uJDs0y4=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBpZ825kW94g5pcZvsr+i9/i6GRnLfGgNa7pFFhK
 lmKhfwUVT2JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaWfNuQAKCRDm/A8cN/La
 hZVBEACqMuM881Nt8EJivf+CishVsuj4EC53+9mHxQCCW7WYXZtVp7tlD2DS5+2RAgJoYqTkLOl
 qCtSY66mv8M3w6UF8gdlisZrLCpDIQ34bZcnowKSd6NZESLyM/nv5jCqOwTNjjPqoATxHoH0JBD
 nZHtINboSwbmn8feJyOdDaZ71nk7evUI2FIZmXUr/dsMW+vs0X37K0blL42/6kBt8HDWV63J1Y1
 IVacEkKDMqfjHBxz4uvWbl0uG8KOur1oElrsC5JA08kVl0FQ1uSBJJylIf26fq/Hj2ULJjUcDTi
 0rz7EqE35lpGWYwa6b78hrixY3LWSYVWPVZkJb61lJ4QpqRc68N8pa0SmScoXw24oVF4FJRe5tO
 jDIq7hfL1XquYyKg8vVpRsUqxFl5B4uLP7hrHiRRzCTFTVbm9ncUsV18UaNGHSLN97Ix1SH/yev
 CSfSi9n4HtaOa1hbgQFUlFOT2hA+hQdky626J/D4NHNUsyyRXm46TP7QMqTaKDfnmYr4U8Cjr2a
 fQmnGevOmt4L5R2jqr3h1l6pctbu1STvfSVHagoyzVlxl26Tkln4YZQsdcB+YpSSt00Ee91jhzr
 7l8plfEx05/qUlV+VuqTEBNuozgSTCtlCmRaF33Av931U4wTvOvb3y4NMGFGrH5SYn2LXKlNZ3r
 897NydBJCJWlL4g==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_090928_188205_B6C5F41E 
X-CRM114-Status: UNSURE (   7.57  )
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

The amlogic MMC driver operate with the assumption that MMC clock
is configured to provide 24MHz. It uses this path for low
rates such as 400kHz.

Assign the clocks to make sure they are properly configured

Fixes: 50662499f911 ("ARM64: dts: meson-gx: Use correct mmc clock source 0")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 9 +++++++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index f69923da07fe..a9c830a570cc 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -824,6 +824,9 @@ &sd_emmc_a {
 		 <&clkc CLKID_FCLK_DIV2>;
 	clock-names = "core", "clkin0", "clkin1";
 	resets = <&reset RESET_SD_EMMC_A>;
+
+	assigned-clocks = <&clkc CLKID_SD_EMMC_A_CLK0>;
+	assigned-clock-rates = <24000000>;
 };
 
 &sd_emmc_b {
@@ -832,6 +835,9 @@ &sd_emmc_b {
 		 <&clkc CLKID_FCLK_DIV2>;
 	clock-names = "core", "clkin0", "clkin1";
 	resets = <&reset RESET_SD_EMMC_B>;
+
+	assigned-clocks = <&clkc CLKID_SD_EMMC_B_CLK0>;
+	assigned-clock-rates = <24000000>;
 };
 
 &sd_emmc_c {
@@ -840,6 +846,9 @@ &sd_emmc_c {
 		 <&clkc CLKID_FCLK_DIV2>;
 	clock-names = "core", "clkin0", "clkin1";
 	resets = <&reset RESET_SD_EMMC_C>;
+
+	assigned-clocks = <&clkc CLKID_SD_EMMC_C_CLK0>;
+	assigned-clock-rates = <24000000>;
 };
 
 &simplefb_hdmi {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index ba535010a3c9..e202d84f0672 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -894,6 +894,9 @@ &sd_emmc_a {
 		 <&clkc CLKID_FCLK_DIV2>;
 	clock-names = "core", "clkin0", "clkin1";
 	resets = <&reset RESET_SD_EMMC_A>;
+
+	assigned-clocks = <&clkc CLKID_SD_EMMC_A_CLK0>;
+	assigned-clock-rates = <24000000>;
 };
 
 &sd_emmc_b {
@@ -902,6 +905,9 @@ &sd_emmc_b {
 		 <&clkc CLKID_FCLK_DIV2>;
 	clock-names = "core", "clkin0", "clkin1";
 	resets = <&reset RESET_SD_EMMC_B>;
+
+	assigned-clocks = <&clkc CLKID_SD_EMMC_B_CLK0>;
+	assigned-clock-rates = <24000000>;
 };
 
 &sd_emmc_c {
@@ -910,6 +916,9 @@ &sd_emmc_c {
 		 <&clkc CLKID_FCLK_DIV2>;
 	clock-names = "core", "clkin0", "clkin1";
 	resets = <&reset RESET_SD_EMMC_C>;
+
+	assigned-clocks = <&clkc CLKID_SD_EMMC_C_CLK0>;
+	assigned-clock-rates = <24000000>;
 };
 
 &simplefb_hdmi {

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
