Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5664FCD6E4A
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 May 2026 14:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e/qLtg87CMLOyKiS+l25mt4dt0typ5MtP1KafmXYT8w=; b=13dc7yzuoJTZze
	NeDCh47lrsImI4tJlTZIpE6pzfUc5nDqjjgkdpi55gTk6WsaWGcACuU3Vf3v4BUQJHYK+VZZjcHXq
	YQO9IoKeW6kPwnmN8JGiYlrjGj3ZbnpUd8EyZ55Fj29YSGuChuyUYFoXq6yFM0mePKWvup2p0T9fu
	4U6IVsDuhS9yW5UGjcBw4iV0ZsMarYwi/yfjGCtde9gqq8G9oB/PRao5x031Qdayxac7tDuxWvEoR
	sNKSRqvD49QIHqgRnqYqjM6VuJ/AMFXKHu9+XXhobTYiMhg0cHWdMSOxpShVxcBbLQHxA/ALprp79
	QjhgczQf3xqdA6B6cJzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxqw-00000007UHt-2QIv;
	Fri, 29 May 2026 14:06:22 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxqt-00000007UGF-44ta
	for linux-amlogic@lists.infradead.org;
	Fri, 29 May 2026 14:06:21 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2bea7176c72so67502845ad.0
        for <linux-amlogic@lists.infradead.org>; Fri, 29 May 2026 07:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780063579; x=1780668379; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9TLdBdo+a7d//how+11PkSCp7hrc+buyRfRIWTDHt0c=;
        b=Fz2T0iVrw8uozYt7IZJvsB8DAbp+G7lCEEEQUwdlYVVTxfA1v0OMcQkKkuvhSmrhMG
         +yMNyoay8UdF1nebfs/wf6LWm2w5iN9cGR9LrR6EY/Avk1TijBlGRjS5Pemk94bl4xPc
         F6LYs2eEGzatqsR7lIiS8EjA3ee54FAKcfhnPnq1BdWaNm9Hzygi+XAkwRxZTENNqaRd
         8kmU+CQX3qE0kDmG06CCfRB/n9e8H+gtSC4omT4RYkd1jVo+klhmmIp7aNbxML1DcDzL
         jeOgpRfinBZL5ha8lrDmqhUFIlINjfxUV792gDOtiSjnnxLZkHU2aqmi0cckGuUDg42O
         ezTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780063579; x=1780668379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9TLdBdo+a7d//how+11PkSCp7hrc+buyRfRIWTDHt0c=;
        b=S+JEmhXOe1hu9a0clDgwAZNFcvc95hYQE0sW9fdKWfVNLbuobqOCgdg98M/0anUkFm
         rhfl05LTLu5j+WFZ2iXkIW4bWVJMcctqcWVK/QIE+dVL1adH1EzYvKLWGzfbhVmqLf0k
         nPOciQzvoQhxv+epLnn3czbGoY8TyfKkEg9zE6/ETjHjxEw3Mh6A3dYg5PS6HIMRQw2S
         A5XRfQ9gjMBUt/TdlKMyrNKAy6pyzyQ1DQ16h2y7C+kYuGAccWgfQwBS4PT3256bv76i
         dwo7CGsvd69HqkY/l5VlEm14hdGKAvPLn+vIxO8xSIAy+EtW72dix+7qxQnPbjN+YxRf
         fJTw==
X-Forwarded-Encrypted: i=1; AFNElJ8kExr+a6bFUdAbPvh2Pq+S2zdSe9f/MXWwGJbc/EkDOjttvWHxGKmNL4H2AWcyStWCzxCUJQZ1hRmopUZ4@lists.infradead.org
X-Gm-Message-State: AOJu0YztGJ9msiNAxb8tbthXY+NFovZ40ferPfwC7jdi6mnN9xFj+SWL
	I3QvcMUeFBgx7D8N4UQm3UP5zZnbzK0Sh+rU4DJYEV/a/xERF3bkg3rU
X-Gm-Gg: Acq92OEb7QlovJtpxZUCO++qm3YNpU2h6wFn+Fs3I/Lof6i3bI5TsqJKTa95c6fq869
	3TUgxZbNEL9qDlU8JS8rBdEcj2YsFU7fCvvgC3bJTdlaR7+xENChcAYnbmiTrq5LqlgFwsD/yBm
	uH8sY+l3uhVinpXEzLiH3vki2FuvhJPGdLH7SwpkP2L/eAzABG46gDrsXbKM6EoWPyzzY1blPu6
	OMy/HCmz5hmlTxcKPdBH/IxBQHV7Snz8W3+dWD0WsIcfoHYY/J11TzTj/x4EVJxq2VrbcvmBpSC
	Lj69bHUA3ePCA3Jy8MFydA1xof+kjCgYHDoe1EY0vB64MWJKsUnwmsF4ibmOxRcwgnGEPGQSUTz
	d5zyLYGgbCkD5G2HBw39zXJ0wDP4jOHA5IywGmtIBJmZH0ClTZhc97bwZ/dcM762E7DVgFOFx2U
	o/PwptezMEuoVE4Hzc/aun4q1uazu9zZfD0jIUyRhz8YR6gTKG64wNNTuzmtm1
X-Received: by 2002:a17:903:2b0b:b0:2ba:ba5c:2524 with SMTP id d9443c01a7336-2bf205132ccmr42462425ad.11.1780063579099;
        Fri, 29 May 2026 07:06:19 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a5f:4fa1:cc65:18c0:209b:38a4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c51f80sm22926645ad.80.2026.05.29.07.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:06:18 -0700 (PDT)
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
Subject: [PATCH 1/3] arm64: dts: amlogic: meson-axg: Add missing nand_rb0 pin to nand_all_pins
Date: Fri, 29 May 2026 22:05:57 +0800
Message-ID: <20260529140605.1070764-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529140605.1070764-1-jerrysteve1101@gmail.com>
References: <20260529140605.1070764-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_070620_023858_E7C0AD71 
X-CRM114-Status: UNSURE (   9.70  )
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

The nand_all_pins pinctrl node was missing the nand_rb0 (ready/busy)
pin description, which is required for NAND controller operation.

Add it to the pinmux list.

Fixes: be18d53c32b2 ("arm64: dts: amlogic: meson-axg: pinctrl node for NAND")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index f1f53fd98ae2..b7a7f4fae7dc 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -481,7 +481,8 @@ mux {
 							 "nand_ale",
 							 "nand_cle",
 							 "nand_wen_clk",
-							 "nand_ren_wr";
+							 "nand_ren_wr",
+							 "nand_rb0";
 						function = "nand";
 						input-enable;
 						bias-pull-up;
-- 
2.54.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
