Return-Path: <SRS0=xPAz=DH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F713C4741F
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Sep 2020 23:48:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D79F720B1F
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Sep 2020 23:48:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HDg7w84Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D79F720B1F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lespocky.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sssXUb7PmUnpHtzKnJ5NgAuD473vS2IaIVUevxVz3Co=; b=HDg7w84YuiR65yYWvlWQYgCXi
	fizcd6OQGJ1Iav8mlV2KwpPMLrRaBiAZAwF8z0yz+eFmjGcN3sriPLRkkC/WbrzPhKLCTGpvqV/ko
	9u60GNHcY0FlEQxrKRKgrolK2CAhs6Ds8tOoO4eN0oJC7ylovNu5xDez6YgqObRoqGFU0vhWlMCbe
	5tJZWglzm8QGnEetNCU6JB8x6WhbtesIkzwhENoFjPIGa7RQU1EManQPAkhx2F1S70KHBjTNHms1Q
	61185wox9S/DObf1G+GVrUNrCMXdX1JNIvSTnhBDVByhAmpt1zvE2pMP9yDAJG3iscv+yj1CfXLed
	nTtFcexbA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNlpQ-0000Uq-Us; Wed, 30 Sep 2020 23:48:09 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNlp9-0000Nr-N6; Wed, 30 Sep 2020 23:47:52 +0000
Received: from methusalix.internal.home.lespocky.de ([92.117.51.117]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MtO06-1khDwh18e6-00utdP; Thu, 01 Oct 2020 01:47:41 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <alex@home.lespocky.de>)
 id 1kNlox-0007Zd-0j; Thu, 01 Oct 2020 01:47:39 +0200
Received: (nullmailer pid 7778 invoked by uid 2001);
 Wed, 30 Sep 2020 23:47:38 -0000
From: Alexander Dahl <post@lespocky.de>
To: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-amlogic@lists.infradead.org,
 linux-mips@vger.kernel.org
Subject: [PATCH v6 4/7] ARM: dts: at91: smartkiz: Reference led node directly
Date: Thu,  1 Oct 2020 01:46:34 +0200
Message-Id: <20200930234637.7573-5-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200930234637.7573-1-post@lespocky.de>
References: <20200930234637.7573-1-post@lespocky.de>
MIME-Version: 1.0
X-Scan-Signature: 47063c0bd3b0440d119657da58bc7562
X-Provags-ID: V03:K1:kNQzKotdRff+jmTK4enfW2P8VC+lN5Mm6sK3dTcCWyI7KqF5K0w
 hs9y5hvIdZxbvwjGV6d1MbjwF+93wWztobk2nTO8bv4NKOk4hYWJzlm7+DToWFTqnOe+mK2
 bMDeUKjAMcccYMA6iDl3Pt9XXvtPQp57BkpOH8Ls3rFw2QjTLF+FnfU+Bqyjox9GG0VbD2f
 VwLnWtvbe25tfrYuE59KA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xbIVF+xv/VE=:Uz+vC7sq3WUaBiE4lhNcJj
 XwQJ7oHB2rlKtXrmOi4tlJ7hNuFYngnRC3TcDhVMUZZY/YJbHyhMnyR97klNea19PuQDQ4PAT
 HcW6hE6/JqViZM3GvQH/TCJADKdACqyekIbabzFUJir55DytD7v3vQaWBOTBEVNugVDjptxGQ
 eHF1+M8C3h6pZ47Dq8bThNyhotzI0PxPkCXS/7EM3yfT0yzhiLK+0GNJukaE2rAKkGCjMec/c
 0mvyopgCZlaSrnyZa7w0Eg3+1jVr9Yk3QQbI/RlngGQAvAXGhKpbKxHDXet4cmF5t+IaWk7Rj
 22d8aMSIFlQg2ESPrKYwI7p3VI4I7xnU6wDZ3WXkC4HlC4xoONey6XXDG7b86vYgys2iZFzzo
 +Qs3SknH4RmXhIiUwqtvBRdMwXlvjld6TOgkIPVhkoyB3TySHNwUrEXuMPQ1ec7sBWKtVr/yo
 I73Jpk2S5V9fJhN5PKPtklzlMbjvxlPl+wX5lq543st5Bkfa7H1YjL4yLDdvrHQndqZcp0d7D
 qXoVsq+fJlBQIUcJEnEj2+JF1RLI9uooYf3/FNrlQuMQXgUxC/EqGYUoE6VgvOrZBctfLYeO8
 T8jDFI2KphUWZdAGb1toGoycOaMbmbE12pR1145ibXYBInCVw+/uXZDNQKJ6izVqVQV7aB5bz
 WR5QGq+gnDtHt9znqX8/puUZvN5BRG55kRynLEqIBR5Ju/2vFGmi8Ax1t7vL/SlrYC1uvFU9K
 MJrN5ngcABLcteXK5E8NDMhkDj3H+N1L54+IhT4uD1IpSMDXiZ/1z0uO3XJ8DoyydAYRQU5I+
 N9iXWIIMT3DZD/4tzrRnAEtDxkBZRoqbbfgGkJvehDi89Jz5A9pr3uBfY/FYRioJZNNOPi0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_194752_005088_B215B77C 
X-CRM114-Status: GOOD (  11.74  )
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

Do it the simple way like for the other kizbox boards.  This will allow
renaming the led controller node name later without breaking things.

Signed-off-by: Alexander Dahl <post@lespocky.de>
---

Notes:
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
