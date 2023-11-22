Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE9CC61D97
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Nov 2023 12:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=traECkOukgJRvehQE6lTk7FWw0pEBZOs8uYjjfXeRqc=; b=q7lZiVDVHYcb6W
	Z/KtwtETKo0AMFhsePE7R3zC98ZkkfiJZBXR9ZJAHfWxybP88k1H0wXdiGHsSPf4ZQPYvugnYyzj6
	Zqzyn9SGhK09covffYn9TEB3uXADF5FiPuDtrz++ispNTIjXEdkspNzQN7XGGiHeQ2c6UZztnWou2
	v2CGnfM+yNr6tK2j/h/kTEHiwPU7rCLngiwIcdyPK/PkfZdMRsigdY7mk8s9lof4XYtsre5gbn7V0
	OePTqq5+YDEJfWEgLsqxynUBhgCkWTOvxQ6Y2/ic9ijmFMfD2qrNRbZT2ZUykrnHIQTDeWb9tCMGx
	JfYOkjwLogMrULGvxBYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5mmw-001svC-27;
	Wed, 22 Nov 2023 12:57:06 +0000
Received: from mx.msync.work ([62.182.159.68])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5mmr-001sqd-13;
	Wed, 22 Nov 2023 12:57:04 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BBCED540A2;
	Wed, 22 Nov 2023 12:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
	t=1700657814; h=from:subject:date:message-id:to:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=1JJrVlQT4dSyAepCsKEppt0JhDAnONuiLebT73/zFmQ=;
	b=MyaO1ciELUoOTnkA8k5bOa8bMRT2ead7XfG4T1E1/saUsTaq9YZZ5POKgj8j/2kH+2yK5b
	Yt4F4OdXM0mtM/vpM9Ah9rXVH8A79i4xkMSEeeJ5ltnobxOh/IopZ4eEqDEEVVvjGcT29u
	McfldYm/gBr2SkJKqT33OyapEP2vdX49Yu1jzgO9lprJ8n8cH5S3QjRISFts71ah/aLaem
	ynCHhwbAj0wVR7makmAnhlviUDes0UwIiVKX/7ox9cDrUEc5wi/tEHuMC1kmkcWk6EYlbn
	XbBquQ5X5cVbxtaLtzW1sxqMWhHDJJ7zj8djrGFb755RagPQrgoldenLRpj2WQ==
From: Viacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 3/5] firmware: meson_sm: move common definitions to header file
Date: Wed, 22 Nov 2023 15:56:41 +0300
Message-Id: <20231122125643.1717160-4-adeep@lexina.in>
In-Reply-To: <20231122125643.1717160-1-adeep@lexina.in>
References: <20231122125643.1717160-1-adeep@lexina.in>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1284; h=from:subject; bh=qgIgUERrKdBRmt/t8R9MoRn4sT6vtjugdlg8U0yx7ss=; b=owGbwMvMwCHmnhFhrJcZuJTxtFoSQ2rst6N93hV/DR5LPs8LXCH2/fyz36Iv3ldfLpt+SnmDqfNG XbbUjlIWBjEOBlkxRZawjqCp+zxWX5y4wOgAzBxWJpAhDFycAjARETOGv3Jn1KbnZSwoTRbMmhoS8a O3ZVJ970a71oRvJ0K3vctTXcvIcLTzWXu8t1fTt7VmW0tLsiZ9U/OptTUWN+dalL03ukWKDwA=
X-Developer-Key: i=adeep@lexina.in; a=openpgp; fpr=E2FA1A767ACB0716E02E3E7AEE36B110025A8DFA
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_045701_976037_163606CB 
X-CRM114-Status: UNSURE (   7.89  )
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

Move SM_CHIPID_* constants from firmware meson sm driver to
header file.

Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>
---
 drivers/firmware/meson/meson_sm.c       | 4 ----
 include/linux/firmware/meson/meson_sm.h | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
index 402851ed4ac0..96e50811336f 100644
--- a/drivers/firmware/meson/meson_sm.c
+++ b/drivers/firmware/meson/meson_sm.c
@@ -240,10 +240,6 @@ struct meson_sm_firmware *meson_sm_get(struct device_node *sm_node)
 }
 EXPORT_SYMBOL_GPL(meson_sm_get);
 
-#define SM_CHIP_ID_LENGTH	119
-#define SM_CHIP_ID_OFFSET	4
-#define SM_CHIP_ID_SIZE		12
-
 static ssize_t serial_show(struct device *dev, struct device_attribute *attr,
 			 char *buf)
 {
diff --git a/include/linux/firmware/meson/meson_sm.h b/include/linux/firmware/meson/meson_sm.h
index 8eaf8922ab02..f62acd2bf52a 100644
--- a/include/linux/firmware/meson/meson_sm.h
+++ b/include/linux/firmware/meson/meson_sm.h
@@ -7,6 +7,10 @@
 #ifndef _MESON_SM_FW_H_
 #define _MESON_SM_FW_H_
 
+#define SM_CHIP_ID_LENGTH	119
+#define SM_CHIP_ID_OFFSET	4
+#define SM_CHIP_ID_SIZE		12
+
 enum {
 	SM_EFUSE_READ,
 	SM_EFUSE_WRITE,
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
