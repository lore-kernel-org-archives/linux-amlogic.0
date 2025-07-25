Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514FAC87FCD
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Jul 2025 07:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l7slPRkiqn95sYd4Yeqc72RTKZxyDgnAggm2lZj5xxw=; b=znCwk1KLIZ59xR
	YC/duBOVzCOTuyW4qezp25lXUvVlPG9P/WSfmlSHSxjjM95lqODjlPS1HAauzCr00D5ZUSX087PCK
	fMo/BkO/aNYPi+lxVl24iNPDVEti2bvXL8T8UuHVqqO7yE+4UEedjnoM5vlUU/4eMLEjAim4JFNyL
	PmW3vrJX2SmKl/KRf5IWmWn7DhXI8vd+3uN+a8hORkXLU6MwUCkpKiw8kHfpYggwwN8x7OFeNSKRo
	X3XKPIGJj+UUTnXf/UybibK2zXvwEeMcFn01IINnVciwoZamSaB1x3R+8kpqO/W+H+CE7Q6Tb3sv6
	he0WRSMvzG7ClyccqGRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufDGs-00000009IfY-3jSv;
	Fri, 25 Jul 2025 07:55:14 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufDGq-00000009Ien-1bYm
	for linux-amlogic@lists.infradead.org;
	Fri, 25 Jul 2025 07:55:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4F3B6A5618F;
	Fri, 25 Jul 2025 07:55:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7273C4CEE7;
	Fri, 25 Jul 2025 07:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753430111;
	bh=6sEXsOfdWVGGj5F39V0ZHf78vtaUbBB/yBw30lKrfGQ=;
	h=From:To:Cc:Subject:Date:From;
	b=AXXmRdsGFXGsAcJWxNS+Ix2SBpVmuMx71uOzSggGbg6p+hQVLmHz6+vyL+Ca8zUR+
	 DUD4mm+Mtsmgvm9d2a2/chBC2IsC0c6NnVlFoDSwydV6rVIu8Tm1WxLU+INggNVlEc
	 ooF9jAD1pp3d2xs0NpRaF1E6EpFiMJWDK6QJ43MwpYYQDVaw9LtJpON64+Yfp4p3Xp
	 TEJru9KiLFMjSAM1ppneXtOt1QgtSet+eFslHqpCEBQhdhYE1Yl+ozq24pKXOsZahR
	 8r8qAxGvr5AaQ7rgsaPXAyoblIaJyD3erZfTKhNWqyoanrnWYZEuy0FqkrCgJ5d4Pq
	 /TW/lpXwBBbZQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1ufDGk-000000002cy-3CzA;
	Fri, 25 Jul 2025 09:55:06 +0200
From: Johan Hovold <johan@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Carlo Caione <ccaione@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH] firmware: firmware: meson-sm: fix compile-test default
Date: Fri, 25 Jul 2025 09:54:29 +0200
Message-ID: <20250725075429.10056-1-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_005512_485895_745A599B 
X-CRM114-Status: UNSURE (   7.94  )
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

Enabling compile testing should not enable every individual driver (we
have "allyesconfig" for that).

Fixes: 4a434abc40d2 ("firmware: meson-sm: enable build as module")
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/firmware/meson/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/meson/Kconfig b/drivers/firmware/meson/Kconfig
index f2fdd3756648..179f5d46d8dd 100644
--- a/drivers/firmware/meson/Kconfig
+++ b/drivers/firmware/meson/Kconfig
@@ -5,7 +5,7 @@
 config MESON_SM
 	tristate "Amlogic Secure Monitor driver"
 	depends on ARCH_MESON || COMPILE_TEST
-	default y
+	default ARCH_MESON
 	depends on ARM64_4K_PAGES
 	help
 	  Say y here to enable the Amlogic secure monitor driver
-- 
2.49.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
