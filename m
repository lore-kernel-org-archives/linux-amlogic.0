Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A509CAC5BC
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Sep 2025 14:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SUmPFU/YDH0HFQvcxTf/pLhDMXDuZc2ETixi4CxmUDg=; b=Qq1UBw2lsRTh+0
	dPHDzkxBcUcvFOSgWCiFHAVdmWPzBLdb1BDGS5CRItjIppvf6o1ZAk16mWFPLwgOs36XEkfdrOQ2y
	g7LqnR1ERW1KguNPQ/xeSR+vs93sF1OYKhbGh6N6AYtpazYyfCf+ohRmXizHoyW09pqwDto+09eg/
	DUEjGg6xtmrMYXMCFJMx8dMqbbRqkz3LVg1tzwi4/59V7GkqRJcngf1ELvnpUBlICguCwYQrQQgkW
	/HHdAh9sbWLkeD9oBinzm3Fx+j73gFGWFod0GdQT7ofgVG3rPXRYlVk0h88ubHJq/siDZ+Q+oRuns
	vETzg8dE3hKkXJt0Y2jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v29Np-00000001xvq-15xN;
	Fri, 26 Sep 2025 14:25:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v29Nl-00000001xs3-4A3S
	for linux-amlogic@lists.infradead.org;
	Fri, 26 Sep 2025 14:25:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3769D45687;
	Fri, 26 Sep 2025 14:25:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13485C113D0;
	Fri, 26 Sep 2025 14:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758896709;
	bh=0Py0gus+4Kw9xvuUld0HHLpuUDZX3KtoevhAxkUictk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e1iKz9jq18I9U4b5c4xlfsB04frWUGHM31yqSfASTu16U9A4mndpu425DdOvaP709
	 +p9LCXNftxuQsIJYbMHZoQzVeLzYPiXWObPDp/os9GYAXiSXWRslh9psOvb55G1X5n
	 ryeO+/Cv2J1/fjFXLgOPb1JEXcRWo+K2umVzjzajPHDN1CiOncAY/I/ROTUcmz7bJ8
	 4Y2fQjwYFDlcRDWg3rd3t77kjc7uoqye2uhGcAyjnHHAgoB9ZXXiFnPAsijSLKOFgi
	 7p1xol7gyPVX28vkVMnlY080MLC2ZPmJrMw6bfpkZxYetfMBVC59w/RHJLNc96HWzx
	 lwIMhZOTkECdA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v29Ne-000000001Y6-2Y1j;
	Fri, 26 Sep 2025 16:25:02 +0200
From: Johan Hovold <johan@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 2/2] soc: amlogic: canvas: simplify lookup error handling
Date: Fri, 26 Sep 2025 16:24:54 +0200
Message-ID: <20250926142454.5929-3-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250926142454.5929-1-johan@kernel.org>
References: <20250926142454.5929-1-johan@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_072510_067444_5151B19E 
X-CRM114-Status: UNSURE (   8.06  )
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

Simplify the canvas lookup error handling by dropping the OF node
reference sooner.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/soc/amlogic/meson-canvas.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/amlogic/meson-canvas.c b/drivers/soc/amlogic/meson-canvas.c
index 0711088da5dc..79681afea8c6 100644
--- a/drivers/soc/amlogic/meson-canvas.c
+++ b/drivers/soc/amlogic/meson-canvas.c
@@ -60,12 +60,9 @@ struct meson_canvas *meson_canvas_get(struct device *dev)
 		return ERR_PTR(-ENODEV);
 
 	canvas_pdev = of_find_device_by_node(canvas_node);
-	if (!canvas_pdev) {
-		of_node_put(canvas_node);
-		return ERR_PTR(-EPROBE_DEFER);
-	}
-
 	of_node_put(canvas_node);
+	if (!canvas_pdev)
+		return ERR_PTR(-EPROBE_DEFER);
 
 	/*
 	 * If priv is NULL, it's probably because the canvas hasn't
-- 
2.49.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
