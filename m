Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE74BCAC5AE
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Sep 2025 14:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sfJeznyeQ2BfiezC+fdO9tvlK+Z4d8s+A/ZVpCjBW0Q=; b=ghylSxlUEs5hd9
	+lcdn5ySPU//i1r69V0zqZiwCCQR/dHBKhhCceF1Wna9XPqC0HUxVSTL7LmziEMdyBHV7MMKzY1c6
	TaZ3p4qpTlLThIPSEkap6hsvxEM739slA5TXrj7C3R820mQX1WxBSPKyCRcugEmqPROZYL+9tIpa2
	0M/Qk00I55X1Ryy+RfsT2A8VwgXpBhThYaPnLvzN0qK9WpirfAdUt49feCgWzfy37IhEARNBxdcHV
	ekqxhMJLZcWaeqOAjfIf26fnkP/DWlf28jlR9iFkLp5oULq/djTy5Z4ilZmobjJyVtuwMEb3d0Fb9
	/otezpEtuY6IJEBE1CPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v29Nq-00000001xx0-2DQl;
	Fri, 26 Sep 2025 14:25:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v29Nl-00000001xrx-49l8
	for linux-amlogic@lists.infradead.org;
	Fri, 26 Sep 2025 14:25:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0CEA045649;
	Fri, 26 Sep 2025 14:25:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDD4BC4CEF4;
	Fri, 26 Sep 2025 14:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758896708;
	bh=Jg3dS60+quRoQDa5nDEodavgLyUoChDVPfThy50rlf4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g3lvwbrMJ3oqd+tzV9CIHLFzuRYRPNfZrMGQQZuuyOLTTjkGaaRMUO0/VinFPwDV3
	 Tkccr/Da7WwKdou9PWDgnLGo/EVQ6RuDFLnyP6Lsisuih6DNVX5WuUmvcHSWoeSNJV
	 eDmdGuFAQ/TPKOjG8tWnTRioovZOEbZrDCqvUvNYhdZPOiqQF9uzo0yzheAoJD5kwz
	 meR8lMAaspw92/4TIixyBtBUhVNuG3NK+ebJtxDwW6iynFHoCm9eFbcRrQFqddvy49
	 U5e40iwk3eGeuE9Fpq4iPu9PRi5a9DojLVzeCgpC4cXDOYpI3plPbVj+lMthZUBxtg
	 z8fnCl4WEYsUQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v29Ne-000000001Y4-289q;
	Fri, 26 Sep 2025 16:25:02 +0200
From: Johan Hovold <johan@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org,
	Yu Kuai <yukuai3@huawei.com>
Subject: [PATCH 1/2] soc: amlogic: canvas: fix device leak on lookup
Date: Fri, 26 Sep 2025 16:24:53 +0200
Message-ID: <20250926142454.5929-2-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250926142454.5929-1-johan@kernel.org>
References: <20250926142454.5929-1-johan@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_072510_080369_5C83682E 
X-CRM114-Status: GOOD (  11.94  )
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

Make sure to drop the reference taken to the canvas platform device when
looking up its driver data.

Note that holding a reference to a device does not prevent its driver
data from going away so there is no point in keeping the reference.

Also note that commit 28f851e6afa8 ("soc: amlogic: canvas: add missing
put_device() call in meson_canvas_get()") fixed the leak in a lookup
error path, but the reference is still leaking on success.

Fixes: d4983983d987 ("soc: amlogic: add meson-canvas driver")
Cc: stable@vger.kernel.org	# 4.20: 28f851e6afa8
Cc: Yu Kuai <yukuai3@huawei.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/soc/amlogic/meson-canvas.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/amlogic/meson-canvas.c b/drivers/soc/amlogic/meson-canvas.c
index b6e06c4d2117..0711088da5dc 100644
--- a/drivers/soc/amlogic/meson-canvas.c
+++ b/drivers/soc/amlogic/meson-canvas.c
@@ -73,10 +73,9 @@ struct meson_canvas *meson_canvas_get(struct device *dev)
 	 * current state, this driver probe cannot return -EPROBE_DEFER
 	 */
 	canvas = dev_get_drvdata(&canvas_pdev->dev);
-	if (!canvas) {
-		put_device(&canvas_pdev->dev);
+	put_device(&canvas_pdev->dev);
+	if (!canvas)
 		return ERR_PTR(-EINVAL);
-	}
 
 	return canvas;
 }
-- 
2.49.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
