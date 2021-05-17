Return-Path: <SRS0=PyQ3=KM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84142C433B4
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 May 2021 20:22:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07408610A1
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 May 2021 20:22:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07408610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JK/Dy7MN70ZBK4WJDeyyjsABce8l7YWTs6KNL9urY5A=; b=EHT2VHJZ0mR+6sQNjOcdaH2V/c
	ox37pXp7OCYRZyCIkRrFwHLAiIEFmMAT//wuLy64nkoLzWxcr+yF+2yB6dvVmgH8cA5an1ctxX1FW
	Khumte8EG+XSnnvEMLpaCCEy7FQdD0+bc52VIRIpPoTxg9CzOS0TCGigrHzDHO8eGeJJ8N3QzbzSN
	e5AMTeFEDuKz0IVHUwvBFtAK9dUHCk4zLJpw0fC1RkXewmZ737xfbkfgTRvulciHXujxnzGj9RB7W
	NyhTnvdod/g9awRP1KdH4uxFiu1ALNIXqOdrpKR/Ju3oKIAOK4UWzLczciu69PEUGmgE7JyaX8ao3
	584mtUJg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lijkr-00G368-Uw; Mon, 17 May 2021 20:22:22 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lijkd-00G34p-9Z; Mon, 17 May 2021 20:22:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=z220BesNCBDXACL2kstOoMgF4dcNonJNXvdvzRxIldk=; b=ZjZ+J+6URFA68logrSvu4r4c52
 MbF2vrEaNCfMUa4jDEehLrVQIMcpwPk6saNmPCwxJY0b0PTVwdh4/rcnVVl6y9lDkwABu753Eda39
 LoyVrZoyQ2gEpWZQyV1/4vRMvRU+sELu2ZwqMHCL9QKSQ5XhPhWDZASJk8S5WNS6tieeKWxwTC6jb
 EBJL4Vi64hu3gbZ5O6evZRhpVmhf7CBYIFrO33bGy1IJvvRmBJdMGrmsigXa5hIAqx0bGHItcqFAg
 sMPMpFJ2Oc3bIC/mTY5WN4amEQYR/Iui/0UDg4i/SID15VOMjPRy/kCAdqwI2J21B3IjXFaq8Jx4f
 sUPjcysA==;
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lijka-00E7um-Da; Mon, 17 May 2021 20:22:06 +0000
Received: by mail-wr1-x431.google.com with SMTP id c14so5953648wrx.3;
 Mon, 17 May 2021 13:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z220BesNCBDXACL2kstOoMgF4dcNonJNXvdvzRxIldk=;
 b=dcsJesrjVYOJH/ZBeTAbkzGH0EaJtCj3qzMVDUxk4/s8RpLJtUBfMGkb2Sw/fZ66M6
 1LDqZ/0ovDBLYPEcHGXX6AAsQyJkmePgM3YMON5Nfg49bqp0qquUEEaMYoEkPpEnNqBi
 uijhFKTOe9VRwvj4oTBBg1jaYC4XpfxiE33kEOFm8bUFbFndrUU0l6MHChfTyLePGcw7
 yHTBckmGsEKWLreABr2KbJ/7WY2kY8C0NKU3cukrP3/JUBepxQlbU4hBUjzef4e0uUs/
 JjADlGpzkSHMpnEbKy/RjRCa8WGXBnvq0LnUvaEMgIObEbz8r3DbUtjNBiY1t1O6RXYI
 fm4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z220BesNCBDXACL2kstOoMgF4dcNonJNXvdvzRxIldk=;
 b=dDI5iBdWzRkNlR2RcD0Ah50K6jn+GcB3wLZ/PzdCKQodK2Zovte42vtNzt/qt3MUms
 uVrTHp9a8OxjBYoYEPOhvR1MOl9Tvf83lw8M7NuHYJ2jjgc3Vb/6hWjGtpZg1MZpSPcZ
 9uVpkKIWlaokppN1j2LekvrdlsPl5kDQkuwnAmMhVe3sdnKHWJgYKfAH8zl+fREh4qVv
 3fv8FesFHC1zDxITtB6wBjp79Ds1F4KIDqkCtlrlfDjyUBfp9tobjtqQnyDUr+DT/0Ar
 GkqjNoAGz0h+JazVebugW1d88MF2o/nSCcMCf4VEPwpvN6DYzU46Ykl6VDSv2o5fMx+/
 AmFg==
X-Gm-Message-State: AOAM532MImCsOirge1jmgfYa1+75eCDVNoE/MsNky/HTAsKq6//n6Rff
 oe15UpHrhVLvjvvbOujCxrU=
X-Google-Smtp-Source: ABdhPJzeVNfSBJj8jrPvCmB6fLPbJKVTbzhHlj5S9xagPYBgolSxtx6+tSRulJyXLisr1p+0BQRxrA==
X-Received: by 2002:a5d:63c4:: with SMTP id c4mr1707262wrw.287.1621282921926; 
 Mon, 17 May 2021 13:22:01 -0700 (PDT)
Received: from localhost.localdomain
 (p200300f1371adf00428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:371a:df00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id f4sm19190387wrz.33.2021.05.17.13.22.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 13:22:01 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org
Cc: jbrunet@baylibre.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] soc: amlogic: meson-ee-pwrc: Rename "get_power" to
 "is_powered_off"
Date: Mon, 17 May 2021 22:21:15 +0200
Message-Id: <20210517202115.1004065-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_132204_498777_42CC9B0E 
X-CRM114-Status: GOOD (  18.53  )
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

The name "get_power" is used within the Meson EE power controller driver
to indicate whether a power domain is turned on or off. With the
original "get_power" naming the result was:
- true = powered off
- false = powered on

Rename "get_power" to "is_powered_off" to make the naming consistent
with the third argument to pm_genpd_init. Also this naming is easier to
understand when reading the code without looking at the implementation
of "get_power".

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/soc/amlogic/meson-ee-pwrc.c | 46 ++++++++++++++---------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/soc/amlogic/meson-ee-pwrc.c b/drivers/soc/amlogic/meson-ee-pwrc.c
index 50bf5d2b828b..2be3afe6c2e3 100644
--- a/drivers/soc/amlogic/meson-ee-pwrc.c
+++ b/drivers/soc/amlogic/meson-ee-pwrc.c
@@ -68,7 +68,7 @@ struct meson_ee_pwrc_domain_desc {
 	struct meson_ee_pwrc_top_domain *top_pd;
 	unsigned int mem_pd_count;
 	struct meson_ee_pwrc_mem_domain *mem_pd;
-	bool (*get_power)(struct meson_ee_pwrc_domain *pwrc_domain);
+	bool (*is_powered_off)(struct meson_ee_pwrc_domain *pwrc_domain);
 };
 
 struct meson_ee_pwrc_domain_data {
@@ -217,7 +217,7 @@ static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_audio[] = {
 	{ HHI_AUDIO_MEM_PD_REG0, GENMASK(27, 26) },
 };
 
-#define VPU_PD(__name, __top_pd, __mem, __get_power, __resets, __clks)	\
+#define VPU_PD(__name, __top_pd, __mem, __is_pwr_off, __resets, __clks)	\
 	{								\
 		.name = __name,						\
 		.reset_names_count = __resets,				\
@@ -225,46 +225,46 @@ static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_audio[] = {
 		.top_pd = __top_pd,					\
 		.mem_pd_count = ARRAY_SIZE(__mem),			\
 		.mem_pd = __mem,					\
-		.get_power = __get_power,				\
+		.is_powered_off = __is_pwr_off,				\
 	}
 
-#define TOP_PD(__name, __top_pd, __mem, __get_power)			\
+#define TOP_PD(__name, __top_pd, __mem, __is_pwr_off)			\
 	{								\
 		.name = __name,						\
 		.top_pd = __top_pd,					\
 		.mem_pd_count = ARRAY_SIZE(__mem),			\
 		.mem_pd = __mem,					\
-		.get_power = __get_power,				\
+		.is_powered_off = __is_pwr_off,				\
 	}
 
 #define MEM_PD(__name, __mem)						\
 	TOP_PD(__name, NULL, __mem, NULL)
 
-static bool pwrc_ee_get_power(struct meson_ee_pwrc_domain *pwrc_domain);
+static bool pwrc_ee_is_powered_off(struct meson_ee_pwrc_domain *pwrc_domain);
 
 static struct meson_ee_pwrc_domain_desc axg_pwrc_domains[] = {
 	[PWRC_AXG_VPU_ID]  = VPU_PD("VPU", &gx_pwrc_vpu, axg_pwrc_mem_vpu,
-				     pwrc_ee_get_power, 5, 2),
+				     pwrc_ee_is_powered_off, 5, 2),
 	[PWRC_AXG_ETHERNET_MEM_ID] = MEM_PD("ETH", meson_pwrc_mem_eth),
 	[PWRC_AXG_AUDIO_ID] = MEM_PD("AUDIO", axg_pwrc_mem_audio),
 };
 
 static struct meson_ee_pwrc_domain_desc g12a_pwrc_domains[] = {
 	[PWRC_G12A_VPU_ID]  = VPU_PD("VPU", &gx_pwrc_vpu, g12a_pwrc_mem_vpu,
-				     pwrc_ee_get_power, 11, 2),
+				     pwrc_ee_is_powered_off, 11, 2),
 	[PWRC_G12A_ETH_ID] = MEM_PD("ETH", meson_pwrc_mem_eth),
 };
 
 static struct meson_ee_pwrc_domain_desc gxbb_pwrc_domains[] = {
 	[PWRC_GXBB_VPU_ID]  = VPU_PD("VPU", &gx_pwrc_vpu, gxbb_pwrc_mem_vpu,
-				     pwrc_ee_get_power, 12, 2),
+				     pwrc_ee_is_powered_off, 12, 2),
 	[PWRC_GXBB_ETHERNET_MEM_ID] = MEM_PD("ETH", meson_pwrc_mem_eth),
 };
 
 static struct meson_ee_pwrc_domain_desc meson8_pwrc_domains[] = {
 	[PWRC_MESON8_VPU_ID]  = VPU_PD("VPU", &meson8_pwrc_vpu,
-				       meson8_pwrc_mem_vpu, pwrc_ee_get_power,
-				       0, 1),
+				       meson8_pwrc_mem_vpu,
+				       pwrc_ee_is_powered_off, 0, 1),
 	[PWRC_MESON8_ETHERNET_MEM_ID] = MEM_PD("ETHERNET_MEM",
 					       meson_pwrc_mem_eth),
 	[PWRC_MESON8_AUDIO_DSP_MEM_ID] = MEM_PD("AUDIO_DSP_MEM",
@@ -273,8 +273,8 @@ static struct meson_ee_pwrc_domain_desc meson8_pwrc_domains[] = {
 
 static struct meson_ee_pwrc_domain_desc meson8b_pwrc_domains[] = {
 	[PWRC_MESON8_VPU_ID]  = VPU_PD("VPU", &meson8_pwrc_vpu,
-				       meson8_pwrc_mem_vpu, pwrc_ee_get_power,
-				       11, 1),
+				       meson8_pwrc_mem_vpu,
+				       pwrc_ee_is_powered_off, 11, 1),
 	[PWRC_MESON8_ETHERNET_MEM_ID] = MEM_PD("ETHERNET_MEM",
 					       meson_pwrc_mem_eth),
 	[PWRC_MESON8_AUDIO_DSP_MEM_ID] = MEM_PD("AUDIO_DSP_MEM",
@@ -283,15 +283,15 @@ static struct meson_ee_pwrc_domain_desc meson8b_pwrc_domains[] = {
 
 static struct meson_ee_pwrc_domain_desc sm1_pwrc_domains[] = {
 	[PWRC_SM1_VPU_ID]  = VPU_PD("VPU", &sm1_pwrc_vpu, sm1_pwrc_mem_vpu,
-				    pwrc_ee_get_power, 11, 2),
+				    pwrc_ee_is_powered_off, 11, 2),
 	[PWRC_SM1_NNA_ID]  = TOP_PD("NNA", &sm1_pwrc_nna, sm1_pwrc_mem_nna,
-				    pwrc_ee_get_power),
+				    pwrc_ee_is_powered_off),
 	[PWRC_SM1_USB_ID]  = TOP_PD("USB", &sm1_pwrc_usb, sm1_pwrc_mem_usb,
-				    pwrc_ee_get_power),
+				    pwrc_ee_is_powered_off),
 	[PWRC_SM1_PCIE_ID] = TOP_PD("PCI", &sm1_pwrc_pci, sm1_pwrc_mem_pcie,
-				    pwrc_ee_get_power),
+				    pwrc_ee_is_powered_off),
 	[PWRC_SM1_GE2D_ID] = TOP_PD("GE2D", &sm1_pwrc_ge2d, sm1_pwrc_mem_ge2d,
-				    pwrc_ee_get_power),
+				    pwrc_ee_is_powered_off),
 	[PWRC_SM1_AUDIO_ID] = MEM_PD("AUDIO", sm1_pwrc_mem_audio),
 	[PWRC_SM1_ETH_ID] = MEM_PD("ETH", meson_pwrc_mem_eth),
 };
@@ -314,7 +314,7 @@ struct meson_ee_pwrc {
 	struct genpd_onecell_data xlate;
 };
 
-static bool pwrc_ee_get_power(struct meson_ee_pwrc_domain *pwrc_domain)
+static bool pwrc_ee_is_powered_off(struct meson_ee_pwrc_domain *pwrc_domain)
 {
 	u32 reg;
 
@@ -445,7 +445,7 @@ static int meson_ee_pwrc_init_domain(struct platform_device *pdev,
          * we need to power the domain off, otherwise the internal clocks
          * prepare/enable counters won't be in sync.
          */
-	if (dom->num_clks && dom->desc.get_power && !dom->desc.get_power(dom)) {
+	if (dom->num_clks && dom->desc.is_powered_off && !dom->desc.is_powered_off(dom)) {
 		ret = clk_bulk_prepare_enable(dom->num_clks, dom->clks);
 		if (ret)
 			return ret;
@@ -456,8 +456,8 @@ static int meson_ee_pwrc_init_domain(struct platform_device *pdev,
 			return ret;
 	} else {
 		ret = pm_genpd_init(&dom->base, NULL,
-				    (dom->desc.get_power ?
-				     dom->desc.get_power(dom) : true));
+				    (dom->desc.is_powered_off ?
+				     dom->desc.is_powered_off(dom) : true));
 		if (ret)
 			return ret;
 	}
@@ -536,7 +536,7 @@ static void meson_ee_pwrc_shutdown(struct platform_device *pdev)
 	for (i = 0 ; i < pwrc->xlate.num_domains ; ++i) {
 		struct meson_ee_pwrc_domain *dom = &pwrc->domains[i];
 
-		if (dom->desc.get_power && !dom->desc.get_power(dom))
+		if (dom->desc.is_powered_off && !dom->desc.is_powered_off(dom))
 			meson_ee_pwrc_off(&dom->base);
 	}
 }
-- 
2.31.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
