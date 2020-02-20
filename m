Return-Path: <SRS0=VXFk=4I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00141C11D0C
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Feb 2020 20:45:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6BE0206EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Feb 2020 20:45:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NHoidbfK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="RZe84KTg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6BE0206EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=c6SeM0KfSgSAzenrjOEq9gXltXBbck2wNitBp2UEDHE=; b=NHoidbfKNhmHzv
	mLzqnUEq3hOvsrMPZRzYM/Q7q3O6LXU/WrqPCGE5o4zT2EXF8jg6n2me2Krg5z8rI3nT4vsfZDG6J
	KQEwqgfaTeBCIfl+8z1sGPRI16r/MZiAyn4DoEsO+HhxlVgu5q+FjKLw4XMoh5Eg0O1Q1DU9LRFXF
	cej4DdtGli3xrDjM8otD7M1XFxKubp9b7KnM06m2AhhcwCfV3x3TbF+C6or1QNyH7R38KKOMsBKdh
	2LD3pNqswx16KjrnmiuNbCziPfrLERmd7aP2Hb9P/rd4qWtsX2NsgKRstRiTWoCu2SUMKNM0Dmlx0
	+ZFwJauCRWf6SRrslpyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4sgw-00067T-NT; Thu, 20 Feb 2020 20:45:02 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4sgt-00065q-M3; Thu, 20 Feb 2020 20:45:01 +0000
Received: by mail-wm1-x343.google.com with SMTP id p9so3449544wmc.2;
 Thu, 20 Feb 2020 12:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n76MR2hfIZsf6g57SD/GC8wwOFNZ4gbM6KJt3yOpBLs=;
 b=RZe84KTgVDumaVTivMwcyl7kEwDt57yX76+EH+ZLQWwRzv5k62azpHW8GqTx8mxI5J
 6d86J/N/tD47TrjzY+73UOYpQtyxsiHyf/yJ2PAbvRbUgF4WGlHmAwxGRofiMzBIfWmu
 DajDDq/fyp1k7BZfgCAdwxbHMfLZDowqN2cq23QtzZkTbeMw66pO0GdihywqH6QEC4LI
 W/C3nTVpiEI4DWCMfTY8/yGtanqaqmcWk9EqVf+SKkCo+CAiF39bmSCyuPXOucKkcvc6
 9BqwCvhOH5psaYpONEy2grDTT/ygotPLzUdunW6SVTK8+dcLurn4nftvXiPC+pd1vuuM
 yTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n76MR2hfIZsf6g57SD/GC8wwOFNZ4gbM6KJt3yOpBLs=;
 b=lTQG/KOftm56NdLVcD2M+wJ0+OGhXAkw2/ejEKvqos6E3p+wSfZPO6xxbTRdWP8Bxk
 KrNfjcnSRQ+M5ksbO5fe7A1kk+r/aZwFesydAt8hPYu8OxVIovGXES9PDpV5QMdoM0Gi
 zf0p1DpHcgurKOqSp05y2yoHrX4SunqnBv6/Z2oflCBoMPBlro+kkoVL1TBte1RAIsQy
 kXNAfPdzMO0f/phPNAPeJA9P4pC6PajszCrNcue2pdqiuZubQKJ2SnjE60f3SpXkFV8N
 a3ToM388ZQdJU/jv/NK0Ib1ysd/8A1L4Aj96h7wRC9z+NO28SOI0aSTBwWFB9ixtRqFh
 COhg==
X-Gm-Message-State: APjAAAWoCBKlJqLOHq/5odrl1yVzMLjt5kqgphaSY82Z/LjMB4ufVJt9
 JuwNTPat22JVi+xSOBI32+wfF2Qb
X-Google-Smtp-Source: APXvYqxch3aaikANJA018nryWRbnsmAci2QcLCKH9CNx4CfFPp5Gcf4OfNOPQkVxewFpcm91NxbQvg==
X-Received: by 2002:a7b:c204:: with SMTP id x4mr6326147wmi.20.1582231497318;
 Thu, 20 Feb 2020 12:44:57 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1373A1900428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:373a:1900:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id r6sm902544wrp.95.2020.02.20.12.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 12:44:56 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	jbrunet@baylibre.com
Subject: [PATCH] clk: meson: meson8b: set audio output clock hierarchy
Date: Thu, 20 Feb 2020 21:44:33 +0100
Message-Id: <20200220204433.67113-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200220_124459_723927_B6A419CA 
X-CRM114-Status: UNSURE (   8.91  )
X-CRM114-Notice: Please train this message.
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
Cc: narmstrong@baylibre.com, sboyd@kernel.org, mturquette@baylibre.com,
 linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The aiu devices peripheral clocks needs the aiu and aiu_glue clocks to
operate. Reflect this hierarchy in the clock tree.

Fixes: e31a1900c1ff73 ("meson: clk: Add support for clock gates")
Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
This takes Jerome's patch for GXBB and ports it to the Meson8* SoCs.
Hence the Suggested-by.


 drivers/clk/meson/meson8b.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 9fd31f23b2a9..34a70c4b4899 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -2605,14 +2605,6 @@ static MESON_GATE(meson8b_spi, HHI_GCLK_MPEG0, 30);
 static MESON_GATE(meson8b_i2s_spdif, HHI_GCLK_MPEG1, 2);
 static MESON_GATE(meson8b_eth, HHI_GCLK_MPEG1, 3);
 static MESON_GATE(meson8b_demux, HHI_GCLK_MPEG1, 4);
-static MESON_GATE(meson8b_aiu_glue, HHI_GCLK_MPEG1, 6);
-static MESON_GATE(meson8b_iec958, HHI_GCLK_MPEG1, 7);
-static MESON_GATE(meson8b_i2s_out, HHI_GCLK_MPEG1, 8);
-static MESON_GATE(meson8b_amclk, HHI_GCLK_MPEG1, 9);
-static MESON_GATE(meson8b_aififo2, HHI_GCLK_MPEG1, 10);
-static MESON_GATE(meson8b_mixer, HHI_GCLK_MPEG1, 11);
-static MESON_GATE(meson8b_mixer_iface, HHI_GCLK_MPEG1, 12);
-static MESON_GATE(meson8b_adc, HHI_GCLK_MPEG1, 13);
 static MESON_GATE(meson8b_blkmv, HHI_GCLK_MPEG1, 14);
 static MESON_GATE(meson8b_aiu, HHI_GCLK_MPEG1, 15);
 static MESON_GATE(meson8b_uart1, HHI_GCLK_MPEG1, 16);
@@ -2659,6 +2651,19 @@ static MESON_GATE(meson8b_vclk2_vencl, HHI_GCLK_OTHER, 25);
 static MESON_GATE(meson8b_vclk2_other, HHI_GCLK_OTHER, 26);
 static MESON_GATE(meson8b_edp, HHI_GCLK_OTHER, 31);
 
+/* AIU gates */
+#define MESON_AIU_GLUE_GATE(_name, _reg, _bit) \
+	MESON_PCLK(_name, _reg, _bit, &meson8b_aiu_glue.hw)
+
+static MESON_PCLK(meson8b_aiu_glue, HHI_GCLK_MPEG1, 6, &meson8b_aiu.hw);
+static MESON_AIU_GLUE_GATE(meson8b_iec958, HHI_GCLK_MPEG1, 7);
+static MESON_AIU_GLUE_GATE(meson8b_i2s_out, HHI_GCLK_MPEG1, 8);
+static MESON_AIU_GLUE_GATE(meson8b_amclk, HHI_GCLK_MPEG1, 9);
+static MESON_AIU_GLUE_GATE(meson8b_aififo2, HHI_GCLK_MPEG1, 10);
+static MESON_AIU_GLUE_GATE(meson8b_mixer, HHI_GCLK_MPEG1, 11);
+static MESON_AIU_GLUE_GATE(meson8b_mixer_iface, HHI_GCLK_MPEG1, 12);
+static MESON_AIU_GLUE_GATE(meson8b_adc, HHI_GCLK_MPEG1, 13);
+
 /* Always On (AO) domain gates */
 
 static MESON_GATE(meson8b_ao_media_cpu, HHI_GCLK_AO, 0);
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
