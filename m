Return-Path: <SRS0=4Wh7=NB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3B89C4338F
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Aug 2021 10:26:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B103E60E97
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Aug 2021 10:26:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B103E60E97
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w692qCgtAeUp0pMxkMJ6J8vmzp2T5d4e3OHw/Meujzs=; b=dioHCNU7O/tP++
	eMgXEQlyiHkAdgeNW0ZydcLkqOFSl/QodE6LU1OxfcPwh56h15DUvUPGo/mnLnvRuTk6kdG0yABHz
	6cFYUtDTaDi3gIJGCXXrQuFDbh0hXce4ZuV/gnfL/pb2wlzrbzO34PtE7MAYxn+nGBCZgEIpgZVGP
	LKfTVLt7u6WKLVZqMdWmRy0YYt8alUNy2nLG+YEK1SCEYfgPW55HWEnXQrsQy4ekCKxuh9MHGgZf2
	SQForAc8bneuuBz32PZMftSL+jPmDkQf3RWcits/I79NqReQFJJsZk8lvz8iEru/zDLgHGqBkZpiU
	7/bLyL/CLtB/FxsbZq1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDOxu-003Vc7-2m; Tue, 10 Aug 2021 10:26:34 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDOxf-003VYc-2Z; Tue, 10 Aug 2021 10:26:20 +0000
Received: by mail-wr1-x42e.google.com with SMTP id k29so12756876wrd.7;
 Tue, 10 Aug 2021 03:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=mjY7O/pC2TcqSPG82GtWi58hA2y8Bv1MoiaYMqZ4vVI=;
 b=JqZnHfY+P04gFemljz3QJ5119I8BJNqCNkUXZP5Xde3C5M5XZV3mRmZBXGuiJuLpuB
 y3lC/DGEoe8U/yHxUKIXY7d6aIZSOu5Jv+QLcxNvqPyAc+v2IKx8WNXvc/Bw7Nu5gom8
 x5fCDWDc81FXxtuv0RXvtBTGPVRq/fPMA73v+Mu+RGgqGKeL+mO3uDea/96adeaT2Pbg
 dB+XoIuwYkqdY2AHaneALcojWzeoVQD6HVo1EeA8PWrrTLbFGA6zKgUTF9lloaMFt1Hw
 qN5Wt1E5w+7Fc1HxALUVnDRT73yqcMTZrOVswCb/o2Sum269O24oFFy03R4VwB+B6Vyk
 gnUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=mjY7O/pC2TcqSPG82GtWi58hA2y8Bv1MoiaYMqZ4vVI=;
 b=t03mPke97Ff0OdQkylI1HUuiD4woJJnWLK1w23++24J+t7zFp+Rjj/DeS223OOgUCS
 2hRP7ETT0j1aYyLVDlsuQP4YmMzcCq+1HTbeuLWjUhkw9cOy2zDuLD97M3Bw7SZSSfct
 VAMbBB4QGGFw33Q8+cqjya7sBKF2v2GWBnOyVpKmJmpuH029orBZ5RtK1jo3wILcAq8U
 UELy5Ls/p4iwvYGQ1dwxf1L3xmOFOp/bD3/CLru7FMuWxlb7fXUejRcQBilneb3dfjGg
 uuI1zsHWf95fmEAZXEEEdbIB2MO8zLLIUBf/TlxgdhSUttv9n/tnsuOSLSBMoHqqSEsK
 S3Ag==
X-Gm-Message-State: AOAM5305j42V78Q9cHowd71pDegvSfMUqauLci4zZthc1Kn7sZfxBUYP
 6VcMvkAmva7htj4U/TvRe+w=
X-Google-Smtp-Source: ABdhPJxJg8rlUTfz4vqYgqJ+QF4oQlBfbwNVQj2jbNaJV9TqYAZAW7wdJV5HauBzT23Z/v/xvERvzg==
X-Received: by 2002:adf:e6c4:: with SMTP id y4mr30011954wrm.220.1628591177334; 
 Tue, 10 Aug 2021 03:26:17 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id j194sm1582998wmj.3.2021.08.10.03.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 03:26:16 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH v2 0/2] arm64: dts: amlogic: add support for Radxa Zero
Date: Tue, 10 Aug 2021 10:26:11 +0000
Message-Id: <20210810102613.25149-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_032619_138985_C7A9EB67 
X-CRM114-Status: GOOD (  11.39  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds support for the Radxa Zero SBC. The device-tree is loosely
based upon existing support for SEI510 and U200 (also G12A boards)
and has been developed with the 4/32 board configuration.

Changes since v1:
- Drop flash_1v8 and use vcc_1v8
- Rename dc_in to ao_5v
- Rename vcc_5v to hdmi_pw and drop GPIO control

Christian Hewitt (2):
  dt-bindings: arm: amlogic: add support for Radxa Zero
  arm64: dts: amlogic: add support for Radxa Zero

 .../devicetree/bindings/arm/amlogic.yaml      |   1 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../dts/amlogic/meson-g12a-radxa-zero.dts     | 407 ++++++++++++++++++
 3 files changed, 409 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
