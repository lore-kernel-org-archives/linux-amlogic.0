Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82ADAC04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 13:22:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 586BB2133F
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 13:22:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FZuMLp1t";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="pL7P5sxd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 586BB2133F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OXqsg/BOvFVv1s5Oy3hOLiZN+6ooP5PM/zxSAgHJthA=; b=FZuMLp1tTpdDMQ
	3eGsXFnLudXOO5Ujkjzer6ri5l5JzIvbnw9meH/3bp1WN/OKdPL4jVCgYzuRAYwN0xFYxY0IHQu3d
	lr0xOLluq41ZFeAxd8DxDxqQJBKVPTsxZJrIOcItRyxx67tuRCcUQ6nug3rZ/XeflY2LhuV2qyWO0
	ezJRYPJV73JPO3m9O8K7KC4jo6E0p89wX/2pNicxSj9D6SvDt1lUXRbSOi35b6OWf/M65IORG7ibO
	RUlVXPqBZcMdKpOdTcugZXXQc+S+aDmDY/lt07e2RVvYuivCsDCEG73Q8/x3LnDZpQjzxFUSqRTVL
	OeHkUhl8t4HwiFrTwdIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVFa9-0002eJ-1z; Mon, 27 May 2019 13:22:29 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVFZl-00028O-6s
 for linux-amlogic@lists.infradead.org; Mon, 27 May 2019 13:22:07 +0000
Received: by mail-wr1-x431.google.com with SMTP id l2so16926963wrb.9
 for <linux-amlogic@lists.infradead.org>; Mon, 27 May 2019 06:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ceESg/eKh3AFRTY/CoikatuHiURoMtYj1sjsEX9yO6U=;
 b=pL7P5sxdTymgRwuekufB2BnC0rYT3DA5TwwbEf7Pj1MjS8ySUQGGlE+2IdmRDj8R+K
 yBpY4NqNt+3Msd+CgPPjrf7Q1oLbHCckxKoh4q1jv7KwA4xkzZPaFtiYEYOt7My2ftZf
 /TUv+SjqfUwVOJcarvVJdCVI1IB6+UI5pe8Wak7Omns6Tx71a4PgnenCCuDZpuvkcPV2
 V+LBUzlwnv/Ax0WpMBhdda9KiIU0j8ojL87E4Vxvlk1aY6baJZXCeP2TTO7iMFsjg6MT
 GaLKGYJzenfzBUfJnsIuyeerxlrD5W120cwDGpwaoo9HU9ljDDH+6p3UPSaqeApeCSTU
 kMNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ceESg/eKh3AFRTY/CoikatuHiURoMtYj1sjsEX9yO6U=;
 b=GaEJ3NItbRJcqAhRYxJUTqF7CiidSmtIS8osG7pxQCKVk8nJdby9StweKQgtV8XRDu
 92YQsbvwNkarkgLlt3v1S5+WeTgh1IhQKwNzPpwvDsyreQnoS0JJhmTEoSEzfpBN88n4
 RxIY+VNE1mYDFbpNIaDLvZJ8H4lEyVAuzis9oLNCqoBkoCpLn99+YGhrAvcQxSlHw/QJ
 VmpYU+onfqX4FfJzJ8hTgW7GLfFaFwZvgT4FWUod0XlIcnI0koJO/TLPYGcGh9D1Q03/
 RDpFs7Zqo4J1k5DqPoqivYAg4ciLCPFauyZOeRI1910CyO0WyMZZbJTjV3aWyLod0fsU
 VEwg==
X-Gm-Message-State: APjAAAUXRmN8gsf+Lzk8UM50KjhMGaq2mG/TWO5WwwDLliXzXuxeWjA2
 ZnA2HrRLaqUj4nPQV23V1whQjQ==
X-Google-Smtp-Source: APXvYqw8//NOue/uv53owng3Us+VdU/FIm6rd0GP8DuDacGdnKIg8lOUGR+mFyaTqXKuPGWsHwvI0w==
X-Received: by 2002:adf:cd06:: with SMTP id w6mr2479722wrm.353.1558963322561; 
 Mon, 27 May 2019 06:22:02 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id l12sm7019836wmj.22.2019.05.27.06.22.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 27 May 2019 06:22:02 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 00/10] arm64: meson-gx: misc fixes
Date: Mon, 27 May 2019 15:21:50 +0200
Message-Id: <20190527132200.17377-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_062205_245733_C692499A 
X-CRM114-Status: UNSURE (   7.21  )
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

This patchset :
- Fixes GPIO key DT on Khadas VIM2 board
- Fixes regulator naming on Vega S95 board
- Enable SARADC on Wetek and Vega S95 boards
- Enable/Fix Bluetooth on VIM2, Wetek and Vega S95 boards
- Enable CEC & HDMI on Vega S95 board
- Adds ethernet PHY interrupt on Vega S95 board

Christian Hewitt (4):
  arm64: dts: meson-gxm-khadas-vim2: fix gpio-keys-polled node
  arm64: dts: meson-gxm-khadas-vim2: fix Bluetooth support
  arm64: dts: meson-gxbb-wetek: enable SARADC
  arm64: dts: meson-gxbb-wetek: enable bluetooth

Neil Armstrong (6):
  arm64: dts: meson-gxbb-vega-s95: fix regulators
  arm64: dts: meson-gxbb-vega-s95: add HDMI nodes
  arm64: dts: meson-gxbb-vega-s95: enable CEC
  arm64: dts: meson-gxbb-vega-s95: enable SARADC
  arm64: dts: meson-gxbb-vega-s95: fix WiFi/BT module support
  arm64: dts: meson-gxbb-vega-s95: add ethernet PHY interrupt

 .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi | 93 ++++++++++++++++---
 .../boot/dts/amlogic/meson-gxbb-wetek.dtsi    | 25 +++++
 .../dts/amlogic/meson-gxm-khadas-vim2.dts     | 13 ++-
 3 files changed, 112 insertions(+), 19 deletions(-)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
