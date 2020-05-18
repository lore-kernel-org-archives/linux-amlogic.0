Return-Path: <SRS0=WPS6=7A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA0E8C433E1
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 May 2020 02:55:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D00C20787
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 May 2020 02:55:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oBtadq9G";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tK0CbIaI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D00C20787
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=fZJJPYzSLtPiebHPO4xRt6r0DE911zcrwLouf11m194=; b=oBt
	adq9GFY16XklZHey57RfVT9x22/O+7GYOVgyS8XdTmqKFuf3G8lOq7x/aK0Jp0MKcZLrUZC+INsR4
	eEZLI925XOkHV1D32zeRGCy7Rhvpa/uqBErjPNQZ7rLJvps4YOR1XPVgBAPr4RN+G4UJR9oBxMzUG
	iEtpFM3h/h3GwotZQFRb6EcnRkt3qd8hF73VelfQqXSDlW5EEbP2ksM4Q1KFm/4CPgNbbNMS4zCpS
	OBwpSdPxDibAhKQK7vqo2KGkjyNSk7W7VT+6/46mPhFQaQQ5qpEq6F5JZisifIMtgwewlPd14YpET
	30nOneCNRZs35JyMcL2jBufX59hRspg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jaVw5-0005pd-NV; Mon, 18 May 2020 02:55:25 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaVve-0003HB-5x; Mon, 18 May 2020 02:54:59 +0000
Received: by mail-lj1-x241.google.com with SMTP id u6so8175385ljl.6;
 Sun, 17 May 2020 19:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=2jFq9prhAH2wIK8gbzUKR9isfuzYq/gIMJSIzZWYu8E=;
 b=tK0CbIaIPpHV4gEM+abpdSUOYcpDl4B/nOcUHEziOVj3EUHlB8pHsOITbBcnsbu/tJ
 S+0SrN0fBP/JoVMkCUENN6b1hmeEVpBqFkCvdU1dddTqvF5J7coZWydu6ngNjw4WHb4f
 nrM1txpP6q3qhVlWTqG1BqTsXC8jaOBPqLIJK6h7FUtQqTr9P8XdI3t5sMNkZCICfxu0
 LO69wVLwPqU31KaFbGTQZ+5zzBN/4VHT0P80bj7r3GtBwNqtxD0fpH45w8E0+kinasr4
 XJDtcoaESd3jQSY4ERTbLzMJ9+zdwfp9IJA3Z6YDm8B37x8wsHSS148tQNUxmutMEZr3
 BpqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=2jFq9prhAH2wIK8gbzUKR9isfuzYq/gIMJSIzZWYu8E=;
 b=rWbVhq0ja9qQ3u8z/mwLQwFLWdPvhEdv9sQSFIVkwD/ynh/xLQrLsgAs4oxsEQARjD
 7b3tkovDwW3Yp7ABjbc2SnCLdjH1t4hppwS6TpQYBpxA7aUi/DMTyOg2CAHRwIsHBZdV
 lVFHOQS5jZAo9aUXPthxGAayoIuOPfTIViMWFoYT4kZGc6jfMWJRF5K9PQCxj8yPO3Eb
 PxeJUOeUkaUhWbF6KaKLFBf6E//RrDQxWdpA0YVk+yEwqgXReHB5JaPZsOWRBvOUedGI
 uw7gcpnAaa/f54LGNIq6k84ixCe5PHWiUi+eAjIha5X0EhKBxvXES8c/JWg4kdeS5H5U
 Yd5Q==
X-Gm-Message-State: AOAM532sWrsZRbqkr6vUMh8Znll2aD4TrIXmrR47u8DlSkSduhqk6clM
 wng7yspxUNEn6z9UIO+Rx4P9pFzr
X-Google-Smtp-Source: ABdhPJyYzqTgPOAmvsxyCf7uSX8bDqWTZcSY82RpGn8VgcPggP06JGDFO93AVoCohi3Bqow+954rfA==
X-Received: by 2002:a2e:9b8d:: with SMTP id z13mr3094942lji.35.1589770496715; 
 Sun, 17 May 2020 19:54:56 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id q21sm6849368lfe.0.2020.05.17.19.54.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 19:54:56 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: meson: add ethernet interrupt to wetek dtsi
Date: Mon, 18 May 2020 02:54:51 +0000
Message-Id: <20200518025451.16401-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200517_195458_239791_B651B099 
X-CRM114-Status: UNSURE (   8.97  )
X-CRM114-Notice: Please train this message.
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add Ethernet interrupt details to the WeTek Hub/Play2 dtsi to resolve
an issue with Ethernet probing in mainline u-boot.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
index d6133af09d64..ad812854a107 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
@@ -149,6 +149,10 @@
 			reset-assert-us = <10000>;
 			reset-deassert-us = <30000>;
 			reset-gpios = <&gpio GPIOZ_14 GPIO_ACTIVE_LOW>;
+
+			interrupt-parent = <&gpio_intc>;
+			/* MAC_INTR on GPIOZ_15 */
+			interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
 		};
 	};
 };
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
