Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E11C36008
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Mar 2025 19:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jgcxDHe4/vvtrhrjYXipWlTDJFf3u9HH9TVjVnUoSfw=; b=eZ0fRpvjnAzQxn
	ckii6860HVz5iozt5PUQSm0B6EvJea8AxoLPDW4lhUBf64gh165QyzYl7ibFmcT9vL9TkB2ccZ7J9
	JBvdHC2LyP/1T6yl1bl9iOLlD3B6ZxKFI3kjgE7obmVQn+uC2MIzMIgjyxFjMUbKOfSbtLmHokCJf
	mZXB2pWp+BlWrCZfXtDUkyIh57wXmiMEsYqt3wEWojcJzZ7uPsr8Oh2o5Gjz2j9JfKxnSwcIb64KS
	TIZlVyDCvddM8Cn24IOwDvxD5ZRXaAGI9cE9euuNCftMn+qtUVN0FoAhopsbb/P+WYn5IPfretNqX
	XVnvHlBAMMGOcf2T725w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tybap-0000000FRWe-0bra;
	Sat, 29 Mar 2025 19:11:43 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tybP5-0000000FQ3t-1mvn;
	Sat, 29 Mar 2025 18:59:36 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5e5e34f4e89so6020810a12.1;
        Sat, 29 Mar 2025 11:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1743274773; x=1743879573; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cwf31W03hzDQ3pn4ZEZvOqnTw7bLaOev9kguqMxCgac=;
        b=iaa1I/DWTUSMGcPIvuXT2MHrhYkhwCc7/4Xp00Cay8Za1cNsv9+uA5Fq/eNptnwRTx
         05uhj8S1k3hDcERmr7KikAiZWkSnmytrhc6M7+b8vruVNZp+OPqU9k+PB/DytdjKgIyT
         Bj53NS6BLCVyeWazRKPwXboekJqPErULKDcjL02ZjIaBjKNHXGR4KsbAJihLPsnfAgFj
         LghRHrm3HH88jy3K5xKWRyviOuysBirNhtI6+rkWcUhZFyZNvBbXBvOuV+PeU5p2G2VP
         si3vlIxlleo8HIZ2eltcB5tGd6vPWx/WTOO+SPRubjM0iUd4PbIX0fZ82sqk1oTTnocc
         9RJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743274773; x=1743879573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cwf31W03hzDQ3pn4ZEZvOqnTw7bLaOev9kguqMxCgac=;
        b=thWGkMqMFkYnrqYu6iVPbK8QRm/Jba/AOzOIUeasvRNu1051fd1P26mWtjFRzYUq/7
         MuKIYlEovygU3h0SMXQcb/2xEZs+TdKmemn38bQ2gRk7FOEu4uxy4v22VD6zsbzPTbcW
         CWxNEwEpf/NonieuCKGnGbyO/E6Lcl6HJ3jaKhlJyDPazO4bVS42VBUiZNYL8D6Fr8eN
         rAoPQf07n/DmHQ1bnWMC/jtFyHIEwhQRKCa0MnJFq+4zHJocFfR5MX0orVmg/ysmMPQu
         2w8X3XGJih4abZ8uR1LRhFe098cjXQaO5BgB1YzEuJNj4f4DyixtjW2Ukn0DrENj1Bxn
         I9/g==
X-Gm-Message-State: AOJu0YzjTRAjDUcFXuZtbz9JUXMDYGli9ead7232qtbmY1Rm9NH+eYyc
	1DZV8xDtjt5L7b/1GTRQFpFBQRJg33XqT2egtABvz70Afg8AetEs8H1U7A==
X-Gm-Gg: ASbGnctTMoZ0kUSQxesSZKHhhg3yWTfwY1P7IjuxemjBHzbNxZpucu74EQG4ax7U7IU
	vn54pa3aMIxpY07u6ZE8oueexebK5fHehEqnXeGlKA+TM5tz9bQUIJUkkYiHHnZn5jnKaNuMmQA
	jVxya6TIM48Xj64W0GYPn/p6pCBDmZe8oFKqpb1Tqvc2H1aKw9x2CF8mPgY7pY9zT9yA5qgayky
	gi2FnerKf4EFjEU2WkWycWQ755WU8xyr+FjgNM+2/SGsdF3TEHOrgcPxh+9qoycjzhjjDPuH2qR
	TOn76ZOPDgFQKMWhLIQTap3STnMZS0P5UEvLuCtXyvc2gMspBdThu4SD7u6HIH2soOx8KSv5eAx
	Z1JL8fxYTXyaXbLKrI1raVAwjXsebwM1NYSYFYDbOC9oQMftbiuek2XSZ+kaGQ66A/W43SQ==
X-Google-Smtp-Source: AGHT+IFTpADwyhmdGZC/uMEn7HRP+YrC2xbCL6evJOQI7YFnJ9+6LvnjcqnXDwdY3wn5SL8IaD1VLQ==
X-Received: by 2002:a17:907:c26:b0:ac3:8895:8e99 with SMTP id a640c23a62f3a-ac738998f18mr322099266b.3.1743274773307;
        Sat, 29 Mar 2025 11:59:33 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad73-6800-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:ad73:6800::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ac7196dd46asm364497866b.160.2025.03.29.11.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 11:59:31 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Subject: [PATCH 7/7] arm64: dts: amlogic: a1: enable UART RX and TX pull up by default
Date: Sat, 29 Mar 2025 19:58:55 +0100
Message-ID: <20250329185855.854186-8-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250329185855.854186-1-martin.blumenstingl@googlemail.com>
References: <20250329185855.854186-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250329_115935_463688_DB664DC7 
X-CRM114-Status: GOOD (  12.17  )
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
Cc: devicetree@vger.kernel.org, neil.armstrong@linaro.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, khilman@baylibre.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Some boards have noise on the UART RX line when the UART pins are not
connected to another device (such as an USB UART adapter). This can
be addressed by using a pull up resistor. Not all boards may provide
such a pull up resistor on the PCB so enable the SoC's pull-up on the
UART RX and TX pads by default. This matches the default (from u-boot
or SoC hardware) state for the pinmux configuration on these pads.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index 1eba0afb3fd9..f7f25a10f409 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -233,6 +233,7 @@ mux {
 						groups = "uart_a_tx",
 							 "uart_a_rx";
 						function = "uart_a";
+						bias-pull-up;
 					};
 				};
 
-- 
2.49.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
