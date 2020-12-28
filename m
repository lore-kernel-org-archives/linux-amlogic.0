Return-Path: <SRS0=E6Yr=GA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD57DC433DB
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Dec 2020 16:33:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88E61207B7
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Dec 2020 16:33:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88E61207B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lespocky.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fWq5hW+Axk4xK5AQ5gAr5WW4kqDZFIphEXDbciLAcms=; b=jaaioW24nbGaqFU0pfo4MRK9W
	PBfh7A3iu5bUTJvD4d1jrkfCazObEAXBE4B+4TOfkj0qWJk+07jHQ7YMgwt4vwPJZ0h9z03ZcEUB2
	1hhscpLbkL20bnCL66xQ945enGBdz2K24WeKxXi3I4ADDs83cCukWPLC+TjzW7eodGB+A+WigvAUv
	9NFL5EsFvr6n2/EKZ8j3+KCBUEb/RrI6GOHOg2/CzC/dudDDmwdxt6U1f6W9gPxT3qJInG2zy3eh9
	HRLxq30AgEpLZuXRbj5jKZyw3iP+Kllz1M80AK5iczucb5KS0z7+vY/eCoEyYLzChHBb0R8cJ7zIu
	QK6slSIpw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ktvSd-0005di-Uz; Mon, 28 Dec 2020 16:33:32 +0000
Received: from mout.kundenserver.de ([212.227.126.131])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ktvSO-0005ZE-Pz; Mon, 28 Dec 2020 16:33:18 +0000
Received: from methusalix.internal.home.lespocky.de ([92.117.54.172]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MK3BO-1kakAl18Pe-00LYy0; Mon, 28 Dec 2020 17:33:01 +0100
Received: from lemmy.internal.home.lespocky.de ([192.168.243.175]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <alex@home.lespocky.de>)
 id 1ktvS3-0002GQ-UH; Mon, 28 Dec 2020 17:32:56 +0100
Received: (nullmailer pid 32623 invoked by uid 2001);
 Mon, 28 Dec 2020 16:32:54 -0000
From: Alexander Dahl <post@lespocky.de>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v9 3/4] ARM: dts: stm32: Fix schema warnings for pwm-leds
Date: Mon, 28 Dec 2020 17:32:16 +0100
Message-Id: <20201228163217.32520-4-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201228163217.32520-1-post@lespocky.de>
References: <20201228163217.32520-1-post@lespocky.de>
MIME-Version: 1.0
X-Scan-Signature: 36fd1d55df1a518e40d0076c137e1855
X-Provags-ID: V03:K1:LimgWNDLRRVaCNMFJ+i8uoeo7wemoEqSTqKIxlEjwEQ0TAFGuEF
 giflE4niugQcsvUU03fAn7MZtYe0yiKtyYHhcinoIFrm0EL1hfhSgXxxogmZgjhDw0GJGAo
 gnw4rIbBS3xmUwabYbz3VxjgpcnKvJTCVDmD596yvbM/yFNWAoL/r+ZqihH4loDs1yvLvS8
 EZkd8Z5h/dhqRv2iqJfjw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SRKurWlsH04=:ZZo6M80gCHdBDukFBDuNcl
 cW3FHOCbtY1D1gzP68XLOr4owTJJYM0qqPUDoHdpTsB5c02qQZINbdknIQxUuKeHukJgVc6+S
 Z4QBAJsTK3SQMi8gKHg9z1HhJNNy/uydY88DGi2MIy1yfrVRCc36kkV0fJ0rwju9MQXIHJf7Y
 59dS32EvXgACAHgVeawKAH9QtZct6FGgZe4SsTSRjD/Og4TnldOuV3juNPL1hRIKjbc48DNVF
 EqTLOR0kYduP1wMva9WjTk/JiVdYTmnG9YkIAa9WZPXE7r1yFRtjtkeOn3BfUd16xLw0xCL2h
 FvEvz+fjbNFp0h3McyFFeVnw+0+TGV+/iMPVrmkl3b0QlE6Mz6DNMB6/KTR+XWkyn2TM8JkW/
 CagKjGdtuNNbw2O+7aX29X9bo2uvqyOI/PBGlt65tmsBlY7SLgxU9ppdlz2L9nXYMYd+Hjwpi
 SfOMsK60AQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201228_113317_143862_6C331033 
X-CRM114-Status: GOOD (  10.74  )
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
Cc: devicetree@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Alexandre Torgue <alexandre.torgue@st.com>, Alexander Dahl <ada@thorsis.com>,
 linux-kernel@vger.kernel.org, Alexander Dahl <post@lespocky.de>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org
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
Acked-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---

Notes:
    v8 -> v9:
      * added Acked-by (Ahmad Fatoum)
      * rebased on v5.11-rc1
    
    v7 -> v8:
      * rebased on recent pavel/for-next (post v5.10-rc1)
      * updated indexes and added comment (Ahmad Fatoum)
    
    v6 -> v7:
      * split up patch (one per sub arch)
      * added actual warnings to commit message

 arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
index cda8e871f999..1e9bf7eea0f1 100644
--- a/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-lxa-mc1.dts
@@ -36,34 +36,35 @@
 		stdout-path = &uart4;
 	};
 
-	led-act {
+	led-controller-0 {
 		compatible = "gpio-leds";
 
-		led-green {
+		led-0 {
 			label = "mc1:green:act";
 			gpios = <&gpioa 13 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "heartbeat";
 		};
 	};
 
-	led-rgb {
+	led-controller-1 {
 		compatible = "pwm-leds";
 
-		led-red {
+		/* led-1 to led-3 are part of a single RGB led */
+		led-1 {
 			label = "mc1:red:rgb";
 			pwms = <&leds_pwm 1 1000000 0>;
 			max-brightness = <255>;
 			active-low;
 		};
 
-		led-green {
+		led-2 {
 			label = "mc1:green:rgb";
 			pwms = <&leds_pwm 2 1000000 0>;
 			max-brightness = <255>;
 			active-low;
 		};
 
-		led-blue {
+		led-3 {
 			label = "mc1:blue:rgb";
 			pwms = <&leds_pwm 3 1000000 0>;
 			max-brightness = <255>;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
