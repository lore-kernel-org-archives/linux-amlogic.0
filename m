Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738F6CA0FFD
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Aug 2025 05:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q4BtE/xBTPSIQe6Q9HNW90wgHekkgK8/902txkepeq8=; b=nDtdKrfv59vGaN
	rZtulatEPYacEzJ7LemHYNL6jAJuQIXhATWPDbYhWem783LdyR+ph1hRJAocKs0nSTjGo8REFxess
	CbfqbzgUsXYH9174L2DOh9IXC2xwYPV0zpCcMxEfSqWCJ1lTxKrCaL6W8MlKQ4ca8tZVSy59BzJ+B
	9ZGsY9HszV8ANpVaZPWJf4Dfui2bURc+pBaPVjmaM93xmIqABcQf6TWu5htJtjjvF8NbJOU+neLIz
	U8LWo1rO0tbXYcaxp3ynQ2GoZbmhMRd8lYSXbRL41A1qbmEEkgS63VR8OQcg0vpMg7pl2+uTKQoEt
	uND4+r0vtZF6AM+ziz0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urrTM-00000004UF2-0kw6;
	Fri, 29 Aug 2025 05:16:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urrTK-00000004UED-37Is
	for linux-amlogic@lists.infradead.org;
	Fri, 29 Aug 2025 05:16:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A2DA345349;
	Fri, 29 Aug 2025 05:16:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E8EEC4AF09;
	Fri, 29 Aug 2025 05:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756444580;
	bh=SGZ/ztM0Jh+alQljhSybFcNPM0P2ohWIF7g13dEMIfs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TPZqy6+QmXsYc/+CGukthovVe8FlDnC7irWBe17LoP+rAMXz1lrmX3uZvumG++MhT
	 t2eEx6uEYXJzOPx90D5vhSMkbNHtbec5foMKo719UYeiSgRSfQueOpL9cu1LSK6i0Z
	 0IdUQcT+CKW4psslIUfAD3e68Rn5skU8032LlKsM05nDQ895obccHSjDAs7kZJUroK
	 Kc3CABsPRg/+d0bW/XLoicXsdhq+1xZeVw5MikK0HSv20EVPoDgU6mCk/a5plCyZyD
	 VuvrRcE29kaNnUQas/rsPBQPu6V7vA0OP9JuRc65VAQUAt0zRJBgwaauTNxLYaQwWg
	 ow1slnfKv6HvQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA63C8303F;
	Fri, 29 Aug 2025 05:16:20 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 29 Aug 2025 13:16:15 +0800
Subject: [PATCH v4 3/3] MAINTAINERS: Add an entry for Amlogic spifc driver
MIME-Version: 1.0
Message-Id: <20250829-spifc-v4-3-1e57fd39f584@amlogic.com>
References: <20250829-spifc-v4-0-1e57fd39f584@amlogic.com>
In-Reply-To: <20250829-spifc-v4-0-1e57fd39f584@amlogic.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liang Yang <liang.yang@amlogic.com>, 
 Feng Chen <feng.chen@amlogic.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756444578; l=935;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=waH2I+tfwvOLzp50Qi+Yg091qChCxHO4Mz5PuoGKYLg=;
 b=qPzTb7RTVjnIOz8LAOv7eRTOVyg8cqtn52vtIbh35of0wr0uJPfoPQJeDyBGeSUU48JdG0wls
 PCAGKx2PLDpD0T13JcFXzCK/EWbyhwgvV1HEiNPEZzA9bXQaspVAed6
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_221622_815659_8AF763EC 
X-CRM114-Status: UNSURE (   8.72  )
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

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add Amlogic spi flash controller entry to MAINTAINERS
to clarify the maintainers.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b1c081f9c567..9f1f337e9b6d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1306,6 +1306,16 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/rtc/amlogic,a4-rtc.yaml
 F:	drivers/rtc/rtc-amlogic-a4.c
 
+AMLOGIC SPIFC DRIVER
+M:	Liang Yang <liang.yang@amlogic.com>
+M:	Feng Chen <feng.chen@amlogic.com>
+M:	Xianwei Zhao <xianwei.zhao@amlogic.com>
+L:	linux-amlogic@lists.infradead.org
+L:	linux-spi@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/spi/amlogic,a4-spifc.yaml
+F:	drivers/spi/spi-amlogic-spifc-a4.c
+
 AMLOGIC SPISG DRIVER
 M:	Sunny Luo <sunny.luo@amlogic.com>
 M:	Xianwei Zhao <xianwei.zhao@amlogic.com>

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
