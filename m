Return-Path: <SRS0=ej2R=UC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC72C28CC6
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jun 2019 09:48:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 200FC28042
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jun 2019 09:48:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q9A3dEAQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="pzYeMNuj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 200FC28042
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MWVuN6F1mItL+j2iFf+EgChuKqWRvnNAYJdMz2MiWC8=; b=q9A3dEAQQHQINA
	d42/2UaHUvyTvebbCrrQ3ffo2LTVM75ewFJBXPhk5FgrDP4QCeiDxRKMKDG2xBQRK5wiTDXnjgFD5
	aZPj854UPMBIOxK7Foo5RDGCvchugtOp+dPRKxTBSXbvTp60+cLLuxr94Evff9G5k22WC24HDt4T/
	81IfcSTuSi5Ya1dzNjf+r7Duuh/Y8iSt0bus3NtvJEXL5SXTkzxW5e5Xw7NQk2/ZdteXs+RwvC2L1
	1SBJkP222HOQYFDNlMj5xjYq4HVvpIl0KiI2qBISEJQGEvarkV+HrccIPB8sKjcYXbhX3twXsSN7M
	Lc+1KnbAle/WlhYjHZfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXjZO-00088C-MJ; Mon, 03 Jun 2019 09:47:58 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXjZE-0007xo-UA
 for linux-amlogic@lists.infradead.org; Mon, 03 Jun 2019 09:47:50 +0000
Received: by mail-wm1-x333.google.com with SMTP id g135so7245844wme.4
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Jun 2019 02:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e9Ixde2RaAqTQGdv+LA9dTohQTsUZNLap9qbImLLJdg=;
 b=pzYeMNujyAFxjYrDgexUSXvZNbCrKH4ON0S8GO6yhoEos7QDzrXvmiaDID9tfzEKyg
 sW+C6F5cEPQ/rk8fW7UCxjSvAEggstG/hdn4GThq0n1nMs4K/oyjnE0vqdKzWBf2MkUO
 t9UE+j3BJ4AthZlLyEv4+PbwuQtL0ZnvVBSIyQD1YjBS96WXsFK4qjaxcAco+7Fv//e4
 GkyNZ3jPOtU7lnGlESqER8ZzfdjuQgZ+a8fQ0huUdMNO4SiuGRrjLEk3+nnEBpn69Hem
 ujJeMrhWxL4SdxJTgLEWjBNLEVM0+PXZkeQxHFqFxVH5oWlt1bIAmpbbl6MXzA3/NxoX
 Kavg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e9Ixde2RaAqTQGdv+LA9dTohQTsUZNLap9qbImLLJdg=;
 b=D/CS+g9g+vhfBuiOFbOYkzFHqieEHWQxyraG1EkzZIL/L629Oq2QQKa0eega4/guhe
 crYlpd3h7FEDDq5tGiUOAshuxkZwJRhk1k/vRC4zCMtDNKTaYKs65LPFikn3cTR1I5ip
 y8whppBHgO/LmAcgLt49LHtyyUmwJKc35AwdQAIBwHxQylxBNFn7moIYt/IjJ0Ab6r56
 mzEhguPfTpP9kLdWj49armmvfbdnoNQV3TsFDX9003Gxkur2b3b5Rc2Hl0+bGbe+kqiI
 Ddi4TroFNB1ArViMq16EOf37JHPv6dBuesDabvYMS79tLiDzLvTVJW/JFkmrJ9i1unl2
 qeVw==
X-Gm-Message-State: APjAAAVLYc2R4pnwxb4Kh/DzKPc3g87v/OR1k4snLZhxvdma9O1P4bM1
 08vtOb6at4oOd42wG+0jspaxHA==
X-Google-Smtp-Source: APXvYqzbgRQEAG7CUDXFioI6Ii9i4e+8Al0EgocEvPQeRh42n3dvxouKvbj6QMVEBXoM/NPQwRWm/Q==
X-Received: by 2002:a7b:c34b:: with SMTP id l11mr14066558wmj.69.1559555267031; 
 Mon, 03 Jun 2019 02:47:47 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id z14sm11235375wrh.86.2019.06.03.02.47.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 03 Jun 2019 02:47:46 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 0/4] arm64: dts: meson-g12a: bluetooth fixups
Date: Mon,  3 Jun 2019 11:47:36 +0200
Message-Id: <20190603094740.12255-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190603_024749_126829_1AE5A6DE 
X-CRM114-Status: UNSURE (   7.58  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

These patches :
- adds the 32khz low power clock to the bluetooth node, since this
  clock is needed for the bluetooth part of the module to initialize
- bumps the bus speed to 2Mbaud/s

Neil Armstrong (4):
  arm64: dts: meson-g12a-sei510: add 32k clock to bluetooth node
  arm64: dts: meson-g12a-x96-max: add 32k clock to bluetooth node
  arm64: dts: meson-g12a-sei510: bump bluetooth bus speed to 2Mbaud/s
  arm64: dts: meson-g12a-x96-max: bump bluetooth bus speed to 2Mbaud/s

 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts  | 3 +++
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts | 3 +++
 2 files changed, 6 insertions(+)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
