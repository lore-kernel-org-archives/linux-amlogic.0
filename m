Return-Path: <SRS0=VwQT=O5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ADE9C43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Dec 2018 16:11:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A83A206C0
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Dec 2018 16:11:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NqFnAMN2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="aFgzY/WX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A83A206C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kmc1Zbzkem3gbgDNLOV5qvo8K5Bck+PvYrR46ViT4+o=; b=NqFnAMN2nsDyUv
	KejqbQIRp7x3QkTlacQf5kHW5H/rEPDoNbVSxJoHmiBi/T1dItXs3Y5aKvbg691dbPFeaIT48Btnq
	O46khPYVBBSoBGAhrMYdBO7uxhNflDuTnmuj8HliOAaYLE/klely8CPUtr911d40jQmikBsLVmylC
	xHjaCyxAQ93889WkTGjfFUY200iZo8bfXnAxd5OKF+iQXMMZUvGC+ed9ltWbqc4+czXlK+yHHPMNE
	tbmNsJ3FAERFuXHX1rMx3ymhCRsdNVJH4/NxbRoMh0Zy9nv+CCHcDTwhMiy3WoKvGbJvje0f5jAxb
	eC1DBKmABznNwTasQ0Qw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ga0ua-00075B-Mo; Thu, 20 Dec 2018 16:11:00 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ga0uW-00071D-9w
 for linux-amlogic@lists.infradead.org; Thu, 20 Dec 2018 16:10:58 +0000
Received: by mail-wm1-x341.google.com with SMTP id g67so2804949wmd.2
 for <linux-amlogic@lists.infradead.org>; Thu, 20 Dec 2018 08:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CnhknRkRJgND+GstRyz0VxGv13ceIvrslPcHLDVtb5g=;
 b=aFgzY/WXD9RhJymFKKqTTtuw3aH0Ve+4JMENOj8emUjMjwMXjloneezG0tjss3EdI4
 CKZXzqy3v3mlJWE8XKBqzNpLqWlC0d1BbXxIDwezl0IWCUIpjMc8B/yVpWB48jrCw0ZC
 /g22pqv/LpthC4UfeMuOQOeun/qzm4E1KA5+sIIjppJCXr5Wfxc+tQD6vVV6Ya2YN+jJ
 B4w6jo8z7uHd2OMz1tCVXx6yFl9kgRDSzno45oWqYkBGqHQwlqJf9nxKINueVjzX2sH+
 YPyT8enK+6MkRiga1Iz4EjTw8R7MpkKNin6FPtDFj2uSK/G9HNg1y/xn5AiY8JdYChLx
 5TwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CnhknRkRJgND+GstRyz0VxGv13ceIvrslPcHLDVtb5g=;
 b=uRF8Dhx0iMq/rJmShzbaZzDXewgUVmXLrUDVaTs3F65My80GNufNZHRMEBQtkZNyv8
 13j6B1AGr/kP6sVucQAStRT5LWCEQjgHukQjrY0h4CjZkgrUncqpT2mQ23LKjWWOMHTu
 uyg7VCOtrN40x0DDW664CCIcXCGcCKYYED1lbUMYVzRxpIgr1cc9hLunRIC3VaHAYXDs
 9sFv5LQTmXoKSsRIRC5DzNJg37YTca1X8+1RWIOMnAKi/k/e3yPv/6NkcJ6Kqt6HghLf
 QGOTyaF6UrZAbgptjODJNOcR6+ddCbK4+AbDRdObLV1VZw4sWwd0cJT84yeMF1qi8wfc
 OLOQ==
X-Gm-Message-State: AA+aEWYMHUsnxD2RO7BRDTQL1EGtM9OeYCRV+CEhXPsGzgBbZSxkDvOq
 7c8w1tnidOB0PsWDKn3ILNnNfg==
X-Google-Smtp-Source: AFSGD/V4/m3InhsVVUa024rnI0uZJh864DHPgw5rA968fKZ2BerjzAwNGYRsEZ1+NSC80hu6GmQSMQ==
X-Received: by 2002:a1c:67c2:: with SMTP id b185mr11210412wmc.96.1545322244547; 
 Thu, 20 Dec 2018 08:10:44 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id x10sm10941186wrn.29.2018.12.20.08.10.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 20 Dec 2018 08:10:43 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>,
	Carlo Caione <carlo@caione.org>
Subject: [PATCH 1/2] arm64: dts: meson: libretech-cc: set eMMC as removable
Date: Thu, 20 Dec 2018 17:10:36 +0100
Message-Id: <20181220161037.23756-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181220161037.23756-1-jbrunet@baylibre.com>
References: <20181220161037.23756-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181220_081056_352122_0BC30D70 
X-CRM114-Status: UNSURE (   9.42  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The eMMC on this board is add-on module which is not mandatory. Removing
'non-removable' property should prevent some errors when booting a board
w/o an eMMC module present.

Fixes: 72fb2c852188 ("ARM64: dts: meson-gxl-s905x-libretech-cc: fixup board definition")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
index db293440e4ca..daad007fac1f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
@@ -256,7 +256,6 @@
 	cap-mmc-highspeed;
 	mmc-ddr-3_3v;
 	max-frequency = <50000000>;
-	non-removable;
 	disable-wp;
 
 	mmc-pwrseq = <&emmc_pwrseq>;
-- 
2.19.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
