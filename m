Return-Path: <SRS0=WrmZ=KN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFE5FC433B4
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 May 2021 07:59:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD17061261
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 May 2021 07:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD17061261
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Gf4waOsVXYb7unaO98ocLfOaEPLrw97l1K7iS+QeC3E=; b=kzqIySQybX0JsTCl2Elyu9Bx1h
	IN1YZmTIERWVNWq7xo/jV6KSRnnc5teJii2C7LR3pMl3iPjoTbWuD3kzy3MIDiUjiTR8Nw8NW5LEy
	5skxRAQoQ1snLVmJRYP3UIA6Vlsgk51BIt1kzfnSUW0+GK+kmchoIz17q5f2I2vY1KURDnBW9rIUl
	YfwcgK1xCHPNKlQcnhq347vimgrW4SBrWdF8h9+v0CYgBCUHYau2Q4aODOwka3H/fJ2sSVUamR5gj
	/uPnpJH9xcROeANiaEvtI6AuOqn4Z0bS8VIQJmTchYuHpb3GyAUG2YIierH5cuHLyniVrOyt3zGmH
	no+2WWkA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liud9-00HU2i-PQ; Tue, 18 May 2021 07:59:07 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liucp-00HTxf-R6
 for linux-amlogic@desiato.infradead.org; Tue, 18 May 2021 07:58:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=DkFAJ7cUM9Paz3T90sR+cBtykdhQ8PjkYKNHuPU6o5M=; b=Unt4TanRF2WFbAXVf1mfifdAhx
 pTWL8R8W9dsiKUmVn/dcTwNDBTGdnqrYLHBeDlUFtoJS2Irt6y1Ibwxr/SKOwjsZ0HfL5ty2M+V3v
 nN/aD2o9CFIrc8y/0D26O54xiAFzS8A13znKo856aArt8U8FsDFH0TVwGyGMtR3xcS+kUalxOfRAO
 EWWMgPKi5r8qzynDygAUj/YJMJRXcs/OA01yTk69/KV2Ebh4T4BX+dG5H5fDeqIlLkVhY7r0G39oa
 A7mZLFXcra1hN6KLdumlR83lWqc9kOcTg/bxChpYTAMqt7qWSsBRjHq6PmBM6IV1HVeUnXS2AOsPe
 6UQLoAfw==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liucm-00ERDY-1C
 for linux-amlogic@lists.infradead.org; Tue, 18 May 2021 07:58:46 +0000
Received: by mail-wr1-x433.google.com with SMTP id y14so6999288wrm.13
 for <linux-amlogic@lists.infradead.org>; Tue, 18 May 2021 00:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DkFAJ7cUM9Paz3T90sR+cBtykdhQ8PjkYKNHuPU6o5M=;
 b=ITrtzVzPkLnjWtjElFMH31l+nVtM/TcQlGdY97yww8azEW2GuW+ptPOqD0j+2epwO9
 50UTGFcMift4HCK21eiIrSxXUQIvNO0nGh0OzgfSoIJOMsxH15mZQ1ywa/XCDxXSqP4g
 aVzknNUvQ/m+BmertAk6N2SBmNb94V0915egTGL6g5cNMcU57HotyPGxk31uX+nV6/kE
 ydXh2Ztmk30ZOmZY7hXbJBHDpFNWg1AUvudIzoRRXUwjryjRhdF0ofHGLsVjC/tiYyZB
 yZiZ1zCmii3IUIbvc2DvtTSIAL2Z7Msl8oqtqrgHTgdiRFej5r1Wc3o6tLv/1blwpyuc
 L2wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DkFAJ7cUM9Paz3T90sR+cBtykdhQ8PjkYKNHuPU6o5M=;
 b=porugciqhjLQcr4xys28YEDMipZP3ruvMsTFNGrqaHDeqmQs9+WXnzb+RBrPj8tYBJ
 fSLpe24ws3KVX44RK3zdNry1LuxNBcQjU4ch8yjn2ux4QtrBcEvuD+bTcJxR3F+ox9rl
 dX5IM6icc29PbeLgpl7YbMCfhUHanAfDsATMQh3FJFbQXAFmXu6ex6BCr5hMhm2J0lpH
 t9rEKeWqsQ74Xs70ao23DTmbqKRcPD6LsBkODnSsgo5Ngvs9cO9VYvKql0kyfwGniK9V
 Fgxm5nPOCO5xc7S9fhX70nV9N8yieV/jKT8W0xWefEZubdmfwPoG5lZ1XwvLt+WmlTOB
 AeNg==
X-Gm-Message-State: AOAM533d8ezaTNJ9U09c9RkT2scncc/AxyU456H1pyR+V/Vm3DX5vWPs
 i9ax6L+1kJKJNHlmNKb8YcoZEA==
X-Google-Smtp-Source: ABdhPJyKfFz0SKbNMOc+Ey51iyEMF4nI1arx0EzIXE/uR/jMy6HmULXM7jsFhK6o1WZ0X4tTPNMlvw==
X-Received: by 2002:adf:fd82:: with SMTP id d2mr5256142wrr.218.1621324721170; 
 Tue, 18 May 2021 00:58:41 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:842:2d82:a1ae:1a91])
 by smtp.gmail.com with ESMTPSA id
 v16sm735448wml.6.2021.05.18.00.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 00:58:40 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/3] tty: serial: meson: add amlogic,uart-fifosize property
Date: Tue, 18 May 2021 09:58:30 +0200
Message-Id: <20210518075833.3736038-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_005844_090175_BABBEFA0 
X-CRM114-Status: GOOD (  10.87  )
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

Changes since v2:
- removed spurious blank line from bindings

Changes since v1:
- switched to a more generic "fifo-size"

Neil Armstrong (3):
  dt-bindings: serial: amlogic,meson-uart: add fifo-size property
  tty: serial: meson: retrieve port FIFO size from DT
  arm64: dts: meson: set 128bytes FIFO size on uart A

 .../devicetree/bindings/serial/amlogic,meson-uart.yaml       | 5 +++++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi                   | 1 +
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi            | 1 +
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi                    | 1 +
 drivers/tty/serial/meson_uart.c                              | 5 ++++-
 5 files changed, 12 insertions(+), 1 deletion(-)

-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
