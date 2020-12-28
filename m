Return-Path: <SRS0=E6Yr=GA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AEF4C433E0
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Dec 2020 16:33:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FE12207B6
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Dec 2020 16:33:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FE12207B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lespocky.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cISNAK4COhLzS2329c83A1wfARQjJJPdZ7vVk6O6ncI=; b=VPF1Y8axDD/uPzQzshEudFmKZ
	7Jm3LlLK4/By1NVAB0jVeafkF6gLEif1+t3UKlXD30gna4TCNINeIZwSa8tljfiDMCFz1sLZdxgAk
	PmOvsnDjcCbZVxLRYgAupPZjpimSQVBudUIbuZsQct4EYkZNJNAXo3x9GCFo/tpBN0/mrVVY2IZht
	buhO8I4ZhPNoBsxWyo/fCYfSWR/CzQMHdODTNDxszDxHHn6JCe44Roa6RKlZgddWMygL5slvx4IGz
	Y0iKtT9YLYqW26P7tleg4LpvTGzBIh6lxGkUzPLeGQVl4R2T4qV6wcYM8o7x/0WZFtI8KwwyslPkT
	xnPvn2jZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ktvSQ-0005a2-1J; Mon, 28 Dec 2020 16:33:18 +0000
Received: from mout.kundenserver.de ([212.227.17.10])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ktvSL-0005Xd-Nw; Mon, 28 Dec 2020 16:33:14 +0000
Received: from methusalix.internal.home.lespocky.de ([92.117.54.172]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MSbp1-1kRhLg0nZh-00SylT; Mon, 28 Dec 2020 17:33:01 +0100
Received: from lemmy.internal.home.lespocky.de ([192.168.243.175]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <alex@home.lespocky.de>)
 id 1ktvS6-0002Gf-OR; Mon, 28 Dec 2020 17:32:59 +0100
Received: (nullmailer pid 32617 invoked by uid 2001);
 Mon, 28 Dec 2020 16:32:54 -0000
From: Alexander Dahl <post@lespocky.de>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v9 2/4] ARM: dts: berlin: Fix schema warnings for pwm-leds
Date: Mon, 28 Dec 2020 17:32:15 +0100
Message-Id: <20201228163217.32520-3-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201228163217.32520-1-post@lespocky.de>
References: <20201228163217.32520-1-post@lespocky.de>
MIME-Version: 1.0
X-Scan-Signature: 1a0b367694e79faea72b17a9cb5f6f3c
X-Provags-ID: V03:K1:BIWACTo4Z6dV+m64LgCGv/Vy0/a5dj1c8GrQ+LVFfnAsjn9pbRu
 OvhYDB/heVEN49gTOdTW+6bhMTkcoYhEOv3lGnuGEoSrfmHnnponayTCeojRygBhzKmRDhC
 FzJIjHBySUsLsm1sQSTjG+Nn1i2VA2o7lRXEIY2ap6P/zSEm+E63f3SDda+WvfbPoUbblGI
 wbUdRWhp8lEWanbHhZEDw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EC0dEAJ8sXs=:15Cb8byaC2se/ynuP9EhBD
 Ooqmt4/MUCgEujHdVGQVHmW6C/dMw6yYFBsWJ2ERrla65NNNGNd4Uu9kpY/l60LWYkyUIUQa5
 g8R9c71pA2MC1iLa9W1PZQBx2CtsrNl605fqjaPc6q/hN/3J4PVAfoIat/MMIBmw6ZnO+ZQoM
 A9g1yf3jqlk4jLXrfohe9ZmS6p6Hlm8MDQ75H1SsvYUmc5wVQ0WRzz3x2P6JfJADS+wZ4u0T+
 +oGrc3ZjdDX9AxHGw/6IcdQlx1iaSv1vYom93p5F88b77Xz/SRAt/FKmxOxGqP1J3vtG0mpSi
 8NqiEFG03AkM6fxFJnFhxOhpExw1MtzgqDEbkEli7vacXisgq2M+zHAUDULIMnOjNGhZA0Kw3
 ZsGmQuMXDAmftPek0Zd/5JjXPrA47G8zULE4ndaTcfvMgpsmxkXhj71ALsU4fj40+GoNgJW9Q
 6Bmck/13LA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201228_113314_000706_405B0911 
X-CRM114-Status: GOOD (  11.19  )
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
Cc: devicetree@vger.kernel.org, Alexander Dahl <ada@thorsis.com>,
 linux-kernel@vger.kernel.org, Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
 Alexander Dahl <post@lespocky.de>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The node names for devices using the pwm-leds driver follow a certain
naming scheme (now).  Parent node name is not enforced, but recommended
by DT project.

  DTC     arch/arm/boot/dts/berlin2cd-google-chromecast.dt.yaml
  CHECK   arch/arm/boot/dts/berlin2cd-google-chromecast.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/berlin2cd-google-chromecast.dt.yaml: leds: 'red', 'white' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml

Signed-off-by: Alexander Dahl <post@lespocky.de>
---

Notes:
    v8 -> v9:
      * rebased on v5.11-rc1
    
    v7 -> v8:
      * rebased on recent pavel/for-next (post v5.10-rc1)
    
    v6 -> v7:
      * split up patch (one per sub arch)
      * added actual warnings to commit message

 arch/arm/boot/dts/berlin2cd-google-chromecast.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/berlin2cd-google-chromecast.dts b/arch/arm/boot/dts/berlin2cd-google-chromecast.dts
index 56fa951bc86f..c1d91424e658 100644
--- a/arch/arm/boot/dts/berlin2cd-google-chromecast.dts
+++ b/arch/arm/boot/dts/berlin2cd-google-chromecast.dts
@@ -34,19 +34,19 @@
 		linux,usable-memory = <0x00000000 0x20000000>; /* 512 MB */
 	};
 
-	leds {
+	led-controller {
 		compatible = "pwm-leds";
 		pinctrl-0 = <&ledpwm_pmux>;
 		pinctrl-names = "default";
 
-		white {
+		led-1 {
 			label = "white";
 			pwms = <&pwm 0 600000 0>;
 			max-brightness = <255>;
 			linux,default-trigger = "default-on";
 		};
 
-		red {
+		led-2 {
 			label = "red";
 			pwms = <&pwm 1 600000 0>;
 			max-brightness = <255>;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
