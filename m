Return-Path: <SRS0=ycqe=ON=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 122D5C04EB8
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Dec 2018 16:58:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2EA420659
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Dec 2018 16:58:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Nma9tD/f";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="srdIzaFG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2EA420659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f9NjpKHu9sg/PhuAwhM5MCspCLCI5EomlwQICrVr7Fo=; b=Nma9tD/fEytPq4
	wvXBnv45GdGgn9LUnyzycBsu/h8FU4aK0Jy+a0jv/5fizUYGLfdXo14jK5ZHtT5mVR9NpbwOMf25S
	zyX+zRzWmG6nCeSM3zsl9rPn0zxilP5u0GkR6JYux0Q0WZ9Q2629a0E6tRLHSl3BbX+oAtDIhnUhI
	D2xa36QFD1pjsJgTlwtalyjtudYSodIB0y6fr9aTEx21QyDGSICr0isjDm6ntAZghnuLRTCx/W+9B
	b0lXtmTWIXMibp2mZgGt5e4+Lgr/N0VNQICgSwitunNUEgoBEBtDX9Yn0t7FN4F30j5PiDnmXd7xK
	qeFxyx2z3cqqqVfLakiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUE1z-0004CV-G9; Tue, 04 Dec 2018 16:58:43 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUE1w-0004Af-3A
 for linux-amlogic@lists.infradead.org; Tue, 04 Dec 2018 16:58:41 +0000
Received: by mail-wm1-x342.google.com with SMTP id r24so9859625wmh.0
 for <linux-amlogic@lists.infradead.org>; Tue, 04 Dec 2018 08:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GFaj5nnpznOUas4Nk4RvpF7kGZOF4xLLF5UsFHMGNEI=;
 b=srdIzaFGu3pA59qfVe5+NL05RLSR+ZodpzQ++pFEEkF3SBMNpKKtM7l7GFFF8VS/UM
 VQaZeDZUN5nyGUTeC1C0o5TFbKcPahJLRJkQj5xZRKE9pfqMZJng4JoUsvlOpx/vEGt/
 OlhC8pJQ2smI52uqwc0RYykhwuYn974zr7BLL7MVMNrRIUl2P8g8DYJAhZYxLZMQXAmC
 cQJg0lMep4Pwxly25zgaIhKYz+C82j0lNJigI6sT4X6L9a7wi0FWBJPT+Do+evnSzBal
 CsNuCthevRzzU/IQuN9NulW2+uIOXoNWk51Qj490eUKcUcoAlnGTSPzMyyB16DQlvUWg
 5nGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GFaj5nnpznOUas4Nk4RvpF7kGZOF4xLLF5UsFHMGNEI=;
 b=DZaVGK+aXdOkd40glzoYlckPoeGoBLfoqHgX9OiAYOaqDsAAsVR3QvLEPteET0rsqq
 OkbOrt7JsV88mMuHdsYLgIE1qMbxOusNhcuSyjti4+EuCH0avQGoJFTz9CsgEZN2KLMZ
 q+DpGUzgcaoInbKEUVS5kJjuFbl9q1wG1NRhn8llHZolW77Izu+eRO7NGRfZebc0F8va
 xmZtIFQTdo9tLJLNDQewnxNWunsCesVZjZmPNyA3ymqpYygxMyBL5vOJTUPNiTFJ0ZOo
 RhjO5cbwSy8sOVBhKAkNstNm7HBGHYS1qMJVqoah2E1u74Qmaxrf74qt9P92usggnztR
 KxjA==
X-Gm-Message-State: AA+aEWbr8R9bKvx849SPYrAvcM3NJSKiJm/1DQTp5BL/3RG6Wxvj22Jb
 V+PUKmS50Q67tQhfH2AaYPFifA==
X-Google-Smtp-Source: AFSGD/VnCwtapXZIu6I7LJY17J2Dek32xY3jzoyAR14FToy4ExZQhq3sSRtzaLkb8aGKlbbkb0n8lA==
X-Received: by 2002:a7b:c5cc:: with SMTP id n12mr12923646wmk.149.1543942708347; 
 Tue, 04 Dec 2018 08:58:28 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id x81sm10152521wmg.17.2018.12.04.08.58.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 Dec 2018 08:58:27 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Subject: [PATCH 0/2] clk: meson: add clk-input helper
Date: Tue,  4 Dec 2018 17:58:17 +0100
Message-Id: <20181204165819.21541-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181204_085840_136916_A2E27891 
X-CRM114-Status: UNSURE (   7.90  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

When the related bindings get merged, we will add more input clocks
to the different amlogic clock controllers. Instead of copying this
code around, lets create an helper function and use it.

Jerome Brunet (2):
  clk: meson: add clk-input helper function
  clk: meson: axg-audio: use the clk input helper function

 drivers/clk/meson/Makefile    |  2 +-
 drivers/clk/meson/axg-audio.c | 83 ++++++++++-------------------------
 drivers/clk/meson/clk-input.c | 44 +++++++++++++++++++
 drivers/clk/meson/clkc.h      |  5 +++
 4 files changed, 74 insertions(+), 60 deletions(-)
 create mode 100644 drivers/clk/meson/clk-input.c

-- 
2.19.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
