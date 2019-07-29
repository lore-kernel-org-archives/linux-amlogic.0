Return-Path: <SRS0=fUxg=V2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6569C7618B
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jul 2019 18:42:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9B08206BA
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jul 2019 18:42:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h9ngcq+a";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="dx5FxhTI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9B08206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zylUJghwihkVvmXaW2wqWYbGe2Zr2uI9rxIF4ZyDIRw=; b=h9ngcq+awBN923
	Dz6sH9YxpXSc5DkGnNijCloXBj4TN9/xaeIuzcCixy9dRT+jjuIwT32TfgzTByit0J2bkZINS146/
	e/6wSEx94vFCumEUsSn8pxe9lDCQCop4dE27EZaTIBWF5of/HN3h9V+EkbRgz/eSlXU0ysLgkYlx0
	LioEN88SEQYmJznsZQshbZ498S25CUHYuAKDjZY+hVVZQ2eiWiNOsxt/OI2hoiDI5Gs2LKH9jdSeV
	ZZ2Vrn47oQOypxfHd/IxFgNCZTea1SVgd8F5ogoNWYpnfiIdQG71RNZzL7M37WItmczruMx+en1Hn
	pvk0hcZ0yCyBoJwZEuZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsAbR-0005Ik-5I; Mon, 29 Jul 2019 18:42:33 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsAZS-0003i5-Q3
 for linux-amlogic@lists.infradead.org; Mon, 29 Jul 2019 18:40:33 +0000
Received: by mail-wr1-x444.google.com with SMTP id f9so62922321wre.12
 for <linux-amlogic@lists.infradead.org>; Mon, 29 Jul 2019 11:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yk22Z8JHzlgEU95z+MeljHJJxoVpT6sQyqAKg9tLY5U=;
 b=dx5FxhTIrR+KuBI9Gf5ymUQ2/cStpTGC3wuKFN03eNuQP/BydgV7kfxJ0otUDwewq1
 gtIeE+bffQGFr7ShhV2nEWrlUIcGG6s8z8Cp1JHaY0m79OkutI917g8Q0z8nYhOMqFgy
 cqtH+LsjsC/5mGxtI4+Nmi2WoG35Em2SPc0TvKL8Tw1zpIiMslqOMUAQre9zSOpx7zV5
 PH+QVzrPOo/QQDypc0AjQSrnJvtxkzTLg620KndSj9WIvvAXJJhg08DAodrK87/dpU+h
 R3RLuE3Kwo0QNiyXM1RZGfH8lfnD8XQ64IXaYV80N18RbOAAkjhvfNoFAZQI4GKHjCyd
 IgvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yk22Z8JHzlgEU95z+MeljHJJxoVpT6sQyqAKg9tLY5U=;
 b=mj7Uh3e3cCcBiAQH31K2mm6GwbRqHkJy/gvK0uBpGcdZwlh1Aqt67yX4q6ClMLwmMv
 zOp5PGQ+StsaT4/IPQwYwJVPkWWB6NLBr5Vo7Lfj05ox2v/l8jPaTIFigQBbKEjlruDX
 w/219+9wxMZQo6NZTiF0YPBIyfELPEoqfrm3hMF1fMjTJvm20JKhe7/0bJypP0WFbovu
 eIRhh3s883Kt5bGqywE4jCChHDkVfAJzvB2FsvNNAtLhruXVfBs7eLYJv3rxxq8CVJJn
 R6Jqwmu1TjjbNscGA0kZaQ7BbwTt4WbVgopItQ0rg6QPx0OeOEbhKl3tBbhQc7yeqfW+
 2U6A==
X-Gm-Message-State: APjAAAWaIvs+nSkMTEl+hyMbEdKd+skp/C4Vmc5V3/qas1TlgRpvTh2J
 oj2QFu7CMJfAFQtDhJOfwzXliA==
X-Google-Smtp-Source: APXvYqwsSAAM0wmsZsQ/D1JTKzKEW/BvIsNSYJd7FhsJtS3NmClnVADYyqPc1eSd8uBcCECLdcyi7A==
X-Received: by 2002:a5d:5152:: with SMTP id u18mr124859285wrt.9.1564425629514; 
 Mon, 29 Jul 2019 11:40:29 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:f78c:d00:1570:f96d:dab8:76ae])
 by smtp.gmail.com with ESMTPSA id g8sm60735790wmf.17.2019.07.29.11.40.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 11:40:28 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
To: srinivas.kandagatla@linaro.org, khilman@baylibre.com,
 narmstrong@baylibre.com, robh+dt@kernel.org, tglx@linutronix.de,
 jbrunet@baylibre.com, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH 4/5] firmware: meson_sm: Rework driver as a proper platform
 driver
Date: Mon, 29 Jul 2019 19:39:40 +0100
Message-Id: <20190729183941.18164-5-ccaione@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190729183941.18164-1-ccaione@baylibre.com>
References: <20190729183941.18164-1-ccaione@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_114031_023959_A9E4240B 
X-CRM114-Status: GOOD (  21.43  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Carlo Caione <ccaione@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The secure monitor driver is currently a frankenstein driver which is
registered as a platform driver but its functionality goes through a
global struct accessed by the consumer drivers using exported helper
functions.

Try to tidy up the driver moving the firmware struct into the driver
data and make the consumer drivers referencing the secure-monitor using
a new property in the DT.

Currently only the nvmem driver is using this API so we can fix it in
the same commit.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/firmware/meson/meson_sm.c       | 94 +++++++++++++++++--------
 drivers/nvmem/meson-efuse.c             | 23 +++++-
 include/linux/firmware/meson/meson_sm.h | 15 ++--
 3 files changed, 93 insertions(+), 39 deletions(-)

diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
index 772ca6726e7b..2e36a2aa274c 100644
--- a/drivers/firmware/meson/meson_sm.c
+++ b/drivers/firmware/meson/meson_sm.c
@@ -54,8 +54,6 @@ struct meson_sm_firmware {
 	void __iomem *sm_shmem_out_base;
 };
 
-static struct meson_sm_firmware fw;
-
 static u32 meson_sm_get_cmd(const struct meson_sm_chip *chip,
 			    unsigned int cmd_index)
 {
@@ -90,6 +88,7 @@ static void __iomem *meson_sm_map_shmem(u32 cmd_shmem, unsigned int size)
 /**
  * meson_sm_call - generic SMC32 call to the secure-monitor
  *
+ * @fw:		Pointer to secure-monitor firmware
  * @cmd_index:	Index of the SMC32 function ID
  * @ret:	Returned value
  * @arg0:	SMC32 Argument 0
@@ -100,15 +99,15 @@ static void __iomem *meson_sm_map_shmem(u32 cmd_shmem, unsigned int size)
  *
  * Return:	0 on success, a negative value on error
  */
-int meson_sm_call(unsigned int cmd_index, u32 *ret, u32 arg0,
-		  u32 arg1, u32 arg2, u32 arg3, u32 arg4)
+int meson_sm_call(struct meson_sm_firmware *fw, unsigned int cmd_index,
+		  u32 *ret, u32 arg0, u32 arg1, u32 arg2, u32 arg3, u32 arg4)
 {
 	u32 cmd, lret;
 
-	if (!fw.chip)
+	if (!fw->chip)
 		return -ENOENT;
 
-	cmd = meson_sm_get_cmd(fw.chip, cmd_index);
+	cmd = meson_sm_get_cmd(fw->chip, cmd_index);
 	if (!cmd)
 		return -EINVAL;
 
@@ -124,6 +123,7 @@ EXPORT_SYMBOL(meson_sm_call);
 /**
  * meson_sm_call_read - retrieve data from secure-monitor
  *
+ * @fw:		Pointer to secure-monitor firmware
  * @buffer:	Buffer to store the retrieved data
  * @bsize:	Size of the buffer
  * @cmd_index:	Index of the SMC32 function ID
@@ -137,22 +137,23 @@ EXPORT_SYMBOL(meson_sm_call);
  *		When 0 is returned there is no guarantee about the amount of
  *		data read and bsize bytes are copied in buffer.
  */
-int meson_sm_call_read(void *buffer, unsigned int bsize, unsigned int cmd_index,
-		       u32 arg0, u32 arg1, u32 arg2, u32 arg3, u32 arg4)
+int meson_sm_call_read(struct meson_sm_firmware *fw, void *buffer,
+		       unsigned int bsize, unsigned int cmd_index, u32 arg0,
+		       u32 arg1, u32 arg2, u32 arg3, u32 arg4)
 {
 	u32 size;
 	int ret;
 
-	if (!fw.chip)
+	if (!fw->chip)
 		return -ENOENT;
 
-	if (!fw.chip->cmd_shmem_out_base)
+	if (!fw->chip->cmd_shmem_out_base)
 		return -EINVAL;
 
-	if (bsize > fw.chip->shmem_size)
+	if (bsize > fw->chip->shmem_size)
 		return -EINVAL;
 
-	if (meson_sm_call(cmd_index, &size, arg0, arg1, arg2, arg3, arg4) < 0)
+	if (meson_sm_call(fw, cmd_index, &size, arg0, arg1, arg2, arg3, arg4) < 0)
 		return -EINVAL;
 
 	if (size > bsize)
@@ -164,7 +165,7 @@ int meson_sm_call_read(void *buffer, unsigned int bsize, unsigned int cmd_index,
 		size = bsize;
 
 	if (buffer)
-		memcpy(buffer, fw.sm_shmem_out_base, size);
+		memcpy(buffer, fw->sm_shmem_out_base, size);
 
 	return ret;
 }
@@ -173,6 +174,7 @@ EXPORT_SYMBOL(meson_sm_call_read);
 /**
  * meson_sm_call_write - send data to secure-monitor
  *
+ * @fw:		Pointer to secure-monitor firmware
  * @buffer:	Buffer containing data to send
  * @size:	Size of the data to send
  * @cmd_index:	Index of the SMC32 function ID
@@ -184,23 +186,24 @@ EXPORT_SYMBOL(meson_sm_call_read);
  *
  * Return:	size of sent data on success, a negative value on error
  */
-int meson_sm_call_write(void *buffer, unsigned int size, unsigned int cmd_index,
-			u32 arg0, u32 arg1, u32 arg2, u32 arg3, u32 arg4)
+int meson_sm_call_write(struct meson_sm_firmware *fw, void *buffer,
+			unsigned int size, unsigned int cmd_index, u32 arg0,
+			u32 arg1, u32 arg2, u32 arg3, u32 arg4)
 {
 	u32 written;
 
-	if (!fw.chip)
+	if (!fw->chip)
 		return -ENOENT;
 
-	if (size > fw.chip->shmem_size)
+	if (size > fw->chip->shmem_size)
 		return -EINVAL;
 
-	if (!fw.chip->cmd_shmem_in_base)
+	if (!fw->chip->cmd_shmem_in_base)
 		return -EINVAL;
 
-	memcpy(fw.sm_shmem_in_base, buffer, size);
+	memcpy(fw->sm_shmem_in_base, buffer, size);
 
-	if (meson_sm_call(cmd_index, &written, arg0, arg1, arg2, arg3, arg4) < 0)
+	if (meson_sm_call(fw, cmd_index, &written, arg0, arg1, arg2, arg3, arg4) < 0)
 		return -EINVAL;
 
 	if (!written)
@@ -210,6 +213,24 @@ int meson_sm_call_write(void *buffer, unsigned int size, unsigned int cmd_index,
 }
 EXPORT_SYMBOL(meson_sm_call_write);
 
+/**
+ * meson_sm_get - get pointer to meson_sm_firmware structure.
+ *
+ * @sm_node:		Pointer to the secure-monitor Device Tree node.
+ *
+ * Return:		NULL is the secure-monitor device is not ready.
+ */
+struct meson_sm_firmware *meson_sm_get(struct device_node *sm_node)
+{
+	struct platform_device *pdev = of_find_device_by_node(sm_node);
+
+	if (!pdev)
+		return NULL;
+
+	return platform_get_drvdata(pdev);
+}
+EXPORT_SYMBOL_GPL(meson_sm_get);
+
 #define SM_CHIP_ID_LENGTH	119
 #define SM_CHIP_ID_OFFSET	4
 #define SM_CHIP_ID_SIZE		12
@@ -217,14 +238,18 @@ EXPORT_SYMBOL(meson_sm_call_write);
 static ssize_t serial_show(struct device *dev, struct device_attribute *attr,
 			 char *buf)
 {
+	struct platform_device *pdev = to_platform_device(dev);
+	struct meson_sm_firmware *fw;
 	uint8_t *id_buf;
 	int ret;
 
+	fw = platform_get_drvdata(pdev);
+
 	id_buf = kmalloc(SM_CHIP_ID_LENGTH, GFP_KERNEL);
 	if (!id_buf)
 		return -ENOMEM;
 
-	ret = meson_sm_call_read(id_buf, SM_CHIP_ID_LENGTH, SM_GET_CHIP_ID,
+	ret = meson_sm_call_read(fw, id_buf, SM_CHIP_ID_LENGTH, SM_GET_CHIP_ID,
 				 0, 0, 0, 0, 0);
 	if (ret < 0) {
 		kfree(id_buf);
@@ -268,25 +293,34 @@ static const struct of_device_id meson_sm_ids[] = {
 
 static int __init meson_sm_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	const struct meson_sm_chip *chip;
+	struct meson_sm_firmware *fw;
+
+	fw = devm_kzalloc(dev, sizeof(*fw), GFP_KERNEL);
+	if (!fw)
+		return -ENOMEM;
 
-	chip = of_match_device(meson_sm_ids, &pdev->dev)->data;
+	chip = of_match_device(meson_sm_ids, dev)->data;
 
 	if (chip->cmd_shmem_in_base) {
-		fw.sm_shmem_in_base = meson_sm_map_shmem(chip->cmd_shmem_in_base,
-							 chip->shmem_size);
-		if (WARN_ON(!fw.sm_shmem_in_base))
+		fw->sm_shmem_in_base = meson_sm_map_shmem(chip->cmd_shmem_in_base,
+							  chip->shmem_size);
+		if (WARN_ON(!fw->sm_shmem_in_base))
 			goto out;
 	}
 
 	if (chip->cmd_shmem_out_base) {
-		fw.sm_shmem_out_base = meson_sm_map_shmem(chip->cmd_shmem_out_base,
-							  chip->shmem_size);
-		if (WARN_ON(!fw.sm_shmem_out_base))
+		fw->sm_shmem_out_base = meson_sm_map_shmem(chip->cmd_shmem_out_base,
+							   chip->shmem_size);
+		if (WARN_ON(!fw->sm_shmem_out_base))
 			goto out_in_base;
 	}
 
-	fw.chip = chip;
+	fw->chip = chip;
+
+	platform_set_drvdata(pdev, fw);
+
 	pr_info("secure-monitor enabled\n");
 
 	if (sysfs_create_group(&pdev->dev.kobj, &meson_sm_sysfs_attr_group))
@@ -295,7 +329,7 @@ static int __init meson_sm_probe(struct platform_device *pdev)
 	return 0;
 
 out_in_base:
-	iounmap(fw.sm_shmem_in_base);
+	iounmap(fw->sm_shmem_in_base);
 out:
 	return -EINVAL;
 }
diff --git a/drivers/nvmem/meson-efuse.c b/drivers/nvmem/meson-efuse.c
index 9924b98db772..669d20d73877 100644
--- a/drivers/nvmem/meson-efuse.c
+++ b/drivers/nvmem/meson-efuse.c
@@ -17,20 +17,25 @@
 struct meson_efuse {
 	struct nvmem_device *nvmem;
 	struct nvmem_config config;
+	struct meson_sm_firmware *fw;
 	struct clk *clk;
 };
 
 static int meson_efuse_read(void *context, unsigned int offset,
 			    void *val, size_t bytes)
 {
-	return meson_sm_call_read((u8 *)val, bytes, SM_EFUSE_READ, offset,
+	struct meson_efuse *efuse = context;
+
+	return meson_sm_call_read(efuse->fw, (u8 *)val, bytes, SM_EFUSE_READ, offset,
 				  bytes, 0, 0, 0);
 }
 
 static int meson_efuse_write(void *context, unsigned int offset,
 			     void *val, size_t bytes)
 {
-	return meson_sm_call_write((u8 *)val, bytes, SM_EFUSE_WRITE, offset,
+	struct meson_efuse *efuse = context;
+
+	return meson_sm_call_write(efuse->fw, (u8 *)val, bytes, SM_EFUSE_WRITE, offset,
 				   bytes, 0, 0, 0);
 }
 
@@ -43,6 +48,7 @@ MODULE_DEVICE_TABLE(of, meson_efuse_match);
 static int meson_efuse_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct device_node *sm_np;
 	struct meson_efuse *efuse;
 	unsigned int size;
 	int ret;
@@ -51,6 +57,17 @@ static int meson_efuse_probe(struct platform_device *pdev)
 	if (!efuse)
 		return -ENOMEM;
 
+	sm_np = of_parse_phandle(pdev->dev.of_node, "secure-monitor", 0);
+	if (!sm_np) {
+		dev_err(&pdev->dev, "no secure-monitor node\n");
+		return -ENODEV;
+	}
+
+	efuse->fw = meson_sm_get(sm_np);
+	of_node_put(sm_np);
+	if (!efuse->fw)
+		return -EPROBE_DEFER;
+
 	efuse->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(efuse->clk)) {
 		ret = PTR_ERR(efuse->clk);
@@ -73,7 +90,7 @@ static int meson_efuse_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	if (meson_sm_call(SM_EFUSE_USER_MAX, &size, 0, 0, 0, 0, 0) < 0) {
+	if (meson_sm_call(efuse->fw, SM_EFUSE_USER_MAX, &size, 0, 0, 0, 0, 0) < 0) {
 		dev_err(dev, "failed to get max user");
 		return -EINVAL;
 	}
diff --git a/include/linux/firmware/meson/meson_sm.h b/include/linux/firmware/meson/meson_sm.h
index 7613bf7c9442..6669e2a1d5fd 100644
--- a/include/linux/firmware/meson/meson_sm.h
+++ b/include/linux/firmware/meson/meson_sm.h
@@ -16,11 +16,14 @@ enum {
 
 struct meson_sm_firmware;
 
-int meson_sm_call(unsigned int cmd_index, u32 *ret, u32 arg0, u32 arg1,
-		  u32 arg2, u32 arg3, u32 arg4);
-int meson_sm_call_write(void *buffer, unsigned int b_size, unsigned int cmd_index,
-			u32 arg0, u32 arg1, u32 arg2, u32 arg3, u32 arg4);
-int meson_sm_call_read(void *buffer, unsigned int bsize, unsigned int cmd_index,
-		       u32 arg0, u32 arg1, u32 arg2, u32 arg3, u32 arg4);
+int meson_sm_call(struct meson_sm_firmware *fw, unsigned int cmd_index,
+		  u32 *ret, u32 arg0, u32 arg1, u32 arg2, u32 arg3, u32 arg4);
+int meson_sm_call_write(struct meson_sm_firmware *fw, void *buffer,
+			unsigned int b_size, unsigned int cmd_index, u32 arg0,
+			u32 arg1, u32 arg2, u32 arg3, u32 arg4);
+int meson_sm_call_read(struct meson_sm_firmware *fw, void *buffer,
+		       unsigned int bsize, unsigned int cmd_index, u32 arg0,
+		       u32 arg1, u32 arg2, u32 arg3, u32 arg4);
+struct meson_sm_firmware *meson_sm_get(struct device_node *firmware_node);
 
 #endif /* _MESON_SM_FW_H_ */
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
