Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D7BC433FE
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jan 2022 21:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i4Be0T3upxFyaxUhyow5QzKAOv9klP/5tm3bfsJe/Lo=; b=TxPXKkq9Wcgaga
	GX9MNNqrtE+lUrNJfx+Q/eoagZLPzoJuGZINpMgMk6Zd+T8MSZid9awedEItvYY79oP5C0ZHPFl1e
	F1Aps3Pi54g8SUdvJY6cs43TWXSpcR0jREY5ASxai6f9qjED0my/kID7pIyEb20HpmSKHjNxPHBiK
	wDDdV92fC+bJKwZBw8Ed03064LV0scglFor5wiGdnBfx+6B0JbYxatZsGNy6irQ6Sm8FIJhlBvJqo
	NlSUsBJaNGUB+VFjoeXlV7VM1HSQm5cPqSqPqtaYecC1z1E3rfTOmdW2xeIvzxaCGiFfRSovwx0mi
	hwB3zVMwhnIhZllbdcbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7kzH-003paL-3o; Wed, 12 Jan 2022 21:16:55 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7kzE-003pZt-Ly
 for linux-amlogic@lists.infradead.org; Wed, 12 Jan 2022 21:16:53 +0000
Received: by mail-pj1-x102e.google.com with SMTP id oa15so7552495pjb.4
 for <linux-amlogic@lists.infradead.org>; Wed, 12 Jan 2022 13:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UM6f/mImKJwqjhftilJlGgIQ0nBT5JdzQHp28iGUEME=;
 b=RhZCA+rt44+NpRxEwuzpWzfAubtf80b7VxOC55E+ms76JwlSsjeiYiAVss9MAjzQSP
 p+Txz4ShO5Nfiwb1D2cqKnPki0AinuqCcTXA51tAhEPCJqsTENkUAEobaWjQGCT/C7zG
 I5yVSExls3z+vG7iU5KryygFGUbsigu37hqqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UM6f/mImKJwqjhftilJlGgIQ0nBT5JdzQHp28iGUEME=;
 b=ECM/NRViI7Z7b11y6zASEvDXifpb/Ndy4NagtAXVFWCrCLX5YJtiV1F2sfQYFtwlNK
 TSQgM+Oh1tYeVgUbSQ6qmuzc++eCgF8EyqXDaBUY6++TbSyXmHhqHHkubh6mIDsnT8ow
 bISP3KcgQNfjyblfxxuh7o7gstIW7pramydGATihnnT8Vtw8jV0hvxWYTMY1AabOs4ci
 VXdE00l1AWNEqkwWpOPdqmmhc3RdA2/cjgufm2VDdbZmwWKQ9jXgVeng2fD8jIJSo2z+
 f4zXCMiSzL+SgZZXDrwQAWDppZshJ9kmTMtuE1yLPpMGQqld6dS3COeOXUQVOU61PbS4
 u8dg==
X-Gm-Message-State: AOAM533+jjux8znu7mDk7Y+ug58zK6YISnKmheG87RNeH4Ddu8BP8lso
 wT+GcogOdYyJOYetNQyY2hP2x1J8L/XKyw==
X-Google-Smtp-Source: ABdhPJxr6+sXTj6A54lNdFsuhCQz0xb+MjQak9zK2zgzbSkLqItuWzj/gUsFVClsA/QE0yxMPjCB4g==
X-Received: by 2002:a17:90b:4b4d:: with SMTP id
 mi13mr11072309pjb.73.1642022211414; 
 Wed, 12 Jan 2022 13:16:51 -0800 (PST)
Received: from localhost.localdomain
 (2a01cb000f5a8200e371e4a5048c8b22.ipv6.abo.wanadoo.fr.
 [2a01:cb00:f5a:8200:e371:e4a5:48c:8b22])
 by smtp.gmail.com with ESMTPSA id h15sm507192pfc.89.2022.01.12.13.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 13:16:50 -0800 (PST)
From: Gary Bisson <gary.bisson@boundarydevices.com>
To: linux-amlogic@lists.infradead.org
Cc: Gary Bisson <gary.bisson@boundarydevices.com>
Subject: [PATCH v2 0/3] meson-g12: add pwm and uart pin muxing options
Date: Wed, 12 Jan 2022 22:16:39 +0100
Message-Id: <20220112211642.2248901-1-gary.bisson@boundarydevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220103154616.308376-1-gary.bisson@boundarydevices.com>
References: <20220103154616.308376-1-gary.bisson@boundarydevices.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_131652_738965_257EDFFB 
X-CRM114-Status: UNSURE (   8.20  )
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

This series adds a few pin muxing options needed for our HW platform (to
be submitted soon).

1- pwm_f: adding missing both GPIOZ_12 & GPIOA_11 options
  -> tested GPIOA_11 as mipi display backlight
  -> order for this patch is not alphabetical but follows doc order (to
match current order)
2- uart_ao_b: adding both options for ao_b uart + its rts/cts pins
  -> tested on custom hw too

Changes v1->v2:
- rename uart_ao_b signals as suggested by Neil

Let me know if you have any questions.

Regards,
Gary

Gary Bisson (3):
  pinctrl: meson-g12a: add more pwm_f options
  arm64: dts: meson-g12-common: add more pwm_f options
  arm64: dts: meson-g12-common: add uart_ao_b pins muxing

 .../boot/dts/amlogic/meson-g12-common.dtsi    | 43 +++++++++++++++++++
 drivers/pinctrl/meson/pinctrl-meson-g12a.c    |  6 ++-
 2 files changed, 48 insertions(+), 1 deletion(-)

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
