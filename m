Return-Path: <SRS0=VXFk=4I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77EF3C11D0C
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Feb 2020 16:34:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E5C3206F4
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Feb 2020 16:34:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WHBc+dRy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zy/6H47i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E5C3206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=7b7+K9SYlo9mKGbJ/GFN7clswxo+kZkCJ9NBNc2Lk2g=; b=WHB
	c+dRyUSf6JluTQfygQn6ckfgolk9QJFju/sAMe4P/H9NBO7L/090thisnPnT/t3PhXiE2kxBE9ekO
	pyPm58QbLVVD7KihYZZNPgCSpf2hEmFNYS9ol97oHz04QUUhHQuHpaFrKLSiEhcIzhYfCxOLUTWec
	c8t5U98H5SMcmEaiKyD0XG0wL1TZCjaNWrIwRDs8u/uJ34CXkFvhWabiWA6PVz4PIIelSUOWs78Ov
	8Zkux8P6RUgYdzrMxsWjKnksiG2kGJGUFNFaygEwbnkNzrbkTH7BoSXPK1fA1qve+WBfPY2bPo1yg
	aaLS38yroeUp9Y52oD0VhU/tB8nEcLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4om0-00030k-Ev; Thu, 20 Feb 2020 16:34:00 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4ole-0002ZV-TD; Thu, 20 Feb 2020 16:33:40 +0000
Received: by mail-lj1-x242.google.com with SMTP id w1so4890781ljh.5;
 Thu, 20 Feb 2020 08:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=mU6goqc1IxvONiqvTYZTB/JhR8b7wxr9PjlrU6ggYOQ=;
 b=Zy/6H47iNhc6duTlQoHmZ3mvdacWIOPP+1YBoY72p7IK93DvVHCJ2x09p5VX3fLRrk
 FXoPl1UBTcn4UTW9t//xUkil5xwvVdYyLugGBLJJ+lmVA9h0TzMaPEhFH3/DAIM+CWpn
 /8wOMCqRF2iB+Y9BDTxGGvR/GAhRnDZO+vPumX1BrYCkLLG/nQsPKeAKl1ErArHNbFHf
 UjzQK2O28plVU+TUCK3FLKkCdxrkiC06V1mYlVktQgNdaxXtiDdQxNqGAgG0Pd27nek2
 uUUBOExBI/7LyRqXhxIfkv+LJFGphjn/OshscVzSuEXYigNovfAg2dYfCISIskOrS8As
 ay4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=mU6goqc1IxvONiqvTYZTB/JhR8b7wxr9PjlrU6ggYOQ=;
 b=OirO2XtzayEUc5tO4t7a+NLjdwARyl88qRBdJ5mS16jLOBu1C9ZDrcMPTIoPlZSJtT
 DwwoiMAVhlGT6hOGlG5ioO72+MK84mp7OSQumREqgx+Kxv4klHRsiIjr6/w+/2KosiZy
 N81W+c1XEOUSfWApaz7gL/B6Ib1nIJnMR0aKLXTaRoftila2Qwr1a/8VUuBxg62zIBf7
 Lesuxa7UyFLPKUzZCkbymyKo1/yt4tEW9ET72bMdwwIO5lgSV+0X9HLKxz22YPrG5OvL
 73Qbun9Wq33JpMX+pIycxnhfoVIfDgxzsxqp1JrIBEGKHzd0/9UeDuSjzu4uZo6EcwAb
 uV5A==
X-Gm-Message-State: APjAAAUOKdDnxQ7PnuneaEKVaXQwcp9sGgvywxQAsYKdaeG7fh4EBCXh
 9iRJ6MT8TypV68pxgDJ1pN4r0sKDHpDd0w==
X-Google-Smtp-Source: APXvYqzchIlyDbx+qLJ5TUp/c7SgjF1aZOiaYFR9U7AG7zzWR3ChSqgwodz6x6oEG8NwsgbH3OfHjg==
X-Received: by 2002:a2e:810d:: with SMTP id d13mr19485514ljg.113.1582216416742; 
 Thu, 20 Feb 2020 08:33:36 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id y7sm2097292ljy.92.2020.02.20.08.33.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 20 Feb 2020 08:33:36 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: meson-gxl-s905x-p212: add bluetooth nodes
Date: Thu, 20 Feb 2020 20:32:46 +0400
Message-Id: <1582216366-12964-1-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_083338_974667_E016A895 
X-CRM114-Status: GOOD (  11.86  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This removes the uart_A alias (no longer required) and adds the bluetooth
node to the P212 device tree.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
index 43eb7d1..6ac678f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
@@ -15,7 +15,6 @@
 / {
 	aliases {
 		serial0 = &uart_AO;
-		serial1 = &uart_A;
 		ethernet0 = &ethmac;
 	};
 
@@ -180,6 +179,14 @@
 	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
 	pinctrl-names = "default";
 	uart-has-rtscts;
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		shutdown-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
+		max-speed = <2000000>;
+		clocks = <&wifi32k>;
+		clock-names = "lpo";
+	};
 };
 
 &uart_AO {
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
