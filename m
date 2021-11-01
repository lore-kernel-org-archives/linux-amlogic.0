Return-Path: <SRS0=0OJt=PU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1090C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Nov 2021 08:18:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DEB360E52
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Nov 2021 08:18:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8DEB360E52
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NHtAtTt2sp6iQr7oumvQBGF0Xd7DI8fE/vrY0IreYrI=; b=jJsrlBXh+R4sNj
	YwH+tzY57OmE1bd7dDdG0QgeSD7vw7lTiURMLWZ23Sr8UoCuQOXzTyi4E80mp5g20RdjBt3vDnAmE
	GQsqhTZfItP52byVXhuMhKa5yQbE3DoU7yqq2s8cjIV8/Xs/eBNFOwZP5efDDRm3n1xrExaGwKZH0
	APZRl/5laxfWxb0upN/i82aGp1HHUykWYAhD096tcU7+28KVKAiNUVYPAEL+2ov+dhLh60sV47rw+
	prylC2nB+ylvaSEmB4bbyppkyQkLodazYQ0+XFviVFsX8TjwEtVV+9UE8bpJ+VCDpSLx8sAWRO/rk
	utuMqfmYQRZL5ZLGn4ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhSW0-00FdYD-1q; Mon, 01 Nov 2021 08:18:00 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhSVw-00FdWo-Gt; Mon, 01 Nov 2021 08:17:57 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E76C1212C7;
 Mon,  1 Nov 2021 08:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1635754672; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=froXKkwnXcE09hCLAbIHSihJ/nL3UBMsXPk/fd1O4Cg=;
 b=Ofrd8rLNErIfwlciDlpg7G4g2oRWnuCd/EYLyZo4l1Tf+J5KSJmNLbB8/jRtq9pP87Mngi
 u/GZA5CCRgRERoUS8x+iPkf3p6tPki631VOLLVpn8i9d3ZMXyHx1K1jMctj6KsitYD3qjI
 Mz7yB1cf1nLDJSAaOYEvKkYiXzfox90=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1635754672;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=froXKkwnXcE09hCLAbIHSihJ/nL3UBMsXPk/fd1O4Cg=;
 b=19E+Jk2zifLgLxkjMjIKZ6k4BeftOIiScpU3DtesQB4m4QWycwzbz0A6jFfElB0XbIDyqr
 JcD2/xC8RLfXENBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 92C9013AA1;
 Mon,  1 Nov 2021 08:17:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /SfQIrCif2EIIAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 01 Nov 2021 08:17:52 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, noralf@tronnes.org, marcel@ziswiler.com,
 naresh.kamboju@linaro.org
Cc: dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/2] drm: Small CMA cleanups
Date: Mon,  1 Nov 2021 09:17:49 +0100
Message-Id: <20211101081751.24613-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_011756_738247_203A14ED 
X-CRM114-Status: UNSURE (   7.70  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Remove CMA dependencies from MIPI-DBI and replace the config
symbol DRM_KMS_CMA_HELPER with DRM_KMS_HELPER. This allows to
link drm_fb_cma_helper.o into a helper library.

Thomas Zimmermann (2):
  drm/mipi-dbi: Remove dependency on GEM CMA helper library
  drm: Remove CONFIG_DRM_KMS_CMA_HELPER option

 drivers/gpu/drm/Kconfig                 |  7 -----
 drivers/gpu/drm/Makefile                |  2 +-
 drivers/gpu/drm/arm/Kconfig             |  2 --
 drivers/gpu/drm/arm/display/Kconfig     |  1 -
 drivers/gpu/drm/aspeed/Kconfig          |  1 -
 drivers/gpu/drm/atmel-hlcdc/Kconfig     |  1 -
 drivers/gpu/drm/drm_mipi_dbi.c          | 34 ++++++++++++++++++-------
 drivers/gpu/drm/fsl-dcu/Kconfig         |  1 -
 drivers/gpu/drm/hisilicon/kirin/Kconfig |  1 -
 drivers/gpu/drm/imx/Kconfig             |  2 +-
 drivers/gpu/drm/imx/dcss/Kconfig        |  2 +-
 drivers/gpu/drm/ingenic/Kconfig         |  1 -
 drivers/gpu/drm/kmb/Kconfig             |  1 -
 drivers/gpu/drm/mcde/Kconfig            |  1 -
 drivers/gpu/drm/meson/Kconfig           |  1 -
 drivers/gpu/drm/mxsfb/Kconfig           |  2 +-
 drivers/gpu/drm/panel/Kconfig           |  2 +-
 drivers/gpu/drm/pl111/Kconfig           |  1 -
 drivers/gpu/drm/rcar-du/Kconfig         |  1 -
 drivers/gpu/drm/shmobile/Kconfig        |  1 -
 drivers/gpu/drm/sti/Kconfig             |  1 -
 drivers/gpu/drm/stm/Kconfig             |  1 -
 drivers/gpu/drm/sun4i/Kconfig           |  1 -
 drivers/gpu/drm/tidss/Kconfig           |  1 -
 drivers/gpu/drm/tilcdc/Kconfig          |  1 -
 drivers/gpu/drm/tiny/Kconfig            | 20 +++++++--------
 drivers/gpu/drm/tve200/Kconfig          |  1 -
 drivers/gpu/drm/vc4/Kconfig             |  1 -
 drivers/gpu/drm/xlnx/Kconfig            |  1 -
 29 files changed, 40 insertions(+), 53 deletions(-)

--
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
