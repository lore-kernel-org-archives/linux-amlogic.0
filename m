Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A2EC88E5B
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Sep 2026 08:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dwWqftZGDIsJeos9OI+artvgsnkoWF9PBPEaa9xt9PM=; b=dUQovhvyOLTxxz
	P0ycau0M50AEN36CiwUQ0HaOgvSR+qDZAQNmOZL1xOd10K1LOYqmkfAsKN38LOmHe3zcCwicj3idl
	rfxJHy9ppY2X1dB3fptmHfElF2WQE8ofIzKn5ClOOa+E/59h+ALJy8s0cW621TSZjpJ/41gyZTgV2
	DcH2QfZHhAC8o2QhYoF+6NoYPdgk0QJbbm55oWUCUhnHw+OoIwW+xWJCXU8ekM7UFpFBjfUGHNrwh
	ifuc0dVo5qzH4R0DZq6zpGkHb8diXNia8nj+GTiA9yhKwmsX//suHUz7GFZysYDLEuxEFa2qckczt
	vKtw0A/7n7EmKUneppGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wcx-0000000G7kV-3GZI;
	Fri, 11 Sep 2026 08:28:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wcv-0000000G7gm-2AB8;
	Fri, 11 Sep 2026 08:28:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3370B60210;
	Fri, 11 Sep 2026 08:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C707EC2BCB8;
	Fri, 11 Sep 2026 08:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789115331;
	bh=1VS5ElObVqR4WKXROqPaqb+LeB1gJwIdpIW5IFGGrxA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=lHTZYpQrs+0MPrNJ1Kf9WfhORtho4Qd0BL6fZ1ngaacv3k4ZFgLfBrrARi0wset6a
	 r2dfdcnfeQaXojaZE0gOFJkp/omct/lYzMY/Zw2he3oWrRla09WNISizoWTTzYsFoc
	 8XN5xgTpenvNg6U2HfHKKqSInT9cPorLjT8uzGVHRqFO0boBuVb53sCUVgFJCuGmHb
	 v6CtIIiYOGYopBF7wAaFpC3MuxrISD9GoebR3eYWeACsz/+hem1c03AIVktOBpEyTW
	 +F13nve6LsIvrjwj3MtE8HTKkUHrJv9NmPQqg4sxqTD4SZhgx+pjPShMlsz1S1udA5
	 Cg9w0mEDUHVPQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2537C88E4D;
	Fri, 11 Sep 2026 08:28:51 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Subject: [PATCH 00/10] soc: amlogic: clk-measure: Add support for more SoCs
Date: Fri, 11 Sep 2026 16:28:27 +0800
Message-Id: <20260911-more-socs-to-support-clk_measure-v1-0-940e269aa52f@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKu7o2oC/x2N0QqDMAwAf0XyvEDtQ637lTFG18UtOE1JVAbiv
 6/4eBzc7WCkTAbXZgeljY1lrtBeGsifNL8J+VUZvPPBda3DSZTQJBsugraWIrpg/o6PiZKt1eX
 owxDTs6cQoWaK0sC/c3G7H8cfS9aQVHIAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789115329; l=2217;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=1VS5ElObVqR4WKXROqPaqb+LeB1gJwIdpIW5IFGGrxA=;
 b=E3+DeB6GV9hFUk8OaEE06kHsbHmsvNlb9k5j5OnWHHmzw333FSBd2uBr+Mkvls08BW/it78qn
 1KzIArLeCE+DQ3f0fI/UQOoysDxV49AHMVuHd5NI1lPSwNhnPXzhZfO
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
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
Reply-To: chuan.liu@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patch series adds clk-measure support for the Amlogic A5, A4, S7,
S7D, S6 and A9 SoCs, listed in the order of their release.

The clock names for the clk-measure channels are kept consistent with
those used by the clock driver as much as possible, making it easier to
identify the relationship between the clk-measure channels and the
corresponding clocks in the clock driver.

This patchset also includes an additional patch to optimize memory usage:

  - soc: amlogic: clk-measure: Optimize CLK_MSR_ID to reduce memory usage

To avoid requiring everyone to spend additional effort on a separate
patchset, I have included it in this series. Please feel free to point
out if this is not appropriate for this series.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
Chuan Liu (10):
      dt-bindings: soc: amlogic: Add compatible to support more SoCs
      soc: amlogic: clk-measure: Support more measurement channels
      soc: amlogic: clk-measure: Add support for more SoCs
      soc: amlogic: clk-measure: Optimize CLK_MSR_ID to reduce memory usage
      arm64: dts: amlogic: a5: Add clk-measure controller node
      arm64: dts: amlogic: a4: Add clk-measure controller node
      arm64: dts: amlogic: s7: Add clk-measure controller node
      arm64: dts: amlogic: s7d: Add clk-measure controller node
      arm64: dts: amlogic: s6: Add clk-measure controller node
      arm64: dts: amlogic: a9: Add clk-measure controller node

 .../soc/amlogic/amlogic,meson-gx-clk-measure.yaml  |   6 +
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |   5 +
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        |   5 +
 arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi        |   5 +
 arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi        |   5 +
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi        |   5 +
 arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi       |   5 +
 drivers/soc/amlogic/meson-clk-measure.c            | 901 ++++++++++++++++++++-
 8 files changed, 935 insertions(+), 2 deletions(-)
---
base-commit: 87e20720aaadf9540c1596b05b93073a99d02258
change-id: 20260710-more-socs-to-support-clk_measure-c826f8ab9e68

Best regards,
-- 
Chuan Liu <chuan.liu@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
