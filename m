Return-Path: <SRS0=H3eD=OU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CC68C67839
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Dec 2018 13:47:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFE992054F
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Dec 2018 13:47:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e8ZP99U5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="gV0TyJet"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFE992054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pDCnm76y0UvCQ7g+1/6IXki/lDpg+b/BwJU3fs7pek4=; b=e8ZP99U5WlmIN+
	BIoC/7ZLVrhW21XNopZZJvKLjIn0Ez8zy4Qy4F9WA9kzfQYb9fSnLfIFWtaFj1DxWClVU7lIzuAeQ
	jtr6fcM0sEgXB2cGKvbxJxwXpWgYHq7pETGtcpztx4PBYFH+Gk0MAUJGU0hK3xE1vU1v4TuUZ69LK
	qDohHqKzqaylrRJj1UTOsau7ndbNVXXEVTXRA2vmActp9idAQ0DTQj3r/5bSQJKnYaGf+UWxRT9e1
	5JvmTieTMyiNhCjl+utPEMNnZaeoksb8V6MWM6mnjaZU5Q9grcfomc42XGlI/FKqpaRIxAQo1A6AR
	7iBGKCjBx/bAAN9ghcLg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gWiNy-0001pJ-B9; Tue, 11 Dec 2018 13:47:42 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWiNr-0001jq-PY
 for linux-amlogic@lists.infradead.org; Tue, 11 Dec 2018 13:47:39 +0000
Received: by mail-wm1-x344.google.com with SMTP id m1so1641861wml.2
 for <linux-amlogic@lists.infradead.org>; Tue, 11 Dec 2018 05:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u/C7VLcE6neAUUZaza/sZeOnT8Mpon/LIRJpBVmA7gU=;
 b=gV0TyJetEGPyH6Jop7rGLs6oAHPGRooYw55oH10unEiQB1lak76jW2AeK+OpXWbeAJ
 PC9atO9BrKwPIoGpw+t7PZ26o4X6vfwPcVetxbIlUd8zgVRIkzXNGQ3QBUJ7g8YndB5h
 +azQsns0w2dXMF2NT3JcV7PYOJHlkvh8sxmv/Fc+i+HR5qo70B4J52urzCBDWCBFvjqc
 pSfoqLan55VZaIDrhJQukV/oaySr7bCbS48+yrWWJtYd87NCdbLhH/517bSjPO92sBuN
 JEe9kT6ViSBasem/EdAha78HSEPIW6oTT1OsykmkGdOL0QVB8U+P0VK33KPlU+okpwDy
 N64w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u/C7VLcE6neAUUZaza/sZeOnT8Mpon/LIRJpBVmA7gU=;
 b=lt1B84Tp1ZtjsuXKcCW+GeZu1XvRIsDZquZ3ACIZoGcZ8t4/pENASZdDMZkimbY/8I
 SQXZ/ITA6nfIaSrxVS6UASHgVN0AiY0nakivb27GpBYifxZb/QH7eEimFPoQ1Z+HIDo+
 FrBgsacsemtsPgnE3Wt+fvE3WtVxeNrl8Gt4QS26Pn9QworsFgSLBqhb2g3CAtVkImP8
 Dlpft6IJjiF6O/xriwMMUmpCPWJScf5XPzdepa9jQHbQXsjbJMsnOD3lZ93KJK0dQvKC
 oWilTqKVedC9YQE4GtcP6FbI6Vm4IZKoL4K8P9fzCC64gdAha+wLOC2dfU0ikl1WwXib
 hJog==
X-Gm-Message-State: AA+aEWYO3Fx05pbORCftEzRqQGg3De2Tw3KUAXd5Ev0KRNXj4XnYmrla
 kZVGOId0mxx39a9ADKg/+gUkvA==
X-Google-Smtp-Source: AFSGD/W5IAKFcKXLyVegc31zxjtlss6GcifCY6G6uBgQ7picPNaxyyGAEe/4Xcc0yHGTm+jYtE6S0w==
X-Received: by 2002:a1c:128b:: with SMTP id 133mr2498350wms.22.1544536043939; 
 Tue, 11 Dec 2018 05:47:23 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id 126sm113768wmd.1.2018.12.11.05.47.22
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 11 Dec 2018 05:47:23 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Carlo Caione <carlo@caione.org>
Subject: [PATCH 0/4] ASoC: meson: add axg spdif input support
Date: Tue, 11 Dec 2018 14:47:09 +0100
Message-Id: <20181211134713.4908-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181211_054735_859228_AA000BBA 
X-CRM114-Status: UNSURE (   9.70  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset adds the initial support the spdif input found on the
axg SoC family.

The capture itself works well but the rate detection could be enhanced in
the future.

Like several other drivers of this type, no check is done to verify if the
rate of the input stream is consistent with the rate requested in
hw_params()

The automatic rate detection mechanism of this device and the related IRQ
proved difficult to work with, as documented in the driver. Several
approaches to work around this minor issue have been tried but none
provided a complete and reliable solution so far. Hopefully more eyes on
this will help figure this out.

Since I authored all Amlogic ASoC drivers (and the related bugs) merged
so far, I have added myself as maintainer of them in the last patch of this
series.

Jerome Brunet (4):
  ASoC: meson: axg-toddr: add support for spdifin backend
  ASoC: meson: add axg spdif input DT binding documentation
  ASoC: meson: add axg spdif input
  MAINTAINERS: Add Amlogic sound drivers entry

 .../bindings/sound/amlogic,axg-spdifin.txt    |  22 +
 MAINTAINERS                                   |   7 +
 sound/soc/meson/Kconfig                       |   9 +-
 sound/soc/meson/Makefile                      |   2 +
 sound/soc/meson/axg-fifo.h                    |   3 +-
 sound/soc/meson/axg-spdifin.c                 | 521 ++++++++++++++++++
 sound/soc/meson/axg-toddr.c                   |  15 +-
 7 files changed, 567 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt
 create mode 100644 sound/soc/meson/axg-spdifin.c

-- 
2.19.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
