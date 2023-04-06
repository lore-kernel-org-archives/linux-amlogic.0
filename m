Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFE7C77B70
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Apr 2023 15:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zB38JeA0Qr5XHwdqm68iTh+u4Q5kO7MUlU0OxtWFbB4=; b=JBiBupBoC6mLAm
	RAmAEJF/pOFvmQpDsv52rhZGCFULT1QyKa6RbaMN/F6lYzmlMQGhR06UOJ57AF8dxzYPo0FTJ7v36
	YfhlApwxi6N34yI+VWDi4yIrTyrnODGaRzIBJTulGJ6fuQCABkDQD4HGF1UR2ygUirXUjvHfk4WR3
	qZ+gK2K3ZY/POFPpz/SGiWslW1cCCx+DW2bsj2Cbgo6RwPgYxhkbpzllXUK9Dv69LrtsqphXk6S6G
	pdpR+zifIaztKfs+G0fiWnCcPFeZg7r1RBWc+pPNdFfM15tdYiU84eGCOmcIukcqgh8DvjRf6P85u
	/048zn4Udd2ii7e3BqAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkRKE-007m0C-1L;
	Thu, 06 Apr 2023 15:14:58 +0000
Received: from mail-wm1-f44.google.com ([209.85.128.44])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkRKA-007lwn-0Z;
	Thu, 06 Apr 2023 15:14:56 +0000
Received: by mail-wm1-f44.google.com with SMTP id n10-20020a05600c4f8a00b003ee93d2c914so25390566wmq.2;
        Thu, 06 Apr 2023 08:14:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680794084; x=1683386084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MH9oWkxfP8GAyXFIF9/QFL+IZc89otUoWrSEvAQa11k=;
        b=AZV6q/Lj9IufbTuOi0qaX70otxs3oEGXR4w1n4T2jDmSJCY9odZ//6+hCUiLSSRo8V
         nqwxJ2KnGkSBcPwcSm5ySzr0lI7MIYxoq7sVswQ3N/y9fEuu89Z4sfrIzBAxFVcF9ril
         5lmOgzkczj3gC85HHaq+JttZyNq2Wc4E+YJpiK3Qy9eMhYJYQZ78bqiQXHZKLtEAw3ql
         sbjulVDJOpp5SdFRo79faLAgznY2sWzseVopEQJS7J1JdcO1FbhVRXPmEqe9PE0Lr1Ne
         plxfGScBAA/RgwtoHvQ51Bgj9YxmToRmuwJRd0eGs015XrCO0V4amv9mMZ1e9LoQR5/4
         4n6A==
X-Gm-Message-State: AAQBX9dgiriQb2GnFVZnx8bgGUZZhzdRTp5Dg1QsOJ9uQwpJFZUQBbGq
	oNn45XGE8daFNvqj82A6GTw=
X-Google-Smtp-Source: AKy350YgRUPGytR5NW4IoBgt4yI4NZ227JtpkW/Y7mwBewRsPkwEuCA7waIjVK/gM2Q+9su0MqWk+A==
X-Received: by 2002:a05:600c:24c:b0:3eb:2da4:f304 with SMTP id 12-20020a05600c024c00b003eb2da4f304mr7209338wmj.17.1680794084541;
        Thu, 06 Apr 2023 08:14:44 -0700 (PDT)
Received: from ryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id fj12-20020a05600c0c8c00b003ef67848a21sm5560213wmb.13.2023.04.06.08.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 08:14:44 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	jbrunet@baylibre.com,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	martin.blumenstingl@googlemail.com,
	narmstrong@baylibre.com,
	stefan@agner.ch,
	Lucas Tanure <tanure@linux.com>
Subject: [PATCH 0/2] Fix Random Kernel panic from when fail to reserve memory
Date: Thu,  6 Apr 2023 16:14:27 +0100
Message-Id: <20230406151429.524591-1-tanure@linux.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_081454_215721_FF2C91C3 
X-CRM114-Status: GOOD (  12.76  )
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

I am trying to fix an issue where the kernel panics randomly on my Vim3 board.
The issue happens when the ARM Trusted Firmware memory is not removed from the
available ram.

This happens because my u-boot provides this region as a /memreserve/, but it
doesn't flag it as nomap. And the kernel can't map as nomap as the region is
already reserved.
My proposal here is to allow the kernel to mark as nomap if the region from
the device tree and FDT have the same base and size.

arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:
	/* 3 MiB reserved for ARM Trusted Firmware (BL31) */
	secmon_reserved: secmon@5000000 {
		reg = <0x0 0x05000000 0x0 0x300000>;
		no-map;
	};

Previos Threads:
#regzbot link: https://lore.kernel.org/linux-arm-kernel/40ca11f84b7cdbfb9ad2ddd480cb204a@agner.ch/#regzbot
#regzbot link: https://lore.kernel.org/all/CAJX_Q+1Tjc+-TjZ6JW9X0NxEdFe=82a9626yL63j7uVD4LpxEA@mail.gmail.com/

Lucas Tanure (2):
  memblock: Differentiate regions overlap from both regions being the
    same
  of: fdt: Allow the kernel to mark nomap regions received from fdt

 drivers/of/fdt.c         | 10 ++++++----
 include/linux/memblock.h | 18 +++++++++++++++---
 mm/memblock.c            | 37 ++++++++++++++++++++++++-------------
 3 files changed, 45 insertions(+), 20 deletions(-)

-- 
2.40.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
