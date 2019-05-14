Return-Path: <SRS0=drR+=TO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00265C46460
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 09:16:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6B6F20879
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 May 2019 09:16:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r3g8L69J";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="IXXSssla"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6B6F20879
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=n8Jh62tOKjHUuY50Z6wizzWwbjHHjEMc9Oa50lxZdi0=; b=r3g8L69JN5vvuh
	9/x9PMCbBDFgZhtASQ2j40W708+Kgqce72D9vr1b1etOID37SBUydfhfXcB/Qhh5L2WxMblr/GTeG
	t9WHDrLuB48mkGvuxYJK7cka8oKY/vi5feU5dWFg37DRKVLpNPZhUwWFjiAQ0sCGnXhhCptdIFGZE
	87KjB/XKVC1jZeYWjhwusuYzFq6W+T0zI3XF6PrNzAADtglQwPWYTNIlwqmehBWFVaVdOw4cr2sbc
	Y5Nzlw5hgCiQArNxD+BLM8FG3ImsunTXFPI/UIL8htUvtcaofBHDTrynsULPQ0f8yZBSarqVdqAfx
	dtepfHUfGXXZrQLxa6BQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQTXn-0006ys-Cr; Tue, 14 May 2019 09:16:19 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQTXk-0006xc-Id
 for linux-amlogic@lists.infradead.org; Tue, 14 May 2019 09:16:17 +0000
Received: by mail-wm1-x344.google.com with SMTP id q15so2007653wmj.0
 for <linux-amlogic@lists.infradead.org>; Tue, 14 May 2019 02:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m3anIj92/L8NrlG9u2N2Y8IF5jQd43C2YjhwBflKNMM=;
 b=IXXSssla/+rsSsLeIQf7AF8zrXr53GrMS3dwAZ5bi8fbwce53xVHsstXJZQRkQnahB
 4G1giDmXV9ty/pmgqgwE0l5xv/yFpHLVKBLaANncHC/18mwC3Bw8m0fOpU+iJIOkocwI
 LQWTDGeDYO9kvMgFGwoNhw/u6X5Q9JN3cdzZSqCAwZA47amoJmr0iugoodMpw77SgoyH
 dEzoZWVgu3GNG3mm3si2VroGHSx/nr1k48HgzO6gszphhv8Cyn8PgS4qNmE784MZXv/1
 WaTBIyrR96OS1lwMHcRpf3dFR/IlRTo9paXSb9HzsVfVdptMTnAzBEDDe4GfADhMT6RI
 nlPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m3anIj92/L8NrlG9u2N2Y8IF5jQd43C2YjhwBflKNMM=;
 b=GDTgFna9UexgpfkSnt0x2Y82jrhpTw6+KEL7WspIu7jZtS64h6R8NJ28y/Fs+lPK/2
 ZwfTUTOdv28p9uwX4Z/q3JbVomoS11s2QWFvRcYF6ITykH9iEccxRJoBOLl0qezRFi9A
 GI/fXaVlF0gbbxrKYcwlLJ3I+8p6WorDxO8Bo/5O2If8L3+b6glfLi+3Xy1nt3c93e0M
 uFUVOTjmXj9iTrDzvmyQbVpC3W2H7dH9AOvj4rzD+hVB31n1Qp45MYuyomylcwC+R4zl
 O5SJPSbFQnAORTUathMY/ncwWsfymANGGg0OnYbU2y0x9THpLVdMfH00FJV945xueRVi
 4n7w==
X-Gm-Message-State: APjAAAVK5HH0XsU0x53Tmm2O45CMdetmeoBZjk0UxUOYZtvsf0aCXXVt
 tDxf0f+6Q6prXYcOqqU4evEh7A==
X-Google-Smtp-Source: APXvYqwDWrDprnELvTySHIjnfYtG6C2tdrAZOARpxWykbzC0+OO4QdgMq6o9CfdvYnb7h0lLWx/6Nw==
X-Received: by 2002:a1c:ab0b:: with SMTP id u11mr18572373wme.26.1557825374721; 
 Tue, 14 May 2019 02:16:14 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id y40sm17737158wrd.96.2019.05.14.02.16.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 May 2019 02:16:14 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 0/3] arm64: dts: meson: g12a: add mmc B and C
Date: Tue, 14 May 2019 11:16:08 +0200
Message-Id: <20190514091611.15278-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190514_021616_610480_11C743A9 
X-CRM114-Status: UNSURE (   7.83  )
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

This patchset adds the MMC controller B and C to the g12a SoC as well
as the u200 and sei510 boards.

MMC controller A has been left out on purpose. This controller is
special on this SoC family and will be added later on.

Notice the use of the pinconf DT property 'drive-strength-microamp'.
Support for this property is not yet merged in meson pinctrl driver but
the DT part as been acked by the DT maintainer [0] so it should be safe
to use.

[0]: https://lkml.kernel.org/r/20190513152451.GA25690@bogus

Jerome Brunet (3):
  arm64: dts: meson: g12a: add mmc nodes
  arm64: dts: meson: u200: add sd and emmc
  arm64: dts: meson: sei510: add sd and emmc

 .../boot/dts/amlogic/meson-g12a-sei510.dts    |  42 ++++++
 .../boot/dts/amlogic/meson-g12a-u200.dts      |  42 ++++++
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi   | 124 ++++++++++++++++++
 3 files changed, 208 insertions(+)

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
