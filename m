Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CFECC4332F
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Nov 2023 07:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rf17Z3TXd4xrQBuQG1VR2SWqo9KLsV1LgSK/zxg55+w=; b=iZNJYXXC1SKdz1
	Ek3ZNsMwIl6SjQEJvzjU3gHBtuqItkm8CozFs1pmrhwULjzFhQjIzppJD0DxZNMO9u8sEUc3uPa7+
	kYutJ6TKFRAbl/OLIz1gIUTpG7JCwo4WZNvvl+H2oMwhffxQv4lovHB6f/588DRTOpOyGMjmJaWRy
	YGA8M2AZYca3SQzn6zzWQ74tMELMEXQyYEoqaVznL6pbPvueXO97UWqN+YX3HHyu1R5MH2srg35vp
	Ir/ye0P9crBQ18fz79TwYUujcwytlMEWajJUGyFWfhkc9vbS6iBG+hbw1Z90kjUQTQW1RdDcpHbyk
	EqvR35Jz9KBCRnbE0A5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qySSP-008vHa-26;
	Thu, 02 Nov 2023 07:49:37 +0000
Received: from mx.msync.work ([62.182.159.68])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qySSE-008vEL-3A;
	Thu, 02 Nov 2023 07:49:35 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0DC4F147AB2;
	Thu,  2 Nov 2023 07:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
	t=1698911365; h=from:subject:date:message-id:to:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=8Xr/QweSmgY7p0LBTNCDzfvzvoqHoF5yll89vV6bmZg=;
	b=HWBp2KY7I80PU4n4CtgZLFQoURpXPvDGu6OdKU5iycx0g+S4FtILtkBU9671+oV8PNuLG8
	hSPz04sYvUBGo8Um0j2QOafAylCkZiMhTehtGrc0Qo+Wx7s+V4WlLoPsQ4J6F9NuXaB/k4
	DnPVjxzyO8NKz7VPxEyps1+FwvsjJxT7PKGtJlZvQ5jzGNgHkNDSTJSAyiciLxmtBxDpyk
	ZGJE4S4W0FmmvuqUcSpYmbIMOAHCi36a455PzlAyYu1xmE70vuIVb1GO3qQmjX8d1ddNUC
	GeqOOxSmmLhZ1kzqkveRn6wP0H90y7HIxs/1JNP1UR67+xnX6Sk88PaMMVS/Ow==
From: Viacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 3/4] soc: amlogic: meson-gx-socinfo: export socinfo for use in other modules
Date: Thu,  2 Nov 2023 10:49:15 +0300
Message-Id: <20231102074916.3280809-4-adeep@lexina.in>
In-Reply-To: <20231102074916.3280809-1-adeep@lexina.in>
References: <20231102074916.3280809-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_004927_511139_EB69F46E 
X-CRM114-Status: GOOD (  12.73  )
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

Move socinfo variable to global scope and export it as meson_gx_socinfo.

Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>
---
 drivers/soc/amlogic/meson-gx-socinfo.c | 34 +++++++++++++++-----------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/soc/amlogic/meson-gx-socinfo.c b/drivers/soc/amlogic/meson-gx-socinfo.c
index 6abb730344ab..0517f96a383b 100644
--- a/drivers/soc/amlogic/meson-gx-socinfo.c
+++ b/drivers/soc/amlogic/meson-gx-socinfo.c
@@ -24,6 +24,10 @@
 #define SOCINFO_MINOR	GENMASK(15, 8)
 #define SOCINFO_MISC	GENMASK(7, 0)
 
+
+unsigned int meson_gx_socinfo;
+EXPORT_SYMBOL(meson_gx_socinfo);
+
 static const struct meson_gx_soc_id {
 	const char *name;
 	unsigned int id;
@@ -131,10 +135,10 @@ static int __init meson_gx_socinfo_init(void)
 	struct soc_device *soc_dev;
 	struct device_node *np;
 	struct regmap *regmap;
-	unsigned int socinfo;
 	struct device *dev;
 	int ret;
 
+	meson_gx_socinfo = 0;
 	/* look up for chipid node */
 	np = of_find_compatible_node(NULL, NULL, "amlogic,meson-gx-ao-secure");
 	if (!np)
@@ -160,11 +164,13 @@ static int __init meson_gx_socinfo_init(void)
 		return -ENODEV;
 	}
 
-	ret = regmap_read(regmap, AO_SEC_SOCINFO_OFFSET, &socinfo);
-	if (ret < 0)
+	ret = regmap_read(regmap, AO_SEC_SOCINFO_OFFSET, &meson_gx_socinfo);
+	if (ret < 0) {
+		meson_gx_socinfo = 0;
 		return ret;
+	}
 
-	if (!socinfo) {
+	if (!meson_gx_socinfo) {
 		pr_err("%s: invalid chipid value\n", __func__);
 		return -EINVAL;
 	}
@@ -175,13 +181,13 @@ static int __init meson_gx_socinfo_init(void)
 
 	soc_dev_attr->family = "Amlogic Meson";
 	soc_dev_attr->revision = kasprintf(GFP_KERNEL, "%x:%x - %x:%x",
-					   socinfo_to_major(socinfo),
-					   socinfo_to_minor(socinfo),
-					   socinfo_to_pack(socinfo),
-					   socinfo_to_misc(socinfo));
+					   socinfo_to_major(meson_gx_socinfo),
+					   socinfo_to_minor(meson_gx_socinfo),
+					   socinfo_to_pack(meson_gx_socinfo),
+					   socinfo_to_misc(meson_gx_socinfo));
 	soc_dev_attr->soc_id = kasprintf(GFP_KERNEL, "%s (%s)",
-					 socinfo_to_soc_id(socinfo),
-					 socinfo_to_package_id(socinfo));
+					 socinfo_to_soc_id(meson_gx_socinfo),
+					 socinfo_to_package_id(meson_gx_socinfo));
 
 	soc_dev = soc_device_register(soc_dev_attr);
 	if (IS_ERR(soc_dev)) {
@@ -194,10 +200,10 @@ static int __init meson_gx_socinfo_init(void)
 
 	dev_info(dev, "Amlogic Meson %s Revision %x:%x (%x:%x) Detected\n",
 			soc_dev_attr->soc_id,
-			socinfo_to_major(socinfo),
-			socinfo_to_minor(socinfo),
-			socinfo_to_pack(socinfo),
-			socinfo_to_misc(socinfo));
+			socinfo_to_major(meson_gx_socinfo),
+			socinfo_to_minor(meson_gx_socinfo),
+			socinfo_to_pack(meson_gx_socinfo),
+			socinfo_to_misc(meson_gx_socinfo));
 
 	return 0;
 }
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
