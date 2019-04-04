Return-Path: <SRS0=arCo=SG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95995C4360F
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2019 15:05:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 571882064A
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2019 15:05:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I3aXAVio";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="FqIyQ9au"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 571882064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7RM01ANVCjCj3xWcMDbleHp2Dq833nz6JKiH4hdIBN0=; b=I3aXAVioxEV5eq
	hTCe+ynjNSXwN/oFvnkTG0S48LgzVwvnjV6kkLomxewbIuVs20GJUrxvvcqkSR3US2PCdlSwPJULg
	uNsCjBicmwowi1gEHguuWPjVqxtESdSIG2o/A7xXilg5FttHAG3cJ6QnEBY5HfCVzPea0KU6h9/7D
	LaIzCEQV6EM19C6qZZQoucZvJZxyqHli58/PKYfA8NZEkdV5V1fXYi6eIuZjJmUUCiWW8V5BDwJdf
	1ambHUAJK6goODyIcU44Ers/DNPVPIYQ1EUNZzwYvWvDJXyll66iHwoUk24XcquqzYdn1EUx+IXIu
	hW8cMH2y90VaBkX8T2mQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hC3vy-0000WQ-R6; Thu, 04 Apr 2019 15:05:42 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hC3vr-0000KK-BF
 for linux-amlogic@lists.infradead.org; Thu, 04 Apr 2019 15:05:38 +0000
Received: by mail-wm1-x344.google.com with SMTP id z24so3834881wmi.5
 for <linux-amlogic@lists.infradead.org>; Thu, 04 Apr 2019 08:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bInNvpdWwB8SzqqGmXY3uxa+isS0spqIYrGtdkeVxUk=;
 b=FqIyQ9auGcvuYUZPgN5keoYhi1UJHIuVbbfmsOIOimv6RzZ7QUWf3Mn5SlLZuzAgK4
 sw5tCWLo1AnJKFlFjryms9sApDxElcSkF7XofC5hQouUy3JUJIG1txRjZjQ+TNGR/r1f
 W1RK0L2NLlr8exOY3kNmbOL3LSH/Yp6UqpWPGSTU9mRZYiM69SswkXgbiIfZb7qKggWv
 NmQnndra6cgqbyCAYDHZqluQ7N1fclNddoAoAIqHLYLQtjUAocyXh6fpebc08DHNiZOj
 3y/CTqS/2Z0trErPnrWNh/fh238xu/2o0z/BBlhh+Rrn/bVd2GQ+76nky8kohE9KiYme
 4b2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bInNvpdWwB8SzqqGmXY3uxa+isS0spqIYrGtdkeVxUk=;
 b=r/W6Mx/6+goEFOInpR68DmBShu1vRLbxxoklbV6djeMpZbEmiyjwk5oEWoPLGCQJRK
 rlNV9IwtKgRE7UWrF+N4bJ/j39BRS8JRpj+3ZK9M5tYyhbMikgzNmh4hKpkFU8AML9m2
 P45gUaa1ZByKGvEHNrbEP5M4zc6MWzzmcfMLP3SKpjMOmbbW5zK8WthVnEb2W0uZiR7M
 ux3BglE0y3zs55UhnJ8H68KrT0ncMrJScYAz2JJlEVr6R7NnqUfkrhLiR0sXyyVmH6rZ
 jC7a4cVFas/yUsavCme0RKQj/bamc807VPJ+cX7Wo0Vs6hlFw71uG2EEvFcQ2w4LTBfW
 7FsA==
X-Gm-Message-State: APjAAAUIFIwTkcQLNpJreebVEgSCiVi0UCybsl95V9vZ0GxA4S6+YMyg
 zG3wzmdz64/CnkQYgJsPEvThpA==
X-Google-Smtp-Source: APXvYqwUgrIXls8oZpziEumTbZJlMjDOQ4B/kV+4Cm0w8jrUgo/b3K4Ok+aPFGh+/VMiONvtVvEQZQ==
X-Received: by 2002:a1c:f702:: with SMTP id v2mr4748620wmh.0.1554390333574;
 Thu, 04 Apr 2019 08:05:33 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id z23sm9880981wma.0.2019.04.04.08.05.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 04 Apr 2019 08:05:30 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	devicetree@vger.kernel.org,
	jbrunet@baylibre.com
Subject: [PATCH 1/6] dt-bindings: clk: meson: add g12b periph clock controller
 bindings
Date: Thu,  4 Apr 2019 17:05:13 +0200
Message-Id: <20190404150518.30337-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190404150518.30337-1-narmstrong@baylibre.com>
References: <20190404150518.30337-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_080535_524336_652D8DE7 
X-CRM114-Status: GOOD (  10.63  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 baylibre-upstreaming@groups.io, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patch adds the specific Amlogic G12B clock driver compatible.

G12B clock driver is very close, the main differences are :
- the clock tree is duplicated for the both clusters, and the
  SYS_PLL are swapped between the clusters
- G12A has additional clocks like for CSI an other components

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
index 5c8b105be4d6..6eaa52092313 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
+++ b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
@@ -10,6 +10,7 @@ Required Properties:
 		"amlogic,gxl-clkc" for GXL and GXM SoC,
 		"amlogic,axg-clkc" for AXG SoC.
 		"amlogic,g12a-clkc" for G12A SoC.
+		"amlogic,g12b-clkc" for G12B SoC.
 - clocks : list of clock phandle, one for each entry clock-names.
 - clock-names : should contain the following:
   * "xtal": the platform xtal
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
