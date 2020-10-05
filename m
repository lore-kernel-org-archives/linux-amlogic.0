Return-Path: <SRS0=hoO3=DM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2003C47429
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Oct 2020 20:36:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67AE1212CC
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Oct 2020 20:36:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iWKkWWoy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67AE1212CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lespocky.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=W4shlon6JqcBvrN4kh6GIO8pEpzweq5eEWcC5k4Hdxc=; b=iWKkWWoydXWqeKA95C5W+z/mx
	5GlD0uuTZwYRX9P9DaD5i9ycp+5rJXQIP6c6FC3A5CEIlcoiFVZl5IKSmfJpHJHdxnOlbCtqxTFfA
	lp60bDHs7jvijLhxIQ6LNTPjkruByoj7VEsSQli9jEAnU2pnBqHAyaV2iO8rF+J/To7GdVGnarpoL
	wpXmI4PbGvpQEFNdXWtjTV+loXxzekP4rsMdHk40lhuDRO6zOMb6eybZgrTYdELmafBXvamZjfb/Z
	yq0GReRiHrMKoI2RrTR/uaVpgAfYNOt+fO8qajuJY3vMzoimaUElACQZ+r/Ig9GkCh+pynaeCl9jq
	mpzgUso4w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPXE2-0006mz-QP; Mon, 05 Oct 2020 20:36:50 +0000
Received: from mout.kundenserver.de ([212.227.17.24])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPXDR-0006Vb-4U; Mon, 05 Oct 2020 20:36:14 +0000
Received: from methusalix.internal.home.lespocky.de ([92.117.55.152]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N5VPg-1kRAoj34jS-016sx1; Mon, 05 Oct 2020 22:35:47 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <alex@home.lespocky.de>)
 id 1kPXCz-0004Vl-00; Mon, 05 Oct 2020 22:35:45 +0200
Received: (nullmailer pid 10331 invoked by uid 2001);
 Mon, 05 Oct 2020 20:35:37 -0000
From: Alexander Dahl <post@lespocky.de>
To: Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v7 04/12] ARM: dts: at91: smartkiz: Reference led node directly
Date: Mon,  5 Oct 2020 22:34:43 +0200
Message-Id: <20201005203451.9985-5-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201005203451.9985-1-post@lespocky.de>
References: <20201005203451.9985-1-post@lespocky.de>
MIME-Version: 1.0
X-Scan-Signature: 883e206fe91cc1c75a414c154095e545
X-Provags-ID: V03:K1:5ZDmDCrnMLx3t8rF84LEdt0tTtR8Fz7PUe/C49eHIKrHHckpnKI
 5cF2sq0KusblA1UyT1LyDWK4Lx3bF2aGfk1iGUgsONivlyK4O/264pTjy+QcghGG2DeLQH1
 NcN82XoGOPMsQsXJUt4vEYFcYLi+iiiCSJmwy/4vR1Kgc2x6lQRitMzLFvjv7+VfHbgGy8U
 6rpzJAtAU5CdOrFJ8KNpQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6z4X9w84V2Y=:Bk5QOnfSm45rYOQ9PzKPFb
 tRoe/FQgeDv8ozAY3XzzIgvx3Qau2hcSwYdJmzqUCpsdqETs4iHEPplJYXOc2FjzddjkxvM5X
 WKRv6zShH7A6vROm3qL02gfuYHiPpqIPk4+GBiGixiySzCoeDras5b96TXcNw6iUgXtisgtaE
 THcbqftbFfCHzilD2fy5mBRgouhoPtvXToaJrnKAltiLj2MOL3lKu+ChrhkbBP+GZDWQhQSsz
 ivPU0NzehlAJVhcVh3u7eQsgX7tpd8RIxx6YAWI/mC4fALmtyfr3p/2+phofXbyzO1UvrGDrr
 uQN2CrteXXfHnDFaEFY55sQ8+Ug33ofX9uB8EsQctv4l8BUk8afPVLzSRckd0fwiOX/ycfdti
 RjXiPILw7fp0Ljo/MAUeDfljGJinYU7EvwLOmy4XTjH/uOieGBtGor1EDTPwetypMyJkVE+QW
 14X7JXL2wKrrUN7wROmvZajT282/Ywma09Bxuz7CGkx9jh12y7yT4+RMGeCzr2xHjbIvCqny4
 X219GbiHDKvgzFlio1pmfPIzuwlZ4/mOBwCAXiCIFkBRYyXKL3tZ+6eTQyj2h0eTm/obw4L+n
 W+uxFbme/925gxoOoC17Aj4BGZSfuZIp/ZcOvqKZDej4TpThQl9ACpW5RP/AbnVkSP77yJhe9
 8vgD2EAokOfTio92ICoJrgHBbmC23DSz3E0q16TCnNVrMVM7KlNhx479k6cXUO9pOj7HBE277
 9NYOObU322OrY5PYWu/cAyj5MmomAVxu/+jvX3UmiwnGrXfag17KHPevc61mVWoLGtOLXKbJy
 yu+w9NadE7z2Yfgam0QeuxVW0hIHn3ZmN50+JUIPteo3I2NDQoihbc59+cqf9u5qj05HQr6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_163613_427986_2A4CFDAF 
X-CRM114-Status: GOOD (  11.34  )
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-samsung-soc@vger.kernel.org, Alexander Dahl <ada@thorsis.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Alexander Dahl <post@lespocky.de>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Do it the simple way like for the other kizbox boards.  This will allow
renaming the led controller node name later without breaking things.

Signed-off-by: Alexander Dahl <post@lespocky.de>
---

Notes:
    v6 -> v7:
      * (no changes on this patch)
    
    v6:
      * added this patch to series

 arch/arm/boot/dts/at91-smartkiz.dts | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/at91-smartkiz.dts b/arch/arm/boot/dts/at91-smartkiz.dts
index 106f23ba4a3b..b76a6b5ac464 100644
--- a/arch/arm/boot/dts/at91-smartkiz.dts
+++ b/arch/arm/boot/dts/at91-smartkiz.dts
@@ -84,10 +84,8 @@
 	status = "okay";
 };
 
-&leds {
-	blue {
-		status = "okay";
-	};
+&led_blue {
+	status = "okay";
 };
 
 &adc0 {
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
