Return-Path: <SRS0=hoO3=DM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A981BC4727D
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Oct 2020 20:38:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61EF9212CC
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Oct 2020 20:38:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="je72JjIk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61EF9212CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lespocky.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cJ5XoLiqkNefQeBHRfmp5pApqcjikF785Mh62155Ka8=; b=je72JjIk2qAzOj6mb2jLXNvK7
	5A4C4Vfg5eIuZM6FKm0jYaSXyeX2YbzXn1xq/OsWt1mSksvrHljFIyymAhvoBoPOX2+feh2jSOmNt
	JxDU84b46vQfe2gCwBL2AtdItrwkv+yIBfH9yghwWi8uX/PpAWbtjNA/IK62lVZdUBfGLrTaNlzii
	f87cV9q6ILNSNMmsU7jewW+XBABP7wl/EPIr78pAsmesEBu5t7Sl/9qa8Gbsta74Y6+IegTD86wfN
	mDY74t0R7chwT6nTFaSPr+7RCD7YRTu+6ruAXanqnnLJRaN/yGLRi7xpppqbW770DPJEQu+eiKuxq
	i5MmZyoyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPXFK-0007cp-La; Mon, 05 Oct 2020 20:38:10 +0000
Received: from mout.kundenserver.de ([212.227.126.135])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPXDZ-0006Z2-PO; Mon, 05 Oct 2020 20:36:23 +0000
Received: from methusalix.internal.home.lespocky.de ([92.117.55.152]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MDhQt-1kH2ss02o3-00AnRe; Mon, 05 Oct 2020 22:35:57 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <alex@home.lespocky.de>)
 id 1kPXD8-0004Ws-Og; Mon, 05 Oct 2020 22:35:55 +0200
Received: (nullmailer pid 10401 invoked by uid 2001);
 Mon, 05 Oct 2020 20:35:41 -0000
From: Alexander Dahl <post@lespocky.de>
To: Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v7 12/12] MIPS: DTS: img: Fix schema warnings for pwm-leds
Date: Mon,  5 Oct 2020 22:34:51 +0200
Message-Id: <20201005203451.9985-13-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201005203451.9985-1-post@lespocky.de>
References: <20201005203451.9985-1-post@lespocky.de>
MIME-Version: 1.0
X-Scan-Signature: 07736050a5de048e796b12253fbde497
X-Provags-ID: V03:K1:p4vODZJGo9+t9tn9s8bm4upQ45uAf97K+kjoIIIPTinrUJiiStE
 rpcrEB7DJRk32pGB4QvhMU2kgfy+90tUnfDra74bIY6U6B04OzthKrpNFh7xKKN1Gylf3ML
 M3fkSZXJlDQJ5SC3TXFZ1Hzj09ektnkRJBP44ne1uXMx4Mhh69+N0DcUbRBP5wlygsn30tu
 hA0wVNMjT6H/AFtUGeUbQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lKjCGNqN9aQ=:4OCCRZ6yOVkWOUuDTdYsdd
 4ItDgizdlZGX+PKDphO+HBFjymNxyMfq5iQMT7m+y46EQz/WLOocZVFdys6DIc6yvFEBq8NkR
 1PEPPIsQ+C/aPYgYDndLnparpbI87W9bD+5cdQ3RjkqO2kMhiYt9t/Cvfcn1j/QCUlltsHSIz
 H9+pqdrYEIBKuQJFbKU+zbmvwIO+T/0cJR9m1PY0nLXSJyj1fgVqiejlsQ+qVss4Z/92Ztw5o
 fTRSUJOBdXUAjKuevujspz5h9FF8MVKB4MAgYa0nz4TFeXq4o0SE8BZvbVt/xI6F8koLv75AD
 DIXSHxUS8oAGoV2iFIWtCBDlxINivP2hEO45HCrfbKGMiIlHr7uNdgY6VnRJecAd7oLovXw19
 wIflGa0BkD4W/l8gSP7zxisvaQZRoiy/Xk473WxxSTKHaJ4sBvju04Ye1bZNtccGuK886JNif
 whQBFSbiE4tM5jUXrzdcqCHOK0ug5T+24DJ2MxtMm9apcSV0teO3k02eeQOKOQBsViwG1GMnA
 Ewm9REB/gOkrmHqWwSHhMMkg7KnXpvQOVQ5bPlnHSt3tBdJbiuXX9qYbq45261ONAuenYT4gV
 OZryUDfGG6MI5PaTqRPLRsOZJ3MwaQWGvJ9Q0FqaMj0CI+vocuswaJaLW6v8h334y3DFv9HgI
 O2tvTNh1+2hkqLAsoI/KJHgNbSN/ee5aJUhLZtPgvLT+vkC0UDArgbbPHsf7/D3WY8YbU7Gsf
 x+MKhNdXBS+MXiW1YPe8fJ//KX6NC38CCmf2AavA/CxngY6yVnmJ5133JGz6n0S0xrzTHqzaa
 g1YTtDFMNZlmhVFKgmyRQiYmedSUiLJJOj/gSCLF41mChCXp+E8nZwK7qmRbYDSCiWl7BpQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_163622_074627_A5957758 
X-CRM114-Status: GOOD (  11.81  )
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
 linux-samsung-soc@vger.kernel.org, James Hartley <james.hartley@sondrel.com>,
 Alexander Dahl <ada@thorsis.com>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Alexander Dahl <post@lespocky.de>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org
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
