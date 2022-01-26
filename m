Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C114C28CF5
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jan 2022 04:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1XEwT5AmBuu+DVIr6kF25W+nSlS/0YwpE+Hy2chZMDs=; b=dI8iTUb/IC03xF
	DbYgGhUi5JiSOv8UJX1jAaQhse+llO8MyDbHOFTzc1Chk4rV2nXvNzfNjitXcua9gSuswh9WT262E
	qzJHiKaOEvBrhHhYhfEy47378uKeIFVT2cDJzF4k2Ly6wjXvO+eQ20L0wlSP75XGQkf37Kx9i6WqV
	r/Rend6qYH97zYynAzzRYCE3zDm/5z4+C112rpbCq0s/HkQTLzsQwE5jmnNeIo8SLq4DSacmmtT0V
	5PpYfzJn7sHD/yHsSxoaqJ8EBUlgzgEJejtG+zDx5r3/UwT3pxaT6sAmtDe1LT5A68HALFQ09E8TF
	1H8vxGcxkobtzzivqcUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCaGT-00A9Td-Fs; Wed, 26 Jan 2022 04:50:37 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCaFx-00A9If-8Y; Wed, 26 Jan 2022 04:50:06 +0000
Received: by mail-wm1-x329.google.com with SMTP id
 d138-20020a1c1d90000000b0034e043aaac7so398187wmd.5; 
 Tue, 25 Jan 2022 20:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=mqGfir27zJmToE36fS5ePo6W0AQ+1+pKPU+ftIb1KDQ=;
 b=H/u5aTGxe7bDkyVyj/WetTyDAkwOgDrbmlbTQSSNgeOl6fu43dLrxIejkDwHUUc38I
 NV1ic0G6uTxbIXSNr24DUy2lc0kMwnsA+obl/mpNa9owGGfCRGYH/7RTTG0xWJROd0/K
 S3e8yJbW1GWEpgW/4irF2AcrlXnmzRSj/Ij7PAefYPYZ7SJfOFhz7BPWILcCprgz94V3
 WIJ5VW4Q+ambXWN68hI+LMGTpOtVwjz7LtBGelRccZoqr9K66L//pWwweyDKE5eB8MCt
 vae6RgKiYXenV7eWbEOXVrFxow6KOf+wzq27kHaLi5HiOfDsY7seh5iY+wmsoOzAF5ij
 TCBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=mqGfir27zJmToE36fS5ePo6W0AQ+1+pKPU+ftIb1KDQ=;
 b=6gfcylEizvPgOGXo63d6Nfa5wCVRThJHmWIzWCnI970Uy5qGcfVmTqEICY6Y2JoXqP
 9/XqlNPFT5/LzXMCNXRW5l2xNTp4z2xiZEbjUftRBwAf80D/JMl+FxCM1gasz5EYJxIr
 ILP4bNUzk3gyFRkR1HpYxfGv6WGhi/xfoVVv+Vook1LlCh35jG8e08CAsz4eO8QXlUDF
 MVUIJzL6NZ/5RoRalkbKmnlQJNxt3gFtqIDfEFM2i87r4wy1PqsqfJStLl+0DqteyTQ/
 bhz7s9HloMbBdV9/Ai1mqTyeOjKk3b00C079eLTqx3iszrC22YVCvtLvLiNqWZetWf7e
 AeQw==
X-Gm-Message-State: AOAM530vaEJNXdMDmNp6f4q1Z073ZQNdsE535F10Lf/3bvbr6FRy/Mwi
 pjG0IrJq3GlxuTzbse0B26QRIqk8skCBm6Y2
X-Google-Smtp-Source: ABdhPJx7OSVbyDVHUckRwup7sGaYF8zhkCb8BJsjlfWSgjXp0ZhBEmMgluIICeh6SPivrPEIAx/fGQ==
X-Received: by 2002:a05:600c:19d1:: with SMTP id
 u17mr5668891wmq.24.1643172602946; 
 Tue, 25 Jan 2022 20:50:02 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id n15sm2171342wmr.26.2022.01.25.20.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 20:50:02 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH 2/3] arm64: dts: meson-g12: add ATF BL32 reserved-memory region
Date: Wed, 26 Jan 2022 04:49:53 +0000
Message-Id: <20220126044954.19069-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220126044954.19069-1-christianshewitt@gmail.com>
References: <20220126044954.19069-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_205005_334703_058CDF10 
X-CRM114-Status: GOOD (  11.51  )
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

Add an additional reserved memory region for the BL32 trusted firmware
present in many devices that boot from Amlogic vendor u-boot.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 6d99c23261fb..45947c1031c4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -107,6 +107,12 @@
 			no-map;
 		};
 
+		/* 32 MiB reserved for ARM Trusted Firmware (BL32) */
+		secmon_reserved_bl32: secmon@5300000 {
+			reg = <0x0 0x05300000 0x0 0x2000000>;
+			no-map;
+		};
+
 		linux,cma {
 			compatible = "shared-dma-pool";
 			reusable;
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
