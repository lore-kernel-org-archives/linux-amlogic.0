Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D803CD98E2
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Jun 2026 08:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zqQ6m8mtpKdXcuLxhWhbiRzugkSA0QavXoO73eHLpTk=; b=qIYDkE+21rzD+s
	pAJWHDul0vAfzdQM9BzxJ4co3De+5elFBldF90xHL3u7B7nButPkj/W8CZK8oWoWDSAT6pJs08Thj
	LT2sjVYpT7S7pKQYIq24j/rSeNdmW5lwcun89Ofdjf9gyQddOpWfHmNiq4M/wkcgpqUDaTTDYeJJ3
	q+ND/MJJOtr3wINDMnoZnN6Dl6xzCWDTw/y29bgSkVFqOQsA6C0qoseSgqij03adO2KqfU3wsbZtl
	6rZXIaUvzBnqYi9AmAIPNSv2jcm0fnnwLg+94c+a5R+CNSPbwAo/Njbpw+DtEI+u0RhEDl1BTKazb
	FABCxGjiSdOwZtqpIR9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZlY7-0000000Gs9j-2WfM;
	Wed, 17 Jun 2026 08:23:03 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZlY5-0000000Gs8G-1Dqi
	for linux-amlogic@lists.infradead.org;
	Wed, 17 Jun 2026 08:23:02 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2c6c9e02e7dso640435ad.2
        for <linux-amlogic@lists.infradead.org>; Wed, 17 Jun 2026 01:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781684580; x=1782289380; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9WzTe+1vlDzzoGxy8+EdE00Q4JOiUjNnl8CApnpdjw=;
        b=CxSo7sDfV1ejZpo5mgCcQUz0VAoC5AWnTYj5iseUi/rTF57Sesu5wNF94snOq9oaQU
         ZqjVXzn127ENkXjBBPDv0OLJOmcr7RHFAQrDrxfNqj8p2buTEDA2xelfV2blpOLOxW+U
         oA0hiBJSevcnCK1TfNdOqM0FyKMMuGFgskaRj9khwb9uHXhCYwo3msmt0Yz7BvF3Trwi
         ewwlAwXKfjv4VZAcfbNnNrUJOa9E7mSDUvizI96ZqgrVw/4E040kX227T5aB3zKgpd8X
         UrKbx2TuDwZvJWi84FnfQ7Z514yGZJkih3hOYyhqZEUjXF71XR7ZoEByYfGj5gGNSzt4
         Th4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781684580; x=1782289380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O9WzTe+1vlDzzoGxy8+EdE00Q4JOiUjNnl8CApnpdjw=;
        b=ScvLwDUbVEc/+sywxdyfPDndhTnM4hfauXOJWX7hHvoUdhdax9vXQr73Jj0OHcrRHn
         XT9Jl07rlZAhi43Lg4rnG9yLe60kaWrzMdqQsZXVZpI/XhE46Qfsi5S/s/w1VjZOhSFt
         5vMes9AY0nNMRoybTZ922f3E2uCk4t8Rr83o0cpscN4YaEZf3guHGfuwrTdRo7ps3YBD
         +kb+/J9LiZ5fV8tqNRQ69te1NIynUE+TfL4+7aauvESycB1te7UsrdEhBjV0dvuMb2dS
         HAj6ewf/s/eUgKnaHvOPLmy4vHpkR5yD364kXO6tY5CMjYW82Ir0V71/YrH6PVFK0u6/
         ZiOw==
X-Forwarded-Encrypted: i=1; AFNElJ951HYdtdbWX3w2AUscDIikEyItQbu0dYRzLAFZJWdfHcMr7LvWG0JvpxrAMJU/61pMSrRr4B5k65/gwr/Z@lists.infradead.org
X-Gm-Message-State: AOJu0YyQHPP4HRJkJ/6cGA3wOqJ4E72l769cAp0G/F+uEhKsTp+DBqkY
	ND8UBBYeDxA1/16BfJupdXFkYdkp6CMlRsQEEe11Kp4RJGOSJ6efgtDi
X-Gm-Gg: AfdE7cnB0DrC+/E/0dOIhjdE1a/OYajkKj/pGIDaAhExXMieMJS23SUqTMRCdQIML3F
	UwrFOu1SpjWffnTmyeM6/LeJQ2sGXIlkN18FSJ/LJJQ5pHTUbSfxYLCDwxkEh65MaKhjTvy96bG
	kfRuaEnXzTgN3eILM0E4hXkpl2NTbIMl5jyx8gyqMkqyCuqxc0tYkqkkMVLNsCKFoToP7Xl6I5C
	894V+IyOcDgmyLGKHORov4MtCxcHeAN6Vny6pC69nmVApaBF3D/NXCxKOa62oKH/qzw04NTITYz
	fm8IJp6qgbE5ZWKU1HklZfdGQedgav0uMwmstXXYLkdF0Bcw1RCpi45aQaPZoEG/9IqgEOejBkG
	nYK3Ve0gUZWtgVLIBf5GnkBjGciSQyaMCmRx55SM+qA175rRYNm/cEgmOITc6O1qDKNsGrJiBMR
	5GSUFofdts8yjqkYIS4s43
X-Received: by 2002:a17:903:230c:b0:2ba:3e2f:6883 with SMTP id d9443c01a7336-2c6bc227c83mr25166055ad.19.1781684580462;
        Wed, 17 Jun 2026 01:23:00 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:c491::1002])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6a758a3c6sm35282045ad.52.2026.06.17.01.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 01:23:00 -0700 (PDT)
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
Subject: [PATCH v3 1/3] arm64: dts: amlogic: meson-axg: Disable nfc node by default
Date: Wed, 17 Jun 2026 16:22:32 +0800
Message-ID: <20260617082239.645562-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617082239.645562-1-jerrysteve1101@gmail.com>
References: <20260617082239.645562-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_012301_328696_3A557FE0 
X-CRM114-Status: UNSURE (   7.21  )
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
