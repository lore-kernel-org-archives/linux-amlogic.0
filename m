Return-Path: <SRS0=wDd0=FC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F21A2C64E7B
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Nov 2020 21:55:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D0C920857
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Nov 2020 21:55:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bnl5c3mM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D0C920857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lespocky.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SfD/JdOnK56hT7Fltpok3uFb+kE3Wy4PQnkLjKOOrfQ=; b=Bnl5c3mMklxkaYcdUZtZJhCFe
	U5rqnaImjEotCYIzRHJ6USS37i2mfbxNOtlHqJSYJaIP0FrvKKUelbqaZSqxY0V+S2yfxAg+brtJG
	93YOYKNin1/y9UzkM3WB4xv1RBA5rBOopF8RRfKvN4Y/a5m9gYHQjqevSwCGmUpgLMiVDHQ3K1MPV
	Z6ygjFMyCf27QkexLgLKR8aYZDOGJUG0sp8tVAMxL0nPl3MaFiaJpSNQrAtY6+RDjgDMeat3MiBde
	BuxfFSSfWJBytMi1OFwOfb82FQXHkq4k6HUL8LhrS/6N+wnYAzuV2Q9IQSWC3gaM2DB3i8VwOAD0b
	IGSLcivtg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kj8BN-00048z-OV; Sat, 28 Nov 2020 21:55:05 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kj8BG-00046r-FS; Sat, 28 Nov 2020 21:54:59 +0000
Received: from methusalix.internal.home.lespocky.de ([92.117.45.147]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MWiYo-1kgvGg011s-00X6B6; Sat, 28 Nov 2020 22:54:46 +0100
Received: from lemmy.internal.home.lespocky.de ([192.168.243.175]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <alex@home.lespocky.de>)
 id 1kj8B0-000288-DU; Sat, 28 Nov 2020 22:54:44 +0100
Received: (nullmailer pid 4111 invoked by uid 2001);
 Sat, 28 Nov 2020 21:54:42 -0000
From: Alexander Dahl <post@lespocky.de>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v8 2/5] ARM: dts: berlin: Fix schema warnings for pwm-leds
Date: Sat, 28 Nov 2020 22:53:50 +0100
Message-Id: <20201128215353.3991-3-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201128215353.3991-1-post@lespocky.de>
References: <20201128215353.3991-1-post@lespocky.de>
MIME-Version: 1.0
X-Scan-Signature: 467395612c70a9d75b41506b3ac52c2b
X-Provags-ID: V03:K1:yLxbQe4fLlXjVIaFuag2S2PxaFAqe3BTGyh1CJ6YB9L6+GIZdAz
 SFmE94IzR094e/EdVMhrwcx7BUeFyUtjXwpE9KlI/WtZJG2V8lU4H2gMeA+zHaSPVabwvQX
 IU04uuFDKF3HKybmoNvlRalIKPSH6n8T0wNwhvAxisGg+2T1MWOLEiXyg5oapanB3SVFD3B
 Tz/I/ipnH1jMBIWuaGlPg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VoId4h40b8E=:NvSURxE0qdKPIEw05FiB/W
 l/ch44701hupU0PgW3Pa0l3SMKOBB0kAgiNrVUbSvleykRjPTMlQUw2irN2rlGPwBXwf5LRuE
 XhILhZ1Ko2oGVUCBu/XjOmHCPcHNIRpg8juJIhUoLT2iQuNMpTdr1qpBZth3SG5wvZstmo32s
 k7nI1x5cfP/+b01nhAlfrGsEpUsgencXoLF89/95RO3v1LORM8oEyKwq7TyxzWUHcI509p5Xo
 o4o9njOqr4SFtraNOVe+x6V8+twLdrvji+QrvbcndJ9Jg6uQKfJVdzGz0Z0QBHWGZ7csUYM2o
 0Sj72o42CwSJ6yMi7HmaENumcy0J3ms05q0900ScH6tk7G1QsSWRVvvDt/2uEINo7mOY9TBQm
 hbTLRp91Zeoeo3gjwaPBH5Kwv6mvTVhhxQNYADbQcZ7Jfkaytkn0KDtWTUQQMkNWtHTNAJYJR
 1zG2QhmTbw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201128_165458_924146_BFDA968D 
X-CRM114-Status: GOOD (  11.39  )
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
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Jisheng Zhang <Jisheng.Zhang@synaptics.com>, Alexander Dahl <post@lespocky.de>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org,
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
    v7 -> v8:
      * rebased on v5.10-rc1
    
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
