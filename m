Return-Path: <SRS0=Clcc=SP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E2B8C282CE
	for <linux-amlogic@archiver.kernel.org>; Sat, 13 Apr 2019 14:15:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D3E1206B7
	for <linux-amlogic@archiver.kernel.org>; Sat, 13 Apr 2019 14:15:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sT9IWmv7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D3E1206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9ah1zihXucxp0rCDaQUeLM0X7qvP3onIgIxzgElWDdg=; b=sT9IWmv7/G467+
	OHowlPFVnDgoqzay0OmI+P/h1zpHzYL8rTeA+GVB2GbAlh4oKn1xm0CeKQo7joKy9l2Z8Fir4Paum
	GPnvXQHid39cMwb2j19r3V+lVywCEEJCtbThfOAmYli3wcOtuxaYdodPnO1Z2i2hUiQP7xFrJSmsh
	4s6WOaxQ7YxX4fmaFm4GZInoN7GIRGz+VK0ZZc4kOCMBLscMj1wvME8wM07L6M9i7vmK4oX7Fgyg8
	ow3hrERKK+NLGP87K8nbAh6i0xq7syX/p3xht47fFpElfXy2pBae3QN2HjdIgQYIUi1Snm3s+2205
	6QpnyCFNvWMU4Wd1QkjA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFJRD-0000RL-8O; Sat, 13 Apr 2019 14:15:23 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFJRA-0000QT-3G; Sat, 13 Apr 2019 14:15:21 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id CDBB2AB3431B83E31328;
 Sat, 13 Apr 2019 22:15:11 +0800 (CST)
Received: from localhost (10.177.31.96) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.408.0; Sat, 13 Apr 2019
 22:15:05 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <narmstrong@baylibre.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <khilman@baylibre.com>
Subject: [PATCH -next] drm/meson: Make some functions static
Date: Sat, 13 Apr 2019 22:14:55 +0800
Message-ID: <20190413141455.34020-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.177.31.96]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190413_071520_311358_885E2FEA 
X-CRM114-Status: UNSURE (   7.15  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: YueHaibing <yuehaibing@huawei.com>

Fix sparse warnings:

drivers/gpu/drm/meson/meson_viu.c:93:6: warning: symbol 'meson_viu_set_g12a_osd1_matrix' was not declared. Should it be static?
drivers/gpu/drm/meson/meson_viu.c:121:6: warning: symbol 'meson_viu_set_osd_matrix' was not declared. Should it be static?
drivers/gpu/drm/meson/meson_viu.c:190:6: warning: symbol 'meson_viu_set_osd_lut' was not declared. Should it be static?

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/meson/meson_viu.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_viu.c b/drivers/gpu/drm/meson/meson_viu.c
index 0169c98..b590723 100644
--- a/drivers/gpu/drm/meson/meson_viu.c
+++ b/drivers/gpu/drm/meson/meson_viu.c
@@ -90,8 +90,8 @@ static int eotf_bypass_coeff[EOTF_COEFF_SIZE] = {
 	EOTF_COEFF_RIGHTSHIFT /* right shift */
 };
 
-void meson_viu_set_g12a_osd1_matrix(struct meson_drm *priv, int *m,
-				   bool csc_on)
+static void meson_viu_set_g12a_osd1_matrix(struct meson_drm *priv,
+					   int *m, bool csc_on)
 {
 	/* VPP WRAP OSD1 matrix */
 	writel(((m[0] & 0xfff) << 16) | (m[1] & 0xfff),
@@ -118,8 +118,8 @@ void meson_viu_set_g12a_osd1_matrix(struct meson_drm *priv, int *m,
 		priv->io_base + _REG(VPP_WRAP_OSD1_MATRIX_EN_CTRL));
 }
 
-void meson_viu_set_osd_matrix(struct meson_drm *priv,
-			      enum viu_matrix_sel_e m_select,
+static void meson_viu_set_osd_matrix(struct meson_drm *priv,
+				     enum viu_matrix_sel_e m_select,
 			      int *m, bool csc_on)
 {
 	if (m_select == VIU_MATRIX_OSD) {
@@ -187,10 +187,10 @@ void meson_viu_set_osd_matrix(struct meson_drm *priv,
 #define OSD_EOTF_LUT_SIZE 33
 #define OSD_OETF_LUT_SIZE 41
 
-void meson_viu_set_osd_lut(struct meson_drm *priv, enum viu_lut_sel_e lut_sel,
-			   unsigned int *r_map, unsigned int *g_map,
-			   unsigned int *b_map,
-			   bool csc_on)
+static void
+meson_viu_set_osd_lut(struct meson_drm *priv, enum viu_lut_sel_e lut_sel,
+		      unsigned int *r_map, unsigned int *g_map,
+		      unsigned int *b_map, bool csc_on)
 {
 	unsigned int addr_port;
 	unsigned int data_port;
-- 
2.7.4



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
