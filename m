Return-Path: <SRS0=xPAz=DH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1203C4363D
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Sep 2020 23:48:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91F3A20B1F
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Sep 2020 23:48:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e7kqyG6V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91F3A20B1F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lespocky.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FhLPnHltDhRhI+9TkGZKpsFLd57UFbTxvTvnEjt9ZEs=; b=e7kqyG6V2eXMoyBXHfX7oUmZ3
	9xw5KSY8CXptrakgRF66gkMDYR9+zEhZtaFzOeAvwow+1EdeYlFjFj71exyOmSwAp+uf+h3glJexL
	QotrC7CMEYnA0VEywK/nvuDhjCivpAH2V9PYrSC6DGKjWsILB//B4pX43ytiqSpHu+zcyVjymfPKe
	DBi7MN55SwicUUSatWDp40AqNri9jasbdhaMc+G09yNPnYxX+W4ebPaw5GTuAukwQzev8ZgnhlEa5
	BjU8wCi72+6M8X00HfZC61ouMG7hdSnLclgkJHcZAX5adPdkp/E9T1vxOL7yLpJRXwDPNqXmR874E
	2GpQIFobg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNlps-0000fs-RH; Wed, 30 Sep 2020 23:48:36 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNlpN-0000T8-46; Wed, 30 Sep 2020 23:48:06 +0000
Received: from methusalix.internal.home.lespocky.de ([92.117.51.117]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MgRYd-1ku3qH3u3T-00hvd8; Thu, 01 Oct 2020 01:47:55 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <alex@home.lespocky.de>)
 id 1kNlp9-0007aF-MT; Thu, 01 Oct 2020 01:47:52 +0200
Received: (nullmailer pid 7817 invoked by uid 2001);
 Wed, 30 Sep 2020 23:47:51 -0000
From: Alexander Dahl <post@lespocky.de>
To: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-amlogic@lists.infradead.org,
 linux-mips@vger.kernel.org
Subject: [PATCH v6 7/7] MIPS: DTS: img: Fix schema warnings for pwm-leds
Date: Thu,  1 Oct 2020 01:46:37 +0200
Message-Id: <20200930234637.7573-8-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200930234637.7573-1-post@lespocky.de>
References: <20200930234637.7573-1-post@lespocky.de>
MIME-Version: 1.0
X-Scan-Signature: 47063c0bd3b0440d119657da58bc7562
X-Provags-ID: V03:K1:0IUo1RRU7aAo8lMj4tzZs2tdPUuRWx/DVg9fWHk99XurY6GYSNC
 hi0k4Y+6Rvd2A96ObtnJkZ9b7FaJC8oTKeQjrqDQoiAJi59zcVISDFtcTQC5r9ppEjXMxT5
 9JZqTtubXCNiBVhQw98FxKkqHLFjh1VvJjlQu5KTRSOTFE3yj4N8WYGh5qJoe9yvg0/N+ST
 0mF0lowsi3Ph4kHDEtMIg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hvz3tk245Nc=:g/QpxKPbn4M8s0R+crrBqj
 I2VmIhXT0H7hfD8iolSFiF5pfJk1jjHCbJDejpW5i0xcUHXHkdYYHUrgIB3eI9wb+b/7vg5os
 xvWLdtfnoYeBwjaw24UwhpEDoqWI2Stidl9ttPKsn2XyTzFoAqCWkXn5Y6yLtWSwu+YxKnbsR
 CE3a6lcZ5kEq+sR2ILpVKekK9s4DRQWL6sQANVGACBsgkAeObJ8FC97ZZHv0GcygW2c2nnc9U
 +wMVs+C/roYWYmcllk45fidSri4t03BmK+fmDA1k+/nuUMAlovJP7Pp9qwaMUIM34eh0pKIyP
 8QtBnQEMIRFWTpM9uAsL1jj78mPi6XvnhhyBIzPXuFQhZ12cwrc40RWV6MklzwnCLIA7toh38
 Y+XvrZm1Em/xkAUE7duoH/OhVXEL3WAR2UlLSKZBNRPCzlypMfupOpqitnWzWQVbv4lvmaTAo
 Ds5kC4JTHvuLe3lg8LzBGi5GT0z3dfrfy55HpxqB1bKDuj/mg7YdbrWIJ9qVQJOvPOYah0voW
 9r8BeiDejdWckpDWwy56KFtzd/mXRFJWOI4WbLeSvWoFrzg5ssp4AXIpYO6Y2rKaJ4vf+wP8J
 eZzHp7dKotPf2kJs60pqfdQ22V7kBtUSqO0ku+MOnATpx6GxR3nsRkWFjtpbzUUstBNc5bVFj
 AD2Y5Kp6KE5e31OJ7uFLHs0qwhSMD1rFunKe7UBse8Ja9COyvP63eXD3P1MiD60/LqogT8+MO
 IAY8Rc3GLJd2YsoER8rtHAf6PP10Xb+FQFK+2gu6aBl8oLVX+kwiKHyNukJ+MB5i0op1yAnlb
 fECpu3O/2vxpuM4an/qjA4csLsG9xhGj14Gdptg8z0hrmD7UhYQRJRhkzNpGlzDPsCCg0D3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_194805_390063_57C79489 
X-CRM114-Status: GOOD (  12.44  )
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
Cc: Alexander Dahl <ada@thorsis.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Dan Murphy <dmurphy@ti.com>,
 Pavel Machek <pavel@ucw.cz>, Alexander Dahl <post@lespocky.de>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The node names for devices using the pwm-leds driver follow a certain
naming scheme (now).

Signed-off-by: Alexander Dahl <post@lespocky.de>
---

Notes:
    v6:
      * added this patch to series

 arch/mips/boot/dts/img/pistachio_marduk.dts | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/dts/img/pistachio_marduk.dts b/arch/mips/boot/dts/img/pistachio_marduk.dts
index bf69da96dc8b..a8708783f04b 100644
--- a/arch/mips/boot/dts/img/pistachio_marduk.dts
+++ b/arch/mips/boot/dts/img/pistachio_marduk.dts
@@ -46,9 +46,10 @@
 		regulator-max-microvolt = <1800000>;
 	};
 
-	leds {
+	led-controller {
 		compatible = "pwm-leds";
-		heartbeat {
+
+		led-1 {
 			label = "marduk:red:heartbeat";
 			pwms = <&pwm 3 300000>;
 			max-brightness = <255>;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
