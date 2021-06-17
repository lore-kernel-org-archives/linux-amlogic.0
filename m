Return-Path: <SRS0=pHk5=LL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 998DCC48BE5
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jun 2021 19:42:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D02A613CB
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jun 2021 19:42:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D02A613CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GdLYhs2vxQjvz5iq797EjcnwvWyk35qTm0S/MBOpmZ0=; b=vOvXVssXH4HVQm
	M2gOWMMP4xPE1FIdduD8nqy+y96pdrjIiomgSrt1glq9W2+vx3fSEWsF+nit3BXwaq5jELte4U3Aq
	MCgahtS5ROgsvVCvz3hqelRRwiKlvYib9rEzT8ylfz6TlMmXZOZKiMqum927Vz8DhXCzsUeXZXYX6
	BcD7i0stHJTRhnMxJDY2rTNbHcBe3VXYIZKeSq19QHIciQz2RwbFcu/UQVIJA6VVOOptIw21zhA06
	T/ncZmg8+jEIQTilvjTkSxDLv3JwV4VzT6pefmo6QL66j4J+K0939EVRCpDg16VnSmcACA7YebCnj
	9dSAemYbKxvP1Ylu7vcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltxud-00Ba98-QJ; Thu, 17 Jun 2021 19:42:51 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltxuQ-00Ba7q-K2; Thu, 17 Jun 2021 19:42:39 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 m15-20020a17090a5a4fb029016f385ffad0so1661168pji.0; 
 Thu, 17 Jun 2021 12:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=da00ZN+RLuSXdFw+Cx3yDmIBQSfROsLCEVIOIeO609g=;
 b=r5KIycO/y5V1xvjDdhknZKPhmXG0J4r2uoGdS9ISm2AlTMVsGVw/sqoCrlaDqY4Ol/
 om7m5WK9M/R6GJV9KSGgL7pW67YioAvxGrbZC0y3wWoFiGrM6s0j6HWaIPBeno+wRd0h
 2VRNQm+4T4wTCKeF0dBlqAQjPXDOlbMSwBxhW9nra4VnhVqqP+PdXgEBNtJ7rmr0fd/3
 9nXgFrohQATVKF8H85DWNC12wmddYALpM1lmAhgBwr86RXB7e3OP2D7ci9SPNSWPXQPk
 j/ddPjRJowBoJBJMwYGfOadL4T9Vmz3ZcNGpBQHSYa83IFF+vHus75KHscC0xvvNzncu
 RK4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=da00ZN+RLuSXdFw+Cx3yDmIBQSfROsLCEVIOIeO609g=;
 b=G4XzYXFHbd7UVfj4g8V52KxP3ZWMQqniMQ7syEM58J5wu70zkGQs6UA5lAHlIafZId
 eHMEwOOx0OYWwLme2Za+z561ed4q+hHmSTY8rGu8oC1bHdAE4yzSrH9j37HOXMaHQSOJ
 6c15KjJvZk4e78HV1rE+inr6DS+pS5osCywqqpTYw4zMwhINqwxXCEIsJHqm2zdADtw3
 lmPoYatu/labxJjoA4I7/yALMPc/B6AGudZNYuEY2Yh+4NUctsXFRc3ZrNiZ7egAi17r
 w4rG27yqnCh64aQJ+XGqxufmffZmDGXo4MXXCzkhF+bndrQAeHdZj/dd3kcDQfJ+8JXD
 ZsCQ==
X-Gm-Message-State: AOAM531z9w8HNZtsDGGbsRDEZnJF3xmCJOBraDSatP93oslmSA3jOXNL
 u9AKjnpaU+2JhwjzfJAAfY712IerxqI=
X-Google-Smtp-Source: ABdhPJwW9q6oBVxAsW32fu7Y2lPktocoo8W4MTKRbk3gM8togfzrbQCQWsps1BCqnVjlRXcZ3xOTHQ==
X-Received: by 2002:a17:902:7c94:b029:fc:5e8b:e645 with SMTP id
 y20-20020a1709027c94b02900fc5e8be645mr1413344pll.18.1623958956442; 
 Thu, 17 Jun 2021 12:42:36 -0700 (PDT)
Received: from archl-c2lm.. ([103.51.75.27])
 by smtp.gmail.com with ESMTPSA id z9sm5987187pfa.2.2021.06.17.12.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 12:42:35 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: --to=linux-phy@lists.infradead.org,
 --to=linux-arm-kernel@lists.infradead.org,
 --to=linux-amlogic@lists.infradead.org, --to=linux-kernel@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [RFCv1 0/8] Meson-8b and Meson-gxbb USB phy code re-structure
Date: Thu, 17 Jun 2021 19:41:35 +0000
Message-Id: <20210617194154.2397-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_124238_718739_3F95B390 
X-CRM114-Status: UNSURE (   9.49  )
X-CRM114-Notice: Please train this message.
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
this code changes are just re-structure the code so that
proper callback function execute in proper order.

Code changes losely based on phy-meson-gxl-usb2.c

Initially if we connect USB HDD at initial boot it get detected.
but after that usb hotplug of USB HDD is broken.
I did not observe and USB debug events messages to trace the root cause.

Another issue I observed is increase of USB interrupts event
even if there is not much activity on USB ports.
I tried some clk changes but it did not workout for me.

$ cat /proc/interrupts | grep usb
 45:          0          0          0          0     GICv2  62 Level     c9000000.usb, dwc2_hsotg:usb1
 46:   17488032          0          0          0     GICv2  63 Level     c9100000.usb, dwc2_hsotg:usb2

Thanks
-Anand

Anand Moon (8):
  phy: amlogic: meson8b-usb2: Use clock bulk to get clocks for phy
  phy: amlogic: meson8b-usb2: Use phy init callback function
  phy: amlogic: meson8b-usb2: Use phy exit callback function
  phy: amlogic: meson8b-usb2: Use phy set_mode callback function
  phy: amlogic: meson8b-usb2: Reorder phy poweroff callback function
  phy: amlogic: meson8b-usb2: Use phy reset callback function
  phy: amlogic: meson8b-usb2: Power off the PHY by putting it into reset
    mode.
  phy: amlogic: meson8b-usb2: don't log an error on -EPROBE_DEFER

 drivers/phy/amlogic/phy-meson8b-usb2.c | 159 +++++++++++++++++--------
 1 file changed, 109 insertions(+), 50 deletions(-)

-- 
2.31.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
