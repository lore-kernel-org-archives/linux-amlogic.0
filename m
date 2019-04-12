Return-Path: <SRS0=tjuu=SO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEE4EC10F0E
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 08:38:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C93F2084D
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 08:38:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="id3U2jWg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="1xMLWaOD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="E7OJ647N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C93F2084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9hqM5pjkbc38M8osHyhONClutS5EKGeBCz6zThXfAb8=; b=id3U2jWg8+TDbz
	ig1suvSTfFCXXCTDwaoxKT5YEniFA1HxBuk0XXzo1NYakenxnxIuNjRNKBUq/SpCqTn3f713N1hku
	DFQs0vNaXD7famSprP3IWsi6maR9H3w06pu1lVDGeJfHQJpk24QY/vsAMeKRiOjLS3OF3faxf1gQm
	f/2kpLUBIQGIJHQvmqzwB5P3hsXyiO/N4clhS3otr6PWUEKLqkt2FAWcbY6ymxKXZdKEqPCeC078o
	u2BzamMSFoI+opybPjo/nldhKHIrAwN3izBayVZddpZK49zawZdJ26QTiVRCGwag8sdv63RrCOtwG
	59xG/XrLrLOK6yAydwQg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hErhb-0008Rh-6b; Fri, 12 Apr 2019 08:38:27 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hErgn-0007Ot-Ht
 for linux-amlogic@bombadil.infradead.org; Fri, 12 Apr 2019 08:37:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Message-Id:Date:Subject:To:From:Sender:
 Reply-To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZKz/3nG67GwzsaV3N/YB/TEMllMIJbbub9F4fg+aT+k=; b=1xMLWaODyHRIWsPMDf4D3cYemj
 trBpiWnMCCNhX2gRfMWK8uzcu+hNq1+x4u2Z5y9DxJrV/0htsFyxiEKVRTY+0QFaMc9nHPxX9q2f3
 auMtK7IOV43eKYOTZQhRBVjtds0Y3cBghWyC4T8SKlx4gTZV0cMKyhmT497XlUg1hlAW8hbnwz3Lh
 5OUeP0w4706kYNY+YitLRuViCjTkL6/eTdbYP0Ju1ek+DOkyBn7HvTwsSyclyTqs+7uO3KsU7OtQ/
 qIDtE8u9hSWminB4V9auzZjVCXUEyPDM6IybpRY4AtZzhuhz5cNBRpFUP6920DT0VUvooDYQZYmsP
 OJj+WG9g==;
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hErgk-0000AQ-Fl
 for linux-amlogic@lists.infradead.org; Fri, 12 Apr 2019 08:37:35 +0000
Received: by mail-wm1-x341.google.com with SMTP id h18so9948914wml.1
 for <linux-amlogic@lists.infradead.org>; Fri, 12 Apr 2019 01:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id;
 bh=ZKz/3nG67GwzsaV3N/YB/TEMllMIJbbub9F4fg+aT+k=;
 b=E7OJ647NESDimD3WKwbgRxMKtoGjQWH/13iE09HHdhS1NjNGM5sC+NKvZ6wo3f6hqo
 CxmgWTTURAyXJbOealiDSnk44TQ3JBtVa/QN5zI5yb+uYN9lJFS4WXhXxsyRysCuFNHl
 v5Y4D5TQE8DKVC+PqN8adRVATAuBWDryP9ooWLv8cJLyaDvrajRbxAd9f6alWe+kfVF1
 y1jW0UBWNPcRShpSlaGWrbx/vC9SPBM6XLL4QKxLG/lZxVpFe09MtNTy9dk8lPaeFfn4
 VOYCecqvu8sjAM4hWIggsDd64SrgSUF39uTVSreVTz3n/WqX92ynejAUMLDmZc/pkD4j
 f9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=ZKz/3nG67GwzsaV3N/YB/TEMllMIJbbub9F4fg+aT+k=;
 b=S2qGK0evHAFR5iK1VUW/dzj6ZMFpUf9TxSTfJwiNKk2LIMNjwUDCXR/hm6YMbfsDp7
 v6SR3EFz2leBXrBURI2/uu6CkBO1NpvobfCI/UiIuZCFyhlqoIEGnu3RCU/WvqMb2q/c
 fD2Lwt4D9+iTstSY56CocMr2U1wzunFphyZVM3ccfvqBVQXeZpV/BKSUciAUEgBc2ZvJ
 GCwqQiWGlkNOVP4d25g5IJiaX7Ap8Kzux5ftqWjCO1nYSV9n9EfYb8PH7kfoQptlowCr
 3qsxT9ef2oHJRWGXTG1GA91pi6/0V3C7aVWv+MN0zZhKeIsc8t49gUrBGoGKAMPgy6la
 Ip1Q==
X-Gm-Message-State: APjAAAUyDYD563aLL8udMrCTWrFea8U3VGVeNv+A7tUevrdf9idNQIMI
 BjtRRG5Ggm5kvNCfPYHs8K3T9g==
X-Google-Smtp-Source: APXvYqy4rYbzVamG2wJvJxJQyRgXoKvrpKngk2aUZpY2KevlOpHB4AqVU/KMioKi6uLemMfT9m/wzw==
X-Received: by 2002:a1c:208c:: with SMTP id g134mr10133283wmg.70.1555058249935; 
 Fri, 12 Apr 2019 01:37:29 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id y125sm12124318wmc.39.2019.04.12.01.37.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Apr 2019 01:37:29 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
To: jbrunet@baylibre.com, narmstrong@baylibre.com, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] Add support of Temperature sensor Clock for G12 SoC
Date: Fri, 12 Apr 2019 10:37:26 +0200
Message-Id: <20190412083728.21029-1-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190412_043734_602130_F7B811CE 
X-CRM114-Status: UNSURE (   8.39  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patch series add support of Clock for temperature sensor
on Amlogic G12a SoC.

Guillaume

changes since v1:
- fix .width value

Guillaume La Roque (2):
  dt-bindings: clk: g12a-clkc: add Temperature Sensor clock ID
  clk: meson-g12a: Add Temperature Sensor clock

 drivers/clk/meson/g12a.c              | 31 +++++++++++++++++++++++++++
 drivers/clk/meson/g12a.h              |  3 ++-
 include/dt-bindings/clock/g12a-clkc.h |  1 +
 3 files changed, 34 insertions(+), 1 deletion(-)

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
