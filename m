Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E58AC4332F
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jan 2022 15:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IdEfaYvaWUn8lkOpX/2k9D28/ySixnhY+N25AoFKQVs=; b=yBtmYWQAg5jnc2
	/g+GabRp2wYsYkKjdQvVsbVs7rjqgjc9IV226QACglBHo3lb7EbvGFuHICsxQQ75YqItdMVdAbHbJ
	gc4Vao80ppJYn1mm/9rSqMENzk1ZIr/XrQDmN9izW8LWi+QO7aWYmFZO03qpoOgo938Fn9EScpMcT
	27uMre042zFsBCWM3ajOqZdCG6rTNoRQifSk1wrOQeBO4T3iAghx7LFoDFP+ao9kb3i9Cffz+Ejna
	DrCAUinjlUIeROxPJ+xqUZ7upy2dIKAZ6j0EHr2Jf0cP35pdmNobt4MNAYx+rmayIptnY7FGk8e3E
	5QCF9DQAEcElR6Qrs/Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4PY8-009OJf-Mh; Mon, 03 Jan 2022 15:47:04 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4PXx-009OFH-Jy
 for linux-amlogic@lists.infradead.org; Mon, 03 Jan 2022 15:46:54 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 a11-20020a17090a854b00b001b11aae38d6so174482pjw.2
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Jan 2022 07:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9f89L4lDDyyfgV9BW7/wlPt0i6sDhOq7O3gmzWno2cA=;
 b=IvqSkjlWZcvybkvlIWnL3uClSTdDiK8bPkfylDj9xj+vMmaLM2naAdseWeApUK9Ow4
 DsWzrO2BunjCu8HchtYwIT5ptHgOc0yCt7XTgZkT2RX+gZLcn7/5uCi8WkutxealSqSw
 s0jm/fLWRaT3aBuUA788Anv01qzMdnYfAcGMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9f89L4lDDyyfgV9BW7/wlPt0i6sDhOq7O3gmzWno2cA=;
 b=rI+EtqTJfOqHD7WFKhlr4TkdleWB1GkW29iGGc1yN/MVwLRF62Ghgl+CGPifq8jiUB
 dOPQ+/bGR9hfu6epkevoM78Lj+t+dBuu4F5X3FTVEuOIvkTxtKhWOBVPyasCo5hjueRw
 tjWu6Q+Lh5tKHWa5OQXP7HJVLkRnTJXN16JHtdOXMr7Fpf8HQeW8yNuE7rq+YPtw7SaE
 SsjnJmu2nmqfPFbrEk4lvg0nY9uilOiKA4Bp3KFdUlxxIa/8IAc63tAsojPf7GhghnVR
 tXLjO49sTIRDX2CdipjHCzKXnvDRCEMkD4Z8YBUOwP6FY5Aoz5zXpC7rkKTLWvhkU7z9
 rS4w==
X-Gm-Message-State: AOAM532WuDOaq0nAluHNNKWGE7bipw5JfiX1UkLAbJ7dd6qEvn7M/UDX
 QuOkUIdzqgvdFw41kl31c+VGTxRwHxttxw==
X-Google-Smtp-Source: ABdhPJwOyrLU/3kwDGjaTKXC5fxZO4SAgn7ljMYiD0avj9CxtKC51+rVxhsZfvMH5uYg5Hi1YYfOkQ==
X-Received: by 2002:a17:902:7ecf:b0:149:956a:c2c7 with SMTP id
 p15-20020a1709027ecf00b00149956ac2c7mr25496283plb.40.1641224811350; 
 Mon, 03 Jan 2022 07:46:51 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-idf1-1-1088-186.w82-125.abo.wanadoo.fr. [82.125.191.186])
 by smtp.gmail.com with ESMTPSA id l2sm41080153pfc.42.2022.01.03.07.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 07:46:50 -0800 (PST)
From: Gary Bisson <gary.bisson@boundarydevices.com>
To: linux-amlogic@lists.infradead.org
Cc: Gary Bisson <gary.bisson@boundarydevices.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] meson-g12: add pwm and uart pin muxing options
Date: Mon,  3 Jan 2022 16:46:13 +0100
Message-Id: <20220103154616.308376-1-gary.bisson@boundarydevices.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_074653_665762_7C8D3044 
X-CRM114-Status: UNSURE (   7.84  )
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

Hi,

This series adds a few pin muxing options needed for our HW platform (to
be submitted soon).

1- pwm_f: adding missing both GPIOZ_12 & GPIOA_11 options
  -> tested GPIOA_11 as mipi display backlight
  -> order for this patch is not alphabetical but follows doc order (to
match current order)
2- uart_ao_b: adding both options for ao_b uart + its rts/cts pins
  -> tested on custom hw too

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
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
