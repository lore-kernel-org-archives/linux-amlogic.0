Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 628A0CDE002
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jun 2026 13:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gwBNZ3ZB6vM8se60Qilb1IhiwXANdH0/oTmxVSfj34o=; b=iOS1x+Zhd8a9C1
	JkkvurDwFm/3tWsoh6bDa/I6bUaRMAyNjMLAMuexPvh5hvOLEW70UDT4T5tvgniVxFHC8DOYfDnNf
	JEZKJeXk8m/Ng81gnmYcoJRpBA2XDxcodjUNVyIb+f4lxWIQAS3OYV9Cjn3ZykK4VTHCfmU/ONMLo
	57e/+0ZuA+6xCENJ31KdethWgT892txlUM6l/gvZiN53EsQtlkOe94WSMdTC2qi58ZWuiBvW3FK13
	zL81RqYIR5HdP7qdpkPEp8b5U/8pTs75qKCHIS5COEt2CScOTGflk3Cve78wbQQGhQI1o7elU9Sur
	W6W+doCrVW/xe9iWoDVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcO77-00000007rzo-0ygB;
	Wed, 24 Jun 2026 13:58:01 +0000
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcO74-00000007rxB-0o8y
	for linux-amlogic@lists.infradead.org;
	Wed, 24 Jun 2026 13:57:59 +0000
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-9666739d3bcso373741241.0
        for <linux-amlogic@lists.infradead.org>; Wed, 24 Jun 2026 06:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782309477; x=1782914277; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mk86bxlrPWUP+ZTPQQXB6H9xJamJagPahnQQ0p/X5sM=;
        b=OQwkeAy/Xy1h7+jWnGMiN/xLKSfuwrhKeaSHXN38uWqg+REuFi5OcB7OVBYJNd6peV
         QKifgRNW7vda8JzZCxmHB3rZ1VBmRPcsbj76zruFi1DdORLcpwYVr08CdyutNMyCQkhS
         7pRuGl20IwlZuPn16TVxSjeUx6tbhcBZTtsrPdSaOGWzoqCBbMTFnFx4uCTEmOIwnr3K
         6uKuB8jEb9SPje4SPitgJTPD+bCjBbvLCThEDuXYqNzU1PhWHAlhqD0fT25AlPHUuCv/
         37k+vuREQbnSiXG7cpu/jM6ZeKAiCI50Q2kALkaTgBUWHA7dpGJcWkpFnE/YsMH+PUw7
         lwKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782309477; x=1782914277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mk86bxlrPWUP+ZTPQQXB6H9xJamJagPahnQQ0p/X5sM=;
        b=hDPXpFKm+H452bWVsjeNNk/S6YF9RWKea2fqv6NUGS86YCSI4HoOULQDcKuDqKm9ne
         +qsrpw5Gb2he/QbQMKG8aQ0d3sxE6Lok0H0AUJpde7ZBeWX0YiPNr7vDB6nm0Hdfa/bd
         WXLXMIB5yNS3v6rZMBmU4qi1F6yxtaJhIghmDBkj2pC2JvOtPyOrgQGwo9f20UiRbz1/
         kwsP2PVl3dn89b8JaCdP+PZeNLlL7XEDkhA1ArY1F4f6ogP2FvjvwYsJpt2eigAo0AJE
         nGQMlzIZ1KVVIVoMxANEm9nOwcemGqBmJWgKsnvp16urwnhvcar9kfNsw3uwTeiMWHdl
         e80g==
X-Forwarded-Encrypted: i=1; AHgh+RpSYSc4HJZIqxw+p8P3CKeQ6c5hBBaNMuq7Q7PP0AInZElJBkrtJ5pr9iC/Jc7MRb3vsHR+qPyjzrSWy5FB@lists.infradead.org
X-Gm-Message-State: AOJu0YxZDHlrqptldXHSyYb5QY5HY4TS0oOE/FDNqapROa4+Fq9dhQKC
	SKz6IaR9TiMf58+o6aHUHxBAroToTbXWxCJwNDiv1ed5Ayf/zuKGAV+z
X-Gm-Gg: AfdE7ck2BoiGD22E5+iKIuNgrIrLRk5jD3SAr7A+FRw7TzMkFY3cpvQrmYutID44inI
	FTI2y7NsjgiLS2shxL8Tx+3q9GlJtelRxFspE2cxYdeNmL4D5/eMOay3AVKfK/DgvswLLZNdHI3
	cOagrVJ6yc5D2nO1pk0aWQJ2LpdTa1OngaFcw6G1LJCsnuQY6PqeXOfw/zUCykyg+hbxdpzfal4
	6wKUtehYg/Y6scTVVNSc5A/SyFbfMWJsPsauiZdTAY9EMcBqqhUc3OO76vEJrTlbsMMDuaMxf9P
	XQTqEKUTF8zOz8/e8z3BG4yegsjc0YOxV0ls2vCSqU6dS79F/ViXdWZKMe/aPu9pnZVF8Orrl2B
	sOlabp4Y+gHRUSdiLXZVbB130dTnipOZawXHj8rfaaZWM1Do/05xjyr18QqPO2UveRODeMnMVqj
	DTIDPciNop3xHAXlrkxdbYlqmQN0fpMl6eJpo=
X-Received: by 2002:a05:6102:f09:b0:6c2:e290:cc69 with SMTP id ada2fe7eead31-731157322acmr1460988137.23.1782309476725;
        Wed, 24 Jun 2026 06:57:56 -0700 (PDT)
Received: from arch.localdomain ([160.250.247.70])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-72ba2dbc17bsm9805730137.6.2026.06.24.06.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 06:57:56 -0700 (PDT)
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
Subject: [PATCH v4 3/4] arm64: dts: amlogic: meson-axg: Disable pcie_phy node by default
Date: Wed, 24 Jun 2026 21:56:43 +0800
Message-ID: <20260624135650.727077-4-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624135650.727077-1-jerrysteve1101@gmail.com>
References: <20260624135650.727077-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_065758_238665_EDC55976 
X-CRM114-Status: GOOD (  11.35  )
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

Set the pcie_phy node to "disabled" as it is not used on some boards
and should be enabled per-board when necessary.

This change suppresses the deferred probe warning:

platform ff644000.phy: deferred probe pending: (reason unknown)

The meson-axg dtsi now disables pcie_phy by default, so enable it
for the s400 board to support PCIe functionality.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi     | 1 +
 2 files changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
index 285c6ac1dd61..7ba249cc3d56 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
@@ -448,6 +448,10 @@ &pcieB {
 	status = "okay";
 };
 
+&pcie_phy {
+	status = "okay";
+};
+
 &pwm_ab {
 	status = "okay";
 	pinctrl-0 = <&pwm_a_x20_pins>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 8ca3ac09b306..5b8ef98f6d03 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -328,6 +328,7 @@ pcie_phy: phy@ff644000 {
 			phys = <&mipi_pcie_analog_dphy>;
 			phy-names = "analog";
 			#phy-cells = <0>;
+			status = "disabled";
 		};
 
 		pdm: audio-controller@ff632000 {
-- 
2.54.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
