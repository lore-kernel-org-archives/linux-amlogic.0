Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8632CDE003
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jun 2026 13:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zqQ6m8mtpKdXcuLxhWhbiRzugkSA0QavXoO73eHLpTk=; b=e6sSTlndznf3Lr
	LKFrEPlJgceZ0n/9YHjrWhsHB4eQL3R9qC1lVqfWmbFN0BvXmW4MbpQOYz6SYkmnvl56BTiQUlcl7
	4o4vIL354uRv8/Td0bnDiIcy5o5GpN7MI5zN85f3yf9hIfEF9hCMYPUUEi+BTiQe5V82QbVxd8s3D
	Q1ONDRwez+7kOABnSsKQUKc8FuwvTBAXrW2wqCuGMtTGSdHgrakFGr1mAJt+VVHh++42DtM7m3h8W
	NL3Ja17QB/bok995yNuL51JGVJXrqDiVg5/ljc3G5Koe/gdVuDkBdBP1fIi6ioBBO9t3ySB4c2e47
	C832fIfokxFAIGxXH/uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcO6i-00000007rmS-3aFs;
	Wed, 24 Jun 2026 13:57:36 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcO6g-00000007rkz-0R9M
	for linux-amlogic@lists.infradead.org;
	Wed, 24 Jun 2026 13:57:35 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id ada2fe7eead31-728f9ecd56aso326059137.3
        for <linux-amlogic@lists.infradead.org>; Wed, 24 Jun 2026 06:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782309452; x=1782914252; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9WzTe+1vlDzzoGxy8+EdE00Q4JOiUjNnl8CApnpdjw=;
        b=a6sCkiWhjr9idD8/rhmhFBH3NcSMDahiurXI0ry4IIZyLIWvCl1KOvfL1rQzFdQDZe
         Wkd5Ml+JeaaG3cxydrzuNplttiPZZ/fsv8AEYu5b+3ZBsldFrzEqWLfnPSOKoD86nYHi
         TFvWdQLpDYZjEkYSGvW4ct0M8yTEvNVv0ouWeOVxKkVJt/XuHTbZzQDTf8R3x/FaKnFj
         V7VCqCpTJw5ac9LNlI9szoUuWysjNui4fRs6vFJwbNZVBHFIOONebrfpzhLDvoogwz5k
         9uJV1g2Lle4VzrEcFXz3K9ByaR87lcXH/wwiQty75WmCsjs0svBCAL695fr/L6DwVevO
         A5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782309452; x=1782914252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O9WzTe+1vlDzzoGxy8+EdE00Q4JOiUjNnl8CApnpdjw=;
        b=hCMhaThyEdleTsBMvCwBsIqaeCk4dbtNm3I9EPLvZOnADxSqq55QPl5VefErx1xXn3
         1JEciQO7zdP3CVHCxP859kEkiE96dlqDRkqfXObXQwaYT7Mmf2GhnKCM7Hd3z6Lg0vh4
         qTI78Uzt5ptDHpbWqKTH/C++KwVrKbeuyVrtRXyYChQJUAhtc+IRyoXUzUrnouVCrwqo
         zE6jQXiRAeLe7esbvpPKvYvh0vbUOtQD/Mav4uGXfeel2QwoxACcS3Ui616409ajHQDF
         0V4OTUUIUS7aSRELitgykCqzrx8hl14UI0zASFmfNf4mT2PuAdcfjaVd4LBZIZa01Shx
         LzGg==
X-Forwarded-Encrypted: i=1; AHgh+Ro8D2iLjOypnFi6YSDuXNgmu5UsJlBNkEdFGYlnm2gGVGhld0l+j0WjRYEO6EMKmPx7Tts2QBGywstOpAAh@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4h8THGjuAlsy5IstpGoxkO+AbBLcQvJXcHH6DT4dpATBx2ZTU
	Hio4Tp9LYlLCdCO0/9tlCoc4kJYgkkK3RSYfcQ/Wbtx533iGnVFr1F1d
X-Gm-Gg: AfdE7cn+Js4Y3X+1N4ruv9Xk/17ZgTzSGExvtrBD+arkFJsjhmRfRTtfMcKwcYg5xFw
	yeShWoYuZYG+7aKOo5p1o/SciWDp4yfnkouEnN/NYVh2fMKdhtl6UzlIQrhu5h9VlJciticoxHI
	wl+S2AfzJTNVk1S4X4QTGVvhk8zTHKDa5O3ZtcX5Lqdy6dHaaUEjwmlhy8PD6YkC1oObEp7TPs/
	F2pudXegeMfxpCs/sTAwi6EGkTC2X+0M6JQd8S1kpcHrDcNdpnMdDrFPG3LsqS0Kk/ieoUD0VO2
	MnviqH4F9BKoHx2T6IMfJ+9lW0RDXP6iuedzQZh31WiPU+VoWNQRVgV4a+JWeMX3RpFv74G/qrh
	JLrQDrny/WbChOqU1rL6k3auVsIhy16FLOq6CQJQOMyDoXR854WwzxMjfjPktoo2dKAIGGC4VZh
	vPZeCglM/CgbY5erdad0hh2/4yGJ0TVyuXyMQ=
X-Received: by 2002:a05:6102:26c5:b0:631:4cd8:b6aa with SMTP id ada2fe7eead31-73114f11320mr1562339137.13.1782309452608;
        Wed, 24 Jun 2026 06:57:32 -0700 (PDT)
Received: from arch.localdomain ([160.250.247.70])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-72ba2dbc17bsm9805730137.6.2026.06.24.06.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 06:57:32 -0700 (PDT)
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
Subject: [PATCH v4 1/4] arm64: dts: amlogic: meson-axg: Disable nfc node by default
Date: Wed, 24 Jun 2026 21:56:41 +0800
Message-ID: <20260624135650.727077-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624135650.727077-1-jerrysteve1101@gmail.com>
References: <20260624135650.727077-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_065734_138231_FA04D39E 
X-CRM114-Status: UNSURE (   7.08  )
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

nand_rb0 and emmc_ds share one pad. Before enabling nand_rb0 for nfc,
disable nfc nodes by default to resolve pinctrl resource contention.

No mainline AXG boards enable nfc currently thus no extra DTS adjustments
are needed.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index f1f53fd98ae2..6457667d974e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1999,6 +1999,7 @@ nfc: nand-controller@7800 {
 				clocks = <&clkc CLKID_SD_EMMC_C>,
 					 <&clkc CLKID_FCLK_DIV2>;
 				clock-names = "core", "device";
+				status = "disabled";
 			};
 
 			usb2_phy1: phy@9020 {
-- 
2.54.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
