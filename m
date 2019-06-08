Return-Path: <SRS0=3i0R=UH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49DC0C28CC5
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Jun 2019 19:05:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D97E0214AE
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Jun 2019 19:05:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VRyItQHN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="W3GI02+A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D97E0214AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dD/FGqW+VPnLxdpjsU9TYnWC5E2m3WAIpC6oLjQTu2s=; b=VRyItQHNXBO5B7
	nT3sHUyEoVr192tG5CPQMRb6wc0SRdhc6wf8yl46vfLhr/MqpU6OnFF1MUzSjkUEx9oAXxutkKZq8
	6UfMDkOPrV5hclFJSE11596VuYsu59RU2CC1CVnzqQbr9A87A7uFijFPXc1xxAWFYVr7kBNRrxgs5
	XCJ8v3SQQWrdzDKhP9XzNYRyy6oHO81fZTUi3Z/ZvUvdpHfC6vs1AXBZNBiktmnp15DsZUn2TnnAx
	62XziH/8nMiMNvLxkh2sX5SO5XivtxvUyLNWVltDD+HWDNRqiA+jzLR/FXqBMvwxduwBqzeLZVV3z
	A8/lEqIb5LLFtXs38p5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZgeT-0000Em-Tu; Sat, 08 Jun 2019 19:05:17 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZgda-0006fe-0F; Sat, 08 Jun 2019 19:04:23 +0000
Received: by mail-wr1-x441.google.com with SMTP id e16so5321470wrn.1;
 Sat, 08 Jun 2019 12:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aFV8wLAz1XUXEXzc85OBEqEUiMkenB8CQtS+Vt1/BiM=;
 b=W3GI02+AJAI/VaMVlY/zu2APCio3iURaaXWz00uebnZQF1i5wIck7r84AquCmwxoSm
 QVUQlITH04SsEk5yX4n1+Htt/S66k/8DnxhJT+Sj9JpTUeLmarHPrJyerC6uO4U7D+c9
 J9bEwz26MFRSk4K4LX/TvVmadvj7t+s/s/3HH1H/7RfWjKHe7yyPegf1WG7Nb/XAeoL9
 I1TkQgIozoFyBYKtBukYrp+Yg6NwDQA8pTvQacx3wup+DG6a2hAEcjA0ctQ8xZ6u1IXe
 xno9GYn9TZOBxaybhLSP6waj8uZcqRJoJL7xa2PTEX3AE7vOxbv1XKXC8iIl2QEIQIBE
 ExXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aFV8wLAz1XUXEXzc85OBEqEUiMkenB8CQtS+Vt1/BiM=;
 b=W7VdYwSlBxEl0+DQeM+sNA6DmQSSe4Kbpu2B4X5yxIQxQivaf0enXrCQzlc6zifkUE
 4dtO8bmuZ6sisoICu+DPn8pmLijloezzco6vyizkF9hj+VGSct4t2i8TIwF7Fdm/+2yK
 8PCWmlVnhpeCKVUv2aoV6BmjQLUdpInKBcRwlKWhg3HH6goXzVTx/b6lpMsTS2d3qEda
 c9TPsK93d7VJkPBXsJ4y/W3AZi9ITHk8j3ZQAaP7XhvGzDMTBovGCAZSzgliXsRMh+Ne
 jNff1ON0awFuiY/KvQ158yhRJEhEXRe+ZwzFHQJQN4Ozc1LetbZ+I3lSprFQfNRRC1QO
 vxAw==
X-Gm-Message-State: APjAAAX4h7pzSoKOmhtamMmuOPT4CuIBH65OZpi2s+fUZtQddA2Q29KF
 W7pHBoVEDWoVeCiePkFpAXQ=
X-Google-Smtp-Source: APXvYqxeWMqj9C2OusCvfves/EELauA2ecBxZT6qIcQg37NCmz0ahYkESZJeSIOqrDaeXSF3C0s2Eg==
X-Received: by 2002:adf:da48:: with SMTP id r8mr18981182wrl.18.1560020660535; 
 Sat, 08 Jun 2019 12:04:20 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133DDA400D12EFF43FED1E981.dip0.t-ipconnect.de.
 [2003:f1:33dd:a400:d12e:ff43:fed1:e981])
 by smtp.googlemail.com with ESMTPSA id t6sm5655062wmb.29.2019.06.08.12.04.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 08 Jun 2019 12:04:20 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com,
 robh+dt@kernel.org, mark.rutland@arm.com, khilman@baylibre.com
Subject: [PATCH v3 3/3] arm64: dts: meson: g12a: add the GPIO interrupt
 controller
Date: Sat,  8 Jun 2019 21:04:11 +0200
Message-Id: <20190608190411.14018-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190608190411.14018-1-martin.blumenstingl@googlemail.com>
References: <20190608190411.14018-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190608_120422_564533_B8246062 
X-CRM114-Status: UNSURE (   9.05  )
X-CRM114-Notice: Please train this message.
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

GPIO interrupts are used for the external Ethernet RGMII PHY interrupt
line.
Add the GPIO interrupt controller so we can describe that connection in
the dts files.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 6aec4cf87350..50fcdb3e55bb 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -2222,6 +2222,15 @@
 				#reset-cells = <1>;
 			};
 
+			gpio_intc: interrupt-controller@f080 {
+				compatible = "amlogic,meson-g12a-gpio-intc",
+					     "amlogic,meson-gpio-intc";
+				reg = <0x0 0xf080 0x0 0x10>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				amlogic,channel-interrupts = <64 65 66 67 68 69 70 71>;
+			};
+
 			pwm_ef: pwm@19000 {
 				compatible = "amlogic,meson-g12a-ee-pwm";
 				reg = <0x0 0x19000 0x0 0x20>;
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
