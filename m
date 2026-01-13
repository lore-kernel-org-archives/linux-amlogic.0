Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E19ECF45D4
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jan 2026 01:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BjXtKmj6aRPnQ9L5xAFt+aSXcUaU00ATQ7s1BIsEOY8=; b=lO6d+CZaP9Gkbk
	8STTLAxOGqVgoFGRR7DIi5P5VLEZyYghEIvyIHwXzxo3gW82I7AJMvheAv3Vmfl3d2HziFabMTZM7
	CAJYFeQpN5qsB+EydMnBvC/fHRnHZfthmjb4KcncU56DUnRo4KzkkBViv1QF/3J7LIeOE//tkIAJr
	UXq4Kgjm7LzwavDUiDL4Z2NkjxhYx2w3H0s/JtusDvbxk+CAdty4XN2SXm+HZPIszXaJTA+MjrgIV
	5nF7yMnP/DSJZqPJOGC4UzQHaYfd7KEK2K16RiDpuLYt7SF+biBqXfFlp1ZAHHIq0Szg2mRynqOBc
	b29JNMooqlGEUtgOt4kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfT4o-00000006Ndn-04Bx;
	Tue, 13 Jan 2026 01:20:06 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfT4l-00000006Ncs-1TUD
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Jan 2026 01:20:04 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-34f63ad6f51so2678560a91.0
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Jan 2026 17:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768267201; x=1768872001; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x3CYlMR0Tmf8RQ5i5U0+ElV7tLxxhG2GMXU9rUaD4oQ=;
        b=O8l6jzw2rbsblk6VBN8IdxtcVETIHGFspIFV0oAgtyTEnNXBCaxcp04spGE0LbpFqE
         qiiFLuhVZVgbriBrnakFP7gOi/pVfdowOlNy3Esme81gogm8hNTmlhWttDZV05Eqy961
         P4RXedQe4tR47MVwwJLiRAt6GYR0e5Rstc4zyT8jd7s7N8GleyzdLPkYvNi15RRqrLdt
         Pt+V3AytbtGHfGUwDdCnEPUfCypr64Y7I+f1Rc6dk+QOdEiqFYxlYGx6VdJjY5JyWq/f
         Ej2O47XKeIOH8gteExkKwTfN77dpqCmWWRTES7dNnlE0paYrYrmNmmOcSmB0qp1WAol/
         zVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768267201; x=1768872001;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x3CYlMR0Tmf8RQ5i5U0+ElV7tLxxhG2GMXU9rUaD4oQ=;
        b=F0zYpeQKfHGDR+i16nvlu4YU8RRuA/+YAKyfiQd37lXgDXg3diyZ1gmvIsH3+BYSxK
         I1WScTBp1j7XJf6KFJe3GeMo5nSquhFN6hGHxV6zBsWS+eq2glUuW/CXDto4UmGX+tUz
         jt/Bc63vo2Ajod5tRXxum2oZJtf+AV2cYO1LjGvuRMfCxjSZAgB9hkqAk3n8M7lYtspA
         vcbSuGw2+GzvlCOpkvTDJS/76jEe8QFYCGQH+qdGjGFexoUQQ/HlvPm6Is/nJXB7+CsD
         hpoNZ3hOCnXZFBD1fTWRmJ5fnrpCCoT2YM64WiXjbdKtqT563/9UCU4pKYszWUxejSpQ
         0foQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfGqaa1Qd2b+9rbIID4cwSKOLvif8WkSxUnZrqgBfZ8ESAs9zGztzWOL45h0EhYjhQcRi9MFRm/ysQLsKM@lists.infradead.org
X-Gm-Message-State: AOJu0YxlN6KydXR5G4aJFN7pQGadm+AAjxPuq+JuIm7ynVsZSzOYcMUJ
	sni2bJPl9WGb8rDTZeYbhR04hgU3hoWKzTjNd1clg1Ke3DnNHb2gDAIJ
X-Gm-Gg: AY/fxX7LIfa2QczPXLaK2CZgDjtxn7Ps9Lu03O4na5a5mJJmuCgfqO22fy6cph0YB01
	QLZxo5jie9bxPadEOf9MoFZp8X9aPp8+BtdP/yW04+1CSlUEtOUnXDV+/8rK9DdJ9M84nhjUkAo
	JWALNeE2pWRF24VJV57dLHgK9w8KmdVk9Rrca6585g7IzflyjqcDh/lbmc1a+qIhcOHAsXcgSWt
	Hn9N/6U6qVVXeer0aUaEFML9IqskKdLKbRaKENxCBNYQSbYhFcE1uI3kCL3aWl2IVrNzvXhBVQ2
	slwLqN5XBmPXoBWcKTION0yf+EhwQDk2Rm5iZzA+oSkbKiJl67x7Vhgf33BMavT2TttVNY2Nd8X
	fu+SDwpg068uRPCspX1+GedfQmtalkSyy+mLIthH9aMs3PTazggLdplDiue+v5G8d8G1CQpXAVo
	7wk672bqo=
X-Google-Smtp-Source: AGHT+IG8txkoiMCUKW9YZHZofyZykPuk3kA3XK9+QfFe6Sd/CcyTQyE/WnqZnbSHsGDn+shRYOq7Gw==
X-Received: by 2002:a17:90b:2709:b0:340:bb64:c5e with SMTP id 98e67ed59e1d1-34f68b684c6mr16514934a91.14.1768267201486;
        Mon, 12 Jan 2026 17:20:01 -0800 (PST)
Received: from localhost.localdomain ([47.82.78.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f7c4141sm18533379a91.6.2026.01.12.17.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 17:20:01 -0800 (PST)
From: Nick Xie <xieqinick@gmail.com>
X-Google-Original-From: Nick Xie <nick@khadas.com>
To: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	xianwei.zhao@amlogic.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robh@kernel.org,
	nick@khadas.com
Subject: [PATCH] arm64: dts: amlogic: S4: fix SD card initialization failure
Date: Tue, 13 Jan 2026 09:19:31 +0800
Message-Id: <20260113011931.40424-1-nick@khadas.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_172003_384446_D09A5237 
X-CRM114-Status: GOOD (  10.81  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The SD controller (sd@fe08a000) requires a clock source capable of
generating a 400kHz frequency for the identification phase.

Currently, the sd node uses CLKID_SD_EMMC_B as clkin0 and CLKID_FCLK_DIV2
as clkin1. Both of these are high-frequency clocks (e.g., ~1GHz).
The internal divider of the SD controller is limited to a maximum value
of 64 (2^6). With input frequencies significantly higher than 25.6MHz
(400kHz * 64), the driver is unable to generate the required 400kHz
clock, causing the probe to fail with -EINVAL.

Fix this by reparenting clkin0 to the 24MHz XTAL clock, consistent with
the configuration of the sdio and emmc nodes. This allows the divider
to successfully generate 400kHz (24MHz / 60).

Verified on Khadas VIM1S with SoC S4 S905Y4.

Fixes: 3ab9d54b5d847 ("arm64: dts: amlogic: enable some device nodes for S4")

Signed-off-by: Nick Xie <nick@khadas.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 9d99ed2994dfa..b87bc83b5a9bb 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -833,7 +833,7 @@ sd: mmc@fe08a000 {
 			reg = <0x0 0xfe08a000 0x0 0x800>;
 			interrupts = <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&clkc_periphs CLKID_SDEMMC_B>,
-				 <&clkc_periphs CLKID_SD_EMMC_B>,
+				 <&xtal>,
 				 <&clkc_pll CLKID_FCLK_DIV2>;
 			clock-names = "core", "clkin0", "clkin1";
 			resets = <&reset RESET_SD_EMMC_B>;
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
