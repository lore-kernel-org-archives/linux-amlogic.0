Return-Path: <SRS0=AMvF=FF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B625C64E7B
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Dec 2020 13:22:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98EA9207FF
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Dec 2020 13:22:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gp3MV430";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=agner.ch header.i=@agner.ch header.b="E8FWOCDF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98EA9207FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=agner.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OVOpdQJDgYC4xvu5gL2eYRTvNoKQkLXY3CFM4T625Bo=; b=gp3MV4302018FQs2pmFqh6WyN
	cti4h83j+nqV6+9ux37WXGsGrjMbtgEZQ4Fvmic4l9RNLCwG+VZA4ivTE21tRxa1SBzhVGVNHQKvh
	rPLBOpbQd9FHNDk8fYpQeo6ZIP58eUglJC/mgoJpOUYrNGKamJiZIKqE7Edfhq7DWzHcWatoMrJdS
	aLsUuLey20Ve3Zjv1hssNM4FrFpvXxkdxSD4FmKan8DNABcKndOQNxur2kLlBykn+PW7yta6RbgkR
	oe5Yggmac6DwBm7XkPOxoAYIyM1b3ChVpChWjwjykC6g7N253UCOeWaUnRmXm+1cpI5AMypr8OrnM
	L9/3IN60g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk5bP-0002qm-W1; Tue, 01 Dec 2020 13:21:57 +0000
Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk5bM-0002oD-E0; Tue, 01 Dec 2020 13:21:53 +0000
Received: from allenwind.lan (unknown [IPv6:2a02:169:3df5::979])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id C07EF5C2AB7;
 Tue,  1 Dec 2020 14:21:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1606828909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OtFe8i1obXmaq2UarSATtwgKWDwPVnyMFK5sF7gJVHo=;
 b=E8FWOCDF8u8bEc0WDVHeUhTm80cxqxN6gUgJr0snnbvuwDItpg85MqJNozVieUcYOAlJCe
 /ywDxatSQpyIpArJ3Oh4VKlfausKGG9g2OpDhGyBKQYaatrO/eYT/oiV8RQfctxhVPmLZT
 BK7N3I0uKpvp5+O931zenfIGPbiWNwg=
From: Stefan Agner <stefan@agner.ch>
To: khilman@baylibre.com
Subject: [PATCH v2 4/5] arm64: dts: meson: g12a: x96-max: fix PHY deassert
 timing requirements
Date: Tue,  1 Dec 2020 14:21:40 +0100
Message-Id: <83c1a57cb99c04dc31098166f0c26073de5e7709.1606828668.git.stefan@agner.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <14754fd95378b78eb9a0a3f8b6bab13f7263c7f1.1606828668.git.stefan@agner.ch>
References: <14754fd95378b78eb9a0a3f8b6bab13f7263c7f1.1606828668.git.stefan@agner.ch>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_082152_704040_0B6D1C06 
X-CRM114-Status: GOOD (  15.43  )
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
Cc: devicetree@vger.kernel.org, narmstrong@baylibre.com,
 martin.blumenstingl@googlemail.com, christianshewitt@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, jian.hu@amlogic.com,
 Stefan Agner <stefan@agner.ch>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

According to the datasheet (Rev. 1.9) the RTL8211F requires at least
72ms "for internal circuits settling time" before accessing the PHY
egisters. On similar boards with the same PHY this fixes an issue where
Ethernet link would not come up when using ip link set down/up.

Fixes: ed5e8f689154 ("arm64: dts: meson: g12a: x96-max: fix the Ethernet PHY reset line")
Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index 1b07c8c06eac..463a72d6bb7c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -340,7 +340,7 @@ external_phy: ethernet-phy@0 {
 		eee-broken-1000t;
 
 		reset-assert-us = <10000>;
-		reset-deassert-us = <30000>;
+		reset-deassert-us = <80000>;
 		reset-gpios = <&gpio GPIOZ_15 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
 
 		interrupt-parent = <&gpio_intc>;
-- 
2.29.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
