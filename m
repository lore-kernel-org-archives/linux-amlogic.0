Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FFAACD5BB1
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 May 2026 15:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kYuRMTtff1wfvi2sN5dFe7YZS1oDl+EJKGFLrqA+w8A=; b=M3zbBYxmb+TiUM
	Z/xawuKXHsf/ehX5hlnLQTUWvlH6TXCeqzjcRuVPu34whorNG5HXqhwU3JxO8i8NDHr2BPJh1FrSF
	Mt2c5LqU0AuV9E72I8mkHoRVM1z6GdAl5049huG/3n8Nfi97BjsoL4dFuaoEk6B6yw+f/cO7Kqjzz
	sY+2B03JGv7jUAEjLMrxhEJWoRrr6eldy5Zq+b5qn5qMNwlYCKPi2blqz4Prga7ogz5yTx8UvUfTu
	KjQLz6HJGN4vO/OjaHEbCnKTDrxnw/+TdzzrKFpCixt8wmWoi4pmf/buvSE9vk+dvQ0uTSdeaHB3e
	26KzzUVft8+sG7iQWmXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRB5n-0000000FDDU-0OF4;
	Sun, 24 May 2026 15:50:19 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRB5k-0000000FDCa-21Z1
	for linux-amlogic@lists.infradead.org;
	Sun, 24 May 2026 15:50:17 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-82fbf5d4dc2so6297019b3a.1
        for <linux-amlogic@lists.infradead.org>; Sun, 24 May 2026 08:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779637815; x=1780242615; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ReOkgoPLdCaHd6CcEsCAqea7Z9/lGvf+pkF1enOHLhw=;
        b=ZeQrNKR6GNqrfUXxWy/yUQnJAK2Dm0wqxCQvonmZ7oLntuAc8KESrGVvInPfiPOYDE
         TEAlldSIPbXRpG1XvBcyv2sNmU24yPP8J0YiikmjC+TiVDrcKho46v7cRbAtlD1FMMr/
         mBjBd6x2KKKR/tgx4+scQAfvU20fCdHaKp1kdLAbD1ZRCawV4Kjibm8JydpF5J24A6c1
         VOxUqm2t3vB/QTXfRGkpq6wdHf8/iXwI8XK/ILs/nCq2Ys3Rpu0MkCuen6gGPvKfojdO
         BQFP2KoxUreMHzoZxYzvs634Y0WU+36y4tnD+4N1sSght/oun7kz24b8paW0MMDdsS1U
         JhSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779637815; x=1780242615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ReOkgoPLdCaHd6CcEsCAqea7Z9/lGvf+pkF1enOHLhw=;
        b=d9w9BuqA/1VS6WHMYQnAe5ChhCY5XHhwDNfHS21RfDb6ecSKxOItSe/+4Q7E+iPdRd
         foKbiat1i4ULOEm3VMw0alcCH3xEZJcEQECDs5fIgB03DxlVbqCk0KZsWA30kR5mWdIq
         fZyjGRHeX10LPjbs/jA2nr2ALFUaN+76KktPmszPEqmJDLZOx4DDDDXMeJ1Q66HfUBhh
         J2AkP+6Kt4OWV1zCpPxdBpZqTlraEYxxL3IDg7F1/dnAgC24JVX5eKoYDORPtTwhxS6n
         MK7V2vcp/7iX7TnHpganZKYY5mpMkUzY6LcbKPthCHke3zqZ3A0CXPkiPIDJcYvOm9s/
         FTDQ==
X-Forwarded-Encrypted: i=1; AFNElJ8WSBSRI/qg48j+gTH706s/N4UhAOk1rriovknIStekC8Y9L9A+szTq25BIW3N4YrQkUNh9X34e36PAv5cZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzBB1rIe92LnCtIuJIwoEbQ8YNgtiQLkK3rQOV1zOEfvU0n/khj
	670UeLlnw00V2WUYjc7N85ZbXKZVBfHDpYqIprECSzveRNnPTcJJ8jkj
X-Gm-Gg: Acq92OGfR83AmGwi1kwnLv3hwW4YBP17c5jqNYV/JJx0Klan4CpmsrPMHZFUvE1PB+k
	C38tKdh9p0hSA1rbZKH00pNVFcjU0eIhA7f/4dfgVp0Fyl555dP+LvRZgEd9dXadDyOi9sU1Xcr
	Rqj5JNO+DWUA7HfyAtYAWQZPcmmluk634P4JPDV+ISkkuLhkF99TaZD6PeQdmC093KK+VUoK8mU
	qQIGukgLDjUYHv4AMfkbcKi6xt9QTSWztfUjWUSav+TonNh1UAOCP8le5mBGglwZoRLrGsJBhKk
	f6AGBnDh1Xadxo/XCyeVig/V+BF2cym+tKnkaw37N/7BrXdW/sKE2TzNZ8N6nHf7C4hkXyEmSfT
	HD08kH+PfhZcMxqP7BcCDqA+IoZCMaKy2W4RilWfcnlmKpP17mWiPesQZf3TcNfOoO4O0HIFzDi
	6VMXKsQ/J6W19ccpYjorKxmomAT7EU5w0YFSeyA071Iax61foaog==
X-Received: by 2002:a05:6a00:2d25:b0:82f:5051:f024 with SMTP id d2e1a72fcca58-8415f5dcc6fmr10442376b3a.27.1779637814974;
        Sun, 24 May 2026 08:50:14 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a5f:4fa1:cc65:18c0:209b:38a4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ac9b74sm6997716b3a.3.2026.05.24.08.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 08:50:14 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: gpio: meson-axg: Fix whitespace issue
Date: Sun, 24 May 2026 23:49:53 +0800
Message-ID: <20260524154954.385778-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_085016_525268_B6096BF2 
X-CRM114-Status: UNSURE (   9.42  )
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

Clean up whitespace misalignment in meson-axg-gpio.h

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 include/dt-bindings/gpio/meson-axg-gpio.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/dt-bindings/gpio/meson-axg-gpio.h b/include/dt-bindings/gpio/meson-axg-gpio.h
index 25bb1fffa97a..a0d42bcd9bd3 100644
--- a/include/dt-bindings/gpio/meson-axg-gpio.h
+++ b/include/dt-bindings/gpio/meson-axg-gpio.h
@@ -23,7 +23,7 @@
 #define GPIOAO_11	11
 #define GPIOAO_12	12
 #define GPIOAO_13	13
-#define GPIO_TEST_N 14
+#define GPIO_TEST_N	14
 
 /* Second GPIO chip */
 #define GPIOZ_0		0
@@ -52,7 +52,7 @@
 #define BOOT_12		23
 #define BOOT_13		24
 #define BOOT_14		25
-#define GPIOA_0	    26
+#define GPIOA_0		26
 #define GPIOA_1		27
 #define GPIOA_2		28
 #define GPIOA_3		29
-- 
2.54.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
