Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C45C433FE
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jan 2022 04:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nzOtC6iOApe2VSEJVMN9FsuqLS1RNBRIwNtk1BSMIV0=; b=OFjNnaGaURPHff
	quESJTYOmtAwzwuCaoTPigGYwTCvOG+PF/aIlbO+wTLcw+vajd2oBUU/lBGXHk+NlLoLRYXrZKXTX
	pQBb3HGm2c6ZIvtg1tPn8neepX8oWgjtLh1P7xoJ113z3cTV6WniBbJQmDlDXv1J5R6Qhvwpmg5XV
	Bto8LMDleuSL4DVFzlraK2JtpAoKl8p54G00kEu0JZR7SX/7XqdBiO0vb69y9GRC8g9a9p9lFfd2s
	euBkw5TkDuafpp3UaSwdm3c++os7tEHuV8FWUa+bykDXgx+fQUvShRcpKsjBFoKcWN0+f+TPePuXM
	kAi9B76K2kjPZQqBtZPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7rhK-004aLn-Je; Thu, 13 Jan 2022 04:26:50 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7rYi-004Wp1-DT; Thu, 13 Jan 2022 04:17:57 +0000
Received: by mail-ed1-x52a.google.com with SMTP id o6so18322774edc.4;
 Wed, 12 Jan 2022 20:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HzmvZxRpnsxgqGIy8YYN4OsfjU68b3aJ8+UIStoBfA0=;
 b=Q4bJawOd+ZZkXv8DYD1cyGYc//O4+8Xv3qrX0kFxaS3KqdjqvRko4txY9AxFKmhTi9
 bQCGzdLhejzpi7defB3twuJjK5WsZhWFD3soyz2BBdx/9bnZpbzb6YdFdmkCCC9IkUAm
 ILL0FSwuIdsdNTt5qFWxuWJM7/1Cb4Jl0ooWHAHP1CW39KB8goeDhZ4FSP8rKz6ZwAsY
 J+Obew/8rmtQbBAXvxkMbx/l7V+7L2rAoe2lZKBqCcODi/QYKtfTYFR8WtdikZ5whLqU
 vja9VoRFM5NRp/FStTVJukn0GFcrSAPjr+H5RqIOfYuSQ9Kkfmb/TuHgYT1QqwCjp5ME
 SjAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=HzmvZxRpnsxgqGIy8YYN4OsfjU68b3aJ8+UIStoBfA0=;
 b=OcUsDLXlU8YPknENluMAIj40LhVEq2TTWfipAFtI2W7EzRP2Vx2kzOvxv/yViBa7FS
 C7JAillA+VALs4mlziSzd5kfF/JoehBdXZJ4jJKwEfQdHSEjvT4b/tsugcNatEIXk/ju
 UUqxKe5MFyoF4GWqKaAcbwXgFVLYZtD57L13m1YW3yd4N+F2kvBYhbugij3OKhbX2P60
 8S4jn1PpYOKWF9vilbGbWH+bxugFsOypRVk3CZ++kf3qdyZm6vZt85x0JIn6cfkB5fdq
 ZeMAyo2sWjuA3pqn5/ARGpTrr7dDlMbRXh1/fQSkF/I//hWLJWIBoDGsb5OOy4SGTYMb
 QK/w==
X-Gm-Message-State: AOAM531ppj5olCq8qHNPK7hBWoKT87HjfppcG+yS0O8VRuYqOh9cffRW
 j+0yYiKT7l2qRIa71I5Z4xQ=
X-Google-Smtp-Source: ABdhPJxo4ki9X78vZDozmtI4hYQi3ocBBT2r1MmiDeO62vyGXqHwpXjySadKKu6tkkT+yyagVAxixw==
X-Received: by 2002:aa7:d507:: with SMTP id y7mr229177edq.298.1642047474644;
 Wed, 12 Jan 2022 20:17:54 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id eb14sm651822edb.16.2022.01.12.20.17.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 20:17:54 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH 2/3] arm64: dts: meson: move pwm_ef node in P212 dtsi
Date: Thu, 13 Jan 2022 04:17:45 +0000
Message-Id: <20220113041746.16040-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220113041746.16040-1-christianshewitt@gmail.com>
References: <20220113041746.16040-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_201756_507790_5661D020 
X-CRM114-Status: GOOD (  12.15  )
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

Cosmetic-only change to move/alpha-sort the node.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 .../boot/dts/amlogic/meson-gxl-s905x-p212.dtsi   | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
index c635e5858929..b3d7b8613d6d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
@@ -97,6 +97,14 @@
 	pinctrl-names = "default";
 };
 
+&pwm_ef {
+	status = "okay";
+	pinctrl-0 = <&pwm_e_pins>;
+	pinctrl-names = "default";
+	clocks = <&clkc CLKID_FCLK_DIV4>;
+	clock-names = "clkin0";
+};
+
 &saradc {
 	status = "okay";
 	vref-supply = <&vddio_ao18>;
@@ -170,14 +178,6 @@
 	vqmmc-supply = <&vddio_boot>;
 };
 
-&pwm_ef {
-	status = "okay";
-	pinctrl-0 = <&pwm_e_pins>;
-	pinctrl-names = "default";
-	clocks = <&clkc CLKID_FCLK_DIV4>;
-	clock-names = "clkin0";
-};
-
 /* This is connected to the Bluetooth module: */
 &uart_A {
 	status = "okay";
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
