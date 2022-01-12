Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA42C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jan 2022 21:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t66ItVE5k03+hfvt4QoeZX7znrnuQgO/noN/4QEDYnI=; b=MpWxs4XTxRuNBg
	jiyC/zUcJLIX7fNFF57AHrVEZI6BZ39t9O9HifiTWEz7eCgl/g0GXaR3PLgu+yjYLg4nR14X2MTYa
	lGzWb25t4PKxG3PR7dBVUNK5m+Id1M0vPWDevQbJbJ8uTLZR7n9MYvUj2UqEawRgXW1goKZcqa1gC
	o8g9IEMMDk6nzTXu4KK6ynHiNnR2E9mx60xBuQjaQiOgxNGoUcYQ47UQa/AO1aOZDm05fW4xvm34c
	E3bE2sItpVXusvTYGokcBFi7V+Aj2/y8G+vPT/6OTcmd/zgEK5YUwae+3KvjhRr9ODbDqiLePJ6tp
	9qNPl0y9JVoF35chvawA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7kzi-003pl1-6O; Wed, 12 Jan 2022 21:17:22 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7kzN-003pdL-SW
 for linux-amlogic@lists.infradead.org; Wed, 12 Jan 2022 21:17:03 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 y16-20020a17090a6c9000b001b13ffaa625so14872926pjj.2
 for <linux-amlogic@lists.infradead.org>; Wed, 12 Jan 2022 13:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P0OpirpLo3lFPzhXuxtbh2WjLoHGGYMgIKLuMYWDySQ=;
 b=Nex77jCtujyu/JYrJVhh4VSI3QRugHS/8QUW03cirP3xG0d+h0WH5uL/kfJz8OD25w
 X9vKtrk0BED2tqKug1kk50kdAJBQroPulaajtEo6EBVDocXTMnaO1gpsgGo4BP1HaLza
 OPbQfVL+WH8aIdzOa//C5wHZHjs4CSjMHwNP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P0OpirpLo3lFPzhXuxtbh2WjLoHGGYMgIKLuMYWDySQ=;
 b=bLFxyE7LJnaOs79DMb4g2e+aH72d9LIupPGxM6spmKyRHJHEfKeY79pSn4MmXtLWa5
 AicmdEyDQiv5oSNhxZuDEGuHFzpOrDryGQj3BZh6XIU9/APHyAW5IyTx9yQKCcyaM3YY
 XS5XVKUNnRs4APEUw2yKRgBE3u8hr6oEnGoqhmd6x81TfHL0zKo0D4/5GrlSm4pY83Uy
 dPK71aAlNMwYgoUiP2Xr+ApQB++9pr1O3pJkfgdFEVtl8f2qG8iR4GCyiKfa4HPFPjSl
 CXDl+Nle8RUfeNGbjd0RpmLBA+PteAbXfrgNxdp6NOj66TYA65Xr8K3MBmL5Ua1fBIZ1
 yoRQ==
X-Gm-Message-State: AOAM533+TN658DrUvvb6sy5CrYyjHkIVr8czsNYZrJQd5qFVhsou0KJ2
 T8zDGOmEGxiqDP2sYTz9OaLxyJgVEvBQzQ==
X-Google-Smtp-Source: ABdhPJwbJwaH/Q4KmjeX+oL9vPN/RCYvtu1ji5uNMCH/GhuM3e2/kYW/rA9QUcuITjN8PNtNNsSrUw==
X-Received: by 2002:a63:a745:: with SMTP id w5mr1310352pgo.374.1642022221052; 
 Wed, 12 Jan 2022 13:17:01 -0800 (PST)
Received: from localhost.localdomain
 (2a01cb000f5a8200e371e4a5048c8b22.ipv6.abo.wanadoo.fr.
 [2a01:cb00:f5a:8200:e371:e4a5:48c:8b22])
 by smtp.gmail.com with ESMTPSA id h15sm507192pfc.89.2022.01.12.13.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 13:17:00 -0800 (PST)
From: Gary Bisson <gary.bisson@boundarydevices.com>
To: linux-amlogic@lists.infradead.org
Cc: Gary Bisson <gary.bisson@boundarydevices.com>,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: meson-g12-common: add uart_ao_b pins muxing
Date: Wed, 12 Jan 2022 22:16:42 +0100
Message-Id: <20220112211642.2248901-4-gary.bisson@boundarydevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220112211642.2248901-1-gary.bisson@boundarydevices.com>
References: <20220103154616.308376-1-gary.bisson@boundarydevices.com>
 <20220112211642.2248901-1-gary.bisson@boundarydevices.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_131701_933897_420D109D 
X-CRM114-Status: GOOD (  10.20  )
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

- RX/TX signals can be mapped on 2 different pairs of pins so supporting
  both options
- RTS/CTS signals however only have 1 option available

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
Changes v1->v2:
- renamed nodes as suggested by Neil

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 .../boot/dts/amlogic/meson-g12-common.dtsi    | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index af1357c48bee..62350c408e16 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1952,6 +1952,33 @@ mux {
 						};
 					};
 
+					uart_ao_b_2_3_pins: uart-ao-b-2-3 {
+						mux {
+							groups = "uart_ao_b_tx_2",
+								 "uart_ao_b_rx_3";
+							function = "uart_ao_b";
+							bias-disable;
+						};
+					};
+
+					uart_ao_b_8_9_pins: uart-ao-b-8-9 {
+						mux {
+							groups = "uart_ao_b_tx_8",
+								 "uart_ao_b_rx_9";
+							function = "uart_ao_b";
+							bias-disable;
+						};
+					};
+
+					uart_ao_b_cts_rts_pins: uart-ao-b-cts-rts {
+						mux {
+							groups = "uart_ao_b_cts",
+								 "uart_ao_b_rts";
+							function = "uart_ao_b";
+							bias-disable;
+						};
+					};
+
 					pwm_a_e_pins: pwm-a-e {
 						mux {
 							groups = "pwm_a_e";
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
