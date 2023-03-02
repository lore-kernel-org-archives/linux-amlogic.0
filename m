Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A0FDC7EE2F
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Mar 2023 06:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZZHFUUsOwyIiAqXtLDh4m4jEa+JY1JryD7/WxP7FY8Y=; b=eeqkx8mSiYelAK
	/JxO+yJ7x6ReI03suh35kW64kHRXvTjwZuGGghPalg0iJsL+sz5u5PRTR5teI8OnZUYnsQSRaatmx
	tCHD8M85FV5+Yb3R+nYr0gVL8F9sTE+h7QJq+nTL0p6/z8X1XUIit1C2iQvFJ+KS7x/OPchJaYy1T
	ICJDzukuKh/mYTGl8f1EQSlq3xwnTzSQE8G+0A/jl8EgjD1D/7R+5gcKJq0fdrSaD+ONCtXDhX+E9
	9ouAxZkoos9WfHs9AzNjac/r+iB+4fHvJOnemZuOFlyPAFqbkaNPptrwtfJlDqmODgiv5Ul+t4m0e
	HP/VWHXQR5D6znuyz8og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXcWZ-0011ib-VX; Thu, 02 Mar 2023 06:34:43 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXcWX-0011h2-6Q
	for linux-amlogic@lists.infradead.org; Thu, 02 Mar 2023 06:34:42 +0000
Received: from droid10-sz.amlogic.com (10.28.11.69) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Thu, 2 Mar 2023
 14:34:28 +0800
From: zelong dong <zelong.dong@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <linux-media@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<devicetree@vger.kernel.org>, Zelong Dong <zelong.dong@amlogic.com>
Subject: [PATCH 0/3] media: rc: meson-s4: support RC_DRIVER_SCANCODE driver
Date: Thu, 2 Mar 2023 14:33:59 +0800
Message-ID: <20230302063402.42708-1-zelong.dong@amlogic.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Originating-IP: [10.28.11.69]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_223441_267385_7E53A4BC 
X-CRM114-Status: UNSURE (   5.50  )
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

From: Zelong Dong <zelong.dong@amlogic.com>

This patchset adds IR controller driver support for Meson-S4 SoC.

Meson IR Controller supports hardware decoder in Meson-8B and later
SoC. So far, protocol NEC/RC-6/XMP could be decoded in hardware.
DTS property 'amlogic,ir-support-hw-decode' can enable this feature.

Zelong Dong (3):
  media: rc: meson-ir: support rc driver type RC_DRIVER_SCANCODE
  dt-bindings: media: Add compatible for Meson-S4 IR Controller
  arm64: dts: meson: add IR controller for Meson-S4 SoC

 .../devicetree/bindings/media/meson-ir.txt    |   3 +
 .../dts/amlogic/meson-s4-s805x2-aq222.dts     |   6 +
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi     |  16 +
 drivers/media/rc/meson-ir.c                   | 713 ++++++++++++++++--
 4 files changed, 657 insertions(+), 81 deletions(-)

-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
