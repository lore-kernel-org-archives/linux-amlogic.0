Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17843C3DA41
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Jul 2024 03:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zg7q2SXfYFW315fDggFc1S1PIU04wh2UdHmEp71G9Vs=; b=kSP3bzQ2r1HP3i
	9joCSD5/RfDWDjmVa7RaxjNRNgVChec7a5DJ3nLjgYpID3u1PLvpznSY6xH2hUstuJVqIJlp2g1hO
	wTObL5eVM6bg5J7UysQNzmz6506ZkbMAdLS+ieprnXJMT7295uhRPXdR2H5oKkbCJ25zGg/uLGsbl
	+jK6fUda4Zd/SxR4s4ktuqMgn/rKt70Bb+LfGkDUlcnclJISLPj3OIyzReBgIv/VHCANRTgq8PnEr
	FySsL8Dyag1kYdDX0dFEwxbQm00DkBgDE1P6F89QisV/EzPeg1ghw5bcz07J/P4BIYl8HkFSIBmt8
	c57teEpP4dAC70+cY6bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRkgO-0000000CajX-30Vy;
	Thu, 11 Jul 2024 03:41:24 +0000
Received: from sakura.naobsd.org ([160.16.200.221] helo=mail.naobsd.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRkgK-0000000CaiF-1Gp9
	for linux-amlogic@lists.infradead.org;
	Thu, 11 Jul 2024 03:41:23 +0000
Received: from secure.fukaumi.org ([10.0.0.2])
	by mail.naobsd.org (8.14.4/8.14.4/Debian-4.1ubuntu1.1) with ESMTP id 46B3eorg032509;
	Thu, 11 Jul 2024 12:40:50 +0900
From: FUKAUMI Naoki <naoki@radxa.com>
To: neil.armstrong@linaro.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org,
        linux-amlogic@lists.infradead.org, FUKAUMI Naoki <naoki@radxa.com>
Subject: [PATCH 1/2] dt-bindings: arm: amlogic: change product name for Radxa ZERO 2 (Pro)
Date: Thu, 11 Jul 2024 12:40:34 +0900
Message-ID: <20240711034035.3921122-1-naoki@radxa.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_204120_584464_A3ABA9B1 
X-CRM114-Status: UNSURE (   8.48  )
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

a while ago, we changed product name (hardware is same),

from: Radxa ZERO2
  to: Radxa ZERO 2 Pro

this patch reflect the change in dt-bindings.

Signed-off-by: FUKAUMI Naoki <naoki@radxa.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 0647851ae1f5..25f509b943af 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -157,7 +157,7 @@ properties:
               - bananapi,bpi-m2s
               - khadas,vim3
               - libretech,aml-a311d-cc
-              - radxa,zero2
+              - radxa,zero-2pro
           - const: amlogic,a311d
           - const: amlogic,g12b
 
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
