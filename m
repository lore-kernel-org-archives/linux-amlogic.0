Return-Path: <SRS0=wDd0=FC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D38CEC63798
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Nov 2020 21:55:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F89520857
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Nov 2020 21:55:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3etesQey"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F89520857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lespocky.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=I4cer0u3p3bA2oGITz++wZM8DU2giSVTNvMWLpD+U7M=; b=3etesQeywZEHhDXSFK7IwB0Kb
	LiyQeUB4aipkL7SAr/bbuEOpF5clDKq/aQ3aj3br0W6O2zJetRwHCowwjgcPqwQIqYofx4vxDaT1U
	zs4pzYyvjqKK1s/mkk536xa41L13zcTOhTxWb4k+MIasqmoECkxMVAGQOnBg54BOETL9ZneJ/jPZg
	PiunC99dsd+AxyvE/FQYVd2VVfqIimcgd7kkyiibzbwzSAVImVKY1XfwOCNQxD56MDMTeyKf6YzgN
	uRBSAIX8K6sAo4y/MSeHNKTWSyT3mxzFiOSDNM1wo1zKwNm+BhBugNcRTK7s8lqRyn9bsM9ABpUyu
	v50gfZF8g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kj8C9-0004Qx-Rw; Sat, 28 Nov 2020 21:55:53 +0000
Received: from mout.kundenserver.de ([212.227.126.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kj8Bt-0004Kx-C2; Sat, 28 Nov 2020 21:55:39 +0000
Received: from methusalix.internal.home.lespocky.de ([92.117.45.147]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MowT0-1kPnaD463C-00qUqX; Sat, 28 Nov 2020 22:55:12 +0100
Received: from lemmy.internal.home.lespocky.de ([192.168.243.175]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <alex@home.lespocky.de>)
 id 1kj8BR-00028l-4q; Sat, 28 Nov 2020 22:55:10 +0100
Received: (nullmailer pid 4158 invoked by uid 2001);
 Sat, 28 Nov 2020 21:55:08 -0000
From: Alexander Dahl <post@lespocky.de>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v8 5/5] MIPS: DTS: img: Fix schema warnings for pwm-leds
Date: Sat, 28 Nov 2020 22:53:53 +0100
Message-Id: <20201128215353.3991-6-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201128215353.3991-1-post@lespocky.de>
References: <20201128215353.3991-1-post@lespocky.de>
MIME-Version: 1.0
X-Scan-Signature: 5ccd8535a2f53357608f384c4c8220c3
X-Provags-ID: V03:K1:P2Y70kYg3CuoaW8dA2A8duhR9E0iY4+BlupumaHUtNIKfJBeMpE
 OEgb7CJ++1ExB2HMOrc+kjbDjIxt3D/u1QGmQdPN+lwOArjSw/jNEeftA3LbzW6RB+p45FY
 ynTo4IR46hHblnF+KU4SocDdQ3aXarkEBDGX3c+chthToemwFtl50WLmz7arkEAbywCCYX6
 FqGqXip+nP3GxNZD3gwMA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Mgwv/y2PQyo=:l6g3zbRgOPuTRcX6qX+csU
 0Z0rHM3WEDNVxmydmMlmuKHcygVtROPApeRsUkJltJJaK0JC9miqHjYdGdLwMqVeEnR7GQn1s
 eSXr6yQszpDcnetk0q3TOfwk96e+BtazDmR9J35o5X6nANSnThQxxAHfOHFjfjTQhMONtv3iP
 q9Ux3W2x+3jrHm00xXgB5Yu10DsPHF0JUTygljBbM7Go81k+ILSWltGIPlaoW53WEogsotnUR
 eMRm76Ro80+y/eRcZfc5mRzrvfCEtcfkIlbzHfcOwE1Ncqgu1fSQb75kKFJQetjQSl7yzVR3+
 pEOY4XZaM76uAFsOcjFvphMgjNelgVA81l+nt4AqGTSJxExDC+LLz17vx4FHR9vOnh8ffQCtL
 oFEzQGMkRVJSZXJgkuqNpK+UYUCKo7xCqOLl+B/uHG2k3K7HJHDwdFznlfpzzBeW+7avu3EGA
 FGGytYzNRQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201128_165537_708131_889E1F85 
X-CRM114-Status: GOOD (  11.31  )
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
Cc: devicetree@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 James Hartley <james.hartley@sondrel.com>, Alexander Dahl <ada@thorsis.com>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Alexander Dahl <post@lespocky.de>, linux-arm-kernel@lists.infradead.org,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The node names for devices using the pwm-leds driver follow a certain
naming scheme (now).  Parent node name is not enforced, but recommended
by DT project.

Signed-off-by: Alexander Dahl <post@lespocky.de>
---

Notes:
    v7 -> v8:
      * rebased on v5.10-rc1
    
    v6 -> v7:
      * added another explaining sentence to commit message
    
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
