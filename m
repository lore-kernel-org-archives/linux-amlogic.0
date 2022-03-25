Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF54C4332F
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Mar 2022 16:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UrZv3OPHjMJxtuH9IPBU7EAuGCjdUVvJZTSiNaB55PA=; b=I8EhAtc/LKLg4F
	CQ2mb6AiTfvhYj4FGp68yBPtbAXxrkeVK4JF1bBOihwAe+Czgf7t1n1kGRc9EDwm2msaqp1zk6syl
	XNb11hh8wmgSc44CBuEBpqkUrYRCWTvIvcMV80tQKfT+UHlKINn3nMA5kGVaYFBUqNuBtBuCUpAAU
	oatYwbbxWe//ejjmSgajL+5K8KkiKteMW2WU2GlAOg9spviX9/FEDp3AdvsCN7Ym+HkWtRm/SneQR
	AaKXaL7FGucsIY3q64vPzTTm+8EMFO1oowE5pew8V+LwFyiQdAqkYYRqI5vHlPIrq+zAKHUeEhFOJ
	EzHV7EJ85VgTbj/ei1mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXnDZ-002eL7-2N; Fri, 25 Mar 2022 16:55:17 +0000
Received: from mx.msync.work ([2001:41d0:d:357f:aaaa::3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXnDV-002eIz-LD; Fri, 25 Mar 2022 16:55:15 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D0F7232041; Fri, 25 Mar 2022 16:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
 t=1648227308; h=from:subject:date:message-id:to:mime-version:
 content-transfer-encoding; bh=2Z9kbaIxV2YtXn9npaupo8QgaDLgj6YOX0GWnSHvOAM=;
 b=mYg7YTNYbC0EF7KlDstBcBvIlGJJYmSib8o1ozqXxnv8/MKDQ1IEQQF5vu5grX0DPCk10d
 pDg3tGT1qoUMx6g4HQRkinZfCloc0xAJPcJ+/p9o4MRvgDdlPZLRo1EkrE9f/gE4O20qlE
 VO6d089C0YHKzDmTKzXaAF9/FPtrueL3N9mXeT+GRaPw2d2iZD4c0CsBpGqe9xkJZYdGq7
 LejGM4JzytsHT0NBYpAO304h+AR7bU/uWJ/WSCAX7pvvtp+GKtrgRSP4S7QPwQOJnUzY2U
 LsYPWmBOLCGencPRX0hJtbgguA5rrk878vn/2JQJ/fiEokd2WvZ32TzDf22ECA==
From: Vyacheslav Bocharov <adeep@lexina.in>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH 0/3] arm64: meson: update dts for JetHub devices
Date: Fri, 25 Mar 2022 19:54:58 +0300
Message-Id: <20220325165501.81551-1-adeep@lexina.in>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_095514_002482_3F97469D 
X-CRM114-Status: UNSURE (   5.37  )
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

Update dts for JetHub H1:
- add bluetooth node for RTL8822CS uart port

Update dts for JetHub D1:
- add ZigBee serial alias (ttyAML2) for backward compatibility
- update voltage regulators and SDIO config to match board's reference design

Vyacheslav Bocharov (3):
  arm64: meson: add to dts for JetHub H1 bluetooth node
  arm64: meson: dts: update dts for JetHub D1
  arm64: meson: fix sdio in dts for JetHub D1

 .../amlogic/meson-axg-jethome-jethub-j100.dts   | 17 +++++++++++++----
 .../meson-gxl-s905w-jethome-jethub-j80.dts      |  5 +++++
 2 files changed, 18 insertions(+), 4 deletions(-)

-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
