Return-Path: <SRS0=FMGI=56=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BEA1C2BB1D
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Apr 2020 20:16:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 336E1206E9
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Apr 2020 20:16:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fo4mk6+6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="p7rlS3al"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 336E1206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F6WQyVJC/f1PJf0Y3K7J7GkSoM/4c9Ndnr1Ld6I5zik=; b=Fo4mk6+6y6ZBt1
	Zus21Wu2S9dev1LHnm522RwzEsPoUYTr3tXS8eSMm7UMRT+5lLdxbJEozIQ65G3/NWOVy74QC1iv6
	d12oKM1o45sGjSZ17AAXfG8cU2gMl/fEHJs1Ike82iigEqGbr7x3h+Zofu+0VYBBR0+bBJFdVez1I
	vcZ1yhFfRDiST//A4NZATT6ogZx4ThnMITzEwQWhZgfU5zsLIt2gBKkI+WYmso3E1K79iJ2AIMhh+
	XEE8VcrCAmqDOOUknatORF3tozu42R8lO+IhtyNQp5mqlpEUXo92R5pjGM1MNL3CHlNY9B+Rpf57P
	r7B1zzWNxc2QEtBrxWYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jORyY-0000q3-DP; Tue, 14 Apr 2020 20:16:06 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jORy0-0008QT-NX; Tue, 14 Apr 2020 20:15:34 +0000
Received: by mail-wr1-x442.google.com with SMTP id k1so8824348wrx.4;
 Tue, 14 Apr 2020 13:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f8em9AvrfAEpxaMHqaLgGhBy4pxjXY2ZYYbHJqjrLMg=;
 b=p7rlS3alBsKhovayyBNnkQ0iz2zy0XG2rkJ8Jqk9nlveJ9HaG5AQMr6F8A7ikQRJIb
 elQxE+v8thegARaELzvq1uMiWFN+0ukpQixd/GB/8F5SozMEKMScpIypGPBQCyL749i6
 nLuQ0dxqpf8ssW6No4SomInpszp5Y3nQOkm+6snZbYd1sUN4r7vo8jFqOSYFq68L7Tv5
 BTP5XCM9woJjxuHxcV0NJBem3XLLthExt3XdzggJuZLy/LnyK5Tl7Vwh7ZQyXgqd9Shi
 mxeNUBAr4mpcrES+UoX/2C0xTZodFUn1LSJDXNEzOgUm8hHk62UtBcQdflxbe6gbdoO2
 I7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f8em9AvrfAEpxaMHqaLgGhBy4pxjXY2ZYYbHJqjrLMg=;
 b=adZrPpo0dIkTCOlX9AMXaTz3Hr2TuOdrptgS++URWWdv1qwOs0xzqFxFxC3K3g5918
 YOinm+vNubhOX5S9JFC/IWGsCi7MKTRfFkS90o9AeXxVRvzL0oHPDtsZjHQJ+2qvuSTc
 uv/nolk5WLzh2ClQb/YdJAg2Jg8wzkDNQanJvHZHglJmFfE3Gi4risn5iC50mwK4sTCU
 x3cTx0qwPPMCQ4q02eBTOP2CAt2wKQnen66v7XVVGMKJzfKkwRfGTxoCZbbhLVZTED8X
 4BBSFr15+d4mmVVPf9tZH18oYEONg7wZ4D89vxoRriCniZ+mFjtfcK/75k900yOkCBqS
 fKSg==
X-Gm-Message-State: AGi0PuaFGSEgEKrRN7L2M2FKVFPCjtTOhEzed8n8yehM9LR31uIpmdjG
 0iemtITvMWE0VEpo9Nppxys=
X-Google-Smtp-Source: APiQypLSLEwSPL5qqaWeTy+hFwnxC3rU6QWDzoXHJjL6U8WkB7JbZKQC72Kvwv6oiWG7P8TN4G5xyg==
X-Received: by 2002:a5d:438c:: with SMTP id i12mr13368428wrq.14.1586895331421; 
 Tue, 14 Apr 2020 13:15:31 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F13717DF00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3717:df00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id u17sm22537467wra.63.2020.04.14.13.15.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 13:15:30 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: robh+dt@kernel.org, khilman@baylibre.com, narmstrong@baylibre.com,
 linux-amlogic@lists.infradead.org
Subject: [PATCH RFC v1 4/4] soc: amlogic: meson-ee-pwrc: add support for the
 Meson GX SoCs
Date: Tue, 14 Apr 2020 22:14:57 +0200
Message-Id: <20200414201457.229131-5-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200414201457.229131-1-martin.blumenstingl@googlemail.com>
References: <20200414201457.229131-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_131532_811055_1B10E4AC 
X-CRM114-Status: GOOD (  13.72  )
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
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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
index b30868da456a..c8fbdc8f5c1d 100644
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
+	[PWRC_GXBB_ETH_ID] = MEM_PD("ETH", meson8_pwrc_mem_eth),
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
2.26.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
