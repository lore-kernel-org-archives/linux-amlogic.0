Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCF7E9A03B
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Feb 2026 11:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+p0wvBIF3OEK5xHzkr0R6F5zWT9WQ2dAmKofxBelssI=; b=B9hbBDgWDDZbOC
	zHfvw0L2bHdfesaw5xR21RpCbOtNFCeEQyFZzKgaxMO4Ois5bajXW/drp0k96RjmWAXogWSxRdTNJ
	sNqNVngF9w9bCUb6ClX1AzqsGYv4WMbeyV94fg78xC//theBw4mnRxepb+TkUFVm0hhywt5HMpGtd
	gVPZjWYkiX7G0r1pT2iAoNbXj9Cc16i8I92XXIf7oQm4G8MLCfnSdDzfklh5PRkmzG9/XTR8aZZQp
	8/aLCZRbHb0YsYFPVOxudnRwvq/JFI4NOwowO9CSpFcge+9iFKyR/Z2EZH70BHVJSHDLBb1IM4orx
	HJOM1P4VaJk+l3dgpsEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsfJK-00000009gjq-0Ny1;
	Wed, 18 Feb 2026 11:01:38 +0000
Received: from [2a01:4f9:c011:1c83::1] (helo=courrier.aliel.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsfJH-00000009gjE-3VUH
	for linux-amlogic@lists.infradead.org;
	Wed, 18 Feb 2026 11:01:37 +0000
Received: from localhost.localdomain (2a02-842b-8136-0001-b865-661D-5641-e7C6.rev.sfr.net [IPv6:2a02:842b:8136:1:b865:661d:5641:e7c6])
	by courrier.aliel.fr (Postfix) with ESMTPSA id 1AD08426E9;
	Wed, 18 Feb 2026 11:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1771412492;
	bh=Bf1BGfpVaFE+vAbk5iBAFQe8t1I69MBvOFnXlOZ888c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bu75AyLRF52GkTzk46PW6Qb7f7JO8/32CdoEl7wzsQVk/qcPUJSgdJvljKs+u2//N
	 Pg9hZzDk0UoDOtJnGGpSVbX/pRrUBxbjRBdtUI9FdkCFb2ARY9r1mFyVOvdeQEPAeY
	 3UCQnhmXWHoD4Eg8ix5eNlAYjEV5okOTtzVXMKtY=
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
To: linux-amlogic@lists.infradead.org
Cc: Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] dt-bindings: clk: meson: Add Amlogic T7 sys pll support
Date: Wed, 18 Feb 2026 12:01:25 +0100
Message-ID: <20260218110127.36394-1-linux-kernel-dev@aliel.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260218101709.35450-1-linux-kernel-dev@aliel.fr>
References: <20260218101709.35450-1-linux-kernel-dev@aliel.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_030136_166418_25BCD5FF 
X-CRM114-Status: UNSURE (   7.15  )
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

Add SYS PLL for the clock controller of the Amlogic T7 SoC family.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h b/include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h
index 32c4b62037de..0cda8edfa7cd 100644
--- a/include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h
+++ b/include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h
@@ -224,5 +224,12 @@
 #define CLKID_SYS_PWM_AO_CD		215
 #define CLKID_SYS_PWM_AO_EF		216
 #define CLKID_SYS_PWM_AO_GH		217
+#define CLKID_SYS_A_SEL			218
+#define CLKID_SYS_A_DIV			219
+#define CLKID_SYS_A			220
+#define CLKID_SYS_B_SEL			221
+#define CLKID_SYS_B_DIV			222
+#define CLKID_SYS_B			223
+#define CLKID_SYS			224
 
 #endif /* __T7_PERIPHERALS_CLKC_H */
-- 
2.49.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
