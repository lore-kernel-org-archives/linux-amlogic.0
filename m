Return-Path: <SRS0=tbsV=6E=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE38C3A5A0
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Apr 2020 20:27:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F2CC2078C
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Apr 2020 20:27:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EmWEzIp3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="p6knrLkB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F2CC2078C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pU/X1iZamIitD8Y4D/lGzAoAXA1x90wdSStobe+ctrg=; b=EmWEzIp3muFMbG
	IhxJsVworbwauozOoTbjTt8u0eZ8Vf/20sgkOHE8ksWomA9yeOoASNUVHXFWAnU+qZf8IhZZ2Rwc6
	T7Z+mr+UfgNFAkl8wELgAjFCy9C8Xv9tLrLJEmcc6GM/SSIkN2FUDj+4/u1eNyA/R5REFKqyof/6n
	ZhER/FjP438TXCADI830CXhe8V61Yuj1OWuX9wKh1nveLFjvAkZmZImOCxmvNsCCt6rOfGbGObk8k
	biA2KnA2n5Ws1L66AmJfaqPkFVQ5kjdgBcA2l5Hd8H4PDDeSV96X9nsyguTkTOLaB2ri565F9usPw
	8kqBdmPd7f85OTopjA8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQd0Z-0001SY-1E; Mon, 20 Apr 2020 20:27:11 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQczs-0000kP-H6; Mon, 20 Apr 2020 20:26:30 +0000
Received: by mail-wm1-x341.google.com with SMTP id y24so1061668wma.4;
 Mon, 20 Apr 2020 13:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6W8grtyB7pbKtLO6nZYSpUXrUqbnBG7Y9G7Qj2TNYYc=;
 b=p6knrLkBXwqGxq6+Y8qDIGzAfcrs/wLEqwashKOOkURN4yTA94z5zf6FYUXgFl5l+A
 sUZmWPty1XgIIpLJ3hTZO4gKR/faEocL0UrIS0nof9RS8Twbj238UkMEtj94Kz5OlpUd
 8hQELeyceiME/J/rZZVVMoRms2EpF/5fJzag0sVaY5uAMl/5yXip4SfSyG3lZMWSEjeM
 k14iXl5I9MZDAQS/v/frX36Orkn+PTNpt0fHnjzmF1buhsAhSk+K0WNkYkNAsy4sfAEL
 awitjW9GwcEYdzsGz3nqeD8ILj01JO0ixWHC5/iW+BObvDHrDvKpuPvCv4X+F1l5TCIY
 yh+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6W8grtyB7pbKtLO6nZYSpUXrUqbnBG7Y9G7Qj2TNYYc=;
 b=BJ7raAxk5hPPHWKR8Nv8qy8iYU8wuS4uotHvIbqTfe/zaEb89KSBlQapDqsEFGfdtr
 A2JoN42gaiR79V+oOAKhJ1fqDmhPCkEIlgJ2Onh3U5T9MtrVkpEUe7YW7CDcMR9mus1K
 JpqTJZ+FyTcAjQpZ7ULLB3Dv39+chT56tlrVVZbrQ0UhWNM7yFbpo5YS6etGDDyyqsod
 Qsc8EoFlEYfv0QrBmo2lo00grzY+vowAA+dXMoTCK1C9zJOpntuAhjQeTJ1TasHd8038
 JXGWdDEqoOhCJsRnMfJmbsJrWR+3zQb6U0mUMiz6BQV894bwRfsv0IXIjqQctyw40IXj
 X4mg==
X-Gm-Message-State: AGi0PuZBkOOrET8XcAWHwqhlQnZV6muEgpgouxKak2bdtlRycMS9QftJ
 dnjvs1BHLrfx65V070g++YY=
X-Google-Smtp-Source: APiQypLqmxKs/1t8ZCj39OTBsU0FhGL3s33M63qCSyOMn2SmgJ0ImXAQAFlCOH5BiI32aIJv+k0WsA==
X-Received: by 2002:a1c:148:: with SMTP id 69mr1161252wmb.181.1587414387225;
 Mon, 20 Apr 2020 13:26:27 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F137142E00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3714:2e00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id l19sm657846wmj.14.2020.04.20.13.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 13:26:26 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: robh+dt@kernel.org, khilman@baylibre.com, narmstrong@baylibre.com,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v3 4/4] soc: amlogic: meson-ee-pwrc: add support for the Meson
 GX SoCs
Date: Mon, 20 Apr 2020 22:26:12 +0200
Message-Id: <20200420202612.369370-5-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200420202612.369370-1-martin.blumenstingl@googlemail.com>
References: <20200420202612.369370-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_132628_573421_BDC74E62 
X-CRM114-Status: GOOD (  14.32  )
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
