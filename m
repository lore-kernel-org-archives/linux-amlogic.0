Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAEB7C3ABB2
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Sep 2024 08:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6bqtUU/jThZWvasWgk3oRR5CEp26vtgwXPB9osbILGQ=; b=dFuy+4H4Z2C0Gf
	pEYDsB2C77Mo9UW6mZfhGTbnkVDJyBvQwDJ1uaaTYgdUX0UGQXCcmtmrW8zSVDchmb/KsWBQYxq1T
	kSN6dsgHVppviUbxZ6H2cMrUu2/VyWxE40LZEwXJtusQwJDNzdeSs4yiorzbN7l6MNLjVA+CZ8ZY1
	LYgvAcZW2S99D1a1BIZDlhUb13ZgXJH+RXi6czjlq9Q0sJXu1SOAODvtep7YL2PmGf2bNLMNeGHt5
	wsyNLs8P3rDVvtxwOId6AdhZIkTyvybmDGyBr2gaPRtpJjNJTQRo2ndlx0NC0B9S0UWzdCfxYQt8c
	HoRpDXmrEXP71H9n/L5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sq6yb-00000003Pg7-3aLv;
	Mon, 16 Sep 2024 08:20:54 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sq6n0-00000003NJE-2Xoo
	for linux-amlogic@lists.infradead.org;
	Mon, 16 Sep 2024 08:08:56 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-42e5e1e6d37so10454925e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 16 Sep 2024 01:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726474133; x=1727078933; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IDILcTbSjW1S8sYtyN9RK1TYgzDvLjqVuAYASzyv37Q=;
        b=miGgxSYAebLFfX//4GiQDLn2yXjGl0+ykqN4N1cRh36V/RkJ+HqjZOkEgp3IBxtSdd
         MhtElbyxJT20uv8cTpxPUXG7NDPTagnc1uvuCXy5xecSuVLIFgeU40AMnKYUNqLiFyCo
         ebR5n4DSLPEffGzlQi0fjCMI7JpL+tYhYT4t9G63MK46qE0RnVQAktnmN1D9BdKN/wMR
         n4N4ZWJfYnwlPkb813NWUByQbq9iLk4MTmhq2QxO+0tWw5lQ02oR9hQe1ES5rDkysVGS
         DLL6kBsG0dMzmrksGLAesSOpI3qF856dgN4DIviMAF3aPf6pH2mzsnkf+KR11GDuH6Fm
         poaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726474133; x=1727078933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IDILcTbSjW1S8sYtyN9RK1TYgzDvLjqVuAYASzyv37Q=;
        b=lmAC4J9Nix2WbaZqOe78FLr6vXLm/9cfK0Uu46NvLhOLiS82rcM6evfLoI+a0gJOOM
         +a9HOGhkowpqO4SUGLbCwms/YUpSmETh5+M3/Kgmvp9n05uY6Hodx1gzKLKwYUJZyxuz
         IcvevHuocngKdDHCJOkjdqlRgEgHl5oByUuNQ48CjVAkkL1EhsiZvkjfHL1xLv1IBh+u
         CC4JRa3QGSxGICUPt2o2MOyi3xR9GJ3uVXVgP6fV5s0GwMDHL+JAK8uS5ORarsWtuFAz
         VRw3beu8RDOEJIv+zijLzlfO2YeZYdXZlCKi5n/niCvuodQkcdHS8fx6cuVf2IWRlU4P
         wmrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVv97O7jsN6LNkEUyc5h2cnpeY6ewjMpxsDN3nARA+jtJy+/lV2RFw7godTc+kgeTuTiElC5tErKHhqHMQ6@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ+bWSQRNtJTeEOWR7FuF/YuleJV36bl+B8eph7naDRdNfm79o
	fxohYUoFer7dodkq3xx6YkI7B9YuDkWck1lpVDj3SVhSXoDeYZ972p3AdzhAmQ4=
X-Google-Smtp-Source: AGHT+IEPIYQXmB8ojnBkXTb3OyMGy8C/tBkDJrdGsY7qAssIZ5711xeeYXZ2JVBUsV5W/kUZF9M1OQ==
X-Received: by 2002:a05:600c:4e8f:b0:42c:c28c:e477 with SMTP id 5b1f17b1804b1-42cdb586fa5mr106731305e9.23.1726474132980;
        Mon, 16 Sep 2024 01:08:52 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42da22b900esm69309465e9.1.2024.09.16.01.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 01:08:52 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 16 Sep 2024 10:08:40 +0200
Subject: [PATCH v2 11/11] ARM: dts: amlogic: meson8b-ec100: add missing
 gpio-line-names entry
MIME-Version: 1.0
Message-Id: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-11-0b20ed4f0571@linaro.org>
References: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-0-0b20ed4f0571@linaro.org>
In-Reply-To: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-0-0b20ed4f0571@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1016;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=2hqg9a24qnxMOqiNkyVFjC2llgWcfLxzW3WoUdSP61E=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBm5+eI49JfJ23NZ1RKPG6LjbxxrXSuSETW52BkplTd
 760JLgWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZufniAAKCRB33NvayMhJ0b0eEA
 C+z+DgFFIOAH0DFoy3o29AX4GZiLG+CIFLdJDfjTGuAbxaMatrjtNJRxjQ8HlWUX4fefjgg/EmB7LC
 i5XwlZq7oym1BPaKVyarQvVxiPjHXQ6IdhmEbomXHFkANV213hbwOudHrzzkE0JbnJk+w8S5lnJ+KQ
 +zCjL1NL5yiDT2qSbJVnttXIScqsbriStV3/y2vVbpkZTv2VmSStB4PsDs2SEIl+CUX5wfHW4ytvAz
 csUA7wiMtjpWbsSYWv8NSyW7kZNlZaW0R9Daq+NThZvIvfcElc2TGfcVy0KN7aGTqUbWWEsTZpOHp5
 H2NItf5WDZmibNyx35aOANcEHxjDbMUXp7rORHj6S225a3Y34/3ck2wQJ+ZfSYfNugXoeZfYnUs7l/
 tuVwoEnqh0y/UCA6dvvB/jEv4IVq4dKjzmyrwxSseil1EP803mFYHOcuAr24kIYQ4eH+hz8GpPYfKY
 1niJuNKwcdeTXYbvg2kle6xtVgWl3Ok8TPRm8BNFlsp7/R6WyUyhrFdOfd5WZxXceC6SG6Xl6BAIMC
 2BJEje7Bnt2LElEO09pkzaylbb7++Wll3fyWntJZT0eTUKRTYQlnGqKS6huChC6VDqBpEP5JU8Ig9L
 JonouduyHZbpdWfuI+q3t5xs9FE4X888bkoh+LnGCzce6pqQomHB4BkkKibw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_010854_872512_B63E6A57 
X-CRM114-Status: GOOD (  10.06  )
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

The EC100 gpio-line-names table is not the right size, add the missing
cell and fix:
meson8b-ec100.dtb: pinctrl@9880: bank@80b0:gpio-line-names: [...] is too short

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm/boot/dts/amlogic/meson8b-ec100.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/amlogic/meson8b-ec100.dts b/arch/arm/boot/dts/amlogic/meson8b-ec100.dts
index bf1ef07de6c1..18ea6592b7d7 100644
--- a/arch/arm/boot/dts/amlogic/meson8b-ec100.dts
+++ b/arch/arm/boot/dts/amlogic/meson8b-ec100.dts
@@ -431,7 +431,7 @@ &gpio {
 			  "NAND_CS1 (EMMC)", "NAND_CS2 iNAND_RS1 (EMMC)",
 			  "NAND_nR/B iNAND_CMD (EMMC)", "NAND_ALE (EMMC)",
 			  "NAND_CLE (EMMC)", "nRE_S1 NAND_nRE (EMMC)",
-			  "nWE_S1 NAND_nWE (EMMC)",  "", "", "SPI_CS",
+			  "nWE_S1 NAND_nWE (EMMC)",  "", "", "", "SPI_CS",
 			  /* Bank DIF */
 			  "RMII_RXD1", "RMII_RXD0", "RMII_CRS_DV",
 			  "RMII_50M_IN", "GPIODIF_4", "GPIODIF_5",

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
