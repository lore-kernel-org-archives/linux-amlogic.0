Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA348C44507
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2026 21:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F5jHGwnidODrNi5mcfcwtwc7RwEEIA0jSwTxEs5Vh0Y=; b=kk3S3N1d4TMDFA
	lnoC+YGtcDarSUI70POiM1BXj7/MbCjK+6XAqbd+ekLpZR78yw9TdaiUsGZ/jF+JCWz05ahd3JJqo
	42Yv1EoqN22UociEx17+m9uiPuCxiN1iTC+BA7dIqsHc7D0T4S/gHsPZvZvbtPbcoJugf6PN7U+OG
	9UH2FUT5lw/blUk5mBYBfGO99EftqhopEITD+YUDp39O/lV8yV3w6K8fEuIENBCPw89pbTF9YXMeT
	Gaj8RsU0j+I4fpXddieVMSCZkLyfIrLcfrCBpZ9WIsgsH5ZdAikIZsqIeR9jr2fTM2GBaAA9h+R8k
	xXZ97jFj2mcMvxKZ63yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjOFb-0000000ARvs-2HjR;
	Mon, 13 Jul 2026 21:31:43 +0000
Received: from extorris.mess.org ([92.243.27.206])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjOFT-0000000ARrq-3R9p;
	Mon, 13 Jul 2026 21:31:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783978286; bh=mIylYCO0JFLAiBSJwkYAbJj9cPt23NJtSym9D8CkTxU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BuLXW2gXORO7XBE6hR8HzYlR7f7rAxZlFCWgTzZfPXzeDsSW2dIgsVm+hqvUUBkQL
	 RpDn93kzO23LwMmHXvXDDDcsIBeC9CxGye2fMMNogkpV2lsiXkoMgcWp/b+BS5pDgE
	 mv7jp/2UIVtDc4nXXP+CN4V1qhIqmcz0fZN+eq+SlG8c8DXR0TDwOkiEL5PMiLPBkF
	 sc7JIM3o2IG78Cx0XcpshPzrieYJO5k9HTkDf9loR4bQD+9c27DiWtXccdxPmWZE1+
	 iszlBAdZqoVtFUT99blSl068EXjWxacvK/mav4DtBNuVq7teiowJW4KhoKSe/4XaxW
	 s3iJLzyxxy0Gg==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id B2AEB41F01; Mon, 13 Jul 2026 22:31:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783978285; bh=mIylYCO0JFLAiBSJwkYAbJj9cPt23NJtSym9D8CkTxU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GrlviD/u9Tu1qOcMyBP9v6JK+1DdWjeXdWSvNmO+11UwTBd9ZNU1TKmX/hRc+bjGw
	 fPt1EJeC3B36i+90wJOLPRr72PTR2+PTABH2otHx8fX/XcS9+YG4OjahtqLCWgvq/s
	 JnoUvVPthe16UVRYj1zGxX2plFIXBmXeHK15chzal1u0BtGj0hTIgn//+mmmpXgrtE
	 fqzcqFPRasO4beEIZ45+BVBueHjH8FPiOnhhTzni/Hf4CrIO2BybGVb3zdE7GDCCM6
	 l5IDjBXSj45pSORAzjFRr6iS447X7zRDqTbACmPMUCiJKudfp2PppnngsAhTe4SwbL
	 M0xbhDaAHFgNg==
Received: from maru.home (host86-148-148-68.range86-148.btcentralplus.com [86.148.148.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 687C540155;
	Mon, 13 Jul 2026 22:31:25 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/11] media: meson-ir-tx: Ensure rc_free_device() is called on unbind
Date: Mon, 13 Jul 2026 22:31:02 +0100
Message-ID: <9f28638da11733f8ccbab4e62c703b7c2f80884f.1783977550.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1783977550.git.sean@mess.org>
References: <cover.1783977550.git.sean@mess.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_143135_994693_4AA425D5 
X-CRM114-Status: GOOD (  12.23  )
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

Make rc_dev devm managed.

Fixes: dccc0c3ddf8f ("media: rc: fix race between unregister and urb/irq callbacks")
Signed-off-by: Sean Young <sean@mess.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/media/rc/meson-ir-tx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/rc/meson-ir-tx.c b/drivers/media/rc/meson-ir-tx.c
index e7bb107e6a84..abb107d19e8c 100644
--- a/drivers/media/rc/meson-ir-tx.c
+++ b/drivers/media/rc/meson-ir-tx.c
@@ -345,7 +345,7 @@ static int meson_irtx_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "irq request failed\n");
 
-	rc = rc_allocate_device(RC_DRIVER_IR_RAW_TX);
+	rc = devm_rc_allocate_device(dev, RC_DRIVER_IR_RAW_TX);
 	if (!rc)
 		return -ENOMEM;
 
@@ -358,10 +358,8 @@ static int meson_irtx_probe(struct platform_device *pdev)
 	rc->s_tx_duty_cycle = meson_irtx_set_duty_cycle;
 
 	ret = devm_rc_register_device(dev, rc);
-	if (ret < 0) {
-		rc_free_device(rc);
+	if (ret < 0)
 		return dev_err_probe(dev, ret, "rc_dev registration failed\n");
-	}
 
 	return 0;
 }
-- 
2.55.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
