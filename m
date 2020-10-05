Return-Path: <SRS0=hoO3=DM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D46AC4363A
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Oct 2020 20:38:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F874204EA
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Oct 2020 20:38:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ztlKlFIz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F874204EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lespocky.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=X6CN1fDPtmIDSkfzUEFFH/40MmkuUgbWm2yfrokj6J4=; b=ztlKlFIzgZR44qGPU2cuZ75HD
	0WkdIpPK26xOC6aYGapusHVMxU4B4iy1XPEx6Brg8YwLhxOo93k7QpYJC9uT/9zxk1Jw8bvC5ZUTt
	jtQR5xab7Mpzpudew9snildWlc59KzgIpoWw/hBIfZx1mftu4QUoHsmCJo0P9vMFcfxoc2diX9CRV
	PF4mwFQyTYAsCJZgKKopVoelEC8wdBy5zmv1a8TP/+gLyOYi+fzXMFPmSZwpxw/MYJu6Mps2Amukf
	AkzH3PfZQj+XnOs2i8MhvrnnA9McR2yjewmQtZdx8CLIfo2KBcFgzqC7JMvlout9o5ucxPEhh8z4i
	y1h4gkEMw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPXFy-00083D-RM; Mon, 05 Oct 2020 20:38:50 +0000
Received: from mout.kundenserver.de ([212.227.126.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPXEY-00075a-GI; Mon, 05 Oct 2020 20:37:23 +0000
Received: from methusalix.internal.home.lespocky.de ([92.117.55.152]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MUGuZ-1jyPZb1tMx-00REKR; Mon, 05 Oct 2020 22:36:00 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <alex@home.lespocky.de>)
 id 1kPXDC-0004XF-0c; Mon, 05 Oct 2020 22:35:58 +0200
Received: (nullmailer pid 10388 invoked by uid 2001);
 Mon, 05 Oct 2020 20:35:40 -0000
From: Alexander Dahl <post@lespocky.de>
To: Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v7 10/12] ARM: dts: stm32: Fix schema warnings for pwm-leds
Date: Mon,  5 Oct 2020 22:34:49 +0200
Message-Id: <20201005203451.9985-11-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201005203451.9985-1-post@lespocky.de>
References: <20201005203451.9985-1-post@lespocky.de>
MIME-Version: 1.0
X-Scan-Signature: 5d1699e822705c24f051c25a2c63fb4e
X-Provags-ID: V03:K1:6ZKlG0rDZ5U1HQ7ILaIQAQNhKsTXV0TSWVRTzdpESm8fmO/tqwD
 iK4rNm/LJgtYztQSGYN9mW2xOwWJqbOhPMTtcK0uMXIKykp/wPaXJdVtzJPD9fS68IFAo13
 m8pjTU++ifqTH58lQckSCePhpI7rOcl9djtxrldlZORvq75IKTz+HyXe6R1Ro14yadqgFaT
 yWxI/4fKVjFWSsSAD+Scw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HfmFjwagyQ0=:h4dYDYwyiy8+d8FNw1Tme/
 r9lDpQaopjx5uAFoZpCL/Sfgflnwwqv7WCVOingGfgSngvmlV8afjKAsdcbXb1invDLOs/m4o
 FRTZ0gcC2VNPdbdZ6gNpvxbSVQFyKlAIoDJstuxvz7C9Xia1cZwKeZQzvbpMOex8Iftfxb+ri
 pvBb/pE0O1Iy2okCv/W4sRx1kFtwJN6Qj2BAFuilTCk9M74ttuKlqRC3pGDq3wb4MuRO5nOhM
 bCrgUYF1thmP0ZWnlJQvAuu+XAlvbrlf0xBPtNaDnrCOG0bj3OfYsUnVw7Pl3ItulFUgoGjwR
 bTN6k+2rYXcKHYWWx7JTQEEJAJZ/v10n6Idw7NqrbwHlN/kAWMssThoV7eL56F3fIW9gi6fJr
 7oz7b5beUetnfvzz8GKLKxZ71DYKKnyzdV6gOVKi/wXHq1IgJr9GaC/02nJJboX3QtNo+z8SD
 XPd6uZGSiq/M7DU4xiAomk8WVT3O/+gxRhpr0lIWm5Q1lt5RF8GJU/7ySadWVWtFTAXHb7R9f
 cWmfIPSLFqWbwuj3hf0Zma1sC55eMQ5NEvJA/00bE8hRE+gTXzZBBFUgxhaLkJXT0KkHfGRw6
 xBiTtP7BsZza7AMHilLGg07Dbji5b19SqrKQET728usCQvFHGjyecAjd41SPv6TzidPqNyojd
 ipJphF2BvRdYxHWsKqS0zDJbdxVZPOFftntG20ilDgZG/L0HyN3VCxm1cDYiNK4utBnpkNbDl
 6d046gXSkxPW0BHlPdD5I0LSChWLPT+BEu4NZchrs5hwMzCHmaA87WM/b0WmUp9zMYoAT2xtM
 FXPk2j6rpzJswBRN3vrEoGBNNux4O4JMoZ17KgGvguzn9fZ6HoQA1AHShUJEtC/9W/vwvpN
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_163722_754535_1D49E0A3 
X-CRM114-Status: GOOD (  11.63  )
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
 linux-samsung-soc@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 Alexander Dahl <ada@thorsis.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Alexander Dahl <post@lespocky.de>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The node names for devices using the pwm-leds driver follow a certain
naming scheme (now).  Parent node name is not enforced, but recommended
by DT project.

  DTC     arch/arm/boot/dts/stm32mp157c-lxa-mc1.dt.yaml
  CHECK   arch/arm/boot/dts/stm32mp157c-lxa-mc1.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dt.yaml: led-rgb: 'led-blue', 'led-green', 'led-red' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml

Signed-off-by: Alexander Dahl <post@lespocky.de>
---

Notes:
    v6 -> v7:
      * split up patch (one per sub arch)
      * added actual warnings to commit message

 arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
index 5700e6b700d3..25d548cb975b 100644
--- a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
@@ -36,34 +36,34 @@
 		stdout-path = &uart4;
 	};
 
-	led-act {
+	led-controller-1 {
 		compatible = "gpio-leds";
 
-		led-green {
+		led-1 {
 			label = "mc1:green:act";
 			gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "heartbeat";
 		};
 	};
 
-	led-rgb {
+	led-controller-2 {
 		compatible = "pwm-leds";
 
-		led-red {
+		led-2 {
 			label = "mc1:red:rgb";
 			pwms = <&leds_pwm 1 1000000 0>;
 			max-brightness = <255>;
 			active-low;
 		};
 
-		led-green {
+		led-3 {
 			label = "mc1:green:rgb";
 			pwms = <&leds_pwm 2 1000000 0>;
 			max-brightness = <255>;
 			active-low;
 		};
 
-		led-blue {
+		led-4 {
 			label = "mc1:blue:rgb";
 			pwms = <&leds_pwm 3 1000000 0>;
 			max-brightness = <255>;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
