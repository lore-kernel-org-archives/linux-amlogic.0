Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60264C44508
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Jul 2026 08:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TRR638CQesalRhW7kbJnjLOsp4bkuPmJQffc/+XtNKg=; b=EgTWJs/M0CsrlB
	VvlE0ucPTk7bICoTA1llVOPVqTiHSTt/wcJTpF/6QgjovNPPE0V9Pp/Lkz60WlRQqe2WQQIHOhkAW
	VmRWiAAO45ZhPC7m0N6HoI/dGnX3KmDJCKzfmVEc/3wLd+3J3gHXg4Y4Ov7blmMxO6AWPGYNNbV67
	kID/VWyzMEGE4yAPEFCXEMRWinyA9XdbzySmdRvoV3BsVwhl78wUfOUVBVZ7uBuRmbj+Xf0ayizlZ
	cqgVATzFtdviQxWIzobuZ+RI5SF0plVnSFdgWKgxq/8tw90Nxxynrl08YBt3zX2GYXv6uxMwMAPdK
	iKAIP45Cclpm8+ZcBOlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi6zf-00000004Uzr-3tat;
	Fri, 10 Jul 2026 08:53:59 +0000
Received: from extorris.mess.org ([92.243.27.206])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi6zb-00000004Uxr-3Kr1;
	Fri, 10 Jul 2026 08:53:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783673632; bh=VTN1gzPokpMjTvGP+n6o0ob+YikmETxLkSiXZ9C7eUw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=phENkU7MPN1o4o4q+GhrR+sWTZHfaaG7rtEjrwtxXJEw6Xc0Z/jjmqfiCyfXszJH2
	 ZHj5yv7eDOPW5NQ33A97lBTgqM4HjVEikHMWkcNgSDCor1JtjiSZ7OnJ9bWuiTDztH
	 uhUphM1tVqWxqx8ObKAn+kt3xRo74inmuZdVfKgGKr7dY5OTvwXo5VvV8pGc00wTD4
	 s00t86c0/hiySKLvLRkaDDfwY/lgsEEePTZk/9GPeljeQYAUJKUjorOmjgloWng9IG
	 p2NSgdoVcr4b+Vvr41Ath8FkpZAUvtS7GIhG6zIPi4IqVIwW1clcuOFNlMfU7r8ZiB
	 aJFHMrqeJA96A==
Received: by extorris.mess.org (Postfix, from userid 1004)
	id B6CD740B5F; Fri, 10 Jul 2026 09:53:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1783673631; bh=VTN1gzPokpMjTvGP+n6o0ob+YikmETxLkSiXZ9C7eUw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KoybHE3BX08uWg1kOaSiOcb06STgFgg/c6NzTKAEwAzutIhvnPJmOzJbreIlvCjXf
	 xkPO37jyL/qWXvvDMRB49DtoIJX/0gpRdhtCDqdbIb54ZM8kqmHZCc4cjJlsmifIed
	 tkaNav92YSa2RzIqKRXLqJ0f0jmfnRLCtZcC7Ip53sp3bu0KraEcAVD8dzbeOjgyYx
	 fXuugaSVdsLsM3+AZZy81Y56PsYmrBd3eFjml0XxYQzGWJU3QmI2+SipUtATiKH1ay
	 kYQJU68WN+h1Ms8Fd4y48xhMej/KpkiXyBGAz69i8T0UGpeD9fQkNSpHCUmUiBkvaT
	 R0oo78uOqZrIw==
Received: from maru.local (unknown [62.232.99.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by extorris.mess.org (Postfix) with ESMTPSA id 1378B40AF1;
	Fri, 10 Jul 2026 09:53:51 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] media: meson-ir-tx: Ensure rc_free_device() is called on unbind
Date: Fri, 10 Jul 2026 09:53:34 +0100
Message-ID: <a11dc2d089d4e288b63412a0d3029393c577ee80.1783673420.git.sean@mess.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1783673420.git.sean@mess.org>
References: <cover.1783673420.git.sean@mess.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_015355_992083_45893234 
X-CRM114-Status: GOOD (  12.64  )
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
