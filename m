Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CB9C61D97
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Nov 2023 12:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wvbcf1dKn7t6pQJd200fPfjxFLJt77s2Jh5SJZ9XNhA=; b=PDlUlP935CWdRn
	UAEGWrkS9cbywYWbLVSkPYiKXaEa0c1QY8qmHtPkLtE8H44EdueDzy+Dn1u7D206TtqAvMzMNMSHa
	F0+MskA4q8Cr8bE/6eyP2K8jz2Bue4wAmpEtYuAj4IpzplboDNT2BMKlj4cr9lovZPtpDmBzYzxBF
	B/N5WOqM62PAc+pXO/z7ZC0q+1VmV9L1Q1NvK43U5STCAbiYh7Ld8hL3500rDG/WY6jXgk8kaYnQa
	f/4+jdRCKthvr+A7aTtCg/UU5woYpAd7dPT/rMHU2W0hVUnXQLAVKW39+6HycLySjNmYHv+GUP0ng
	ZTlmxOdaM0hSWH6DzWHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5mn2-001szm-10;
	Wed, 22 Nov 2023 12:57:12 +0000
Received: from mx.msync.work ([62.182.159.68])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5mmr-001sqT-16;
	Wed, 22 Nov 2023 12:57:05 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 79DD953ED8;
	Wed, 22 Nov 2023 12:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
	t=1700657814; h=from:subject:date:message-id:to:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=TCt0JoZg+p6aWcClOSdNWHnx4AX17W2tb5XYFeiobmA=;
	b=mA/UeoFeBoCs2qSwF7nxxjkUFaDJmKEQOU5Wa3EZR57SwbPJTyghxGJyrkaqLlt8artEKp
	XetuKqfHJtF0FUusVm5MxTpbBorJ6XO4yi80Y7kkKVSgxqCsAFgHMeKkXHY7kl/1JKXOAT
	3wPLJioi0l8r9tRD4y3K8w8M4TFym6Vpy7w3Hmsy366qrWz8KB1AxlhOZFmK/4LqYMOG8I
	hxfRLPKqZyrMcGbFncrldnP0BQZFg9HX+CpDFkKMWYDG6sHM29vpnyPSAOTDVjvR1pDeb/
	2kQxQdwn3GkaAdg0SZ3BjvPke9JVwMBaXzMDv741W7XbCIzRVhVnV5A6g2RVPQ==
From: Viacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/5] soc: amlogic: meson-gx-socinfo: move common code to exported function
Date: Wed, 22 Nov 2023 15:56:40 +0300
Message-Id: <20231122125643.1717160-3-adeep@lexina.in>
In-Reply-To: <20231122125643.1717160-1-adeep@lexina.in>
References: <20231122125643.1717160-1-adeep@lexina.in>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2574; h=from:subject; bh=BnHHuUquDeW8vfYvoIWuzuZnrP1gP/Gae/DQ47jDLU8=; b=owGbwMvMwCHmnhFhrJcZuJTxtFoSQ2rstyP3FWz+1wqt///MM3F/QLJsm3D3Tg8PsXbvuoya5uoP 2tYdpSwMYhwMsmKKLGEdQVP3eay+OHGB0QGYOaxMIEMYuDgFYCInExkZjjtfuFXcoBVz8Iw/O9fm2t J7qisu61w0ZbuSXG3wg/9AAMN/j4jY8vh1NuZZeuEcnzYK/Vc+u6NVsUyGn//ftKlmJyQ5AQ==
X-Developer-Key: i=adeep@lexina.in; a=openpgp; fpr=E2FA1A767ACB0716E02E3E7AEE36B110025A8DFA
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_045701_997279_671297EC 
X-CRM114-Status: UNSURE (   9.84  )
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

Move common code fill soc_device_attribute to common function for
later use

Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>
---
 .../soc/amlogic/meson-gx-socinfo-internal.h   |  3 +++
 drivers/soc/amlogic/meson-gx-socinfo.c        | 26 ++++++++++++-------
 2 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/amlogic/meson-gx-socinfo-internal.h b/drivers/soc/amlogic/meson-gx-socinfo-internal.h
index 884cf8fb580f..5a742cc16fc8 100644
--- a/drivers/soc/amlogic/meson-gx-socinfo-internal.h
+++ b/drivers/soc/amlogic/meson-gx-socinfo-internal.h
@@ -95,5 +95,8 @@ static inline unsigned int socinfo_to_misc(u32 socinfo)
 	return FIELD_GET(SOCINFO_MISC, socinfo);
 }
 
+int meson_gx_socinfo_prepare_soc_driver_attr(struct soc_device_attribute *soc_dev_attr,
+					     unsigned int socattr);
+
 #endif /* _MESON_GX_SOCINFO_INTERNAL_H_ */
 
diff --git a/drivers/soc/amlogic/meson-gx-socinfo.c b/drivers/soc/amlogic/meson-gx-socinfo.c
index 9d7921c0fb91..8cf69dd238ee 100644
--- a/drivers/soc/amlogic/meson-gx-socinfo.c
+++ b/drivers/soc/amlogic/meson-gx-socinfo.c
@@ -47,6 +47,22 @@ static const char *socinfo_to_soc_id(u32 socinfo)
 	return "Unknown";
 }
 
+int meson_gx_socinfo_prepare_soc_driver_attr(struct soc_device_attribute *soc_dev_attr,
+					     unsigned int socattr)
+{
+	soc_dev_attr->family = "Amlogic Meson";
+	soc_dev_attr->revision = kasprintf(GFP_KERNEL, "%x:%x - %x:%x",
+					   socinfo_to_major(socattr),
+					   socinfo_to_minor(socattr),
+					   socinfo_to_pack(socattr),
+					   socinfo_to_misc(socattr));
+	soc_dev_attr->soc_id = kasprintf(GFP_KERNEL, "%s (%s)",
+					 socinfo_to_soc_id(socattr),
+					 socinfo_to_package_id(socattr));
+	return 0;
+}
+EXPORT_SYMBOL(meson_gx_socinfo_prepare_soc_driver_attr);
+
 static int __init meson_gx_socinfo_init(void)
 {
 	struct soc_device_attribute *soc_dev_attr;
@@ -95,15 +111,7 @@ static int __init meson_gx_socinfo_init(void)
 	if (!soc_dev_attr)
 		return -ENODEV;
 
-	soc_dev_attr->family = "Amlogic Meson";
-	soc_dev_attr->revision = kasprintf(GFP_KERNEL, "%x:%x - %x:%x",
-					   socinfo_to_major(socinfo),
-					   socinfo_to_minor(socinfo),
-					   socinfo_to_pack(socinfo),
-					   socinfo_to_misc(socinfo));
-	soc_dev_attr->soc_id = kasprintf(GFP_KERNEL, "%s (%s)",
-					 socinfo_to_soc_id(socinfo),
-					 socinfo_to_package_id(socinfo));
+	meson_gx_socinfo_prepare_soc_driver_attr(soc_dev_attr, socinfo);
 
 	soc_dev = soc_device_register(soc_dev_attr);
 	if (IS_ERR(soc_dev)) {
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
