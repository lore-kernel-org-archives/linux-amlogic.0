Return-Path: <SRS0=JnL7=XU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF7B6C432C2
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Sep 2019 21:36:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8354720872
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Sep 2019 21:36:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IP/uZm56";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="B7uNmOfQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8354720872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bs7qps+zeGTmLVt2J0KDjD2Wwe4bVDI8tMrGhKmxtW0=; b=IP/uZm56JmuoHM
	wjyaMDVLovRTaFWDpBEMFGasQrdzFKz6fnUxItebdTuEJhaiziViWf1E0ldKu9vAWv8TxLWuhaehf
	ue36IKDKYWFDK2O7sOZXgU/QjYHUZtbkTgZWyVeNX/7bCOAFJP9boP6drq17u7jg1f2qktFuGYu3t
	JUEr+I88HxqjM3c0h9UGW9+cODbe3tUrYmts4jNKYxYAO1Rq3waIQ6yWdLcm08hy4hFbNkvcDiqBc
	mN5PTOBoZXLsEe+XVhGe3iccOCxZFoZkm0K7B4gd8Mysa43PjmnliFRlGJymYgWp7oM6HwhHCvyMO
	hYiDFJpQDx0pEkrddV1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDExE-0001Ee-3k; Wed, 25 Sep 2019 21:36:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDEwb-0000Vr-FR; Wed, 25 Sep 2019 21:35:35 +0000
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net
 [71.197.186.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2898F21D81;
 Wed, 25 Sep 2019 21:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569447329;
 bh=0ILfSUBG4uQytNVjbplPPbgoUcFq5ZroUW/hsHpzr7k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B7uNmOfQJzG9BVj1hi32RQ+3NG5ntnIPjAo0rmjUHFDYHoEg8hFGsz7dvgolaNCyr
 a2ztZZ3SPSih3NHMsKhKzu0YNFp4SO0G6JyGNGMK4kW7MIuhOOin08NShv2Mo5fpgj
 7XizgPcxjox4OMHSOXPIL/uKzBs4ktLSaRv5T2Oo=
From: Kevin Hilman <khilman@kernel.org>
To: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 1/2] soc: amlogic: ee-pwrc: rename get_power
Date: Wed, 25 Sep 2019 14:35:27 -0700
Message-Id: <20190925213528.21515-2-khilman@kernel.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190925213528.21515-1-khilman@kernel.org>
References: <20190925213528.21515-1-khilman@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190925_143532_645951_46D0F47C 
X-CRM114-Status: GOOD (  11.19  )
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
Cc: linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Kevin Hilman <khilman@baylibre.com>

The function named _get_power() is misleading since it returns true
if the power is off.  Rename to _is_off() for better readability.

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 drivers/soc/amlogic/meson-ee-pwrc.c | 34 ++++++++++++++---------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/soc/amlogic/meson-ee-pwrc.c b/drivers/soc/amlogic/meson-ee-pwrc.c
index 5823f5b67d16..dcce8e694a07 100644
--- a/drivers/soc/amlogic/meson-ee-pwrc.c
+++ b/drivers/soc/amlogic/meson-ee-pwrc.c
@@ -56,7 +56,7 @@ struct meson_ee_pwrc_domain_desc {
 	struct meson_ee_pwrc_top_domain *top_pd;
 	unsigned int mem_pd_count;
 	struct meson_ee_pwrc_mem_domain *mem_pd;
-	bool (*get_power)(struct meson_ee_pwrc_domain *pwrc_domain);
+	bool (*is_off)(struct meson_ee_pwrc_domain *pwrc_domain);
 };
 
 struct meson_ee_pwrc_domain_data {
@@ -173,7 +173,7 @@ static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_audio[] = {
 	{ HHI_AUDIO_MEM_PD_REG0, GENMASK(27, 26) },
 };
 
-#define VPU_PD(__name, __top_pd, __mem, __get_power, __resets, __clks)	\
+#define VPU_PD(__name, __top_pd, __mem, __is_off, __resets, __clks)	\
 	{								\
 		.name = __name,						\
 		.reset_names_count = __resets,				\
@@ -181,40 +181,40 @@ static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_audio[] = {
 		.top_pd = __top_pd,					\
 		.mem_pd_count = ARRAY_SIZE(__mem),			\
 		.mem_pd = __mem,					\
-		.get_power = __get_power,				\
+		.is_off = __is_off,				\
 	}
 
-#define TOP_PD(__name, __top_pd, __mem, __get_power)			\
+#define TOP_PD(__name, __top_pd, __mem, __is_off)			\
 	{								\
 		.name = __name,						\
 		.top_pd = __top_pd,					\
 		.mem_pd_count = ARRAY_SIZE(__mem),			\
 		.mem_pd = __mem,					\
-		.get_power = __get_power,				\
+		.is_off = __is_off,				\
 	}
 
 #define MEM_PD(__name, __mem)						\
 	TOP_PD(__name, NULL, __mem, NULL)
 
-static bool pwrc_ee_get_power(struct meson_ee_pwrc_domain *pwrc_domain);
+static bool pwrc_ee_is_off(struct meson_ee_pwrc_domain *pwrc_domain);
 
 static struct meson_ee_pwrc_domain_desc g12a_pwrc_domains[] = {
 	[PWRC_G12A_VPU_ID]  = VPU_PD("VPU", &g12a_pwrc_vpu, g12a_pwrc_mem_vpu,
-				     pwrc_ee_get_power, 11, 2),
+				     pwrc_ee_is_off, 11, 2),
 	[PWRC_G12A_ETH_ID] = MEM_PD("ETH", g12a_pwrc_mem_eth),
 };
 
 static struct meson_ee_pwrc_domain_desc sm1_pwrc_domains[] = {
 	[PWRC_SM1_VPU_ID]  = VPU_PD("VPU", &sm1_pwrc_vpu, sm1_pwrc_mem_vpu,
-				    pwrc_ee_get_power, 11, 2),
+				    pwrc_ee_is_off, 11, 2),
 	[PWRC_SM1_NNA_ID]  = TOP_PD("NNA", &sm1_pwrc_nna, sm1_pwrc_mem_nna,
-				    pwrc_ee_get_power),
+				    pwrc_ee_is_off),
 	[PWRC_SM1_USB_ID]  = TOP_PD("USB", &sm1_pwrc_usb, sm1_pwrc_mem_usb,
-				    pwrc_ee_get_power),
+				    pwrc_ee_is_off),
 	[PWRC_SM1_PCIE_ID] = TOP_PD("PCI", &sm1_pwrc_pci, sm1_pwrc_mem_pcie,
-				    pwrc_ee_get_power),
+				    pwrc_ee_is_off),
 	[PWRC_SM1_GE2D_ID] = TOP_PD("GE2D", &sm1_pwrc_ge2d, sm1_pwrc_mem_ge2d,
-				    pwrc_ee_get_power),
+				    pwrc_ee_is_off),
 	[PWRC_SM1_AUDIO_ID] = MEM_PD("AUDIO", sm1_pwrc_mem_audio),
 	[PWRC_SM1_ETH_ID] = MEM_PD("ETH", g12a_pwrc_mem_eth),
 };
@@ -237,7 +237,7 @@ struct meson_ee_pwrc {
 	struct genpd_onecell_data xlate;
 };
 
-static bool pwrc_ee_get_power(struct meson_ee_pwrc_domain *pwrc_domain)
+static bool pwrc_ee_is_off(struct meson_ee_pwrc_domain *pwrc_domain)
 {
 	u32 reg;
 
@@ -367,7 +367,7 @@ static int meson_ee_pwrc_init_domain(struct platform_device *pdev,
          * we need to power the domain off, otherwise the internal clocks
          * prepare/enable counters won't be in sync.
          */
-	if (dom->num_clks && dom->desc.get_power && !dom->desc.get_power(dom)) {
+	if (dom->num_clks && dom->desc.is_off && !dom->desc.is_off(dom)) {
 		int ret = clk_bulk_prepare_enable(dom->num_clks, dom->clks);
 		if (ret)
 			return ret;
@@ -375,8 +375,8 @@ static int meson_ee_pwrc_init_domain(struct platform_device *pdev,
 		pm_genpd_init(&dom->base, &pm_domain_always_on_gov, false);
 	} else
 		pm_genpd_init(&dom->base, NULL,
-			      (dom->desc.get_power ?
-			       dom->desc.get_power(dom) : true));
+			      (dom->desc.is_off ?
+			       dom->desc.is_off(dom) : true));
 
 	return 0;
 }
@@ -454,7 +454,7 @@ static void meson_ee_pwrc_shutdown(struct platform_device *pdev)
 	for (i = 0 ; i < pwrc->xlate.num_domains ; ++i) {
 		struct meson_ee_pwrc_domain *dom = &pwrc->domains[i];
 
-		if (dom->desc.get_power && !dom->desc.get_power(dom))
+		if (dom->desc.is_off && !dom->desc.is_off(dom))
 			meson_ee_pwrc_off(&dom->base);
 	}
 }
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
