Return-Path: <SRS0=5vFS=PY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24898C43387
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Jan 2019 18:00:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC110206C2
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Jan 2019 18:00:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="roiInoNx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="a8I7dgjY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC110206C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VoMel/TS6ePsG6QUCx+tetuXghR9rdZxcJA/vJABfT8=; b=roiInoNxtSttnT
	vVSm8A0ciMqpsCqk606guC9iyr6txs9DhDeYSSMu1NPYktiHyLi8o1b+04JPXN2YnHxgF8HABbsZZ
	QbQt+couaobGVq05D4fNNBuJPtBv4IvkQq+N9aNg6fS6z5LtXzhcmXdSPJleLPUZHIJm1+n5iiTRG
	dA8ZhbJSJgh7EDqsgGMpuZZJXR97WPIbQpP+0y9yyTICR2qpgQbrllodhjIZLTF2XgsvNKQxKc3MT
	qwNa35kU9MBBnb2xLI027M0rkRX13cNBBtEIOd/17ah3CYX/crwll3eYe9vNkhrwST4otTO9evWWx
	Q7lyVrehbhPwBf7tw2Xw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjpTr-0004eL-4S; Wed, 16 Jan 2019 17:59:59 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjpTm-0004d7-9K
 for linux-amlogic@lists.infradead.org; Wed, 16 Jan 2019 17:59:56 +0000
Received: by mail-wr1-x442.google.com with SMTP id r10so7959663wrs.10
 for <linux-amlogic@lists.infradead.org>; Wed, 16 Jan 2019 09:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Bcv4MkeoVz8gZ3m+0FU+1hIF0hDCII/eg515n8hHTfs=;
 b=a8I7dgjYkgC0u2nsI3XmM5KgB4T5r3bSqVHTR4J8ABoYESmbNjaCisD4hK+GkAsidu
 My6Qx8R1ppE1Crmj/2hsKiOpNjW02bOhZP2lldWUFx934x27+dl8HeNqlxj6fpFWGegu
 mIgbV2MbBSPCw4bwNjOa22WY30RoFiFyYGvMN3N1yMMJvdjit027EzA7GlvKVPJYZ2f4
 w3GZsXQvUNOaufhOiBG+3kLOQzh5WYWV6uNWrHD4D0omKZVMEr+ErTaPPMPZ81kMTzVb
 vkdBvDzHvgNC/wHVJNmwQoHkbHzLh+5xzHGKUf0FPhBHPjYsA9nCcdRDz5RjZYQ7oWs/
 WqPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Bcv4MkeoVz8gZ3m+0FU+1hIF0hDCII/eg515n8hHTfs=;
 b=UAKyoI+pHbJw448RiqxgXCUupmTmgBZMmH4YiIeRWKwlQtGEpIGb2+4D82u7Jk+FV5
 2wM9XACzmZHJV5zAO+5LWBbaelGvnoV+sNTgruPcBkR+KUb2Ykr2PJAX9Qbhfgc04v9j
 Py0Yx8ij5w6t9vK0S+hxTxbS3ur74Fbilmy+DTJrdCiWccDYOmydCqbdEKXxDTLMcbRF
 a8rs3y/UKxJ30MXnVjj51jshYrwIloYOy0Yru09hJRcF5C3kYSV/MZjbdGXbkRVjcpDZ
 SCeMBuyzr9I7rLQoD+dywK8vSSgHd8D62KQgiujlkFb5RclPHEsJ8hjI1slST/JEI7io
 ttRQ==
X-Gm-Message-State: AJcUukdLr1AqtgWlQSLCadq6YpTnQHlamzFUJu6ZCOUcX7IvcvICt2NQ
 hJdu2eL/+7mCm5lBpGRv9gND9w==
X-Google-Smtp-Source: ALg8bN6jQGun62yIQILU6wHRg/6NfJ1mnia6doWM06JqHNuITBa9t8rnEn19shKmOie2FSU3VlgwRA==
X-Received: by 2002:a5d:4d46:: with SMTP id a6mr8771520wru.28.1547661592737;
 Wed, 16 Jan 2019 09:59:52 -0800 (PST)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id t70sm59324609wmd.36.2019.01.16.09.59.51
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 16 Jan 2019 09:59:52 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH] arm64: dts: meson: s400: fix emmc maximum rate
Date: Wed, 16 Jan 2019 18:59:47 +0100
Message-Id: <20190116175947.6093-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190116_095954_463834_231BF40E 
X-CRM114-Status: GOOD (  12.08  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 patchwork-bot+notify@kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Limiting the HS200 rate on the s400 was just a way to mask that the
tuning setting were not correct. This seems to have been fixed with
the recent MMC driver update. We can now use HS200 at full speed.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
index 0c98ca78c8b8..75fe1a2c49d0 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
@@ -488,9 +488,8 @@
 	pinctrl-names = "default", "clk-gate";
 
 	bus-width = <8>;
-	cap-sd-highspeed;
 	cap-mmc-highspeed;
-	max-frequency = <180000000>;
+	max-frequency = <200000000>;
 	non-removable;
 	disable-wp;
 	mmc-ddr-1_8v;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
