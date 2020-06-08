Return-Path: <SRS0=J82+=7V=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D17BAC433E0
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Jun 2020 23:24:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB319214D8
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Jun 2020 23:24:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Cm5KcUsm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="xOln4T7m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB319214D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Knnh5Ci/xcC60qQ4NSyRoWcfwFQFnFs2ZNN5xqDfx58=; b=Cm5KcUsmfXz4BD
	Xp31M1vHNBOXf6F2VJtGD7HEWEILybOzOBN4fcGDvp3Hs0AqeTsv7X+228ueL/HFl9o6uKb22yokn
	i01K4wcLQAl/lAn9hMpFvG9v5mqLyRkILg8sTmhRvL5u13zb19PoeYDX3/WNJFnkm5Qj5irAbFpr0
	7MjlMxYLQUGrNFAvHK+97CUKD4o2OZJejIqzujFNTk4V+RGFFZ6ZIROlzWm3reG8lKlFyfrsU+0z8
	YDaO05p1NY9MiPIEmrQfZ36LzqAZPBSHSd9u+8+UqfDD+EA2no841BGiOrCZJ83pb8xlQzr0p8IVY
	Cs2Q5utONkGkDZTubsHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiR7t-0003Ub-CH; Mon, 08 Jun 2020 23:24:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiQxI-0006iQ-F6; Mon, 08 Jun 2020 23:13:34 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E9BAD214D8;
 Mon,  8 Jun 2020 23:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591658002;
 bh=mnT9exT/fvQwG63m42+9Iftl9jERWCZuns3xk0LrKSM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xOln4T7m5U/ly0SZ0D/VZCwGunRBH0nC6QoTmU2Xgb2dHSeNdYAG79bcYdNacSgZO
 8XPLKDUt1SCTeVMAfFUctneNGAh7fPvmh7P3vHvJjShkHLZYceRs0TcdGXAAfCMEau
 /loJG2eHc9C+qclLN4zsEFgH+JzQlPISmMnsC9C0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 059/606] arm64: dts: meson-g12-common: fix dwc2
 clock names
Date: Mon,  8 Jun 2020 19:03:04 -0400
Message-Id: <20200608231211.3363633-59-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608231211.3363633-1-sashal@kernel.org>
References: <20200608231211.3363633-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200608_161324_754601_62E814EA 
X-CRM114-Status: GOOD (  10.67  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Neil Armstrong <narmstrong@baylibre.com>

commit e4f634d812634067b0c661af2e3cecfd629c89b8 upstream.

Use the correct dwc2 clock name.

Fixes: 9baf7d6be730 ("arm64: dts: meson: g12a: Add G12A USB nodes")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Link: https://lore.kernel.org/r/20200326160857.11929-3-narmstrong@baylibre.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index abe04f4ad7d8..eeaa95baaa10 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -2204,7 +2204,7 @@ dwc2: usb@ff400000 {
 				reg = <0x0 0xff400000 0x0 0x40000>;
 				interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clkc CLKID_USB1_DDR_BRIDGE>;
-				clock-names = "ddr";
+				clock-names = "otg";
 				phys = <&usb2_phy1>;
 				phy-names = "usb2-phy";
 				dr_mode = "peripheral";
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
