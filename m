Return-Path: <SRS0=3MJg=IN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40DE7C433E0
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Mar 2021 08:36:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B98264E90
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Mar 2021 08:36:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B98264E90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ry72yvtPNOf05uBE+x8fdQyVRM8smxQ7FXI3m0esgvM=; b=itFp+3eofomXgR4Xd2yRaTzyBk
	saJsOCgcb0rslsz2AtDzvTx8BDZiXK1HCUCbi72p/sRX5CFmNOcEJKmwSxxPWd3TnR4j+zE9diHp8
	L8AZIe57W2vLBY+brHgZx/S+l03wv0Zm8gtF1UmlGt4o9poyhM9cktzXTC/KAsEPwHsejK1OQHgs3
	5PWByjJ/qkaj3rnAPIjVW/xD6gGR4U9pPMhzsktBg2yC7ph6zx/pUwwNunSyyTfHH5Ori5ElalL9b
	z4XSlWoAKXph53u1IAjJoccYZVHgaFWnUcGkdtreNPsBmA/CpKckVNKw26vHxumWNVR7bVQeptzfG
	96VqEIwA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLihz-00FF9y-8P; Mon, 15 Mar 2021 08:36:15 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLigr-00FEsD-EG
 for linux-amlogic@lists.infradead.org; Mon, 15 Mar 2021 08:35:15 +0000
Received: by mail-wm1-x331.google.com with SMTP id g20so7583168wmk.3
 for <linux-amlogic@lists.infradead.org>; Mon, 15 Mar 2021 01:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P0LQpqn1sp2gKQ3mxss2v0MtbNQBB0Oge5rskRFXry8=;
 b=mf0X2squuN88Q++1zVaRbHGdHRdk3lTEgBdvpHWKawpFl9gkcyhB9lxEqGPXqDEKB3
 U5cPricaGv0BQdvagmtoYE+lY5Y8/CirkRwowKmsgU100hcT88/Pwx7hinYq/tYTQ7Zv
 daQAXFI+FMsLWslVOhvSizjfkwfNMRwVxNzG6t3gc5kTm1D0Ho+3PXi5qLapQzDxuAuU
 d4tXIE8CcfBPxalFFryeM/W3vbXTRoO9o3JOojFaocc9117Ym6D2tMVMJLwjvLgpZNoS
 9PTtgP6ib8QfgE20jExO7jeti3Xv4/s+uprCC0R9FJamWjrh38W+MfHmshnrH02O0sVq
 8MNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P0LQpqn1sp2gKQ3mxss2v0MtbNQBB0Oge5rskRFXry8=;
 b=Ze7PH40wVOJqLUPkV8LaUtMxDhd0c9g76ZyyutWXRj1/8l+kvOn7HDyrCj5NeN8nYh
 Uwm263tIppOckhDi71j7C89rfGharuiL33piGDlXiTYVlNTYrgrjU8R4tVbTPxQs4P2N
 n+Y5p21asQ0ZQXdvP/oqIKud/gkhuH2Aw+PFH+bH0KBvZu7f5Pc1Y0DbmVEVarljfVPr
 UMN3LQUEKkUq1I7g6+1Z0/vKyUQ7J8zMszcpGfRpdUmzNI2+RWTyaYNzVMnx6X2/4Ny3
 m6qdetnHawGykF6Lw2p3gv7UMaWOtSulZjeBKJREf1EnXJsALu0GTLGgM6D8M6m4UQHi
 +Cmw==
X-Gm-Message-State: AOAM5305k2bDASD4HxKbMJSvUn6Vpf5O7ku6mvsTAcaSCE6BV3sZ49bF
 6V9rISzvtPEzADKiUT+pE7nkFg==
X-Google-Smtp-Source: ABdhPJyuSFJ7w+LBE8QbGv2YrAgzrRTewd+TSsCmAC0t3U6NZO7rWWq9kbxRNygSBIk41pxdEObIVA==
X-Received: by 2002:a7b:cb99:: with SMTP id m25mr25428082wmi.64.1615797300081; 
 Mon, 15 Mar 2021 01:35:00 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:708f:15aa:638c:22b7])
 by smtp.gmail.com with ESMTPSA id
 o2sm8372028wmc.23.2021.03.15.01.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 01:34:59 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: gregkh@linuxfoundation.org
Cc: devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/3] tty: serial: meson: add amlogic,uart-fifosize property
Date: Mon, 15 Mar 2021 09:34:56 +0100
Message-Id: <20210315083459.359773-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_083506_674111_E6887D85 
X-CRM114-Status: UNSURE (   9.46  )
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

On most of the Amlogic SoCs, the first UART controller in the "Everything-Else"
power domain has 128bytes of RX & TX FIFO, so add an optional property to describe
a different FIFO size from the other ports (64bytes).

This adds a property in the bindings, reads the property from the driver and updates
the DT with the new property.

Neil Armstrong (3):
  dt-bindings: serial: amlogic,meson-uart: add amlogic,uart-fifosize
    property
  tty: serial: meson: retrieve port FIFO size from DT
  arm64: dts: meson: set 128bytes FIFO size on uart A

 .../devicetree/bindings/serial/amlogic,meson-uart.yaml      | 6 ++++++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi                  | 1 +
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi           | 1 +
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi                   | 1 +
 drivers/tty/serial/meson_uart.c                             | 5 ++++-
 5 files changed, 13 insertions(+), 1 deletion(-)

-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
