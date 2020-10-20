Return-Path: <SRS0=scox=D3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E289BC433E7
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 07:25:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BCCE2223C
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 07:25:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oetqeER4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="oqUSsJfY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BCCE2223C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TNG7wvpevVQ2YMnA37/QDIjJR2MYL/8UKit3Cc/wqfU=; b=oetqeER4O/VplgBAB11pb98Hbn
	miKtHjQzWjVpEqDv+/YiWD6Ls+GlNk5O7OkPAPirTrlAedDXejowZAUn+yOS4tKbVu50YHkgxifH9
	vq+1XAUxp3DsP8jWvcGA8QKWfwIn/VR16Y2xff0Pd/eaQfwI3vkjvgONGqs0Lq5DiKyegp4/dRDWN
	jIgMvRKCNf2/9PWk93FGjHx4bx68hsKEUBmIXUQsLxcVCeFQ/4dSm/N6kMX2/UH9F/0DVHrGkzc5b
	bTEWVUQdaY8oxR+fvCFPCttrQ2YCqwI+xmvi/6Jrwdq2VzcrdB1iG0VR4ca/x8WPc934DWAfuMM0C
	eunsoFeQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUm1d-0007zX-Tn; Tue, 20 Oct 2020 07:25:42 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUm1Z-0007xE-Sd
 for linux-amlogic@lists.infradead.org; Tue, 20 Oct 2020 07:25:39 +0000
Received: by mail-wr1-x443.google.com with SMTP id e17so786653wru.12
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Oct 2020 00:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IEFMnxSYcHzHuFUbo0zFEMoIVWyQpDgYm3OYOo8liu4=;
 b=oqUSsJfYyMR0qdVYAT8DJfdmbIuV4dzSvreEQ0KrMuR5b+nRhm5SEIDw9ka7qJ5Jdy
 4sohRzMrOun2jayvNDiRqP70lQwW9uyx/XpKl32DApxxj3KPr1wgE6W+SN9HMvM5ADNl
 FBE1qtMLOvkt4trdPcdRFb9wMKbNtNPJ1Bi/v+FzvxpmzxDKtwBIEkd9hBPKGbiSDGJE
 4QeVX0hqAnZgCBFUJwEte4QkJsUcLfya79daN9HAFWxSd9SswzOeXVEGWl09r3glKwYn
 QQ2PxYHM9gDGa5JPdZytr9n5g0HRU8IEz7x0uiQ7ud58eH5Jp9gRY4c0ey3pHKW9A2sr
 8TNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IEFMnxSYcHzHuFUbo0zFEMoIVWyQpDgYm3OYOo8liu4=;
 b=r6ll5HVnrBtNFA2LsjQo1/H0I7KHuxqJoVlv7F3uKkrnFNkU/sSYIAy2O0j1DwaIpy
 uqdNGX0uERpRwfAwU/XwWyKoe4XZK22czrn8yBez4J4yY0PlIbdsmo9ROyXURD/QY3Z0
 0HdjL5XL6qZhAbsSKM+b6zm/vz/XLlgySG0p97NovadX6dOZ13NcjAq3M8QK2ryJDPeB
 TiUii/Z2dnPCoLeX5H8bsQUkcY6G7RRUWpXgpUefrUyfdFpejJ9zqYieAa9Sa8SHxxcC
 A0gJzovTRIY3PM7U8eV1M3UmPvZ1XFi0tasLDbRAYK8Arb2NvvQK8LuNNtUKWCrbpbMr
 Fm7g==
X-Gm-Message-State: AOAM532M2uSdWrmaZApdtVM2DO0z03o9Wk5b6ojnP2aWnyGeRmK7++Dx
 231T7Bsm9ZdvFbIEBXGgiMeDig==
X-Google-Smtp-Source: ABdhPJzU3Qj+3oNMENhW9UqVjVo/iWG3zTuPR0LYynPXfimx6ZaX6hftSWYCEzTdIywouToAgX68Qg==
X-Received: by 2002:a5d:684d:: with SMTP id o13mr1945044wrw.302.1603178736579; 
 Tue, 20 Oct 2020 00:25:36 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:3c62:4f82:8f5f:de74])
 by smtp.gmail.com with ESMTPSA id j5sm1487325wrx.88.2020.10.20.00.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 00:25:35 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: maz@kernel.org
Subject: [PATCH 0/2] irq-meson-gpio: make it possible to build as a module
Date: Tue, 20 Oct 2020 09:25:30 +0200
Message-Id: <20201020072532.949137-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_032538_144811_B7470664 
X-CRM114-Status: UNSURE (   9.66  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

In order to reduce the kernel Image size on multi-platform distributions,
make it possible to build the Amlogic GPIO IRQ controller as a module
by switching it to a platform driver.

The second patch removes MESON_IRQ_GPIO selection from ARCH_MESON to allow
building the driver as module.

Neil Armstrong (2):
  irqchip: irq-meson-gpio: make it possible to build as a module
  arm64: meson: remove MESON_IRQ_GPIO selection

 arch/arm64/Kconfig.platforms     |  1 -
 drivers/irqchip/Kconfig          |  5 +-
 drivers/irqchip/irq-meson-gpio.c | 89 ++++++++++++++++++++------------
 3 files changed, 59 insertions(+), 36 deletions(-)

-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
