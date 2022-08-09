Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0EFC19F2D
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Aug 2022 17:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KBefnhnjcOOfKo1lv/qSq0ewAc1BbCRrIIzGVYDLT3c=; b=XxvEOhbkwNOKkM
	X80eczTMzBaRGCVTLSlUKcHDtfaBmWTUG+mCnheeGfi3/78f2KWWoWnFS7D6FuDKe+zGDLqhSLDyC
	d0c6CItM3b/U3scRB/Dmi5MkpEB+AsB4OFI7q0m5gv9/JDzj7BD0bdHA5ouhucimwXwowe05Y5iU6
	275M6jD5Jfb70Vpa3VPitiIK4UdM7tpcyrlv6a1gtXjeMBUfaVnSKIYiQhFD4AycTqf/rnnpjt8+W
	pHkmLE+Gkyjghkd3WwGG/jL8cSYo/1GHg0cyPiw3PPyZC3C4vesjeJAFLBe1/tlPGJS2/2g9I/bIS
	14SsjAnfuuKXbb5AxRUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLSuf-005EMX-Os; Tue, 09 Aug 2022 17:21:05 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLSuT-005EHd-Dq
	for linux-amlogic@lists.infradead.org; Tue, 09 Aug 2022 17:20:56 +0000
Received: by mail-wr1-x42a.google.com with SMTP id p10so15034112wru.8
        for <linux-amlogic@lists.infradead.org>; Tue, 09 Aug 2022 10:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=sHMkwp3NTmTV/xVMwqTRrDVuL8/D/PiDUhfkbp4j2rc=;
        b=XtroOFWIeD/FFHW2xP+1bOcSThi+rmn9mJ57T/c3OIXw1gF+5WvaBOcwq5GwjKbJ0P
         is9NMLJzP/Qo/p6/8iXdSm6+JQPrg73dE0eWaaIW2N/icGvmUlZQK2/H4X4GDDps9UOB
         0kq14E1slsCe5YfVVjY6uPjOB4GrpTUDlQrwWUgJaDNKxrmKBjkjiR006B6RTVLHx9px
         iXaTq1doW6zm1vb74VyQuQyCVMvCgMWzarx8FpBaq5t/tExGEd1lCi3R4Y7HwfxAAuP2
         LJ3ziyTKqhA4Q0ROIZJcq4NReSDGBKi0O8I9c8KvH1wIZQVxtBWJydL+43Hr43sTOkog
         fgmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=sHMkwp3NTmTV/xVMwqTRrDVuL8/D/PiDUhfkbp4j2rc=;
        b=8MIC+uiHOYIdPqjEcW/XO84CmhYIgDE+mnfT5yE0ZMCs2Z6p6UaLqnvmFmdkrYCW/v
         vpARq1PRWSkRzambJGwgr79H/6iTc4vCXkZ/UDCcSpO5OOewUeqglKB/UiPoGVn8fisI
         dNfkZlhcI9mvgtbCTbyIaVbGsefaqxvHKtja+nCCNcLDBAwk2zVWymRTJGkzolv34peX
         LUVjE4UCwNz8cZdy0v6CgL14f4/9kseSvUvzmTTMguqH7i09E1ZepBOWtuNQuj1hvUoY
         mwcNmEolQcf7L98Fj0Ojg3bavTa19gNlwFjSh4OmFkATQiC7vRt+xfF9/YoTFsZUevoF
         JAaQ==
X-Gm-Message-State: ACgBeo3B2jcUfyl68EivEPXtvfDFaACXtYbMYehjvGgCVqYowlqryNZT
	AxobKjzcvIgiJxXPHrzHMtrwog==
X-Google-Smtp-Source: AA6agR7te7yif/yib4C7IySe6UqMjagxvMgnKemsdomvzBKdmWEkXfKrO5pAusHmStkPSJnzDSwiKw==
X-Received: by 2002:a5d:595f:0:b0:220:619d:da07 with SMTP id e31-20020a5d595f000000b00220619dda07mr14966336wri.10.1660065650358;
        Tue, 09 Aug 2022 10:20:50 -0700 (PDT)
Received: from localhost.localdomain (210.145.15.109.rev.sfr.net. [109.15.145.210])
        by smtp.googlemail.com with ESMTPSA id b3-20020a05600010c300b002206261cb6esm13915030wrx.66.2022.08.09.10.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 10:20:49 -0700 (PDT)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: broonie@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	narmstrong@baylibre.com,
	Amjad Ouled-Ameur <aouledameur@baylibre.com>
Subject: [PATCH 0/2] spi: amlogic: meson-spicc: Use pinctrl to drive CLK line when idle
Date: Tue,  9 Aug 2022 19:20:15 +0200
Message-Id: <20220809172017.215412-1-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220809_102053_708004_FC14AB97 
X-CRM114-Status: GOOD (  11.09  )
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

Between SPI transactions, all SPI pins are in HiZ state. When using the SS
signal from the SPICC controller it's not an issue because when the
transaction resumes all pins come back to the right state at the same time
as SS.

The problem is when we use CS as a GPIO. In fact, between the GPIO CS
state change and SPI pins state change from idle, you can have a missing or
spurious clock transition.

Set a bias on the clock depending on the clock polarity requested before CS
goes active, by passing a special "idle-low" and "idle-high" pinctrl state
and setting the right state at a start of a message.

Amjad Ouled-Ameur (2):
  spi: dt-bindings: amlogic, meson-gx-spicc: Add pinctrl names for SPI
    signal states
  spi: meson-spicc: Use pinctrl to drive CLK line when idle

 .../bindings/spi/amlogic,meson-gx-spicc.yaml  | 15 +++++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi    | 14 +++++++
 drivers/spi/spi-meson-spicc.c                 | 39 ++++++++++++++++++-
 3 files changed, 67 insertions(+), 1 deletion(-)

-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
