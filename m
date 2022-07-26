Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402D1C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Jul 2022 01:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DwZarnptm7pFWOUHvY4kflOkotbFHHPgP5koVNy8QVs=; b=K7p+w/u7BWbPIH
	owr2UPpUeYQeEu1eVatZ5S/c0ho3mSlBbHiGbMHywYrbmmulKCRxXaNapIVpZAEcata3MJyv/8m1C
	1sR4xZa0ojian25OERCwOCEvIYI5GCf36GlrxdEUQgb/Wzqr0PWs1Qnl6wNn8/cmBZWb2MKXnX+o8
	n9TFa044/GtaKRv+2+1vKFzxC9+5hTLRSpT5xyjfwp4GfmvnL1+TrL+qJkpeJGGfjKRL9csNTBWrI
	J2ragLenaQ3r/UCdIexLgmbyymal3AaXAVcl2JL1OjRWBPIEv19jOX2YK7o+BGCraNOHR9x7ps6oG
	ujcOFv2h8JBr/YSPL+oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG93n-006bTf-LY; Tue, 26 Jul 2022 01:08:31 +0000
Received: from mail-m963.mail.126.com ([123.126.96.3])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG93k-006bRx-Jy
	for linux-amlogic@lists.infradead.org; Tue, 26 Jul 2022 01:08:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=lvbhG
	MrtTullxjZx01jQpF6ivXWHh1XL/NmfhOLf2sE=; b=AoI0tCAASJWvRxpnWjhzf
	jpePc29tH/vJ1VbQA7pBfCGPj+28mFlxtFsYJjnz3RdHXjH5dQwRv8sWI0bLGaBA
	GPJ66Of7gBqNWncn7UeUshrpkR1aJx8d+x8/RFJm2dXzvr4fXGHkiccVsZ6bC6DJ
	O7d1TbuBsMkuXDzY7bJ034=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp8 (Coremail) with SMTP id NORpCgDniZZLPt9ia0IKIg--.28429S2;
	Tue, 26 Jul 2022 09:07:24 +0800 (CST)
From: Liang He <windhl@126.com>
To: narmstrong@baylibre.com,
	airlied@linux.ie,
	daniel@ffwll.ch,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	windhl@126.com
Subject: [PATCH] drm/meson: Fix refcount bugs in meson_vpu_has_available_connectors()
Date: Tue, 26 Jul 2022 09:07:22 +0800
Message-Id: <20220726010722.1319416-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: NORpCgDniZZLPt9ia0IKIg--.28429S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Wr1xKw4kKr43Ar13CF48JFb_yoWkurc_WF
	W8XFZrWr4UZr48AF4ayFy7uF9FkF1xurWfCF15ta4fCa4UAr1UZr1j9r90qw1fZFW3ZrZr
	A3ykCF1Ykry3KjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjFdyUUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbiuAxKF2JVkiHHxAAAsu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_180828_993627_ACA9EBE1 
X-CRM114-Status: UNSURE (   9.92  )
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

In this function, there are two refcount leak bugs:
(1) when breaking out of for_each_endpoint_of_node(), we need call
the of_node_put() for the 'ep';
(2) we should call of_node_put() for the reference returned by
of_graph_get_remote_port() when it is not used anymore.

Fixes: bbbe775ec5b5 ("drm: Add support for Amlogic Meson Graphic Controller")
Signed-off-by: Liang He <windhl@126.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/gpu/drm/meson/meson_drv.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 1b70938cfd2c..bd4ca11d3ff5 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -115,8 +115,11 @@ static bool meson_vpu_has_available_connectors(struct device *dev)
 	for_each_endpoint_of_node(dev->of_node, ep) {
 		/* If the endpoint node exists, consider it enabled */
 		remote = of_graph_get_remote_port(ep);
-		if (remote)
+		if (remote) {
+			of_node_put(remote);
+			of_node_put(ep);
 			return true;
+		}
 	}
 
 	return false;
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
