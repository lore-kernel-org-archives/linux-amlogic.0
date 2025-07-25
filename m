Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED326C87FCD
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Jul 2025 07:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5v39MrH17e/eccoE+SP7wganlQusKAEHfRm6hbiBavY=; b=zKUa+nwVM4LO5B
	kM7hTRndbJ387KHKzUpbIq2G4LtnuIiFIy5bkvKETY+coI3oFgVZxrFMj992/5l9s9ypYNSw2iGi9
	Lv9jR7j4alS2bJloqbqHd+yhxSJGkA4exR3ftbYWB5X4oldOHivG8ijBRtaO561iS4ne4hkb+hhkF
	GQZ/PUTSzIRXa9ZlX3eTtUwrad5CawbbqhlntUmLeEbu0/vQSxpTcoGTES7PIyNEgrvLVG4J26A6V
	/wBw/6zKLbqafWnkiHBudY7drJx1+JIwgzVr8Q4I/vr1587jZYPjMlYzIupbqapNjuJNbQ5728v/Y
	+oOxY0TTp+ogtum1Q2Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufDCb-00000009IG5-2cPq;
	Fri, 25 Jul 2025 07:50:49 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufD3W-00000009HPU-0oBR
	for linux-amlogic@lists.infradead.org;
	Fri, 25 Jul 2025 07:41:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 69633A55FF8;
	Fri, 25 Jul 2025 07:41:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D6ACC4CEE7;
	Fri, 25 Jul 2025 07:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753429285;
	bh=EJdajs8yNIrucCAJlRxnjIKqvHvgDMG64nsg+BaAj/o=;
	h=From:To:Cc:Subject:Date:From;
	b=ZuhFYXh9u89PfWUt/FxW+kI6wZEXz8rPquuUlHpcWz9Phdoza4n6mVb5ljTXe9BxZ
	 mlulrhxPtBrhgbb3hOlA8Pi6QCMODh3cPZZa9/ZX26MWqwOP7QFGPvHXFqhXXBBA/J
	 SIWtR7/ubH/Zl/sAZ/3BWIxrGGjYTsUUeaPt9VEvkgJ3+S9re8JhIgm1ncj/SCU9OG
	 +2EfD8mDTo5ngDzmBtQyo3Vsx38afJ7wI7Bfv5EV6fatxDhLknz1QHcay4gJ4HyGC7
	 3gld08H70iuLUSAJZdZMkW79B2Gv3ksN/33hhMgGb2ycOtBhfY5mUzTXe64rPhnd+8
	 E19mv4spF2tcA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1ufD3Q-000000002Ig-3bqf;
	Fri, 25 Jul 2025 09:41:20 +0200
From: Johan Hovold <johan@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Carlo Caione <ccaione@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH] firmware: meson_sm: fix device leak at probe
Date: Fri, 25 Jul 2025 09:40:19 +0200
Message-ID: <20250725074019.8765-1-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_004126_293699_749FB44D 
X-CRM114-Status: GOOD (  10.81  )
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

Make sure to drop the reference to the secure monitor device taken by
of_find_device_by_node() when looking up its driver data on behalf of
other drivers (e.g. during probe).

Note that holding a reference to the platform device does not prevent
its driver data from going away so there is no point in keeping the
reference after the helper returns.

Fixes: 8cde3c2153e8 ("firmware: meson_sm: Rework driver as a proper platform driver")
Cc: stable@vger.kernel.org	# 5.5
Cc: Carlo Caione <ccaione@baylibre.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/firmware/meson/meson_sm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
index f25a9746249b..3ab67aaa9e5d 100644
--- a/drivers/firmware/meson/meson_sm.c
+++ b/drivers/firmware/meson/meson_sm.c
@@ -232,11 +232,16 @@ EXPORT_SYMBOL(meson_sm_call_write);
 struct meson_sm_firmware *meson_sm_get(struct device_node *sm_node)
 {
 	struct platform_device *pdev = of_find_device_by_node(sm_node);
+	struct meson_sm_firmware *fw;
 
 	if (!pdev)
 		return NULL;
 
-	return platform_get_drvdata(pdev);
+	fw = platform_get_drvdata(pdev);
+
+	put_device(&pdev->dev);
+
+	return fw;
 }
 EXPORT_SYMBOL_GPL(meson_sm_get);
 
-- 
2.49.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
