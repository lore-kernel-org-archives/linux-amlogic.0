Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6178DEE57DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Sep 2023 15:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vGuBTyQAbnLVRzE3fArx7bN1c56ehltpIUoxYKr8l44=; b=ukoGNGkPd7J7MV
	2w0MlcRZz+eQvAixHNtOl/cBXoSQKTii0hpRracl/UX7lsuFvw/zLNYxO55tip0Jf+hhcxa5Y/O1f
	adAJxkYF9OtjepY2hBHWNhDVOAHkezpRyEzxsJeRJydczLOC2fbszllrmc/pXIdMT2kXOzwj8hCnE
	gMoGEcG89rPfEgk1X1/ieTfauTn2PysZDhA/zWTdENUIwqa+xCOSjRwKd2MtzIXLrjPsgiVvXOQsd
	GGk5qyYiRbFbFPLjeLqUX6QL3NUY5Wgt1JYQE2faE7OBUOtoynninjYIUyRuein8UZ0+kyeEX8J52
	T+1nEH74OFw6q7Bi9wbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfj6u-000vg1-1A;
	Mon, 11 Sep 2023 15:46:00 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfj6q-000vdQ-23
	for linux-amlogic@lists.infradead.org;
	Mon, 11 Sep 2023 15:45:59 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-401b0d97850so51255025e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 11 Sep 2023 08:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1694447155; x=1695051955; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=epwO+SStz9NM69htgYjFNbJ+1k8dChdarhPRbsLmIPo=;
        b=N0Cnq7Wep2NqGrM2iA79suRSj06du8BfWhZGqWZv2eUk8UXNk4jrubd1Zbun1qExDC
         iAnWNpHWpP7BS4MeFeTcdYApY/iVRvmvop+EGkKZv3DpI4oNi6WoZwjIt/loxeoaq41a
         3gnrx4aoNW1PsqpE7OxCuYp/stqc4AyYUK2TkpDtnwagT3qfcHs4O6135HP/GW8vuDzl
         lhgptSIpJyeRVjhO1BhwdGFUJUqKOEEXYDf5OeGQj22lX/l77A9zUdSBm29CrmlVpbVP
         rt7RITQyI6mFtHqTwrlS6ao6K7is8qrso/Uze/bYpxDhrhB6BuPmnhjeiiWg+7pE1quc
         nHpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694447155; x=1695051955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=epwO+SStz9NM69htgYjFNbJ+1k8dChdarhPRbsLmIPo=;
        b=NA8nA81Yv8CE7AvNJVnAUR9xeB/lG9F2OLVR8mzRk/bSUuD6xN55tGLJ6aUzlN7458
         4myL38trJiO6UQHvD1cUmqcTV+8Coifza7wKMd+/9pssbnyX/9J1c2TShhoPevs/xJa6
         041RFsng/TpP2vQ4nHKVZHnpOMVVRuewCWfJUI2cxhW83sS0GXYBnKfC4a+wyZdPOJII
         j+CK2f1AcFhzheiCtm7xeCr0kjnuda0JG6pSbZ5u5GmTiY+ymVihw8w/oXL32OZ2fetV
         3IMkCkt71D5MyOgEL4VPjk9VkGJbSIRppOaYSDLSBMpKqU1lfPuxz5EiC9QAwzqqJSHG
         +QwA==
X-Gm-Message-State: AOJu0YyApNjG2yoipHfTZWTvU9Jra9ZWz0Zdgf4eY9yOxOTQxAzpBf95
	IynWu1Uhr0tStPSA/JzhQmx+TVDmTpnrHQ3z8q0=
X-Google-Smtp-Source: AGHT+IH/l9YhTMJ8R87Jn4M26LwWErmp/fMinm+HkJON+GjKiZqfQ57rUyoelo8qX83HND/gSYm4Tw==
X-Received: by 2002:a05:600c:228f:b0:401:c338:ab94 with SMTP id 15-20020a05600c228f00b00401c338ab94mr9099563wmf.29.1694447155036;
        Mon, 11 Sep 2023 08:45:55 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:55be:8f7e:5f59:7ed1])
        by smtp.googlemail.com with ESMTPSA id q12-20020a05600c040c00b003fe539b83f2sm13616255wmb.42.2023.09.11.08.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 08:45:54 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 3/5] arm64: dts: meson: u200: add spdifout b routes
Date: Mon, 11 Sep 2023 17:45:39 +0200
Message-Id: <20230911154541.471484-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230911154541.471484-1-jbrunet@baylibre.com>
References: <20230911154541.471484-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_084556_672262_E1F90BD5 
X-CRM114-Status: GOOD (  11.06  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

spdifout B remains untested as it can only feed the HDMI controller, which
does not support spdif ATM.

Still if the u200 has spdifout b, the routes to it should be set.

Fixes: cfae4eadb7cd ("arm64: dts: meson: add audio playback to u200")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
index 2380d237d220..921b62c5ab33 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
@@ -166,7 +166,10 @@ sound {
 				"TDM_B Playback", "TDMOUT_B OUT",
 				"SPDIFOUT IN 0", "FRDDR_A OUT 3",
 				"SPDIFOUT IN 1", "FRDDR_B OUT 3",
-				"SPDIFOUT IN 2", "FRDDR_C OUT 3";
+				"SPDIFOUT IN 2", "FRDDR_C OUT 3",
+				"SPDIFOUT_B IN 0", "FRDDR_A OUT 4",
+				"SPDIFOUT_B IN 1", "FRDDR_B OUT 4",
+				"SPDIFOUT_B IN 2", "FRDDR_C OUT 4";
 
 		assigned-clocks = <&clkc CLKID_MPLL2>,
 				  <&clkc CLKID_MPLL0>,
-- 
2.40.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
