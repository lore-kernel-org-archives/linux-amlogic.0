Return-Path: <SRS0=AMJk=PI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58D0CC433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Oct 2021 19:51:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 169956128E
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Oct 2021 19:51:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 169956128E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8GX5Eb50nViVpTQTiBkXNHxcHbhsA3PpfnPwrmEETp0=; b=nQz9IIHFgKB4lM
	9Ap2d4NfcWmceizo2gm5rLo0drVcfqJdK7reEutg8/9EhxomYutIXIQCoJ59gkbmSRht7hXaCO8QS
	Y+DKoGRQIKcBBHBxpDzNP5LWMghgQo4Ln/uQpmdSOzNoj+WRipxYyIovAgvRAVlfNp1KmURC1D9ph
	nI7/8PGRVGt+WSwa911rqZN/VA1ScpHhrE04bKaHOT97Hfd+92ia/85iLznzaIPxlCGGDc2E4PZ8l
	leE2PeEpshID+nKx1mMhrlnkdKx6FX6b4zYRtmnJzUAs7ZlCmVVH7yIRZn5PXOOWBqOCP05MMafjQ
	tgoo3JkZ5SUHnN4hTfmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdHca-005hWt-Ny; Wed, 20 Oct 2021 19:51:32 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdHcX-005hVO-PL; Wed, 20 Oct 2021 19:51:31 +0000
Received: by mail-wr1-x436.google.com with SMTP id e3so175529wrc.11;
 Wed, 20 Oct 2021 12:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QfMvuq4K6cpLtRMk3KHGbMTXe8asjprh2K841Dtt1oA=;
 b=eKrR198UkLWE8Pj6Uegtd4wafbAXciypdyIk/hVInipJy/z1A0lb1Ao7qI8FNxOxqQ
 5jhLCE1OjQlSWrJ+UByzv+jgRz/W+XTWWXO5iuCl48k/QCCtMPQUl0lZNoA8W1jQK3Gd
 pSTtJbzQpLFvzlZi8/313qDegRXfztY/AR1Dc8ltLo3YIZx5rIeBnPUzld3S9JOK60YM
 xs64ChpCFBn1sdLw0TLh2o89vLVftx+UOrR1d6Jr5sIJsp1ggp909Rnj5NHizbX0G4gs
 j+cKIbf/D/ASpMphqy1soiV1NupoW+dalxdYiM8/f9e9HVft2YoGv2nL9+iUvcDtI11u
 i+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QfMvuq4K6cpLtRMk3KHGbMTXe8asjprh2K841Dtt1oA=;
 b=NQyrN2AXx7pAbXnJ0cG/+tBvNHe2ebnFASCzLp+K6sYFvweFySdxGBi7cy/Uy/DLO0
 +XtEn1SOYyR71rlKitEeVuzDvuax82h2WuHzXu54acNPVSKZKJUBIRF1IeJDHip4uOhi
 pZ4xE8/rVYz4MNkVqCJVX1vuxQQbArFCH88VQt3lxiV7GVjnkFqGcMEdUj1i8PDdZHi2
 lMIq/Dc9gq3ee8YDhBp3BBETwtx2M/caZY7/vd2gzXTanWgzcJWhUi/dyGuu8BBPrDXz
 NdqiozQ3YUGv7YedGW8QrZtxSlLJ4shKkm+NF34+aYu2hmY0Bzz310RI2+dtf2JvbwZD
 8E7Q==
X-Gm-Message-State: AOAM532cEfKOA6sM8kUdhYgLvkgcg9Zj3LFSwB8E2Smhtk4hUbH8KyqI
 LcoMnoe6LUDSLwIuQ7sZ6GgAYzHEgTE=
X-Google-Smtp-Source: ABdhPJzNxHFomcOViX4r7AOwWI5eIKmiLGy8O89pX8OtNiMEKNhsm2ixp+JrCw5VDyi89i6Tf32GIQ==
X-Received: by 2002:adf:f904:: with SMTP id b4mr1528664wrr.403.1634759487982; 
 Wed, 20 Oct 2021 12:51:27 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a01-0c23-b9f5-df00-f22f-74ff-fe21-0725.c23.pool.telefonica.de.
 [2a01:c23:b9f5:df00:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id f3sm2741310wml.11.2021.10.20.12.51.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 12:51:27 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-phy@lists.infradead.org, vkoul@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 robh+dt@kernel.org, kishon@ti.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v3 0/2] phy: Add support for the HDMI TX PHY on Meson8/8b/8m2
Date: Wed, 20 Oct 2021 21:51:05 +0200
Message-Id: <20211020195107.1564533-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_125129_849268_61685255 
X-CRM114-Status: GOOD (  18.31  )
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

Amlogic Meson8/8b/8m2 SoCs embed a HDMI TX PHY. Unfortunately there is
no (public) documentation for this hardware. The best thing we have is
the 3.10 vendor kernel, which unfortunately doesn't document most
register bits (only a few are named there, the rest is all magic
numbers).
It is possible that this is a TranSwitch HDMI TX PHY based core, but
this is pure speculation.

Adding a driver for the HDMI TX PHY gets us one step closer to video
output on these older SoCs.


Changes since v2 at [1]:
- Use "amlogic,meson8-hdmi-tx-phy" as fallback compatible string for
  Meson8b and Meson8m2. This affects both patches in this series and
  it's the reason why I dropped Rob's Reviewed-by.
- Add a comment to the driver explaining that there no detailed
  register documentation (naming) is available and that's why we also
  use some magic values in the driver as suggested by Vinod.
- Hardcode the HHI_HDMI_PHY_CNTL* register offsets (from the HHI area)
  directly in the driver instead of using some incomplete "reg" property
  parsing code. This also makes it easier to compare the register values
  with the vendor kernel sources and datasheets as the offset doesn't
  have to be added/subtracted when comparing the values.


Changes since v1 at [0]:
- add a reg property to the dt-bindings
- parse the reg property (register offset) in the driver
- update copyright year to 2021 (spotted by Vinod, thanks!)
- drop "default ARCH_MESON" from the Kconfig entry


[0] https://patchwork.kernel.org/project/linux-amlogic/cover/20210604190338.2248295-1-martin.blumenstingl@googlemail.com/
[1] https://patchwork.kernel.org/project/linux-amlogic/cover/20210629182047.893415-1-martin.blumenstingl@googlemail.com/


Martin Blumenstingl (2):
  dt-bindings: phy: Add the Amlogic Meson8 HDMI TX PHY bindings
  phy: amlogic: Add a new driver for the HDMI TX PHY on Meson8/8b/8m2

 .../phy/amlogic,meson8-hdmi-tx-phy.yaml       |  65 +++++++
 drivers/phy/amlogic/Kconfig                   |  10 ++
 drivers/phy/amlogic/Makefile                  |   1 +
 drivers/phy/amlogic/phy-meson8-hdmi-tx.c      | 160 ++++++++++++++++++
 4 files changed, 236 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/amlogic,meson8-hdmi-tx-phy.yaml
 create mode 100644 drivers/phy/amlogic/phy-meson8-hdmi-tx.c

-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
