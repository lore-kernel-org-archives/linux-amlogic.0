Return-Path: <SRS0=X3sA=LM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A627C48BDF
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jun 2021 05:28:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 402316052B
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jun 2021 05:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 402316052B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=fudan.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TCCJmunhQS4812CMHGWyo4f9fh5Iakm7GhMbAZxDdTE=; b=CYafJef8Sowzb5
	hxgJ5stmx9p5aur6ueN4r21axMBTAeEGypSvre6OQMgYQo61Dt0VcvZzDfaG3HQK2g9nbTGYuXPnG
	tUIJBZzguiZta7431Sw/AwgX8Txz9CkDxEIxLUZiI0Y2MO4Cq7K2u45oBTwYcpN/U3ag8eS6GtW1L
	1xDXBsvuWA2aAenfc1uEAoKt1027CviV+41x7QoSEp2Jsn/M7Lk6pP/Kt/sau37UJ+UGUO3VuKizj
	kov3uPuzc1R3z+qPvjUM8e6FM2JN/+NW9KRW6YmXCBjEE1A70T1HIhEMBZYOJey7mVvaSzBc2U6wA
	LMPEni5KGUksJbigHjGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lu73V-00Chlg-69; Fri, 18 Jun 2021 05:28:37 +0000
Received: from zg8tmty1ljiyny4xntqumjca.icoremail.net ([165.227.154.27])
 by bombadil.infradead.org with smtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lu73H-00Chjm-9K; Fri, 18 Jun 2021 05:28:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fudan.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
 Message-Id; bh=1u3WcLuOIJNGanaGygETlZ8Gs0rz5+WZUbX217nJS8o=; b=o
 qd4DHwHdcrz5/5likLjUyapj4zUeZE97fP35r3ayeiEQIErXGO391UfDxcRBvIpi
 n586LBomQiO3vbgQobSxxE8BeVUBjzuaLOhCkP4dRxQV5GZ9kWF0S3bfr20QQB0l
 ZwJitaHqC+hU3PAID23xMoWK5hZaV+5BpK27CLwnK0=
Received: from ubuntu (unknown [10.177.89.109])
 by app1 (Coremail) with SMTP id XAUFCgDnmDLjLsxgjEGFAA--.13317S3;
 Fri, 18 Jun 2021 13:28:03 +0800 (CST)
From: Jiajun Cao <jjcao20@fudan.edu.cn>
To: 
Cc: yuanxzhang@fudan.edu.cn, Jiajun Cao <jjcao20@fudan.edu.cn>,
 Xin Tan <tanxin.ctf@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/meson: fix potential NULL pointer exception in
 meson_drv_unbind()
Date: Fri, 18 Jun 2021 13:28:00 +0800
Message-Id: <20210618052800.89007-1-jjcao20@fudan.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: XAUFCgDnmDLjLsxgjEGFAA--.13317S3
X-Coremail-Antispam: 1UD129KBjvJXoW7uw4xZw48CFWfuF4rGr48JFb_yoW8Xr1fpF
 4fGryjkrWktFWUt34DAa17AFy3Jw47CFy7uF4UKwsa9r4akFyxJa4ftFWUtry5Zry0q3WS
 vF98KF48uFW5Ar7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBa14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4U
 JVW0owA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
 rcIFxwACI402YVCY1x02628vn2kIc2xKxwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I
 8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
 xVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI8E62xC7I0kMIIYrxkI7VAKI48JMIIF0x
 vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
 42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
 IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRcAw7UUUUU=
X-CM-SenderInfo: isqsiiasuqikmw6i3vldqovvfxof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_222823_856784_9550A3CE 
X-CRM114-Status: GOOD (  10.08  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Fix a potential NULL pointer exception when meson_drv_unbind()
attempts to operate on the driver_data priv which may be NULL.
Add a null pointer check on the priv struct to avoid the NULL
pointer dereference after calling dev_get_drvdata(), just like
the null pointer checks done on the struct priv in the function
meson_drv_shutdown(), meson_drv_pm_suspend() and meson_drv_pm_resume().

Signed-off-by: Jiajun Cao <jjcao20@fudan.edu.cn>
Signed-off-by: Xin Tan <tanxin.ctf@gmail.com>
---
 drivers/gpu/drm/meson/meson_drv.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 07fcd12dca16..f544fba8c44e 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -380,7 +380,10 @@ static int meson_drv_bind(struct device *dev)
 static void meson_drv_unbind(struct device *dev)
 {
 	struct meson_drm *priv = dev_get_drvdata(dev);
-	struct drm_device *drm = priv->drm;
+	struct drm_device *drm;
+
+	if (!priv)
+		return;
 
 	if (priv->canvas) {
 		meson_canvas_free(priv->canvas, priv->canvas_id_osd1);
@@ -389,6 +392,7 @@ static void meson_drv_unbind(struct device *dev)
 		meson_canvas_free(priv->canvas, priv->canvas_id_vd1_2);
 	}
 
+	drm = priv->drm;
 	drm_dev_unregister(drm);
 	drm_kms_helper_poll_fini(drm);
 	drm_atomic_helper_shutdown(drm);
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
