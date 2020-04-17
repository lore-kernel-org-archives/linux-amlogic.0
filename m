Return-Path: <SRS0=ZPw0=6B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2619C2D0EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Apr 2020 19:09:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C2AC20780
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Apr 2020 19:09:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="feNXvlQi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="eohS/Pgm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C2AC20780
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pU/X1iZamIitD8Y4D/lGzAoAXA1x90wdSStobe+ctrg=; b=feNXvlQiioIsnw
	W0LEZRuzmlwfVi/OkVClarLgIwJKXyOksylzsKRP79dnGzoHavQyMOyNTBvlT2RnCbsg9xbZkNyOD
	SfWvOUC8nQslsdytprSbNO4eopkk1fTMT+Cmh19Px8++kNwTIHQKcQMH233W765jLz1ZiJ2TvJi0m
	m+Kwu/BeeUKFXBErB52Xxpi/Ok74EBlOyX7e/SfBm3bAqYZr22EhAdJ0JbVTsIWHbCCk2+6SDOvpx
	Lp4n95L78R1zxrs1r3JXcuAkoaECQuod+CaA3M2MuwF0CBwIazJttbCYRUBIt0xWxQmUZeQl74Rxs
	gQemE2WnBeO/yAFb4x3g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPWN1-0002xS-OV; Fri, 17 Apr 2020 19:09:47 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPWM3-00026X-1a; Fri, 17 Apr 2020 19:08:48 +0000
Received: by mail-wr1-x441.google.com with SMTP id g13so2244295wrb.8;
 Fri, 17 Apr 2020 12:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6W8grtyB7pbKtLO6nZYSpUXrUqbnBG7Y9G7Qj2TNYYc=;
 b=eohS/PgmixifbU4OP9qQXJdkkkFkvnj2zGyIiM+8j+RuemBqtPhzU9GuDwm66czYQ+
 i1YhLAVCQFHqn4XlfLKAob3MWZv7PxMT40D80jRRe8gEO3T3Jg9DvohBJRz32LLhvNUl
 vBntwB/NJF9web2wrX4R6LzzIqoeWQbKcIxQ1c22a6vmEvCGDl6M5WCdFGs88agO3IMN
 r+7vfSTVUn4JFtHIBK0PmRanq9XpckRa3UFVckfod8hEPasvoe1WjWbK4pwfj2FC8Zhl
 V5J6/p2/og5MOLQEZ21CisSqHRYcfkVKeUWWS3qnyizvgcUjbhelr4mtf+AyhR2mWHVK
 DleQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6W8grtyB7pbKtLO6nZYSpUXrUqbnBG7Y9G7Qj2TNYYc=;
 b=tAqSshiSiEOCf2Vk9mNNKZrQSu8kqdDLuw80aVMU2PSZZ1KrnVg1ubt/N6lYy2aFqZ
 CMO0LB4YT32Vdq0qwuSq911H6C/RwM2zt1QT9Q2g4CJE0Zr7D8bRfencMLDLZiwQLP9r
 SRahMC2nPVpawIJpMTpp+qx8qwHW0SQIzvBFlt/7uUgmcnK6fTw6Fpxza1fdXchVA3I8
 Gj9sFrIanuV8/arKMIBUFH6OCz1CKICfU/5grLwe+Uezw07waduEv/uIkkyN/dCBW7nt
 M9wm5+hJaYJhatoWRpL5LtTbwzo86DUHAhsWAiGFuES7SGpesxrqhNPFgNELYJUADqtb
 p+Jg==
X-Gm-Message-State: AGi0PuYPUAPjZW9IUckFfmc/np9yww1eJyA/R7tOXmR5uBqO4jmFD3Wv
 i3zQkXs9zXVv7mE8TdJU/UTKrKgBi34=
X-Google-Smtp-Source: APiQypJUOfw5uaHckCfVeIv6eCok6EoXcFAHNfbYAHfNICppRDK0dqv5ZqH3wlSqzLkRMKtX2D5vQQ==
X-Received: by 2002:adf:c109:: with SMTP id r9mr5403450wre.265.1587150525549; 
 Fri, 17 Apr 2020 12:08:45 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F137142E00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3714:2e00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id q17sm8722220wmj.45.2020.04.17.12.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 12:08:44 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: robh+dt@kernel.org, khilman@baylibre.com, narmstrong@baylibre.com,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v2 4/4] soc: amlogic: meson-ee-pwrc: add support for the Meson
 GX SoCs
Date: Fri, 17 Apr 2020 21:08:25 +0200
Message-Id: <20200417190825.1363345-5-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200417190825.1363345-1-martin.blumenstingl@googlemail.com>
References: <20200417190825.1363345-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_120847_097156_8F434110 
X-CRM114-Status: GOOD (  14.08  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add support for the Meson GX SoCs to the meson-ee-pwrc driver.

The power domains on the GX SoCs are very similar to G12A. The only
known differences so far are:
- The GX SoCs do not have the HHI_VPU_MEM_PD_REG2 register (for the
  VPU power-domain)
- The GX SoCs have an additional reset line called "dvin"

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/soc/amlogic/meson-ee-pwrc.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/amlogic/meson-ee-pwrc.c b/drivers/soc/amlogic/meson-ee-pwrc.c
index b30868da456a..a90572cb9c82 100644
--- a/drivers/soc/amlogic/meson-ee-pwrc.c
+++ b/drivers/soc/amlogic/meson-ee-pwrc.c
@@ -16,6 +16,7 @@
 #include <linux/clk.h>
 #include <dt-bindings/power/meson8-power.h>
 #include <dt-bindings/power/meson-g12a-power.h>
+#include <dt-bindings/power/meson-gxbb-power.h>
 #include <dt-bindings/power/meson-sm1-power.h>
 
 /* AO Offsets */
@@ -73,7 +74,7 @@ struct meson_ee_pwrc_domain_data {
 
 /* TOP Power Domains */
 
-static struct meson_ee_pwrc_top_domain g12a_pwrc_vpu = {
+static struct meson_ee_pwrc_top_domain gxbb_pwrc_vpu = {
 	.sleep_reg = AO_RTI_GEN_PWR_SLEEP0,
 	.sleep_mask = BIT(8),
 	.iso_reg = AO_RTI_GEN_PWR_SLEEP0,
@@ -138,6 +139,12 @@ static struct meson_ee_pwrc_mem_domain g12a_pwrc_mem_vpu[] = {
 	VPU_HHI_MEMPD(HHI_MEM_PD_REG0),
 };
 
+static struct meson_ee_pwrc_mem_domain gxbb_pwrc_mem_vpu[] = {
+	VPU_MEMPD(HHI_VPU_MEM_PD_REG0),
+	VPU_MEMPD(HHI_VPU_MEM_PD_REG1),
+	VPU_HHI_MEMPD(HHI_MEM_PD_REG0),
+};
+
 static struct meson_ee_pwrc_mem_domain meson8_pwrc_mem_eth[] = {
 	{ HHI_MEM_PD_REG0, GENMASK(3, 2) },
 };
@@ -223,11 +230,17 @@ static struct meson_ee_pwrc_mem_domain sm1_pwrc_mem_audio[] = {
 static bool pwrc_ee_get_power(struct meson_ee_pwrc_domain *pwrc_domain);
 
 static struct meson_ee_pwrc_domain_desc g12a_pwrc_domains[] = {
-	[PWRC_G12A_VPU_ID]  = VPU_PD("VPU", &g12a_pwrc_vpu, g12a_pwrc_mem_vpu,
+	[PWRC_G12A_VPU_ID]  = VPU_PD("VPU", &gxbb_pwrc_vpu, g12a_pwrc_mem_vpu,
 				     pwrc_ee_get_power, 11, 2),
 	[PWRC_G12A_ETH_ID] = MEM_PD("ETH", meson8_pwrc_mem_eth),
 };
 
+static struct meson_ee_pwrc_domain_desc gxbb_pwrc_domains[] = {
+	[PWRC_GXBB_VPU_ID]  = VPU_PD("VPU", &gxbb_pwrc_vpu, gxbb_pwrc_mem_vpu,
+				     pwrc_ee_get_power, 12, 2),
+	[PWRC_GXBB_ETHERNET_MEM_ID] = MEM_PD("ETH", meson8_pwrc_mem_eth),
+};
+
 static struct meson_ee_pwrc_domain_desc meson8_pwrc_domains[] = {
 	[PWRC_MESON8_VPU_ID]  = VPU_PD("VPU", &meson8_pwrc_vpu,
 				       meson8_pwrc_mem_vpu, pwrc_ee_get_power,
@@ -514,6 +527,11 @@ static struct meson_ee_pwrc_domain_data meson_ee_g12a_pwrc_data = {
 	.domains = g12a_pwrc_domains,
 };
 
+static struct meson_ee_pwrc_domain_data meson_ee_gxbb_pwrc_data = {
+	.count = ARRAY_SIZE(gxbb_pwrc_domains),
+	.domains = gxbb_pwrc_domains,
+};
+
 static struct meson_ee_pwrc_domain_data meson_ee_m8_pwrc_data = {
 	.count = ARRAY_SIZE(meson8_pwrc_domains),
 	.domains = meson8_pwrc_domains,
@@ -542,6 +560,10 @@ static const struct of_device_id meson_ee_pwrc_match_table[] = {
 		.compatible = "amlogic,meson8m2-pwrc",
 		.data = &meson_ee_m8b_pwrc_data,
 	},
+	{
+		.compatible = "amlogic,meson-gxbb-pwrc",
+		.data = &meson_ee_gxbb_pwrc_data,
+	},
 	{
 		.compatible = "amlogic,meson-g12a-pwrc",
 		.data = &meson_ee_g12a_pwrc_data,
-- 
2.26.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
