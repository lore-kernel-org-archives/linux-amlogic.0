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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BA0DC4740C
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Sep 2019 15:03:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F36D2086D
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Sep 2019 15:03:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="get8yklM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kFqDCDwg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F36D2086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=X4zk1P0yriG4zBqBO8dAb1aNfxzJKWIOavVJLsR2W+g=; b=get8yklMVA1kZ5YbNzOlmnRHBw
	7pwi+Wz31t3d3iHyV1+ZfuErc8vmhwAmSlmTw81y7WIuLGWxeRzMoP4xdvIpyppEODve47jI0aIvn
	fagAOyS3AvW0LMJPOLEkleG1zRLdh5GUKy8xgpZk4+8KHJngSbVqdtsvaXPJpwAq48NNORt+6mm8P
	Guh13zqLCSEQOOKGkolQ02GyJVvChlmUGCl0dEy2nOq0X421frN0f7tTDX6Os9UXwwI/aOZUBAkPA
	kv8PloO1ibw34vGhaZm+nM7B/48HZn+PVTRC3x/IB+xgNmDArAD4eKNQ5I2DrasW8lNrm2dC7BmeR
	hv1cibEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i7LCr-0002G6-1C; Mon, 09 Sep 2019 15:03:53 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i7LBV-00010m-5Y; Mon, 09 Sep 2019 15:02:30 +0000
Received: by mail-wr1-x444.google.com with SMTP id q17so9507349wrx.10;
 Mon, 09 Sep 2019 08:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=iM24Xqh+JVeQjH/gEqv6pKww+oCucmMlXYCmlb+bvZY=;
 b=kFqDCDwgBoIfXwhtYQ6/ilOsVtf3vYSU4aDGpSG5KOx3xbwdd3uFqJHdPt1Az/54fM
 QrBdNhGk+fn+dXBrO9kqnQy0NLugK+yiEneasep3dzOieEf1Y/C7DWQFx/zmMRFDCOwV
 04NpVNZDNxntwNnul6/twEUEXPr2Y4vV8Twuo0wkN3d3OO/bjyBGBaE06zUpXlO4Gcfa
 kbJFgtyASRRnJm4woG1IecYu70TIiF/i1sdsCOjd2nZnGmGbxlhV7jK0s+5DMHgEG8tn
 VhtE0H3leKdWLOun9Y1jTvpQhCK/aXSMecTBjJElZ5Nkog2xUCcR99SWD4uI3nKU755p
 UbQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=iM24Xqh+JVeQjH/gEqv6pKww+oCucmMlXYCmlb+bvZY=;
 b=NiZ/A6E1CsYeBMESQcVMClo5RmFHAhJTHxufR96iTh9yHbQCt1jVcsBF5WwEng5/mV
 zRmWRohA7JSBQk1wc5N1qhkjrwgkpJJqYuMYqoEREboB34CCkhVpS4WwX/2z5gulFsC2
 D0NhP1i1dc7/TA5fXm4PNe+pyYB9UTuM3pfqigPUWbv0yXzpri3axHgJ0ADrEfWSP5Eb
 FM63bY+zDBJvqrkom9OzUY1X/yV5IO7/oMQAH8Xw2YukTeebFsLxf2uhaOBwzhISt5rr
 MZTNY94fsYxBMccV1iUqmgPP15JTaoy0gYU6oklgYCjNm1RNkL5WRzE6JpqppilnXleV
 nUhA==
X-Gm-Message-State: APjAAAU/ig+Yfsq+yJ1ERqh1qFIMcSlvNJjvDkp9TVnwh9mvxCo7GDR2
 xsXgCP1dCH6R7Wd6i6ZHi9M=
X-Google-Smtp-Source: APXvYqy74EB9OisVuGpM0UgxPNiOr7/Cny9fMiGEMbtujXq97LrJM2vVpw9MiIyqiZUXVsdNQh98LQ==
X-Received: by 2002:adf:dd0c:: with SMTP id a12mr18478863wrm.289.1568041347640; 
 Mon, 09 Sep 2019 08:02:27 -0700 (PDT)
Received: from localhost.localdomain ([94.204.252.234])
 by smtp.gmail.com with ESMTPSA id s26sm27755397wrs.63.2019.09.09.08.02.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 09 Sep 2019 08:02:27 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] arm64: dts: meson: libretech-ac: update model description
Date: Mon,  9 Sep 2019 19:01:25 +0400
Message-Id: <1568041287-7805-5-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568041287-7805-1-git-send-email-christianshewitt@gmail.com>
References: <1568041287-7805-1-git-send-email-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190909_080229_234174_1C77358D 
X-CRM114-Status: GOOD (  12.37  )
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
that show the string.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts
index 82b1c48..4d59494 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts
@@ -14,7 +14,7 @@
 / {
 	compatible = "libretech,aml-s805x-ac", "amlogic,s805x",
 		     "amlogic,meson-gxl";
-	model = "Libre Computer Board AML-S805X-AC";
+	model = "Libre Computer AML-S805X-AC";
 
 	aliases {
 		serial0 = &uart_AO;
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
