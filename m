Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AE04C04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 20:09:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37FAD216B7
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 20:09:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SPaDMn7x";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="fAwHIQTN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37FAD216B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=amyUmZ42vHZS1LKpE71os5IVQ/Eu8kBr5Cd30HiyZnc=; b=SPaDMn7x7kk+aQ
	YpdM2grivtag+75FYTv+DWUxeQcyz7W6s+yl0m5Bk6ohXTwtkS39rMmqt2knPKCT4cDBKjtFmDPZ0
	ROf51IKvUV5E2m6Vasw7N8v4muq8x0It5kdtBBFu0vAwnFllfhOvnpkrLjRvnAejKv3iqYSJz5yUe
	JMbRe5vtME+aPakt2DmIVvBgtbUZy/tuF6o+Ac1fDfD1VsEE+3Z2fqMeInyhK3Mu88TU7KgTrzPz7
	UEM4xFquQTr5I07xOU3sJy+xAe9x2CB3PtRqvZ5vKbc9zKvG/xRoInNx2ebtp6njJblSknyO0F9YJ
	hqpcYMrQoynpX+6fBs6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSoag-0004i7-UY; Mon, 20 May 2019 20:08:58 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSoaX-0004XT-EF; Mon, 20 May 2019 20:08:51 +0000
Received: by mail-wr1-x444.google.com with SMTP id g12so15706812wro.8;
 Mon, 20 May 2019 13:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e0VqE+rZMvBKHIYBXL3p+1cgiNolIPVKif3ndVE931w=;
 b=fAwHIQTNJ7LYfS+npQAVAly5KBNMIBkvINFdruuroIDO75vDaATN0YQ2foFWKpHzu/
 DSawlpfon0AAuxAVzkGqqLRAx1FfhXEyPs7azowQLJ3KSjmEd/Xcqd5Dq2PaLRMasqUG
 2hATUsp1o2StoIAtb7ijeSqNElRx/atHKiFy4BaN9tAgWgTe+MrYVuotpSbKKY8LqUmU
 L9Fg3pKbeMpAtHI2qKWyZ+om8x6v49RkQmW5mrsyk3WFtd+Z0HvrUNuCL9AbAz4d9hmg
 atEN0Y4vmdFCjDbs9ixH3va+1vSF3XTXR97RlQ/J1DPdem4pFEuQpNSxqLIuz7fQyOSe
 NsuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e0VqE+rZMvBKHIYBXL3p+1cgiNolIPVKif3ndVE931w=;
 b=PRNj+RvQf0I1uPYVYKdP7/gDIzLS3+JwmMWGHyMxyVbdZMRUSGAUNC6N+CBqwFrn/E
 nAMcrhxfnfNjgloVeXQfAIrz9o46cgJQhYSTkXl0JyRrwCiM8R0EoEotl96TOFCvk0kD
 GAT7yRrJR3L+XjsK/9WHII3PxNvr09IlsrTgZGSsew0Zm7fLu7du/5mTcKFq1nbulRPL
 zV9ydzR9PkDhs3BuI5mT48EiK90nByu+nSkzC7UQgKMZ6MjLOZZHA6wOUMB7vmSWIB3k
 1gfAK7DD08nAdjBkOgiX1eGgQi4AJIJtDvgEbag16XgWrcnsox5mUQKd4pRR6BvXDv0v
 Gx7g==
X-Gm-Message-State: APjAAAU1wfZMMP4s5WK6hvsozkVD1j/ZTk+4+iUMls0HktgY5KVTeDTt
 Wz15bBQtq/mwx9CFzk08jng=
X-Google-Smtp-Source: APXvYqzMIgHXiFAjB2iqJtd7q4ohra7zn99jfRowf8TpuHE3QE0mc1sJ2+E0VGNp4HgzyiK1FT+wcA==
X-Received: by 2002:adf:ec0f:: with SMTP id x15mr46678862wrn.120.1558382927766; 
 Mon, 20 May 2019 13:08:47 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133EE71009C356FA1F0E19AF9.dip0.t-ipconnect.de.
 [2003:f1:33ee:7100:9c35:6fa1:f0e1:9af9])
 by smtp.googlemail.com with ESMTPSA id i185sm918627wmg.32.2019.05.20.13.08.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 13:08:47 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: balbes-150@yandex.ru, linux-amlogic@lists.infradead.org,
 khilman@baylibre.com
Subject: [PATCH 1/2] ARM: dts: meson8m2: mxiii-plus: rename the DCDC2 regulator
Date: Mon, 20 May 2019 22:08:38 +0200
Message-Id: <20190520200839.22715-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190520200839.22715-1-martin.blumenstingl@googlemail.com>
References: <20190520200839.22715-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_130849_474286_F7E33AA6 
X-CRM114-Status: GOOD (  12.83  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
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

The DCDC2 regulator output is actually called "VDD_EE" in various
Meson8b board schematics. This matches with what Amlogic names it in the
most part of their vendor kernel (there are a few places where it's
actually called VDDAO, schematics of EC-100 suggest that the regulator
output is used for both signals).
While here, also give the regulator an alias as it supplies the Mali GPU
so a phandle to it will be required later on.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8m2-mxiii-plus.dts | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/meson8m2-mxiii-plus.dts b/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
index 29d830ae4bf4..c7d9cf035e22 100644
--- a/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
+++ b/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
@@ -114,8 +114,9 @@
 				regulator-always-on;
 			};
 
-			DCDC2 {
-				regulator-name = "VDDAO";
+			vddee: DCDC2 {
+				/* the output is also used as VDDAO */
+				regulator-name = "VDD_EE";
 				regulator-min-microvolt = <950000>;
 				regulator-max-microvolt = <1150000>;
 				regulator-boot-on;
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
