Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D060D5E134
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Nov 2024 05:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EkmSC80HGTNoNzUuPpfWmBAZizUqOf5eqX3WrHWAKB8=; b=qCaVbq7Yr5WN5C
	gNcZFYk19bcRLx+Vx1Daqi9cFETR34oQU+PRGeJ6YIB1hDoDRCT43NJQmcBGJh9ThnBhYFZaQImgF
	M1l5hn8ftzikLj3xTlu2YCAVsRIPmc38c2Khh0jeA1oa1dfjhJFNNdiUgDeTIUQSoYHE13Vx2XWSS
	AINt1j5rXPzjEO/wLDabHeopbRl1jFGcdaEXgtnSejdDsul9CvmBTM+p23Ka9ff+pXlPRkn0eDgCH
	8y6CsU8fBH0+0ftTa/C6UJoIMERqHFtR9PTyai48QKOo+3vUkI3RogxLL9wVnz13Iuc+R28JeFx8n
	XUEWUz5++LwqIkGWcjYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9HxO-00000009R6M-43T4;
	Fri, 08 Nov 2024 05:54:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9HxL-00000009R56-3Z0N
	for linux-amlogic@lists.infradead.org;
	Fri, 08 Nov 2024 05:54:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 512FC5C5980;
	Fri,  8 Nov 2024 05:54:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 306EBC4CED5;
	Fri,  8 Nov 2024 05:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731045290;
	bh=SVIUbQzxLofeJMLFPpkqoKqNt1gn+vEU3tlnN8KXr+c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Zk4Af8mAZhaQg02H1wiTVNGQFzWpvL4i53HYZF7DC3ZhfpL0q+ex4mToiNInCRm1+
	 S9vAQWQryYwkkU8mo+PBHoxGImjidC0wLKcE31wYkwNO+7MBnMVJO83e18AYfmSSLK
	 FcagCmb2ZbyWngoE+S2ljyz1hjzM7r1ToVS6CswIudDmyzA8ioyIGsH7vfOdRxqFyE
	 3q9z/yLirsSMmLzTJYtoLYDJ86FfgFeBU2j2vQaZL27qcq/gmWJbyF1RPE+WEh3wgl
	 aURmIaxoEEE5io8VcEJgkqF2nEwEUBr4Kt3BnKCjEx6LeRau4QgVSabAN8RMDRya3N
	 LKecrCtlTzahA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24055D5E13A;
	Fri,  8 Nov 2024 05:54:50 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 08 Nov 2024 13:54:43 +0800
Subject: [PATCH v5 3/3] MAINTAINERS: Add an entry for Amlogic RTC driver
MIME-Version: 1.0
Message-Id: <20241108-rtc-v5-3-0194727c778b@amlogic.com>
References: <20241108-rtc-v5-0-0194727c778b@amlogic.com>
In-Reply-To: <20241108-rtc-v5-0-0194727c778b@amlogic.com>
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731045288; l=931;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=Gn6Ya+wBxnc2VJ4I38RsdaXoWkK7Fe7p7YGOFyMiaMc=;
 b=JauI8zgU05bKeqeyzwuQBA2wM5STfZhy/ebpOWWWoTKxzWe5isdRVwCx2UNb5IujppvIWQH4S
 jRpneopPvcTD6rp07VFBCYsfr1yysXZdFURcmzrPv/o0o0p2PID/UfJ
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_215451_973910_507D739D 
X-CRM114-Status: UNSURE (   8.16  )
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
Reply-To: xianwei.zhao@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Yiting Deng <yiting.deng@amlogic.com>

Add Amlogic RTC entry to MAINTAINERS to clarify the maintainers.

Signed-off-by: Yiting Deng <yiting.deng@amlogic.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c27f3190737f..86675e03888c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1209,6 +1209,14 @@ F:	Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
 F:	drivers/perf/amlogic/
 F:	include/soc/amlogic/
 
+AMLOGIC RTC DRIVER
+M:	Yiting Deng <yiting.deng@amlogic.com>
+M:	Xianwei Zhao <xianwei.zhao@amlogic.com>
+L:	linux-amlogic@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/rtc/amlogic,a4-rtc.yaml
+F:	drivers/rtc/rtc-amlogic-a4.c
+
 AMPHENOL CHIPCAP 2 HUMIDITY-TEMPERATURE IIO DRIVER
 M:	Javier Carrasco <javier.carrasco.cruz@gmail.com>
 L:	linux-hwmon@vger.kernel.org

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
