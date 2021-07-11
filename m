Return-Path: <SRS0=dPOz=MD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4909CC07E96
	for <linux-amlogic@archiver.kernel.org>; Sun, 11 Jul 2021 21:40:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 122DF60FEF
	for <linux-amlogic@archiver.kernel.org>; Sun, 11 Jul 2021 21:40:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 122DF60FEF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pqj+mTejlX6itYa7R9xhn1msKqJydo6/9lHWM/tnSOc=; b=Onysr9QscayujW
	GnzBt5dDVlV5r8zST2MbVwQq2zvQVZMkQtGtpkzvg3LD2LS53GODECR4wWA71QD1lAiFh3Fd8i0nx
	vMHMHWcZ44kx/qr7fTe4oQ0j8rH6mZcM4aocRra+B74QBNHkcE3CZ3c0eEPum6rB0l05nNx9wVBsQ
	L0iOsd3oJJ5OQ1JHBBARWMnPdxn20Mvg0oMfmcYUPcHOYs0MfVlH0sH6NDqfLNrZu3JasagEOPESb
	atlCKwMcYYa8UKqE6JGqzN0TdiqkkXDFcTB66w5IKRAOHbq48OOxahXx/2GErA5948osNJ/LhDn0j
	6Z6FJvnVzSMTZfmZA73A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2hBl-005SK0-0v; Sun, 11 Jul 2021 21:40:37 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2hBi-005SJa-Fl; Sun, 11 Jul 2021 21:40:35 +0000
Received: by mail-wm1-x329.google.com with SMTP id j34so9998961wms.5;
 Sun, 11 Jul 2021 14:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IKIR62m9zVkXxG+1eboDYFTYTh8DV2vf9zqwrpBAfSg=;
 b=hNZPcdHFpWM4e15vO1XRt1t1s+vPKT9lj9tuATED58XFszt2/dGMSu2wuKQHfVHWUx
 yTAloFyx2NjBzj1WTcOmJnnJsT/5NnEweR6vnmP2B+bNltOaCdOI3XyBM3xyX/s3aB3t
 SQHHa01/ETb6Z8vRW6/lYZwbFlr9LWOu4P4FqoSe3sKb3FOdwOvymiJv5CTrbGHlsx1J
 /9Ghg3NenJlk/2m8wMJExNZNebfm82HlTHFO5x0j59MOJuHXSoGc7Cmyf81oo2mnfp2n
 NxPb2PSoyWchngYedzAxzrpk6vN9uKq1WG3PplsHef/4xShVePCVOHXBNKBiMFdqyUGS
 demQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IKIR62m9zVkXxG+1eboDYFTYTh8DV2vf9zqwrpBAfSg=;
 b=DETO72/nhCfYw9O/kzkp6iZBbgYpp6jwm2ETyREfUI/PFNKRG7ESYS69vx1kurXjiD
 1wWYQljMmTd+XYm/4dGZoAgdZYYHbUx6iwb3l3Rfqtc6BJ3Rg06BkmBUoAjHG0oQAq0J
 KkZBH5FcIJdG4PZtfZDfNXwNyCLtqKiF+Ds+gMCj6KeqfEcNfQnqLusSeizHi/OlnLHc
 jRg0BykADFFpRG6519+I+R3oqhRwG0gu9A3B+dow5Yggc7EJ4HlSRxBbLeFm0UYpHCwP
 all0hIDy77cK4m7AgmW2bpWNlWWwEKe5Ab0gxTx1dkiclVz3qPIvWREGAge1r1+HE3Xy
 7qwg==
X-Gm-Message-State: AOAM533jSr0WTFp6gOfOCErYNbGmuExmguVuWEx7mz9E384rGZYENCfU
 64pmYJMqjD5Z+1kh5JdJYxEMkUbTN60=
X-Google-Smtp-Source: ABdhPJypYBWjgzOKZ7Xpagpufk8hb0p9U/cfCi1CQN2PkHDCdkbtg5PCUIGYN8Ovv++YFXy1vZYcRg==
X-Received: by 2002:a1c:1b87:: with SMTP id
 b129mr52754193wmb.189.1626039632613; 
 Sun, 11 Jul 2021 14:40:32 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a01-0c22-721c-fc00-f22f-74ff-fe21-0725.c22.pool.telefonica.de.
 [2a01:c22:721c:fc00:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id m29sm17563212wms.13.2021.07.11.14.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 14:40:32 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: narmstrong@baylibre.com, khilman@baylibre.com, jbrunet@baylibre.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Demetris Ierokipides <ierokipides.dem@gmail.com>
Subject: [PATCH] ARM: dts: meson8: Use a higher default GPU clock frequency
Date: Sun, 11 Jul 2021 23:40:23 +0200
Message-Id: <20210711214023.2163565-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210711_144034_589077_20261930 
X-CRM114-Status: GOOD (  10.95  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

We are seeing "imprecise external abort (0x1406)" errors during boot
(which then cause the whole board to hang) on Meson8 (but not Meson8m2).
These are observed while trying to access the GPU's registers when the
MALI clock is running at it's default setting of 24MHz. The 3.10 vendor
kernel uses 318.75MHz as "default" GPU frequency. Using that makes the
"imprecise external aborts" go away.
Add the assigned-clocks and assigned-clock-rates properties to also bump
the MALI clock to 318.75MHz before accessing any of it's registers.

Fixes: 7d3f6b536e72c9 ("ARM: dts: meson8: add the Mali-450 MP6 GPU")
Reported-by: Demetris Ierokipides <ierokipides.dem@gmail.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 157a950a55d3..686c7b7c79d5 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -304,8 +304,13 @@ mali: gpu@c0000 {
 					  "pp2", "ppmmu2", "pp4", "ppmmu4",
 					  "pp5", "ppmmu5", "pp6", "ppmmu6";
 			resets = <&reset RESET_MALI>;
+
 			clocks = <&clkc CLKID_CLK81>, <&clkc CLKID_MALI>;
 			clock-names = "bus", "core";
+
+			assigned-clocks = <&clkc CLKID_MALI>;
+			assigned-clock-rates = <318750000>;
+
 			operating-points-v2 = <&gpu_opp_table>;
 			#cooling-cells = <2>; /* min followed by max */
 		};
-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
