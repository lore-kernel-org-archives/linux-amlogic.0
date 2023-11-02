Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE0D4C0018A
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Nov 2023 07:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DeGy+A91rTixJkYtgBwSLeqkXmsiQApVuRxZjPIcsZQ=; b=evFWcZ5NCN1ZMF
	GufmDMGtsq8/CLAzMicgrZ++VHjyBLhcqZCZilNE+tO+kmDi307MPFpCApkowkuHH+fGUWXut6paa
	mN3eeKUgoudaX7BYPCnDHRJ+9wp/zFA39+ljHdE3B/aAnUjEoZhXjPYXtlowa2CC8lIieKEUUUhB0
	beB/zSPVylrIZTAwc+SjZmjh6Aw5uvNg0cc2D9JnOwtH4T/ixYuk0pE0r9jydbTCmUkSD0ELR3wOX
	ftW/wO70WBm5RF6oh1HZYoFYdGRlF6gF3nUEwfgClQXsIUGQ1r8sYrGYppqElqRgURezWn4caAwnw
	71mY3c1cWcCKPi92XSpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qySSR-008vJ2-1Q;
	Thu, 02 Nov 2023 07:49:39 +0000
Received: from mx.msync.work ([62.182.159.68])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qySSE-008vEI-2y;
	Thu, 02 Nov 2023 07:49:37 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BBE92147B81;
	Thu,  2 Nov 2023 07:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
	t=1698911364; h=from:subject:date:message-id:to:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=7g9Pd3xFizPczsPF4psnwonGnJy6OcmmDqrxbFQxHFA=;
	b=M+uw87MkkWBDPTm4zcqCcvkJd1HPT1Mp+O3c6qIgnCLra9izQxIQo39ejYoKlNdR9sdnwU
	TDxY8sJRRkQeTJYXryyBrXgbOZuZwHGbbWSMFa9cA6S4mRdGXIQbtwUr58eEuO32ceqwkY
	MS2gNiBWZ9r1RVH/1URcfdsseaU0QvUNGL+Vx6Z1rGAVuue3J8oetuCMprR+f2lOnrCrcb
	vp0GgTtcpBBLxiEQ4w0kLqOeYEMJnYEopdtGWIeoEQg7YFRbV4hITOZGCZDlQvZz/aLaHR
	70WDEDufucemByUhdBL/q4Y3uZd3NCq1h/8EY+s402mHOB253Tfa6EIBCXt4Zg==
From: Viacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/4] firmware: meson_sm: Add chipid number sysfs entry
Date: Thu,  2 Nov 2023 10:49:14 +0300
Message-Id: <20231102074916.3280809-3-adeep@lexina.in>
In-Reply-To: <20231102074916.3280809-1-adeep@lexina.in>
References: <20231102074916.3280809-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_004927_516019_E2743D2F 
X-CRM114-Status: GOOD (  15.14  )
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

The Amlogic Meson SoC Secure Monitor implements a call to retrieve an
unique CHIP ID with CPU ID (128 bits length) starting from the GX
Family and all new families.

The chipid string is simply exposed as a sysfs entry under the firmware
sysfs directory.

Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>
---
 drivers/firmware/meson/meson_sm.c | 54 ++++++++++++++++++++++++++++++-
 1 file changed, 53 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
index c1c694b485ee..2820f4ac871b 100644
--- a/drivers/firmware/meson/meson_sm.c
+++ b/drivers/firmware/meson/meson_sm.c
@@ -240,9 +240,10 @@ struct meson_sm_firmware *meson_sm_get(struct device_node *sm_node)
 }
 EXPORT_SYMBOL_GPL(meson_sm_get);
 
-#define SM_CHIP_ID_LENGTH	119
+#define SM_CHIP_ID_LENGTH	128
 #define SM_CHIP_ID_OFFSET	4
 #define SM_CHIP_ID_SIZE		12
+#define SM_CHIP_IDv2_SIZE	16
 
 static ssize_t serial_show(struct device *dev, struct device_attribute *attr,
 			 char *buf)
@@ -274,8 +275,59 @@ static ssize_t serial_show(struct device *dev, struct device_attribute *attr,
 
 static DEVICE_ATTR_RO(serial);
 
+static ssize_t chipid_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct meson_sm_firmware *fw;
+	uint8_t *id_buf;
+	int ret;
+
+	fw = platform_get_drvdata(pdev);
+
+	id_buf = kmalloc(SM_CHIP_ID_LENGTH, GFP_KERNEL);
+	if (!id_buf)
+		return -ENOMEM;
+
+	ret = meson_sm_call_read(fw, id_buf, SM_CHIP_ID_LENGTH, SM_GET_CHIP_ID,
+				 2, 0, 0, 0, 0);
+	if (ret < 0) {
+		kfree(id_buf);
+		return ret;
+	}
+
+	int version = *((unsigned int *)id_buf);
+
+	if (version == 2)
+		ret = scnprintf(buf, PAGE_SIZE, "%16phN\n", &id_buf[SM_CHIP_ID_OFFSET]);
+	else {
+		/**
+		 * Legacy 12-byte chip ID read out, transform data
+		 * to expected order format.
+		 */
+		uint8_t *buff;
+
+		buff = kmalloc(SM_CHIP_ID_LENGTH, GFP_KERNEL);
+		if (!buff)
+			return -ENOMEM;
+		((uint32_t *)buff)[0] = 0; // CPU_ID is empty
+		/* Transform into expected order for display */
+		ch = (uint8_t *)(id_buf + 4);
+		for (i = 0; i < 12; i++)
+			buff[i + 4] = ch[11 - i];
+		ret = scnprintf(buf, PAGE_SIZE, "%16phN\n", &buff);
+		kfree(buff);
+	}
+
+	kfree(id_buf);
+	return ret;
+}
+
+static DEVICE_ATTR_RO(chipid);
+
 static struct attribute *meson_sm_sysfs_attributes[] = {
 	&dev_attr_serial.attr,
+	&dev_attr_chipid.attr,
 	NULL,
 };
 
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
