Return-Path: <SRS0=C9TS=WX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E150C3A5A3
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Aug 2019 10:03:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 604E9206BB
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Aug 2019 10:03:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a5YsrcoQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="CfWqhHro"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 604E9206BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jEW5SHeAfttNkbFWQqVJJQlOvSJQdcyOkSD7degZ2Oo=; b=a5YsrcoQ+fo0UI
	ovjLvRRs1HB3u2HxwF7Fqp9U3kOKkhspiZcSukvQYljRgRXJ8BwBlsvr392L0YgAyKFgal9/YXWqB
	6gCpK3We3Rj4+f+mQwnOop6YCmf4w2cFnJStBz8JUp2b6ovPKCZLwoLW7V8w0ElwsiAEs7cMq3/bC
	QcluupmurumYoOWRdsJMWRwgwMe9bfDLsVqdGbwdPwsJV8TySctR3O5+bHZnF8LZqw3PhXUprn99Q
	er0WVf5Lf6sA1uHAFFHHVtkaiX0w4nH/l2SRSxONjVkONuM7g4WKuYpjdR1a9namQy7eHAoxXH/o5
	pa5c/cAsoos4GiZcZhww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2YKH-0004xo-Ox; Tue, 27 Aug 2019 10:03:45 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2YJl-0004TI-2z
 for linux-amlogic@lists.infradead.org; Tue, 27 Aug 2019 10:03:15 +0000
Received: by mail-wr1-x443.google.com with SMTP id j16so18135364wrr.8
 for <linux-amlogic@lists.infradead.org>; Tue, 27 Aug 2019 03:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N3scpKO0Zzh4GV7gMEeSkZMIk4JwmB5WDbAZocPSw5A=;
 b=CfWqhHrooMAEoQGPlWt04PkQ0BwbFh9AB3BKZNcewA4CorL6RgjmekMXMp1JiAtJTQ
 1zvucYfsGTz5RTGEiC5UAg4uzv+sHB1bTLWOZmoDFuECJmIFdp4gCsmgd/NjVeC4g+e1
 gbWDLHUm9Gi2TWhmFoOrWwGAQeV1PQodjiqQN3zDRdptMCzai2iXaFnznGYJOqWa8GgR
 32NkepzHCO4QF1RaPf5KifZxphB5ayEx0vdsxmOZSb/K2h+TgP7tktAvlPj1Vzin3JF0
 tLNNx9+d0nacz1GPOPsa9g0U9Fs/veRzp69CAUO4bC+ITLOzukAMPPheKbIwwij9DgaR
 6y8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N3scpKO0Zzh4GV7gMEeSkZMIk4JwmB5WDbAZocPSw5A=;
 b=aqrcBI2jZAWHhXZWhfNBeXgR1EdwY4ttAG+5XIB9EdCT9RDg8GywR9BtDY78GSWblA
 AlXuD2lJzVxgJPzZtBrsWzcYvLkFpUjZ3/DFbxY0Onjn2OdEzXH5wk7PHN6BNAO92Dmk
 jNrNsWZk2XGylZdY2K1uNd1eGcFoQiW1Z95gomxN+iNFyqZkwk5fKgXJm4rGdWp7w9HY
 bo3a1BXWaRo0JIHzVzz1657SF9nV/8g/c9/zxEi++t5vbgz0ONhuuyVZx/UxxZW1iMnO
 AWkgVc5wNw3/Ud0baW6TRRd2qx4SkY0ylmf6V4AHfOpnDIGEfIhSDmwmjobaGuvokYGU
 VJAA==
X-Gm-Message-State: APjAAAXhVERCBmoFXrj+wjxETqeGICoAry3GvOa1lNi/gehxyUbbXGIl
 kc7kz4bYiw0D/nia9BYNeYc8Tg==
X-Google-Smtp-Source: APXvYqz+ibjedBMsj+QgbZe3C3ACpAVhv4R3ODBxrUkdq28jETkegrCPCSVUALS3zqKZzfnd7/IouQ==
X-Received: by 2002:adf:a2cd:: with SMTP id t13mr26526511wra.251.1566900191587; 
 Tue, 27 Aug 2019 03:03:11 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o25sm1816289wmc.36.2019.08.27.03.03.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 03:03:11 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 1/3] arm64: dts: meson-g12a: specify suspend OPP
Date: Tue, 27 Aug 2019 12:03:05 +0200
Message-Id: <20190827100307.21661-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190827100307.21661-1-narmstrong@baylibre.com>
References: <20190827100307.21661-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190827_030313_337244_944D4272 
X-CRM114-Status: UNSURE (   9.54  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Tag the 1,2GHz OPP as suspend OPP to be set before going in suspend mode.

It has been reported that using various OPPs can lead to error or
resume with a different OPP from the ROM, thus use this safe OPP as
it is the default OPP used by the BL2 boot firmware.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 733a9d46fc4b..57c880c06a07 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -81,6 +81,7 @@
 		opp-1200000000 {
 			opp-hz = /bits/ 64 <1200000000>;
 			opp-microvolt = <731000>;
+			opp-suspend;
 		};
 
 		opp-1398000000 {
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
