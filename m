Return-Path: <SRS0=qynV=NI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A82C4338F
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Aug 2021 04:17:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99EFD60F22
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Aug 2021 04:17:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 99EFD60F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bDJQjsTGkCvAiTue5Ov7eRysxH6/6m8kakDzjdb0cIc=; b=f0VkCsntwjnpgC
	mrM+bNYovROovfRlSLz83hxvDcVX988v7PhhihLhnAxx6fKmlG54ZJeP7/qujr3UJ0/4YoNERHjwV
	AyR91m4ICmLnfNZZhr2kMw5cTzz3SbXoARlEUTrRIlAzM5oYwQ8ytDPSfk8vieROvIxb5ia2JPA2z
	yUicDOa9Ee/YMENys4G/yezGxnerOjrL2p3bz8FnhrYurjTE6J9Wudyvko4YTKd9zvMC7bkRA75ez
	WB9x5mM4N/sXJ08sk7mhqT1yaer2MRO2mfP5652b4aUybhpqVjsvStGKUUKnZJFpOVkn+cnKe15EW
	/dAI8yd5o9V/8c8tR5Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFqXg-00152w-Pp; Tue, 17 Aug 2021 04:17:36 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFqXT-00151C-2l; Tue, 17 Aug 2021 04:17:24 +0000
Received: by mail-pj1-x102b.google.com with SMTP id mq3so443601pjb.5;
 Mon, 16 Aug 2021 21:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bqqKFEqy6bW/3jaVqfILOBhErn5KinwFdoaG08aeYTU=;
 b=GegebCJ5kKpRuiPtzMuG/9/Oizma9N2aGsdKhuGiQdC7wUiRVR1it6CtyNIc96rUr7
 1Lrv7n2SoUcRo+zrgud1QzHI/S0+BM9EKdV1dWmlrq1uwJxcwfeJQxvy3pLlsNSIMcTG
 xg1oWpegNMAoB7YYtWTgVXZHUg58hyrj4IZ4iY5mpZ0bZazAz4eFsNooZjOo7iBAbThg
 7HpAbMBXtv2CXfVxxOs9YmRuPOxFRdU3q3o6KZ0QeHqAwg7StwEI9lEiUFGlI3fRDuwi
 MjhP+iXf+gIGtZ0TtT8KVdW9vLUEtDDgiyhLwaYRs+TliqPSl2yFJRNKE5nDb3Blnm/d
 nLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bqqKFEqy6bW/3jaVqfILOBhErn5KinwFdoaG08aeYTU=;
 b=ObHRWRoT8ys0VJrTzsg+pf/IuFfuzrre+RnVvh3+C4KNFiy7IZh8hjq2sAow1wZY4x
 mmIrgfexusP8KwyQO39YvusM/d1bYwn4X5t+Sy39uEoKONyIGG2Zb6fawiOlJuzTmo4i
 IciX6f5l760InXcAVOD0j8vOT1g4raBYltlwomaKpzm6kUQaUsNnqnH4OwbOHe5LzpSW
 IF+U3CF+NR2M1MwQTHeZNXasQFVgQ1nNxPzcNA/WbbsHHho5ReH41BkTOfkuCEPW85/j
 aBFOuRvUNs0MCqTUbZU/YFKK7XxEF5Lh4urHMfJz56DM8wTqjT6ZSwVDLayOhJpHmelN
 YEDw==
X-Gm-Message-State: AOAM530wXNiMbweb/KgkgXOgijprFFVH9BNvfnKpDDMIFQxCgV/odj9E
 QzZfcHLXwrLSNYgRVbrQlS6i6lNe4cRQxg==
X-Google-Smtp-Source: ABdhPJxghMRfCc22t7YGDNctHOJGp0NKyTLbKYqjB+T8eXlM0tsqvm0YCsdT7rjc0rp9Hu3gT+3axA==
X-Received: by 2002:aa7:8116:0:b029:346:8678:ce26 with SMTP id
 b22-20020aa781160000b02903468678ce26mr1646306pfi.15.1629173841355; 
 Mon, 16 Aug 2021 21:17:21 -0700 (PDT)
Received: from archl-on1.. ([103.51.72.143])
 by smtp.gmail.com with ESMTPSA id g11sm705676pfo.166.2021.08.16.21.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 21:17:20 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>,
 Matt Corallo <oc2udbzfd@mattcorallo.com>, Rob Herring <robh+dt@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Emiliano Ingrassia <ingrassia@epigenesys.com>,
 Brian Kim <brian.kim@hardkernel.com>
Subject: [PATCHv3 0/6] Meson-8b and Meson-gxbb Fix some missing code
Date: Tue, 17 Aug 2021 09:45:34 +0530
Message-Id: <20210817041548.1276-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_211723_185774_54E7AF1A 
X-CRM114-Status: GOOD (  13.20  )
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

On Odroid C1+ and Odroid C2 USB feature is broken

It's being observed the after initiation of USB phy
the USB port goes in to suspend state, If we pass usbcore.autosuspend=-1
via command line USB hotplug seen to be working.

Another issue I observed is increase of USB interrupts event
even if there is not much activity on USB ports.

$ cat /proc/interrupts | grep usb
 35:   26462800          0          0          0     GIC-0  63 Level
			c90c0000.usb, dwc2_hsotg:usb1
8
Changes added power node to usb phy and small code cleanup
in usb phy.


Previous version RFC.
[0] https://patchwork.kernel.org/project/linux-amlogic/cover/20210617194154.2397-1-linux.amoon@gmail.com/
Dopped the reorder of code changes as of now.

V1 > changes Fixed the GPIO input signal on Odroid C1+/C2
     New patch added to fix Odroid C2.

[1] https://lore.kernel.org/linux-devicetree/20210716103651.1455-1-linux.amoon@gmail.com/

V2 > changes Fixed the GPIO polarity for Odroid C1
     fix the power source from phy-supply to vbus-supply 
     added new patches to fix resolve some issues.

Thanks
-Anand

Anand Moon (6):
  ARM: dts: meson8b: odroidc1: Add usb phy power node
  ARM: dts: meson8b: odroidc1: Set usb power source to always on
  arm64: dts: amlogic: odroidc2: Fix the chip enable signal for usb
    power
  arm64: dts: amlogic: odroidc2: use vbus-supply for power source for
    usb nodes
  phy: amlogic: meson8b-usb2: Power off the PHY by putting it into reset
    mode
  phy: amlogic: meson8b-usb2: don't log an error on -EPROBE_DEFER

 arch/arm/boot/dts/meson8b-odroidc1.dts        | 21 ++++++++++++++++++-
 .../boot/dts/amlogic/meson-gxbb-odroidc2.dts  | 10 ++++-----
 drivers/phy/amlogic/phy-meson8b-usb2.c        |  8 +++++--
 3 files changed, 30 insertions(+), 9 deletions(-)

-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
