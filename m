Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39858CD98F0
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Jun 2026 07:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zqQ6m8mtpKdXcuLxhWhbiRzugkSA0QavXoO73eHLpTk=; b=yOGPa53pkCjMob
	Ix5ogz2l37nD5mAmRFTUlzQeWwh70qT5IqV6x4fCwSpSmQ0q12FAyTCK0aGXcRcAzV+6mLGV4ZgFf
	b/YB0ZHwNpIDA/0H9NKqys1RbkVLAGZIHxHphJPd1o61xwmgGlpb2VGhlnz1H91rx+dNHlH1tn0xo
	9p9eStSy1MuAILF2aNHO2TPkAIuIiphAfOZmuT7BhqgaL1B/2WxUzmRxN5deB0oTUTguXGZrNxR4A
	/kjFyg0rd7j/jf/zgKCIOpAxsRubEYrjpEUGTYsRmWBPQS7I3Ov+24XF7lgi05cT6keeU6/mDI83z
	04AyqVnva/vud4GJxoPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkVj-0000000GnhZ-0E6O;
	Wed, 17 Jun 2026 07:16:31 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkVg-0000000Gnfg-2kCC
	for linux-amlogic@lists.infradead.org;
	Wed, 17 Jun 2026 07:16:29 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-c8894387780so5770a12.2
        for <linux-amlogic@lists.infradead.org>; Wed, 17 Jun 2026 00:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781680588; x=1782285388; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9WzTe+1vlDzzoGxy8+EdE00Q4JOiUjNnl8CApnpdjw=;
        b=qbUzahuSR06nFkupwezjiP1CobKQbHtQZzkDA1KOqW5ZJXkCXbfOoUpt3jiqKDa/Rj
         4onueRck2Ssj7LJ6Cgn/s5MKfM97lvQ4n1FNOk+3m40r6n32vbEW88/FzhkJyD+mTaip
         LzGBuE1cRa76GfREUjf48QVJtnxLQU3cnlnGHzCs1v/Ni8K/PKUe3XEQb8swOe/QL49G
         bwhO221QX0KCKDYDXQFAEhNbdHSbtMFetICiOuFmrT3OGOgAtqBvRWtgx3NTUKk7nYgZ
         AJ3jw43nUJiDXVrX9ozroyMrzEmfjad6ORP4OzJp5n9mZkOhK0FcFPMcbzxS5brMATxk
         WYnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781680588; x=1782285388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O9WzTe+1vlDzzoGxy8+EdE00Q4JOiUjNnl8CApnpdjw=;
        b=BVgWXjmcNqebsxpbTS7Bpeiek9DjpM5A612sLQ9D4ZC9J4tPz4+Z8g3TD9DxvWu++K
         lQlXJ0HHjgM/cTJ6e6u9mBjB9IzaTwyL4SLQ4GGXa00kE1OS1O3Sqk8SslVmIg/tAbC1
         kN4OjookClsykwQxEt2OK/RWRMKgFDO5mwEjwRC3rnF9MwsE0A5oY4eR9d1g4p5YQ/3E
         Mf8ocmpckTSvGatYXeoU0NG8xkvE3KDyzd/unYji6Zl9q6qhzKK3fjTifsi5e/vl6Wf+
         2sDhu9ro5dHJmW1IZJzniGpIv1M8MuCmkWLqOuMLRQLVoimB4I7bQ18RKrkhyRsh2yLi
         qfaA==
X-Forwarded-Encrypted: i=1; AFNElJ88BABnztctCGvHMX6n2COaO0y2dzGG1IQUU/W9H3nY03Jv2SGKsKyvhTTDGqr6N1HBq5o3OmITpltPID6e@lists.infradead.org
X-Gm-Message-State: AOJu0YzKujy8f2r/cDwi4SRLu1ObqXH3tlO9iWAtn0khTti+tzwV6vsc
	ZTYr16gMKi19xZeZLZYiy0uX5DXr5coOXUkl3nm0WVgTnSvYD2nbKvDx
X-Gm-Gg: Acq92OHLeHcx32geLOCGsBQ/9whUE9cOPwAZYwR5jlIYSkRcHabx7uCPatjrrjG5NPK
	LIl1IYwaDxum8z17SqhFmqsH/pnSxvEQZtfq8COQnKlVzeX9vGiElJqmdi/beiKjdbPJFO5bHt1
	MnMUFy3ZKcm8aJYpT+duzBwVuaejQRW0Lt1pKgGp/H8q3KeWz8IqOBpj6Xm9qvZyhSvhzqW5Kzr
	AE8cqKFaCfIBDjuDsvmWHTQ3QRmgWwLILSUCqrsLmxeqKBrqoCAaImNW/1pdnOcPqSPka5weB/e
	GROqxN21Fx8pNfD9OeofXIvfSQkCx6EpcJQNOiZjiS95YHAERrr7yq0Eb40Qc45D/tqVGiLJRwY
	ixakhlVyD50BIxM3vZiyI0+NXS6cC+4S0n9xyQkOdjeJeQ3Wd9i9tSJMozHUa3edI+CYVkD/oec
	7ffn+9MxVc3w==
X-Received: by 2002:a05:6a20:d494:b0:39c:1f:3211 with SMTP id adf61e73a8af0-3b8b64836f4mr2769367637.20.1781680587671;
        Wed, 17 Jun 2026 00:16:27 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:c491::1002])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866519faabsm13653439a12.24.2026.06.17.00.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:16:27 -0700 (PDT)
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
Subject: [PATCH v2 1/4] arm64: dts: amlogic: meson-axg: Disable nfc node by default
Date: Wed, 17 Jun 2026 15:15:56 +0800
Message-ID: <20260617071604.635627-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617071604.635627-1-jerrysteve1101@gmail.com>
References: <20260617071604.635627-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_001628_696758_7E2A86B7 
X-CRM114-Status: UNSURE (   7.11  )
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
