Return-Path: <SRS0=26Jb=IA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8C33C433E0
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Mar 2021 04:23:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57C62601FA
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Mar 2021 04:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57C62601FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NfNrcPf7M4tn1GbyYU/UsGmhrPYJWMcfB/mtoFyHDwE=; b=jz9wqzRze+qYowZ/yD/SJA+FbE
	kKU8YaRRlPmHcvw/jUEA8PpgYdjtpMUYar9PV++UpEcWcSs4/gtDs76WxE94IIjJOPEQKr+LvyCQe
	xTpCbI+x1QdCyEpyIN5/7v5bD9aKab3pOp3PNGi7c7LL2p/wp1LKtAylq9v4bRICvef7j3kLaRqMm
	uD3HTBqeI7dyVfpMHcRrGMq1jUZfwH/spJwQPJ70p17vr824IBKd0vhP6N9A8jCFWJrex21tmI8fa
	PqIxQY1GQj0YzSkKgoA6ToBc4ItO54ilvS+ZVc52DzecmhOvictmKd447mQMirHdHglpXov/2YyTO
	F0rV9Z1Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGwYW-0005jH-C3; Tue, 02 Mar 2021 04:22:44 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGwYS-0005if-L4; Tue, 02 Mar 2021 04:22:41 +0000
Received: by mail-pg1-x52a.google.com with SMTP id a4so13007731pgc.11;
 Mon, 01 Mar 2021 20:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=elM1zjwBJSQBpl/quKbnHA4lgGWxjH0JrhX/IRautFw=;
 b=S8q0CflZIm2643Put3EV+hTcBCMksy/5FECh9eMjvyTxpSxSO3I6AudhkrPLxaQZ+d
 0NkVPHj1lrpcxhhtnG+mlRAdzVGRLlgoGkCw5axRNij2VFwev2LEc2u89ZITrKrR6sGW
 J+F4KZKuQA012ZdPKaI6YaC9eE2JU9o4JEsRJKrOFiXEtHpa/og80HFKcFAR48jnykmK
 HnkYTXdJFdvSkoogh6saIA+CifU8TnZbn5jPY/kaD4UeYjecReNUvHeGN9AnnGofScRc
 pZ0axVwDG6sSaz3pTuoJl/qrSxUeA9O76+xvvIZbO2TpkCtlbTT18ZPC5hK7tI8+pNRm
 IfoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=elM1zjwBJSQBpl/quKbnHA4lgGWxjH0JrhX/IRautFw=;
 b=QUpZqRSjIFT20iOrk2Ro2uInr6oYP/JCuWGZ7Tbj13C+W98WEne4QiJibh1wLpKX9w
 7q0Q7bCm6rO9mBWUcTRlX1SADOGAmAA1MXoROd+fQCw0ioGcB8d8ZsWJlEPN5Hr4WgfQ
 nLnAb9vtZKnFrUOF5Sd52GtCXIiTwQdfZ6oS1/BhWB3aagYYGlEm6NNH3uiJsv7blN+p
 CqjJOY2UtEgymQYuRXaKt/NvzKJg1ZdIldcay9DYXbrq1vJ9hhm9dXgqAxQ5/yocjA3d
 ibEFiM82JZS2K0//Gj/a5ebF+XqcZAZbxMO1GsGAgNIyhDlZtz+6AUoZ/bCdfTUSzlBS
 yLHg==
X-Gm-Message-State: AOAM532XCsghDhdjlbfi8pB2nJMtj8GVmr4JkMZu0RaiDDdlMciWKy78
 zdeSC0UoCbB93DEo3SgR2e8=
X-Google-Smtp-Source: ABdhPJwplW9mkO60eotfrXiajqyI4lu6t+Z+tQxmd1o2ufcqNn4sGsxH1iHYBaPGeULR7ybT7H6xog==
X-Received: by 2002:a62:16c9:0:b029:1ed:df04:8fcf with SMTP id
 192-20020a6216c90000b02901eddf048fcfmr18408932pfw.63.1614658956954; 
 Mon, 01 Mar 2021 20:22:36 -0800 (PST)
Received: from localhost.localdomain (80.251.221.29.16clouds.com.
 [80.251.221.29])
 by smtp.gmail.com with ESMTPSA id b14sm1134534pji.14.2021.03.01.20.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 20:22:36 -0800 (PST)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Subject: [PATCH] drm: meson_drv add shutdown function
Date: Tue,  2 Mar 2021 12:22:02 +0800
Message-Id: <20210302042202.3728113-1-art@khadas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_232240_709707_90837E77 
X-CRM114-Status: GOOD (  11.28  )
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
Cc: gouwa@khadas.com, martin.blumenstingl@googlemail.com, khilman@baylibre.com,
 christianshewitt@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nick@khadas.com,
 linux-amlogic@lists.infradead.org, art@khadas.com,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Problem: random stucks on reboot stage about 1/20 stuck/reboots
// debug kernel log
[    4.496660] reboot: kernel restart prepare CMD:(null)
[    4.498114] meson_ee_pwrc c883c000.system-controller:power-controller: shutdown begin
[    4.503949] meson_ee_pwrc c883c000.system-controller:power-controller: shutdown domain 0:VPU...
...STUCK...

Solution: add shutdown function to meson_drm driver 
// debug kernel log
[    5.231896] reboot: kernel restart prepare CMD:(null)
[    5.246135] [drm:meson_drv_shutdown]
...
[    5.259271] meson_ee_pwrc c883c000.system-controller:power-controller: shutdown begin
[    5.274688] meson_ee_pwrc c883c000.system-controller:power-controller: shutdown domain 0:VPU...
[    5.338331] reboot: Restarting system
[    5.358293] psci: PSCI_0_2_FN_SYSTEM_RESET reboot_mode:0 cmd:(null)
bl31 reboot reason: 0xd
bl31 reboot reason: 0x0
system cmd  1.
...REBOOT...

Tested: on VIM1 VIM2 VIM3 VIM3L khadas sbcs - 1000+ successful reboots
and Odroid boards, WeTek Play2 (GXBB)

Tested-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Artem Lapkin <art@khadas.com>

---
 drivers/gpu/drm/meson/meson_drv.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 42c5d3246..693bb1293 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -482,6 +482,16 @@ static int meson_probe_remote(struct platform_device *pdev,
 	return count;
 }
 
+static void meson_drv_shutdown(struct platform_device *pdev)
+{
+	struct meson_drm *priv = dev_get_drvdata(&pdev->dev);
+	struct drm_device *drm = priv->drm;
+
+	DRM_DEBUG_DRIVER("\n");
+	drm_kms_helper_poll_fini(drm);
+	drm_atomic_helper_shutdown(drm);
+}
+
 static int meson_drv_probe(struct platform_device *pdev)
 {
 	struct component_match *match = NULL;
@@ -553,6 +563,7 @@ static const struct dev_pm_ops meson_drv_pm_ops = {
 
 static struct platform_driver meson_drm_platform_driver = {
 	.probe      = meson_drv_probe,
+	.shutdown   = meson_drv_shutdown,
 	.driver     = {
 		.name	= "meson-drm",
 		.of_match_table = dt_match,
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
