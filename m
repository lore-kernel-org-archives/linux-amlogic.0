Return-Path: <SRS0=jO5x=WZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B73C3A59F
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 15:28:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88CD82077B
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 15:28:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CK3hPQ3m";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="P/xTEs3T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88CD82077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w6tePr69ph6TJsgxKkrQn9CzTZjlPP9cls3bfHIbAuI=; b=CK3hPQ3mXmltSx
	Jbd2A+qJZiyoaMy2eDEjRWcEmXwJwJ4Vy8Ux4Ubfhn/uL7swIwlFXWXxox3qWSpbFpFo/gghqr6rb
	0L2+zrqiMzqXVj5dXerq29byEn3csT6szf/spWWQf8KcK8CeXbsNPM676dmS86GzblURKZS8B+jyI
	r+z1cKdNtvU1V9HEt82+uPAvqBuTwy9vB0t9re+d5h+YLKwwzHXwsDkYfbOCjFgtQoUMsUBnEVeHR
	0iMdJExHCu3XkhIP/FoSQr6Fjqq+w0PT1V34UlxIXGaJfsQWO08/LxZdtQPpRlp2+laGEN5He99p5
	k1u9mywMeR6CQyLLmTNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3MLT-0001Db-2Z; Thu, 29 Aug 2019 15:28:19 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3MH6-0007Qe-JW
 for linux-amlogic@lists.infradead.org; Thu, 29 Aug 2019 15:23:53 +0000
Received: by mail-wr1-x443.google.com with SMTP id c3so3863825wrd.7
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Aug 2019 08:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NxngJDCKM3LeX2Xo9mNwW4G2eN4EwlpJZJC7Q7VWjbM=;
 b=P/xTEs3TsV85z8C0bFkgbtLi0e3P0df5M45kuBNz8dxe/j6MiSpIPEvZuWJFoFtaUU
 TIOkofgqstGOtCgh4NqOMN3jN/jRL7qCHLowF0tzfadTXzrs3DJChcox65n19JctBwts
 gdEvTkgYN1jn2J9SAGk9jocN8zD+RVG+ixyg3ErC/nqJdzX8vSYuKUxRvtYBQY+w02l/
 u/KonWpZscEP7bEHljgm8yF+Sd3Odqnpg9bvE3OmSpTwhcwnaa26MfQzX1nmKWnRVbiI
 i4fvmpIBmtnhIvlEJ5NRu95kH9SC/l72m9IcafYuglbACExv7Lwc9qFzo6y+KUt16IBe
 lpFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NxngJDCKM3LeX2Xo9mNwW4G2eN4EwlpJZJC7Q7VWjbM=;
 b=aUNywwWitXxeQxdhdOPvVydsjwoGrIQZ7hVP8vV216HsudBwu1+Eu2zv6l5AEEy0V5
 hDYnB5spIgSphOJae+CRXf6FQWKysXtqz8WyN0MGGyWCNj8ezHvRBdtL0mQj3kDXtdFH
 9VxWcPUtWHdStMN5Tf6pYZr9WUkSjNLpXbTare4QYIErAM/hNr39SdXCuI+OobmUukcG
 kUoGSMJaIUQ1w03cTsLp1zat/OG+gcug/hTGrqMLfi5lJXjO4zT25nP4NfRmvAWOpO8N
 tfvfctHLrJlri0a3QlY4grGIwNo+8wrrQOwZkB+qGarz5HdT+4phbdWflqLu0n0FNTHO
 L6iQ==
X-Gm-Message-State: APjAAAUBjLEF5IBU/SCCH9lemZtteKyVSWEPRaku3kbX34bML+TYjp84
 9dPtK5BFXIqUHE1v29eVche4Zp9ENWYFtg==
X-Google-Smtp-Source: APXvYqyBAN4/Ban1Og0YFLOBOTc573DLTUUOgxbeF+T0Df4k1C1R9djHlN0ZncmhdtdCh8ch3GwAjw==
X-Received: by 2002:a5d:604d:: with SMTP id j13mr11973154wrt.244.1567092227153; 
 Thu, 29 Aug 2019 08:23:47 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id d17sm4866871wre.27.2019.08.29.08.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 08:23:46 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 03/15] arm64: dts: meson-g12b-khadas-vim3: add
 keep-power-in-suspend property in SDIO node
Date: Thu, 29 Aug 2019 17:23:30 +0200
Message-Id: <20190829152342.27794-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190829152342.27794-1-narmstrong@baylibre.com>
References: <20190829152342.27794-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_082349_562185_56D304FA 
X-CRM114-Status: UNSURE (   8.47  )
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
 arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
index 9c3ca2edc725..0bbf69fd9672 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
@@ -446,6 +446,9 @@
 	non-removable;
 	disable-wp;
 
+	/* WiFi firmware requires power to be kept while in suspend */
+	keep-power-in-suspend;
+
 	mmc-pwrseq = <&sdio_pwrseq>;
 
 	vmmc-supply = <&vsys_3v3>;
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
