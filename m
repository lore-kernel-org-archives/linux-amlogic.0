Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC80ECAAD1
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Aug 2022 20:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f3Y3FyE766Nr7rf0JQJz6cXeBA5RGUsVW7M22usqfLM=; b=GKOUrMTSJmvAne
	YHvE8REm7wPaJjfJphx6rcjDihmDYvkDlYCka8V9xJf7qeUl9NLjha5HEVVvC1N3hDc0XkNWyDUXB
	aiWX0n7D7SC2Q/+1mPonSdw5MezBIcEGZTuBPjNzgxkUVB2fDKFbNnOShm7U9A4gGyv/nq3k5IO6i
	bz6I3MT3HkLuVGzJstKlFRoMOEzrucjPJ5kc84t5UV5jtsCnaiBjjPsL1PU0T4fklqqlxvQSXNjLq
	9QB2drc0N/J2Eb0Py3f7T+akXTtueDas7mD7mxwd9PFbohjhrk3LVag3a5OlNnncxpvgpMb+x+rx8
	w3wyTLZJChII6wU1F9Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oS2Zo-000hZA-Ve; Sat, 27 Aug 2022 20:38:45 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oS2Zj-000hQG-MA; Sat, 27 Aug 2022 20:38:42 +0000
Received: from localhost.localdomain (unknown [IPv6:2804:14c:485:4b69:8e8d:6889:90be:7539])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: festevam@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 630BE8036D;
	Sat, 27 Aug 2022 22:38:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1661632715;
	bh=wgLnaRGcR8FxeeZDic0uSOMF+yNTuaYRDC4dF15vwRw=;
	h=From:To:Cc:Subject:Date:From;
	b=G4MQKy7Pv8fds+7MOw1GrcNd87RpCpIzOMNROEhoKDnMXHgUhopPBGv7eXstTjTKD
	 EFnHf1dtKKD2qCqogRvgm30EiS1SIwQQqmY2KQrQ3Vd75ftpO3tmUi/vw7pVFKOKVJ
	 yoV101Iut1Z+sw/r+SBSZvGp+a1WPMmmvjSwFbBDTQYwwANNoDrhk96/sQotncP/Iy
	 to5Onj0gVjEh8ZG15WpVaR/09USgaWqrSa8bc2eTLHBL0E1CVOnDd+bW3aj42UJn64
	 eWJaHLJtHma09pqfyIqyU8ajgSFdLppeyvNABGsgQ9T4h9cF9sQyZddFty/KmqArrb
	 qnUGzuCa2+V+A==
From: Fabio Estevam <festevam@denx.de>
To: martin.blumenstingl@googlemail.com
Cc: linux-arm-kernel@lists.infradead.org,
	khilman@baylibre.com,
	linux-amlogic@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2 1/2] arm64: dts: meson-g12a: Remove 'enable-active-low'
Date: Sat, 27 Aug 2022 17:38:12 -0300
Message-Id: <20220827203813.1742715-1-festevam@denx.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220827_133840_947261_9F3B9683 
X-CRM114-Status: UNSURE (   6.68  )
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

The 'enable-active-low' property is not a valid one. 

Only 'enable-active-high' is valid, and when this property is absent
the gpio regulator will act as active low by default.

Remove the invalid 'enable-active-low' property.

Signed-off-by: Fabio Estevam <festevam@denx.de>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
Changes since v1:
- Put linux-amlogic on Cc and added Martin's Reviewed-by tag.

 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index b4e86196e346..b2bb94981838 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -111,7 +111,6 @@ vcc_5v: regulator-vcc_5v {
 		vin-supply = <&dc_in>;
 
 		gpio = <&gpio GPIOH_8 GPIO_OPEN_DRAIN>;
-		enable-active-low;
 	};
 
 	vddao_1v8: regulator-vddao_1v8 {
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
