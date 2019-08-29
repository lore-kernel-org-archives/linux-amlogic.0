Return-Path: <SRS0=jO5x=WZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67F3FC3A59F
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 15:30:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 392872073F
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 15:30:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gcBiIfw+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="gkLh4E5U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 392872073F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rFbgX+XM5AloMr4BvYZTDaYig88cMSSSFtjsW+4gO6A=; b=gcBiIfw+fqSg+d
	0orPn6xAvz2cCGgpaGcIvnvKUOxEnwlyyp9p1AuWXbA8qinl2L3XCQ0X7wyrOMTTlMGcv3jvDfRqp
	V/bHGIw+QR0z1xAO/QmPK85utYNvs/JcbbUTueRO90qwo+yNmeJovbfXht/n/eLzUQW1RezvZAv1z
	a4IbWtp/CSDvAkakawhfliiXwkLucydQGDrN4kuILPGUn7Wg/H5ICFFcOPfQ4I5dEMkRJgbhKI+QO
	1UuRS7DfMZRbHhCtmoDxR8p+91bgwfRpnT0aBZnTWBp7rV5VYMEY+93kMpgewvjYLyf4qONcO6HXo
	Ncau3j/WkjPMV5x74mrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3MNs-0002rs-Kc; Thu, 29 Aug 2019 15:30:48 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3MHE-0007VN-27
 for linux-amlogic@lists.infradead.org; Thu, 29 Aug 2019 15:23:59 +0000
Received: by mail-wr1-x443.google.com with SMTP id z11so3878646wrt.4
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Aug 2019 08:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4DbXu44h6zYgUhoI2+oC/PW70jCUJ0aSE0KZ0LmuHcU=;
 b=gkLh4E5U8zTo9TVea9wVjBFgrFpDenNKYz9qy/FLex/I5uDweFPrkzPcn1IETEyneG
 V/LnaPjJuG21eHtkmi5mUpM/oQJqS9gFpkQqAod/sAEbyTI4Wg3a7360JaCJKa3VcGwx
 uYy7vvDuEFdnMQuzeoU79E1i7aYqC1kP6AsJhqSLDc/DHjI1qL7YCoA8eypjjSZYc3lM
 pNKwRUGZ/VJH2In7GMBwOdrXUfnbBxyI6z4tKGYifluidRlI7Ntwy9r3Z3q0YF/YsFxh
 Ziek74oF0XXfgfZe5xufMKEQNPb9M7uxF/Ztsfn8UuPVpaSvfNR/uj4TcGT3T3nbwOyc
 6lyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4DbXu44h6zYgUhoI2+oC/PW70jCUJ0aSE0KZ0LmuHcU=;
 b=C/12Mc8s0K0W1a5gSfhX6oQThd4KWDGguINwu4OYentE0ANikCNqBx3xlBLcs/s+aH
 q9oWxCUWJfnHN33MlV4Nl6atLIMVDKfJrHqfAq47BE6qdjRydZctQjxo2yWmgbV3VBMd
 kKtnxPxGjXI1d17/G4CplfmRh/V2wLD1dvtnzsuCRQJVo71e7RINah2d6P5zM1Qa109Q
 1qKv5hMfD4FK92zVvbpqs6CLsDgM/7fmPRxzy0DWPqgXiYXVC5L2fVikjJIxwDTtXYSf
 LgmJvoyJDbxNNnGYNgNU5NUmmkFk0fl2xGl31KBMIH1CQFkyugsom3OIIbo/YB7zUveb
 d0bw==
X-Gm-Message-State: APjAAAWVWoskEhaAy0+rOAKCFnnfvUoKAeLrZhTLO2CuGinfxe9fuNAb
 /aPqTQC5/Pqq8jtfWRaLGT2AjQ==
X-Google-Smtp-Source: APXvYqwwvv/Bga0e4qQQrLGeLWTenKP0N+cZ1PVW2irmpfKismMyhtgiqXfxyPv0z+uZK+ieRvK8pw==
X-Received: by 2002:adf:9222:: with SMTP id 31mr433433wrj.93.1567092234757;
 Thu, 29 Aug 2019 08:23:54 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id d17sm4866871wre.27.2019.08.29.08.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 08:23:54 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 15/15] arm64: dts: meson-sm1-sei610: add keep-power-in-suspend
 property in SDIO node
Date: Thu, 29 Aug 2019 17:23:42 +0200
Message-Id: <20190829152342.27794-16-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190829152342.27794-1-narmstrong@baylibre.com>
References: <20190829152342.27794-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_082356_844265_BD9EA20D 
X-CRM114-Status: UNSURE (   8.57  )
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
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The WiFi firmware requires that the power is kept enabled while in
suspend mode. Add the keep-power-in-suspend property in the SDIO node
to specify that the power must be kept when entering in a system wide
suspend state.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
index e1cac880b02c..9f83dcfe96ac 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
@@ -301,6 +301,9 @@
 	non-removable;
 	disable-wp;
 
+	/* WiFi firmware requires power to be kept while in suspend */
+	keep-power-in-suspend;
+
 	mmc-pwrseq = <&sdio_pwrseq>;
 
 	vmmc-supply = <&vddao_3v3>;
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
