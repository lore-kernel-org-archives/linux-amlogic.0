Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79D9C5CFC1
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Aug 2026 02:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vC70T+7PhdWyIu2IlVayvkF/IDoPt60LT9VZXJc4nUI=; b=Kg7z6UKOTi7jps
	59yid0q50y2waVPF52Y4e/gIi+cWlyt9wqXNRvmjrlXuJTBF9ZtlsoifvXrEJ3k24x+Q8hdMlBb4Y
	ZigYgz+YRZ3p3MxlfFTQQrX3zB2dv5ECJ7U1ldM1Bzia2WK1qjfKVrNZnyUp73wHFaOef6wlgE8GI
	xsvrIjJLgobMNQX3w1zF2p7wp/4WzVHTkbag7MN7VFummZQX0Bf10r2yeye794dvmqtPSIxW60qpc
	M/IZ8C5Um2zqAY0A5/CZXRRjawYi93txe+CugKM7T2vYXTTCYpgswIeDW5lH3i9S04CFC4KorPOtz
	392HZlRMtCHkNwn0pYZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtyuQ-0000000FHny-26c0;
	Wed, 12 Aug 2026 02:41:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtyuO-0000000FHmz-1SHV;
	Wed, 12 Aug 2026 02:41:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 922E343A35;
	Wed, 12 Aug 2026 02:41:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A64AC2BCC7;
	Wed, 12 Aug 2026 02:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786502495;
	bh=PynJ5xo9Sdp/Ik69/y60OZIBerQ/6DJ4h2lEOta72bc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BWbMolET+BUv+HCNiYSywfCMTafMv8EbTu0ttnqa/PNdzATzYBBf4YeM4WKsEDDa0
	 HrAmpp3S79mhFqgPiZgBmjS2ztfwAIYgV4VpC0sgtoWCN1DF7ngjKh/vCPCgrju3Xz
	 Hkyp0Mi/02tM34/G2qs+T92MqTZ89rh3WJJfKIg5Fws1TqeLLTcn42LrCVpeeEjVeL
	 DZ8ioJpfLv2n+pavUKjrihHzeXLRLt9ODk+4CYz9j/LAIMpUBSF0I0QkEqgo7f1faR
	 DEj2EICD53DFsFcdjXuYf9kK+y3KpgNZI9qBK8Zg8ssKpsUTl2wHjC7sp43Ud/D6Vw
	 C5bLQd9OPIsgA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48316C5AC67;
	Wed, 12 Aug 2026 02:41:35 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Wed, 12 Aug 2026 10:41:23 +0800
Subject: [PATCH v7 1/6] firmware: meson: sm: video firmware loading via
 secure monitor
MIME-Version: 1.0
Message-Id: <20260812-b4-s4-vdec-upstream-v7-1-3fae085861bd@amlogic.com>
References: <20260812-b4-s4-vdec-upstream-v7-0-3fae085861bd@amlogic.com>
In-Reply-To: <20260812-b4-s4-vdec-upstream-v7-0-3fae085861bd@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786502492; l=670;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=ioNPQiZsvUfM7WHdEfF4xb07l7H3o3hVIdC2XZUtO1g=;
 b=eK1kDLPi+TZ0ozmq9apoa6V7z/Tacdapq4Ey5p5r/Sn47u2Ng6Q6TZMe7fL2KhAE4D5HqpoDk
 Or7Tr9aXEvzDGucXn6s0rGvzAFbylCH9EbAjRSx6HrMqVTJnk2bFngM
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
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
Reply-To: zhentao.guo@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Zhentao Guo <zhentao.guo@amlogic.com>

Add SM_LOAD_VIDEO_FW to the secure monitor command enum
to allow decoder drivers to load firmware through the meson_sm
interface.

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 include/linux/firmware/meson/meson_sm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/firmware/meson/meson_sm.h b/include/linux/firmware/meson/meson_sm.h
index 3ebc2bd9a976..3b90b49d0552 100644
--- a/include/linux/firmware/meson/meson_sm.h
+++ b/include/linux/firmware/meson/meson_sm.h
@@ -15,6 +15,7 @@ enum {
 	SM_THERMAL_CALIB_READ,
 	SM_A1_PWRC_SET,
 	SM_A1_PWRC_GET,
+	SM_LOAD_VIDEO_FW,
 };
 
 struct meson_sm_firmware;

-- 
2.42.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
