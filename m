Return-Path: <SRS0=Cl/A=XE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B06CDC4740A
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Sep 2019 15:04:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84FFA2086D
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Sep 2019 15:04:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="smsqUL01";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QFAKdO2+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84FFA2086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=My+i6SPjTataChBYdsDgwSl1vD5vFNaeLBAtxgboyjQ=; b=smsqUL01MoTbq2B7xEc7GPmGKD
	bxDUeIGiLaEtbwMLqV2qTaCblUA7TTKxNPrMFAOKTEBWP1q7QxUlIMb8Te5KR0NvL3+YDmJueYbAj
	g/eHtLGeL7NZ+wuZ9G95wd+kovKsJIHZY960XcVxMK/mKoNLLnF7tcEN5v97f7PuuEOvVm1hYl0Ba
	doOEowekhe4AI+r8115FZBoRhaXNCIbaRrV0M1vI6Qraoevh63KBXcz1/aSxrPVfFmvMvybFPZTZt
	cr5n+Su43xdZPFz66yjBZA9cEAtzfmDP9SPk3cV/oQpxpbhLEQr4K5Rbn0E15nfsWx5bhIX/9z+Ou
	oHZ4gkCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i7LDS-0002qw-7n; Mon, 09 Sep 2019 15:04:30 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i7LBZ-00016E-KB; Mon, 09 Sep 2019 15:02:35 +0000
Received: by mail-wr1-x443.google.com with SMTP id l11so14227237wrx.5;
 Mon, 09 Sep 2019 08:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=PZPdLQeLOEyJtkoSAS2YhSEAdoTAaUvZCMb2Qa3U3f4=;
 b=QFAKdO2+MqvIwbO2LZ8+o2T69rCPUwEqSgPmIkPR9J08dm02Y84WAZidtVqsBtLIxd
 /fIKRGSbKAkpWXv3JMLBUGprFPFZVhI1aSVS/VCa8IVxMWoET8/5PaZZF3p97MMWn3lZ
 2sw+5tlyHn7fv1pH7nGrj5e0luBJtq4a3x3QHsp0xXiomSEKj7LVJ4+PC8KwAyHMLTAA
 hMF/eo+znis+fYXcM/HkLLbLCe7CMqKiAs5t7r5Pg03rJuulmXXGEs9qPLuTzOssKN1F
 yl9jpIzXnl/soAYoonErCvjQfwHRQlegZgQHo6nuCUyQlnGH3MhCjzFaPf8yc5TLevc/
 /KeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=PZPdLQeLOEyJtkoSAS2YhSEAdoTAaUvZCMb2Qa3U3f4=;
 b=HP3k/jcM0vUjcF/bqTiyecxG5pLQbuxOhbNQnFQ5Osw0/ymmI03CK1IPu8OOiPRJ7N
 b0qBONlfj04go+VW6SQzlHpF/D6mR/h0q7LAiN0FIk5ILOHMl5iC98l03Pb1x4I73PIr
 yMdNo0fUzO8cgr8t0NXVBF0UTOT+4SuJFkYKLYewaVTs8RW01TDUb+V7nhJoxOuopbqR
 lN4dTmddVeysHrdSGxj0X4b0uOYHEh4VPCR46C8DmkTVA/9l+xlkfk5vg5hp1qK+oUUK
 FahSAVVOsIGNji5ZXpWyCfuHzlwvRH9n7pB3PLhl3sG8Zcz2cNzTmukmYHSZqEBIpo6H
 nJWA==
X-Gm-Message-State: APjAAAV+O41fc25FffMKBEZ2RUppd+BwzR7h0HIHbq5+6dEmb+GalIUn
 XT9aOI2ag+4SdhGZYacg1hM=
X-Google-Smtp-Source: APXvYqwkXa05gD+0n/Wm1U/GTv1nqjlBkf/38URHAZzWapXaKegLzhdiBoCJMBhOXltgJda6pNiYzA==
X-Received: by 2002:adf:f3c8:: with SMTP id g8mr10269237wrp.58.1568041352095; 
 Mon, 09 Sep 2019 08:02:32 -0700 (PDT)
Received: from localhost.localdomain ([94.204.252.234])
 by smtp.gmail.com with ESMTPSA id s26sm27755397wrs.63.2019.09.09.08.02.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 09 Sep 2019 08:02:31 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] arm64: dts: meson: libretech-cc: update model and
 compatible
Date: Mon,  9 Sep 2019 19:01:27 +0400
Message-Id: <1568041287-7805-7-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568041287-7805-1-git-send-email-christianshewitt@gmail.com>
References: <1568041287-7805-1-git-send-email-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190909_080233_834196_CEFDD44F 
X-CRM114-Status: GOOD (  12.12  )
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
Cc: Chrisitian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Shorten the model description to improve readability in some app GUIs
that show the string. Update compatible to be more descriptive, using
the format of the LaFrite board in meson-gxl-s805x-libretech-ac.dts.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
index 4b8ce73..e8348b2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
@@ -12,8 +12,9 @@
 #include "meson-gxl-s905x.dtsi"
 
 / {
-	compatible = "libretech,cc", "amlogic,s905x", "amlogic,meson-gxl";
-	model = "Libre Computer Board AML-S905X-CC";
+	compatible = "libretech,aml-s905x-cc", "amlogic,s905x",
+		     "amlogic,meson-gxl";
+	model = "Libre Computer AML-S905X-CC";
 
 	aliases {
 		serial0 = &uart_AO;
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
