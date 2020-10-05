Return-Path: <SRS0=hoO3=DM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07378C4727E
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Oct 2020 20:38:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81C39204EA
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Oct 2020 20:38:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eC2JGxCP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81C39204EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lespocky.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7QcKCqGQDTAD6B4kV8gMjoby4diqqDPbNSnf/BiKxRs=; b=eC2JGxCPRJn/bIGf6dhmRYw/D
	s0w0K+d1iaUX7H0oQph5lta6kbkGNPIS0UAre6aYK7r0lglTl4tz0RcYnCD7jXD7N/DX0FuEsQcx8
	zKyn+USA+y+vCixifB+xvYPNOANrzOxZgvjvioOHBo+KjBluubNhipi+LGixeQwTWfDsPMer2p9Ts
	3v43H3RNuaVNC0RYuz396MIg5UDTQyehS3LV2R8A2woizsJKLbjPK/xHWzKfmLjLqi7fwf7maNZZV
	Lu8PHsNROcsqPhxaC1ir3d7F818pRwM/VfoH02vTouwVUeWvfBcCisSxz+q4fdWocbMA+vbUPZmPS
	4KrGp4Kgg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPXF3-0007QT-06; Mon, 05 Oct 2020 20:37:53 +0000
Received: from mout.kundenserver.de ([212.227.126.131])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPXDW-0006XI-66; Mon, 05 Oct 2020 20:36:20 +0000
Received: from methusalix.internal.home.lespocky.de ([92.117.55.152]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MUD7D-1jyPZM0wd9-00RHu7; Mon, 05 Oct 2020 22:35:51 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <alex@home.lespocky.de>)
 id 1kPXD1-0004W6-To; Mon, 05 Oct 2020 22:35:49 +0200
Received: (nullmailer pid 10343 invoked by uid 2001);
 Mon, 05 Oct 2020 20:35:38 -0000
From: Alexander Dahl <post@lespocky.de>
To: Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v7 06/12] ARM: dts: berlin: Fix schema warnings for pwm-leds
Date: Mon,  5 Oct 2020 22:34:45 +0200
Message-Id: <20201005203451.9985-7-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201005203451.9985-1-post@lespocky.de>
References: <20201005203451.9985-1-post@lespocky.de>
MIME-Version: 1.0
X-Scan-Signature: 08386759e7be537865a5b4fcb90d540e
X-Provags-ID: V03:K1:guPzpHouZYsDItxJ2VwmbE1hLmLueuILeAA0xXEMRTr8ny0z7+r
 M3VxkcQRzNq7TcNvxUTN44v398fyE6l1UwsNy+sOkJ55ADAi0UH+IZ1CLzNvc0TdFoNddbM
 rSui4EMI2aeOPF4YWZqm3dTcuSii2/p926KHSS5wULYXMeaKLglCu/vTDZath05MJAqmrVX
 XjDGCBaLmQBJgWppPaTpw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4lr8xTdu67U=:hzBHJ/QNqSAwgrq3R+eD8H
 WuPjw6nUaTamq6r5jFDNam3zhDEfNFKmVxHso0zTYy1EHtHXpuoNMzsyL7/x8Tubpeu5X624c
 nBjBQ6acovXif9BSvybV5yl6EsbyoZvOnQi6A45UeM2FtsZF+XRwmAkH+NUFGl48QUtgycpuz
 SvhAihSpmLNRGUY72PdMYqcV0c1W368GFdnA88Vm2x0Td4nukNtlzSC0UZOZ2F7EnCKZwaYJR
 xu8L6eGfxpvwp8sEmBkEMKG0fXLPNw3GYEnPNuYXpCp2b25QCWDUJAL1K9T/evr5MRqBwXHBh
 GvhO0vlcny96SWQMuCyGd5LMvTIbWbWMc75hO11QPPgVGLIn7HMK1SmRCNjuTdHxLv7YIg3zV
 KVvz0Q7yk7bKuAnmNrNps93KCm7lNDaUlbN9PbGjaPg7N/KbnKeO3tmsIwScdtxneRhevCA7s
 HceGkoxPWA+8tqiDqMCI5ApYARI+REun0fY5gU1pidOSFVeeoAVBtZxH2A0rPY50La3mwLr/e
 6zolFkFt9rbI8B+emPZK8gzOVHGbecnqj4oIHescM8K2cNBQ5zhbWQsyL8j1YN7j+Eni4Kiys
 cbqc6miRKyUBwEkvt/4RPnVtBAz4nt0mEw5x0VSFI7mXjtRKmRq0QeNOVHpNlv2ubeUdvYPmQ
 gzD8lOe52bfrVOVGkpRKiAdHxCE8rRNrt7LGgwZDSsDh3rWXQpD55Rkz9GCw1ahBhybicw62w
 Mcbxs35mnFh92qROSR3s5dpEAdjmARpTXEDi1GezGvsP1kUWntamj7dt8ZSE3ykoWB30M7pKF
 acFVedDXKtG17m/5RclNm5OMh4IqqVDy7Ivmo8JKPBZgydARKA9GHUG0xiT4S7VLGZVVHMh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_163618_509497_2AC442D6 
X-CRM114-Status: GOOD (  11.50  )
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
 linux-samsung-soc@vger.kernel.org, Alexander Dahl <ada@thorsis.com>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Jisheng Zhang <Jisheng.Zhang@synaptics.com>, Alexander Dahl <post@lespocky.de>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
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
