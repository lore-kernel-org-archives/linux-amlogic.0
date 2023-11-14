Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C7BC4332F
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Nov 2023 10:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eXXrgxhQZ6y5RBGZ5Oj9Im8VQLxS8TUuVEpfISYUZEU=; b=RS8MYBuL2+z//t
	GBNkMtzwaI5r+bKyCTM6OxeR/MO0bhB1nE1cr+EiumlqOvCbDK3UAkkeuhO6PlWRWCrPblKP3/StP
	yjwYwU90XE7bTLmeMYaKkrS+XuCjaehninkQ9wGED/Nl5pZeJJ/0nOFnD/+LvOHdb4hLQGDSSVnzp
	p3IEto64r9GJeVcLBmhYyBcZLofEbhaqI6ONV4u4dyzUVIomp5kknto9Ldha7z+vB08AF13zlI9wm
	z3+cZ0KBt06gl1Futc+1bMkx9jZKQGsj71eqcPDX4VgEH2TD+064jQkYUQ5B+zMd/yksmjI0HvZlG
	TXEj6ZBPPp2hAR9ZRFyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2qRe-00FYjc-1p;
	Tue, 14 Nov 2023 10:14:58 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2qRa-00FYhI-10
	for linux-amlogic@lists.infradead.org;
	Tue, 14 Nov 2023 10:14:55 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50930f126b1so7165041e87.3
        for <linux-amlogic@lists.infradead.org>; Tue, 14 Nov 2023 02:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699956892; x=1700561692; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=989mY4zS1x08vGe3jaH2doZ857QaMFqojYApjOFNcNA=;
        b=t1BxLclXvYUIECxTMavTvANDyqdZkHt0fN9XOA22d2yPq9JN8Wbz4aG7GPlIoEJ2nd
         IChXTblFVYmmdI3zqeyL771njecQ0e3m9Vvsm+2Fgp+UlhSatBM362k5QiI8WTTAxBRS
         Qcovj1k9W02O9GIX1lB/4Sg1gV0jpe78jYoq6UXw8lMOo/QK9gztfaK4LZRkjJeYjFu2
         oNn6eEPd9KnEpHugfAfYskZSR7T5mit5vqpUdrFzLSljulmNrfndY8YbUjh2Ztj5rBOd
         BeMlGHcs+H12br/1vUcn//3jgVtNn2a5Gs8YlXJH2sLh3TS0PEq4vyN6l8y6AlgaLqBu
         fjvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699956892; x=1700561692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=989mY4zS1x08vGe3jaH2doZ857QaMFqojYApjOFNcNA=;
        b=Yw3prkhFM4mp6rbGQzq/24Orhlu+VnvcMB/2ub+w1GkifJsg04weR94V80K8w7Nrqv
         V6OTweR+yPkwwT2xlE7GJ5UkB/a8PW9GgfrclQ4p59sYPkYNx+8LUSCV5q+GAoBH+Sbr
         zCfZU0wpQQCLuoGOtETh5NJKgaaLJFJNVrKVjz1EuyiRKHO5kD2EZZwYWpU5TMDpt/9X
         0t4kOQAwa92BlGwfoWT2KNdtix1/EoyXViXaM2vEPDCJMgmlCLTHevcQDqPawtExyGKe
         SOzhwvF2VUbxISPeW2OCUN4CeV5eDWfRiX6x++ZdKDL0KySAjZ1Fyl+5nhM2p7VsACqU
         UIUA==
X-Gm-Message-State: AOJu0YwXv6sUo3Av/A6zaE7kNlXkzIrZ+LzVn/GWGaaipWHZxXgiTfYk
	5Z3IlHwfnTwnzNr5ZLhJ8BGZHw==
X-Google-Smtp-Source: AGHT+IEFDSgibpjMV4Y7PnvYBSXrksO4SQXgiQw6EKC+4nF+gMP8A5o+yNQNi1S3cVJxowIPQccVKg==
X-Received: by 2002:a05:6512:20d3:b0:503:653:5711 with SMTP id u19-20020a05651220d300b0050306535711mr4965401lfr.9.1699956892200;
        Tue, 14 Nov 2023 02:14:52 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id n2-20020a5d4202000000b0032d886039easm7335585wrq.14.2023.11.14.02.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 02:14:51 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 14 Nov 2023 11:14:45 +0100
Subject: [PATCH 3/3] clk: meson: g12a: add CSI & ISP gates clocks
MIME-Version: 1.0
Message-Id: <20231114-topic-amlogic-upstream-isp-clocks-v1-3-223958791501@linaro.org>
References: <20231114-topic-amlogic-upstream-isp-clocks-v1-0-223958791501@linaro.org>
In-Reply-To: <20231114-topic-amlogic-upstream-isp-clocks-v1-0-223958791501@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1776;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=G6Kb72oGcBrPLl5eFs681WZSIgqU+YTJL+dNbC8hxWs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlU0iXw3tWEkFljMjnl008PiXXewEGfT3AHYBO+Wi+
 sQAl3i+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZVNIlwAKCRB33NvayMhJ0QufD/
 0ceRMlDLWS+bur9qzpxRCQm4JTKJ6Kx+cIpmoZWH64KiPe9srQxK38q/CKawXo+wQvZjc1gWV+ldur
 BgqhGY/VxsjAwt8p+FO7NT8BotOl5Xhh9U4gbEf2DJqMUYjcZx7gLBrpWFNMFLId9cEXCdrmAbo7G/
 UfeW+cHrY5rOCkSvtcAWFUE12xUANkKlU/8VB/51OUcvrS4iyymlxA2qV6EKltNwJRTdLtuMBMFzHT
 0HzZH7C8MObagKeOiWT3MH4g8tk/sJk98dB3NkL1BH3p7NxCRc9Nsswrtw20S+Nn05Usfvty8mLEeY
 ugjrfY0vyBqZMqmrMxhApo6gmLeex65PpEjR+z7LENPXc46UoAel7LI5fV/y5HOlT+erymy1vPVf+S
 JSOSn1rJ/ESZMYCgdECBtjFXqbAwMt/qDb/NvLD4elGmYYPnbx2z7pytzdidK5CBvvsMYxjbsn3DDU
 WUMUXuwwPY2QNnFpxLic0Obir+1TsIsu+IcS5fnHPf2+2VRRLS27gijuuYvWrJl9GWCDRDqnC+8gIR
 JDuC2awJSuWNOfb//BOiZmN4H+6CyG0ARxAEfvdU2AXfaBC/tXnthHtxvVhHZFJeWAi1iN80IWqaYJ
 tMAOb2UldwqlNqZ1XqH2gzxt2oofds639E4P1jOIzqN0dGsX6tCB85evzSlQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_021454_361226_0825F4D8 
X-CRM114-Status: UNSURE (   8.74  )
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

Add the gates entires for the CSI ISP domain and CSI PHYs.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/meson/g12a.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index a8312f29d1cc..b0bd37ae1a81 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -4274,9 +4274,12 @@ static MESON_GATE(g12a_htx_hdcp22,		HHI_GCLK_MPEG2,	3);
 static MESON_GATE(g12a_htx_pclk,		HHI_GCLK_MPEG2,	4);
 static MESON_GATE(g12a_bt656,			HHI_GCLK_MPEG2,	6);
 static MESON_GATE(g12a_usb1_to_ddr,		HHI_GCLK_MPEG2,	8);
+static MESON_GATE(g12b_mipi_isp_gate,		HHI_GCLK_MPEG2,	17);
 static MESON_GATE(g12a_mmc_pclk,		HHI_GCLK_MPEG2,	11);
 static MESON_GATE(g12a_uart2,			HHI_GCLK_MPEG2,	15);
 static MESON_GATE(g12a_vpu_intr,		HHI_GCLK_MPEG2,	25);
+static MESON_GATE(g12b_csi_phy1,		HHI_GCLK_MPEG2,	28);
+static MESON_GATE(g12b_csi_phy0,		HHI_GCLK_MPEG2,	29);
 static MESON_GATE(g12a_gic,			HHI_GCLK_MPEG2,	30);
 
 static MESON_GATE(g12a_vclk2_venci0,		HHI_GCLK_OTHER,	1);
@@ -4792,6 +4795,9 @@ static struct clk_hw *g12b_hw_clks[] = {
 	[CLKID_MIPI_ISP_SEL]		= &g12b_mipi_isp_sel.hw,
 	[CLKID_MIPI_ISP_DIV]		= &g12b_mipi_isp_div.hw,
 	[CLKID_MIPI_ISP]		= &g12b_mipi_isp.hw,
+	[CLKID_MIPI_ISP_GATE]		= &g12b_mipi_isp_gate.hw,
+	[CLKID_MIPI_ISP_CSI_PHY0]	= &g12b_csi_phy0.hw,
+	[CLKID_MIPI_ISP_CSI_PHY1]	= &g12b_csi_phy1.hw,
 };
 
 static struct clk_hw *sm1_hw_clks[] = {
@@ -5287,6 +5293,9 @@ static struct clk_regmap *const g12a_clk_regmaps[] = {
 	&g12b_mipi_isp_sel,
 	&g12b_mipi_isp_div,
 	&g12b_mipi_isp,
+	&g12b_mipi_isp_gate,
+	&g12b_csi_phy1,
+	&g12b_csi_phy0,
 };
 
 static const struct reg_sequence g12a_init_regs[] = {

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
