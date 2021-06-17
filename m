Return-Path: <SRS0=pHk5=LL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35402C2B9F4
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jun 2021 07:11:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECCFE6135C
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jun 2021 07:11:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECCFE6135C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=fudan.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CWNFG6DKNehnf5YyfxYAIn1/BhVJk1ncpjVYwzyqO8g=; b=WBtiYbbuyQ5OFf
	nsuoDevKtSMaL2Eje+6MmKz7WThtVToHUOmo+9vuu3Ve1DwBtNWPCfumcmpOZwtVh0cT4EHGiA8Sp
	LxaVpozh9OceYjEDw/YsMHeM8C3b27nqBDolwKwhZyFaEwB1kRSK2ucTiHammVs6wagkeJKfnavYd
	S5meOweFwTSJzw2AYoy9T7OrbRmkZGrlgbPpLDaqjZ7JLPrdcYv5q/gCr43QnLe4uI+Ag762pfBLB
	ZEcQL7Nzpn+ZSPqRk2o9N4NnFIqTY8LD9FcBonsEADvse0iQtCAOwl6Q3IjQeWaAANuKRjlivjTas
	+1p+FOD/mo1h1DjVCJCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltmAo-009DQ9-90; Thu, 17 Jun 2021 07:10:46 +0000
Received: from zg8tmty1ljiyny4xntqumjca.icoremail.net ([165.227.154.27])
 by bombadil.infradead.org with smtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltmAU-009DKL-BM; Thu, 17 Jun 2021 07:10:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fudan.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
 Message-Id; bh=RptfClq4lVC//Zpto1J6NX77le/xD91mEpWrmjb1RGA=; b=C
 uZLQzNduNuyMh9i1HqU9MxtAnSBl+/+KRfqtdowwn8HhLDnrYy0IvxdTeVaAQ6Cf
 wlnOGv1PjxHsbnfkjWb56Ngqzp/DqmacJpbiU3lHOerIEsBkVkeZYzfB3mhNnvRA
 rO1r/ou9ZZZ7K8X6t4hUv6qRgYiNZlADquOmcEhh/Q=
Received: from ubuntu (unknown [10.177.89.109])
 by app1 (Coremail) with SMTP id XAUFCgAH6SFA9cpgKJl6AA--.64384S3;
 Thu, 17 Jun 2021 15:09:52 +0800 (CST)
From: Jiajun Cao <jjcao20@fudan.edu.cn>
To: 
Cc: yuanxzhang@fudan.edu.cn, Jiajun Cao <jjcao20@fudan.edu.cn>,
 Xin Tan <tanxin.ctf@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/meson: fix potential NULL pointer exception in
 meson_drv_unbind()
Date: Thu, 17 Jun 2021 15:07:37 +0800
Message-Id: <20210617070737.50171-1-jjcao20@fudan.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: XAUFCgAH6SFA9cpgKJl6AA--.64384S3
X-Coremail-Antispam: 1UD129KBjvdXoWrtryrKF1kZryrArW8CFyfWFg_yoWDKFg_CF
 W8Xrn7ur1Dur1Dtr429FW7ZFy2kF18ZF1fCw1kt3yfGFn7Zr1UZFWkuw1kXryfXr43ZFZx
 Z34kGr4rury7GjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbSxFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_GcCE
 3s1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
 1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
 w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
 vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v
 4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s
 026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
 JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwC2zVAIFx02awCIc40Y0x0EwIxGrwCI42IY6x
 IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
 w20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
 kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRAl1kUUUUU
X-CM-SenderInfo: isqsiiasuqikmw6i3vldqovvfxof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_001026_938167_3A3C3F6A 
X-CRM114-Status: UNSURE (   8.57  )
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
 drivers/gpu/drm/meson/meson_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 07fcd12dca16..adea6a2b28f5 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -380,6 +380,8 @@ static int meson_drv_bind(struct device *dev)
 static void meson_drv_unbind(struct device *dev)
 {
 	struct meson_drm *priv = dev_get_drvdata(dev);
+	if (!priv)
+		return;
 	struct drm_device *drm = priv->drm;
 
 	if (priv->canvas) {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
