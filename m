Return-Path: <SRS0=1HBj=BJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DFC9C433E0
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Jul 2020 10:02:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FC75206F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Jul 2020 10:02:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QBicUyrf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rpIGXuWW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FC75206F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FN8MYnDtpJkfoFpoLPMz4lSJq3m0vYJVxd34VQhoq6o=; b=QBicUyrfyEz9Q8iDlvqdAFe6lq
	FnUhlQs4zy2//DoNrf43S/eyiFIKPHe7QLJ3tEWWQ4G9Z1w4pM1gXI8jSFeRIHbdU8X15EZsjvPub
	56bUEdeMPD5vfO/rQD1SlKDS8F5YQW79Ov8BjNSFJlD6rOmEuPuvcDf+duBIZGr5Tk23WYD4XvZJU
	60ftMSGIVMwuocESM3tFDU8bLuVIiT7RJkotzGKT74FxIkW07ft3xo+096NtkD/tQ61vpTRdyUpE8
	qBp9pX4eZSPMzhRQZXdTPNYUQmz8Q1HdxGEG1twqu8N7U3Jujgm37uw0KrEJZOovPGiTLWro90UdP
	q1D6nj6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k15ON-0002eo-Mb; Thu, 30 Jul 2020 10:02:27 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k15OH-0002cq-Nb; Thu, 30 Jul 2020 10:02:22 +0000
Received: by mail-pl1-x634.google.com with SMTP id o1so13625977plk.1;
 Thu, 30 Jul 2020 03:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H2QHOBQ+Sp4WVdx5kDP6cQT1aif1NuTz4ehhBg76Yns=;
 b=rpIGXuWWVCpza2uX83lNvd9h+p8s1821V71cVPkAvbb/U12Vk6OmW5PG8dsvg8YdwH
 C8/bazyQ1odWp7hE01uIXVP/WcDCbepEU09GrNT51toU9mLPPikgsCKPhyqwDrs2WlwJ
 gcr+BFVEluBiYQV0mRKJLuG6jBuxBptpp+FKfay5wpx2J5BqBf6rUK0MTw0YhNKMBs+G
 T1P+1zHiGV/HbXoR0uL4JSfcIpMBVpFgj8Ycm+1EKKKuZnsPBGmKFy+cfT+RNMKip8U8
 x5tKOx87FA6/rorQfEG3Gn5IqtE7kDpiftTh1u+CDu8u1dPpK64sBW7hXivK3brszqVE
 CuAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H2QHOBQ+Sp4WVdx5kDP6cQT1aif1NuTz4ehhBg76Yns=;
 b=OQw4orWgRMuA7wUdTov1X/ZMnIQ8h4Z5wcAoSEziz2kwBc3cda0/ilhuX0zRPpZIzb
 JYk+4KtBY6KYwUh48DdO5qqkluGoNl0amjXSnNA4+mCTq8NBmlxjD62/JxWsaxy1oiL4
 5+DC4wK1WByRa9++ohr6OT6xwGI54KzaAuxM/JOAKV7K16jVYMgE3+HkmdmNJrK2/fvk
 j7jGNnFnhR7i/Grm6Nkes9bzpxgbOIzPTbnaqDKeWnDfc41nF1mp0EsPC+Otv9/ytjHI
 F+itvMVxvJ2DDuD8t7QgAFJ4j0NmdhOfWisB1SwcTXwuEb6jnxoQmVfhJp20tBtXNBus
 uh+A==
X-Gm-Message-State: AOAM531votZjegJOT7q4UD1Xdn3JvSE95cwXVaUFGLp98MuKtQ0krsQ/
 vx/oGvvhlWfxFGbxuIek7cw=
X-Google-Smtp-Source: ABdhPJyWIMef5yoBlir+5MtCbK4myBg0gv6rlN4l9L6TDtTsYxLbY5efopw8ZHogIalG+mCAHm357g==
X-Received: by 2002:a17:902:c40d:: with SMTP id
 k13mr13901771plk.220.1596103336599; 
 Thu, 30 Jul 2020 03:02:16 -0700 (PDT)
Received: from localhost.localdomain ([45.114.62.37])
 by smtp.gmail.com with ESMTPSA id d12sm5476640pfh.196.2020.07.30.03.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2020 03:02:16 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH v1 0/3] Add missing ethernet reset ID for Amlogic SoC
Date: Thu, 30 Jul 2020 10:02:06 +0000
Message-Id: <20200730100209.793-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_060221_858705_05F65BEF 
X-CRM114-Status: GOOD (  12.35  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

These patch fix the Ethernet issue on Odroid C2 & Odroid N2 
Some time Ethernet interface come up but no DHCP request
is forwaded to the Router, this happens quite offern on
my side. Adding Reset controller to ethernet node FIx the
inilization issue.

-Anand

Anand Moon (3):
  arm64: dts: amlogic: meson-gx: add missing ethernet reset ID
  arm64: dts: amlogic: meson-axg: add missing ethernet reset ID
  arm64: dts: amlogic: meson-g12: add missing ethernet reset ID

 arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 2 ++
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 ++
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi         | 3 +++
 3 files changed, 7 insertions(+)

-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
