Return-Path: <SRS0=A3X0=MF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAF8CC11F67
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jul 2021 05:53:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 793CF61008
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jul 2021 05:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 793CF61008
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Apf9QTjr3uYumdngULwQxNFzo6OnATwp7H2CQANg7oA=; b=jsX3MdGBatIBfj
	MNdjemNkLSa2NszV8DBOLPyPylHAu9sU2IQ9jra/vLeNPWtet/1Ml112ZlO9gSs7V4T2rWlA96fTm
	verCJhti3T6rJ0EpfQLXbPcRoqcaFgO8qJrj3HcTd/2KSqw2vHxSozMBNk4yjaAQra5xMbdLmNgqe
	Bad8MBVXdmFybXvVqfXuojFdpmYwOsrswq/kl/SRn00y8Hj5EscVEDZyUe+GqlE1FoqZHefuUNWD9
	3EuV1fRsuiXTq+v7c6OA2SPp3mcWYQb7g85Hsv5lIgBd+rMLFeJqS9eEMpJ4c/Vl6ru442VJmRrQ9
	x0PC7HB1O5Zf6d7aX/6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3BLp-009BUY-Ml; Tue, 13 Jul 2021 05:53:01 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3BLc-009BRv-Gb; Tue, 13 Jul 2021 05:52:50 +0000
Received: by mail-pl1-x634.google.com with SMTP id o8so1089351plg.11;
 Mon, 12 Jul 2021 22:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XJ30J7VKV1daCsRGNwfmp9q3CDthhlGNXCEPTO+nQbA=;
 b=htUuNLDOvPkDtNegm9OUrCWSSFPhs8tq7gE2EF+9UoGqv90rCH4TJyfXIyy431CtdJ
 raYhB76APe8UykZsX9ug5EKSjLNCEe3MR+2Tffb27xmq5b9Uq6/TgdsEpzgMHmaeTdEd
 P8X/d5GYvnzM1Q6MjbEllBvTi0kRk2oNRerLHlstVh25KXSV5zzxTODQJDbqxHbxjJ8O
 8OWyX6ki0gKMz1aYWsBBT0MUDXbJpbE1Jk9wzdsTUu4G+pyjDgrQR5RejGd7XqD8nDfT
 1UsLTRzRIq2w1irdGqSQ0GjMX3uR3vQQ94QgZL86L6kNoDtpFgbot8vdtEl8mba7iiVC
 c+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XJ30J7VKV1daCsRGNwfmp9q3CDthhlGNXCEPTO+nQbA=;
 b=CClPFITAi4zOqn5T2D4qBNNPXqH5vmS9FDJ4dPdDp13AFa71xq9tGB8tHVlkd4qSz9
 +0ocGt8yW4UKB5DC7RIpf6Twy240fM1KOd/DBWBkktaII16acVd70oOdZ6jkfVD0M6zy
 v+TZ5oIIOxR22kldUaVRFo1PfD+z8JIlhDl17n6PfgHntHEljns0hjIPpc/vLI4pjZC/
 vCzHrAdgu9TT355DHLbSnSoaeuX8UVf+GWYo066sP0C2XTDjDTTxcHikdyvVt33Rr1lf
 HsVc7+Wd1afLO2TxNDNXgZs4tnwFN9a4R8AYIkIAb0MqlQSOQwoSZhCM8cscJGly0Qwv
 DH0w==
X-Gm-Message-State: AOAM533N9QPb38PpNMjoVJg/lWi3Sg7rXTHL06reY0n21qEsi9xMpcNB
 pM4idCbAi/3+hpjyy0oLSyrD1kGUid4=
X-Google-Smtp-Source: ABdhPJwBqGvbczjI7jyE+C1BkSY0LCJl39s636/wlyXTLR4kc/X91Rbc2m/axi7Bh7Ve+9wwieJ2cA==
X-Received: by 2002:a17:902:d293:b029:12b:1912:2540 with SMTP id
 t19-20020a170902d293b029012b19122540mr2172256plc.76.1626155566777; 
 Mon, 12 Jul 2021 22:52:46 -0700 (PDT)
Received: from archl-c2lm.. ([103.51.72.31])
 by smtp.gmail.com with ESMTPSA id x19sm17755198pfa.104.2021.07.12.22.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 22:52:46 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>,
 Matt Corallo <oc2udbzfd@mattcorallo.com>, Rob Herring <robh+dt@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Emiliano Ingrassia <ingrassia@epigenesys.com>, devicetree@vger.kernel.org
Subject: [PATCHv1 0/3] Meson-8b and Meson-gxbb Fix some missing code
Date: Tue, 13 Jul 2021 05:52:12 +0000
Message-Id: <20210713055227.1142-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_225248_611994_89431AEA 
X-CRM114-Status: GOOD (  11.43  )
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
via command line USB hot plug seen to be working.

Another issue I observed is increase of USB interrupts event
even if there is not much activity on USB ports.

$ cat /proc/interrupts | grep usb
 35:   26462800          0          0          0     GIC-0  63 Level     c90c0000.usb, dwc2_hsotg:usb1

Changes added power node to usb phy and small code cleanup
in usb phy.

Previous version RFC.
[0] https://patchwork.kernel.org/project/linux-amlogic/cover/20210617194154.2397-1-linux.amoon@gmail.com/
Dopped the reoder of code changes as of now.

Thanks
-Anand

Anand Moon (3):
  ARM: dts: meson8b: odroidc1: Add usb phy power node
  phy: amlogic: meson8b-usb2: Power off the PHY by putting it into reset
    mode
  phy: amlogic: meson8b-usb2: don't log an error on -EPROBE_DEFER

 arch/arm/boot/dts/meson8b-odroidc1.dts | 20 ++++++++++++++++++++
 drivers/phy/amlogic/phy-meson8b-usb2.c |  8 ++++++--
 2 files changed, 26 insertions(+), 2 deletions(-)

-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
