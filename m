Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB542CF3186
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Oct 2024 21:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x26mKt6ah3m08kyCPEzVEETqECUmc7I9R3adJjaqf5Y=; b=aKwyeNAGgeUOdc
	d2WID9a3956iI/OL/fqH9GCBecGbM1zgkLkatXHTqjWiHlvmCAbLqGnCMXxqlTwwQI7V6JjjOCZ8I
	Nkc2zwuaW3Il6IGyIp6egpIps7gGFiHR0DxnWYlxR/NX+MkQ8ndDo1frO+MWZs1WxtoNVw8Zvbfe6
	aaynU2L0wVWMdX1fwfxqRIk1JHnWn9zV8dZYMqODqk+qbMOeCEeJKjjW3MhAQRETiHv5d/dujEFxr
	g0liXIe8DfdltiXu7Zf4kYHZiSxWbmbM6UdIGGyyqozgprDh3VGJdhVKSKyGB3Fvx/ay9ylQUnTnm
	WuXzUhE9aPF4SJetBQIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svk3Q-000000045Ao-1n3G;
	Tue, 01 Oct 2024 21:05:08 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svk3N-0000000458i-3oig;
	Tue, 01 Oct 2024 21:05:07 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6A56223D76;
	Tue,  1 Oct 2024 23:05:02 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P24qPAbfXRd7; Tue,  1 Oct 2024 23:05:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1727816701; bh=s1+/LBMYV7QYPCqFRgi/eI/p0qajjacXZ54eovBVtVM=;
	h=From:To:Cc:Subject:Date;
	b=Bz3cdzE8L4s2bPAL61a66NC+HsvVdXN0wUZHKIqryH8GL/ZkQV2YiWgtTALRNhuTq
	 EgN4oY1bGCiTXo9j8sOdh/2SsAkEUF4wiLQhT52cuxJzP6/CdNsepj7rSBWib2aNm3
	 4lJIAas4DQUeP8iXC8ktFbMwcub7/Ml1do0FmbvutAtL7IHBEmWzia0hNYWUwFLpU+
	 y+YGeKNFSrP6J+Zj6A4Wb56UnNzlrpJBouMS1u2yTvloNMAhDrvfxpzN+xLXVEaFIt
	 sAoHnLvRSAQ8odwc7AICTlnfcUhrXhwqpoabvl+EZecKvg+U/G28EOkZjADKqmLKuH
	 p4PU7r2kWuyAw==
From: Yao Zi <ziyao@disroot.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yao Zi <ziyao@disroot.org>
Subject: [RFC PATCH 0/1] meson/drm: Support drm_panic
Date: Tue,  1 Oct 2024 21:04:03 +0000
Message-ID: <20241001210403.43535-2-ziyao@disroot.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_140506_382794_A70A4498 
X-CRM114-Status: UNSURE (   5.85  )
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

This patch adds drm_panic support for meson-drm, has been tested on
A311D with both TTY and Wayland session.

It is an RFC since I am not sure whether AFBC enabled case is handled
properly and don't find a good test case. Thanks for your time and
advice.

Yao Zi (1):
  drm/meson: Support drm_panic

 drivers/gpu/drm/meson/meson_plane.c | 47 +++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 3 deletions(-)

-- 
2.46.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
