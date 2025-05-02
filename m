Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2D6C3ABAC
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 May 2025 15:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+yworO1DuFlxWhZu/bPm+JRMQA1pMva828e/qwjbREQ=; b=vl466dOddyEwai
	i1oz8ISQFsWEufO3CHupLQqaWktz6e3bqgmi5Qr2GqR77AJp10cDcTkDsIAfGI/vDOOs6chkGpU/t
	pv4sPPa4EhERpPdRfZDIVxxt3tGVHr/CASG29+3LURcpvza0UzECFPmtwO6i51in+plNSqGyhImFW
	tBL0oBZPt2FP710LsPU/xeG2ti8iwGPqgM0lmsYHz02TYaT2gZdBkmxxI/mp5xcYF/YrqV5oCAGqN
	Xj7JNP/bWo8CHfOsxp46haCgr/Jitr907ezPF5v9g8THzDvLevX/O05emdMEzgPmvwYrD937gh4m5
	sJKYHaw935wDC9dq6mYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAsWB-00000002MzS-3M6Y;
	Fri, 02 May 2025 15:41:39 +0000
Received: from smtp-73.smtpout.orange.fr ([80.12.242.73] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAsNS-00000002Lb9-189D;
	Fri, 02 May 2025 15:32:39 +0000
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id AsNKucfiRU6wKAsNNuiUsf; Fri, 02 May 2025 17:32:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1746199955;
	bh=+hpk8cr126p7YYLv2U+Rh60U/JKvVKpYQL3YqdP60hg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=WyZhZN1R+jxM5SFehLWOWGPihwRkEGdeRNXJINrq5NSgjMWDa4P5UgurXfxgdi2z2
	 Rtl18Y4xExXTUZgG8s4mr0S3wVmtyIvbQhz0btegHbAT17FGXRg0BhnHP+FtiFaREY
	 +wFE5qLhC2AgUlhCp4VKPiv6MTu32slh7VCC6f3loQZ6kg5MWL0gxHNaYrhC4zwQOv
	 3lqy0Ls5AfdLnovkX3c5YS/EjSzS4ywRpLZDMQOEGkjLPhruy30tCUJTRO+M1hnToF
	 E8HirI7HQc8Q8pYcFnO/HC+ifTxnFUsBEwTBEKeXmp26lpyeQS1eBQPj96cj5W9fo+
	 mbezbb54/O+jA==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 02 May 2025 17:32:35 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH] pmdomain: amlogic: Constify some structures
Date: Fri,  2 May 2025 17:32:19 +0200
Message-ID: <edc560afe2a8763c93341d161daeb8b33ba606c6.1746199917.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_083238_577099_B04F16B5 
X-CRM114-Status: GOOD (  13.67  )
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

Most structures in this driver are not modified.

Constifying these structures moves some data to a read-only section, so
increase overall security, especially when the structure holds some
function pointers. (This is the case for see meson_ee_pwrc_domain_desc)

On a x86_64, with allmodconfig, as an example:
Before:
======
   text	   data	    bss	    dec	    hex	filename
   8924	   3832	      0	  12756	   31d4	drivers/pmdomain/amlogic/meson-ee-pwrc.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  12396	    336	      0	  12732	   31bc	drivers/pmdomain/amlogic/meson-ee-pwrc.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only.
---
 drivers/pmdomain/amlogic/meson-ee-pwrc.c | 78 ++++++++++++------------
 1 file changed, 39 insertions(+), 39 deletions(-)

diff --git a/drivers/pmdomain/amlogic/meson-ee-pwrc.c b/drivers/pmdomain/amlogic/meson-ee-pwrc.c
index fbb2b4103930..55c8c9f66a1b 100644
--- a/drivers/pmdomain/amlogic/meson-ee-pwrc.c
+++ b/drivers/pmdomain/amlogic/meson-ee-pwrc.c
@@ -69,27 +69,27 @@ struct meson_ee_pwrc_domain_desc {
 	char *name;
 	unsigned int reset_names_count;
 	unsigned int clk_names_count;
-	struct meson_ee_pwrc_top_domain *top_pd;
+	const struct meson_ee_pwrc_top_domain *top_pd;
 	unsigned int mem_pd_count;
-	struct meson_ee_pwrc_mem_domain *mem_pd;
+	const struct meson_ee_pwrc_mem_domain *mem_pd;
 	bool (*is_powered_off)(struct meson_ee_pwrc_domain *pwrc_domain);
 };
 
 struct meson_ee_pwrc_domain_data {
 	unsigned int count;
-	struct meson_ee_pwrc_domain_desc *domains;
+	const struct meson_ee_pwrc_domain_desc *domains;
 };
 
 /* TOP Power Domains */
 
-static struct meson_ee_pwrc_top_domain gx_pwrc_vpu = {
+static const struct meson_ee_pwrc_top_domain gx_pwrc_vpu = {
 	.sleep_reg = GX_AO_RTI_GEN_PWR_SLEEP0,
 	.sleep_mask = BIT(8),
 	.iso_reg = GX_AO_RTI_GEN_PWR_SLEEP0,
 	.iso_mask = BIT(9),
 };
 
-static struct meson_ee_pwrc_top_domain meson8_pwrc_vpu = {
+static const struct meson_ee_pwrc_top_domain meson8_pwrc_vpu = {
 	.sleep_reg = MESON8_AO_RTI_GEN_PWR_SLEEP0,
 	.sleep_mask = BIT(8),
 	.iso_reg = MESON8_AO_RTI_GEN_PWR_SLEEP0,
@@ -104,20 +104,20 @@ static struct meson_ee_pwrc_top_domain meson8_pwrc_vpu = {
 		.iso_mask = BIT(__bit), 			\
 	}
 
-static struct meson_ee_pwrc_top_domain sm1_pwrc_vpu = SM1_EE_PD(8);
-static struct meson_ee_pwrc_top_domain sm1_pwrc_nna = SM1_EE_PD(16);
-static struct meson_ee_pwrc_top_domain sm1_pwrc_usb = SM1_EE_PD(17);
-static struct meson_ee_pwrc_top_domain sm1_pwrc_pci = SM1_EE_PD(18);
-static struct meson_ee_pwrc_top_domain sm1_pwrc_ge2d = SM1_EE_PD(19);
+static const struct meson_ee_pwrc_top_domain sm1_pwrc_vpu = SM1_EE_PD(8);
+static const struct meson_ee_pwrc_top_domain sm1_pwrc_nna = SM1_EE_PD(16);
+static const struct meson_ee_pwrc_top_domain sm1_pwrc_usb = SM1_EE_PD(17);
+static const struct meson_ee_pwrc_top_domain sm1_pwrc_pci = SM1_EE_PD(18);
+static const struct meson_ee_pwrc_top_domain sm1_pwrc_ge2d = SM1_EE_PD(19);
 
-static struct meson_ee_pwrc_top_domain g12a_pwrc_nna = {
+static const struct meson_ee_pwrc_top_domain g12a_pwrc_nna = {
 	.sleep_reg = GX_AO_RTI_GEN_PWR_SLEEP0,
 	.sleep_mask = BIT(16) | BIT(17),
 	.iso_reg = GX_AO_RTI_GEN_PWR_ISO0,
 	.iso_mask = BIT(16) | BIT(17),
 };
 
-static struct meson_ee_pwrc_top_domain g12a_pwrc_isp = {
+static const struct meson_ee_pwrc_top_domain g12a_pwrc_isp = {
 	.sleep_reg = GX_AO_RTI_GEN_PWR_SLEEP0,
 	.sleep_mask = BIT(18) | BIT(19),
 	.iso_reg = GX_AO_RTI_GEN_PWR_ISO0,
@@ -154,39 +154,39 @@ static struct meson_ee_pwrc_top_domain g12a_pwrc_isp = {
 	{ __reg, BIT(14) },					\
 	{ __reg, BIT(15) }
 
-static struct meson_ee_pwrc_mem_domain axg_pwrc_mem_vpu[] = {
+static const struct meson_ee_pwrc_mem_domain axg_pwrc_mem_vpu[] = {
 	VPU_MEMPD(HHI_VPU_MEM_PD_REG0),
 	VPU_HHI_MEMPD(HHI_MEM_PD_REG0),
 };
 
-static struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_vpu[] = {
+static const struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_vpu[] = {
 	VPU_MEMPD(HHI_VPU_MEM_PD_REG0),
 	VPU_MEMPD(HHI_VPU_MEM_PD_REG1),
 	VPU_MEMPD(HHI_VPU_MEM_PD_REG2),
 	VPU_HHI_MEMPD(HHI_MEM_PD_REG0),
 };
 
-static struct meson_ee_pwrc_mem_domain gxbb_pwrc_mem_vpu[] = {
+static const struct meson_ee_pwrc_mem_domain gxbb_pwrc_mem_vpu[] = {
 	VPU_MEMPD(HHI_VPU_MEM_PD_REG0),
 	VPU_MEMPD(HHI_VPU_MEM_PD_REG1),
 	VPU_HHI_MEMPD(HHI_MEM_PD_REG0),
 };
 
-static struct meson_ee_pwrc_mem_domain meson_pwrc_mem_eth[] = {
+static const struct meson_ee_pwrc_mem_domain meson_pwrc_mem_eth[] = {
 	{ HHI_MEM_PD_REG0, GENMASK(3, 2) },
 };
 
-static struct meson_ee_pwrc_mem_domain meson8_pwrc_audio_dsp_mem[] = {
+static const struct meson_ee_pwrc_mem_domain meson8_pwrc_audio_dsp_mem[] = {
 	{ HHI_MEM_PD_REG0, GENMASK(1, 0) },
 };
 
-static struct meson_ee_pwrc_mem_domain meson8_pwrc_mem_vpu[] = {
+static const struct meson_ee_pwrc_mem_domain meson8_pwrc_mem_vpu[] = {
 	VPU_MEMPD(HHI_VPU_MEM_PD_REG0),
 	VPU_MEMPD(HHI_VPU_MEM_PD_REG1),
 	VPU_HHI_MEMPD(HHI_MEM_PD_REG0),
 };
 
-static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_vpu[] = {
+static const struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_vpu[] = {
 	VPU_MEMPD(HHI_VPU_MEM_PD_REG0),
 	VPU_MEMPD(HHI_VPU_MEM_PD_REG1),
 	VPU_MEMPD(HHI_VPU_MEM_PD_REG2),
@@ -198,28 +198,28 @@ static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_vpu[] = {
 	VPU_HHI_MEMPD(HHI_MEM_PD_REG0),
 };
 
-static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_nna[] = {
+static const struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_nna[] = {
 	{ HHI_NANOQ_MEM_PD_REG0, 0xff },
 	{ HHI_NANOQ_MEM_PD_REG1, 0xff },
 };
 
-static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_usb[] = {
+static const struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_usb[] = {
 	{ HHI_MEM_PD_REG0, GENMASK(31, 30) },
 };
 
-static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_pcie[] = {
+static const struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_pcie[] = {
 	{ HHI_MEM_PD_REG0, GENMASK(29, 26) },
 };
 
-static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_ge2d[] = {
+static const struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_ge2d[] = {
 	{ HHI_MEM_PD_REG0, GENMASK(25, 18) },
 };
 
-static struct meson_ee_pwrc_mem_domain axg_pwrc_mem_audio[] = {
+static const struct meson_ee_pwrc_mem_domain axg_pwrc_mem_audio[] = {
 	{ HHI_MEM_PD_REG0, GENMASK(5, 4) },
 };
 
-static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_audio[] = {
+static const struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_audio[] = {
 	{ HHI_MEM_PD_REG0, GENMASK(5, 4) },
 	{ HHI_AUDIO_MEM_PD_REG0, GENMASK(1, 0) },
 	{ HHI_AUDIO_MEM_PD_REG0, GENMASK(3, 2) },
@@ -235,12 +235,12 @@ static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_audio[] = {
 	{ HHI_AUDIO_MEM_PD_REG0, GENMASK(27, 26) },
 };
 
-static struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_nna[] = {
+static const struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_nna[] = {
 	{ G12A_HHI_NANOQ_MEM_PD_REG0, GENMASK(31, 0) },
 	{ G12A_HHI_NANOQ_MEM_PD_REG1, GENMASK(31, 0) },
 };
 
-static struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_isp[] = {
+static const struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_isp[] = {
 	{ G12A_HHI_ISP_MEM_PD_REG0, GENMASK(31, 0) },
 	{ G12A_HHI_ISP_MEM_PD_REG1, GENMASK(31, 0) },
 };
@@ -270,14 +270,14 @@ static struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_isp[] = {
 
 static bool pwrc_ee_is_powered_off(struct meson_ee_pwrc_domain *pwrc_domain);
 
-static struct meson_ee_pwrc_domain_desc axg_pwrc_domains[] = {
+static const struct meson_ee_pwrc_domain_desc axg_pwrc_domains[] = {
 	[PWRC_AXG_VPU_ID]  = VPU_PD("VPU", &gx_pwrc_vpu, axg_pwrc_mem_vpu,
 				     pwrc_ee_is_powered_off, 5, 2),
 	[PWRC_AXG_ETHERNET_MEM_ID] = MEM_PD("ETH", meson_pwrc_mem_eth),
 	[PWRC_AXG_AUDIO_ID] = MEM_PD("AUDIO", axg_pwrc_mem_audio),
 };
 
-static struct meson_ee_pwrc_domain_desc g12a_pwrc_domains[] = {
+static const struct meson_ee_pwrc_domain_desc g12a_pwrc_domains[] = {
 	[PWRC_G12A_VPU_ID]  = VPU_PD("VPU", &gx_pwrc_vpu, g12a_pwrc_mem_vpu,
 				     pwrc_ee_is_powered_off, 11, 2),
 	[PWRC_G12A_ETH_ID] = MEM_PD("ETH", meson_pwrc_mem_eth),
@@ -287,13 +287,13 @@ static struct meson_ee_pwrc_domain_desc g12a_pwrc_domains[] = {
 				    pwrc_ee_is_powered_off),
 };
 
-static struct meson_ee_pwrc_domain_desc gxbb_pwrc_domains[] = {
+static const struct meson_ee_pwrc_domain_desc gxbb_pwrc_domains[] = {
 	[PWRC_GXBB_VPU_ID]  = VPU_PD("VPU", &gx_pwrc_vpu, gxbb_pwrc_mem_vpu,
 				     pwrc_ee_is_powered_off, 12, 2),
 	[PWRC_GXBB_ETHERNET_MEM_ID] = MEM_PD("ETH", meson_pwrc_mem_eth),
 };
 
-static struct meson_ee_pwrc_domain_desc meson8_pwrc_domains[] = {
+static const struct meson_ee_pwrc_domain_desc meson8_pwrc_domains[] = {
 	[PWRC_MESON8_VPU_ID]  = VPU_PD("VPU", &meson8_pwrc_vpu,
 				       meson8_pwrc_mem_vpu,
 				       pwrc_ee_is_powered_off, 0, 1),
@@ -303,7 +303,7 @@ static struct meson_ee_pwrc_domain_desc meson8_pwrc_domains[] = {
 						meson8_pwrc_audio_dsp_mem),
 };
 
-static struct meson_ee_pwrc_domain_desc meson8b_pwrc_domains[] = {
+static const struct meson_ee_pwrc_domain_desc meson8b_pwrc_domains[] = {
 	[PWRC_MESON8_VPU_ID]  = VPU_PD("VPU", &meson8_pwrc_vpu,
 				       meson8_pwrc_mem_vpu,
 				       pwrc_ee_is_powered_off, 11, 1),
@@ -313,7 +313,7 @@ static struct meson_ee_pwrc_domain_desc meson8b_pwrc_domains[] = {
 						meson8_pwrc_audio_dsp_mem),
 };
 
-static struct meson_ee_pwrc_domain_desc sm1_pwrc_domains[] = {
+static const struct meson_ee_pwrc_domain_desc sm1_pwrc_domains[] = {
 	[PWRC_SM1_VPU_ID]  = VPU_PD("VPU", &sm1_pwrc_vpu, sm1_pwrc_mem_vpu,
 				    pwrc_ee_is_powered_off, 11, 2),
 	[PWRC_SM1_NNA_ID]  = TOP_PD("NNA", &sm1_pwrc_nna, sm1_pwrc_mem_nna,
@@ -576,32 +576,32 @@ static void meson_ee_pwrc_shutdown(struct platform_device *pdev)
 	}
 }
 
-static struct meson_ee_pwrc_domain_data meson_ee_g12a_pwrc_data = {
+static const struct meson_ee_pwrc_domain_data meson_ee_g12a_pwrc_data = {
 	.count = ARRAY_SIZE(g12a_pwrc_domains),
 	.domains = g12a_pwrc_domains,
 };
 
-static struct meson_ee_pwrc_domain_data meson_ee_axg_pwrc_data = {
+static const struct meson_ee_pwrc_domain_data meson_ee_axg_pwrc_data = {
 	.count = ARRAY_SIZE(axg_pwrc_domains),
 	.domains = axg_pwrc_domains,
 };
 
-static struct meson_ee_pwrc_domain_data meson_ee_gxbb_pwrc_data = {
+static const struct meson_ee_pwrc_domain_data meson_ee_gxbb_pwrc_data = {
 	.count = ARRAY_SIZE(gxbb_pwrc_domains),
 	.domains = gxbb_pwrc_domains,
 };
 
-static struct meson_ee_pwrc_domain_data meson_ee_m8_pwrc_data = {
+static const struct meson_ee_pwrc_domain_data meson_ee_m8_pwrc_data = {
 	.count = ARRAY_SIZE(meson8_pwrc_domains),
 	.domains = meson8_pwrc_domains,
 };
 
-static struct meson_ee_pwrc_domain_data meson_ee_m8b_pwrc_data = {
+static const struct meson_ee_pwrc_domain_data meson_ee_m8b_pwrc_data = {
 	.count = ARRAY_SIZE(meson8b_pwrc_domains),
 	.domains = meson8b_pwrc_domains,
 };
 
-static struct meson_ee_pwrc_domain_data meson_ee_sm1_pwrc_data = {
+static const struct meson_ee_pwrc_domain_data meson_ee_sm1_pwrc_data = {
 	.count = ARRAY_SIZE(sm1_pwrc_domains),
 	.domains = sm1_pwrc_domains,
 };
-- 
2.49.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
