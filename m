Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE48C4332F
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Nov 2023 07:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x3yIotm5ZNe3ALIeClrGXDMGpxiZqa1kKTCBTc1FmRg=; b=JjGLLBNZ7mk9Qk
	M8Mxr8ulsaAnV/U2eB7t4ePeeCdUALQs4gijeNIGx828LXw2ZWUDsIf1QZnt1mwY7fWSv2se5b6Rp
	7hQd02kXEsuYheTx5/qBlBC8KUn4nfnINz0NXU5PG82Eyj2MyhkP9gjNbmwCqrsbFE3VR+dHGJ9JG
	9GNLnr3xpoNyixDCF8HnJ4S1WURMUAVlp0NRwWg1+L4aP85Jivu6LNKYlMzzYgjXmfYU84I8PcKMR
	1f8doBk7ueMkIyOwC5UA1Vun8YhxiFJyOF+c/fMLmCaA6NcwWe+celYE/ewGHYzjTZajFseqNfHxf
	LqJ7HNR+6ctXkYNt6SLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qySSP-008vHE-0n;
	Thu, 02 Nov 2023 07:49:37 +0000
Received: from mx.msync.work ([62.182.159.68])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qySSF-008vEM-0v;
	Thu, 02 Nov 2023 07:49:35 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 51175147AB3;
	Thu,  2 Nov 2023 07:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
	t=1698911365; h=from:subject:date:message-id:to:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=DjHr33z5m71WBOI9v22JQkdNrW3bAbyGgJ/hgN+H1UM=;
	b=XjYThrOooEoCn2gOa0CXNbfolL9znTB9eHjNnAULCFsbKw17PTWQTw8tgyMwzZXXFGR0i6
	JLSM3sxt9joS5KLM3miIHWaRy7O9VU2BHfCYIiS/fWxBVtrR8qZvcSpQiyhac/HyS6g6qE
	PdJcKJFsxm1f6At4NLzWyhMAe2YYshagVOSQv31BuFBgRfDDLLD2ZLuH55RN3i+XqUFfR6
	hUybZQmu8JKHFkMP0a/LJ+3uxFSENmSxrRRbndDZ8qwovNjRg3VP/xAedcXHTZQEqnxWyk
	3AA1C4HYr/nrYiVzx1GxagiiuDoEUi4Bbv2ZHlHDlXWQ9RVLY84hZMvvVP/vgg==
From: Viacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 4/4] firmware: meson_sm: use meson_gx_socinfo for compatibility
Date: Thu,  2 Nov 2023 10:49:16 +0300
Message-Id: <20231102074916.3280809-5-adeep@lexina.in>
In-Reply-To: <20231102074916.3280809-1-adeep@lexina.in>
References: <20231102074916.3280809-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_004927_518099_3C7FF6CB 
X-CRM114-Status: GOOD (  10.77  )
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

Use meson_gx_socinfo variable for chipid compatible call
from meson-gx-socinfo driver if available.

Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>
---
 drivers/firmware/meson/meson_sm.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
index 2820f4ac871b..29b53a8a6941 100644
--- a/drivers/firmware/meson/meson_sm.c
+++ b/drivers/firmware/meson/meson_sm.c
@@ -23,6 +23,10 @@
 
 #include <linux/firmware/meson/meson_sm.h>
 
+#ifdef CONFIG_MESON_GX_SOCINFO
+extern unsigned int meson_gx_socinfo;
+#endif
+
 struct meson_sm_cmd {
 	unsigned int index;
 	u32 smc_id;
@@ -310,7 +314,19 @@ static ssize_t chipid_show(struct device *dev, struct device_attribute *attr,
 		buff = kmalloc(SM_CHIP_ID_LENGTH, GFP_KERNEL);
 		if (!buff)
 			return -ENOMEM;
-		((uint32_t *)buff)[0] = 0; // CPU_ID is empty
+#ifdef CONFIG_MESON_GX_SOCINFO
+		uint8_t *ch;
+		int i;
+
+		((uint32_t *)buff)[0] =
+			((meson_gx_socinfo & 0xff000000)        |       // Family ID
+			((meson_gx_socinfo << 8) & 0xff0000)    |       // Chip Revision
+			((meson_gx_socinfo >> 8) & 0xff00));            // Package ID
+
+		((uint32_t *)buff)[0] = htonl(((uint32_t *)buff)[0]);
+#else
+		((uint32)t *)buff)[0] = 0;
+#endif
 		/* Transform into expected order for display */
 		ch = (uint8_t *)(id_buf + 4);
 		for (i = 0; i < 12; i++)
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
