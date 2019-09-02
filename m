Return-Path: <SRS0=Oax9=W5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1204BC3A59B
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Sep 2019 05:50:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D641421897
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Sep 2019 05:50:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WVMcQDmH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gTxwNe23"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D641421897
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UfvJfWkBD0yCm7uprWY1iFzHzJBN93Q18+LxZjHYGgE=; b=WVMcQDmH8qw4tW
	BsaaG+VWpIYN1XFRSfTTSXqpJe9g5KLItkGQx+K665LIf//O/VjeuT++iDcuQ6jFYARQ4J0EG7eD+
	sZDPJ5ojPr48obnnemHWO/4avjgQ5rz2pi5XTyLdWKadykO3iOHtoJQr2S6YHKRxQ9h48CXxfIJUf
	w+TVYYP5j28Wcdu4A2PugSzUBfq6cSq5lB9xkJQMFehBbypF9ozfjElHzfpF8A4vgDvBr+VvdYd6T
	9PbrmrQKhLT4GUHABTtom+A+KXxHykFPtzQ/vBLhKy0mbS9GSx4la3QRTDi8N2mI5YFmHclyvdaTV
	IJmD99mRha9Odi3XSoDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i4fE2-0001Je-JT; Mon, 02 Sep 2019 05:50:02 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i4fDm-00017b-DV; Mon, 02 Sep 2019 05:49:47 +0000
Received: by mail-pg1-x544.google.com with SMTP id n190so6903632pgn.0;
 Sun, 01 Sep 2019 22:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MHdxKsFqjn9JIHizAHLjgVQgY6D3oHhQhJ6Mqn2/Qis=;
 b=gTxwNe230a+264cG9c+8Feyt1MMUrqIZtlpV2gNcUSLYb9cGMxCXEDMCXl+5tiMyd7
 eUa/FrxSb3adsoXpZ3KxcgExKHRp+/hvRpiAZAxjenPJkjOYsUoRdTRILyEkmug4+JE2
 j7fCV8+2/+6M8w8pXHBB4FH11+PT9DpxczyrJ9TErw6BrQhiT9rQ071e82EHNCDawVrP
 260yQtXj7stBkcZtNNv0f8vUSfhlWQ9+vGNJuCK6il9nb8jb6d7MeBvK6yDblE353vUj
 3Fcz2nQzuhtim8yXoBxjdue88BRauI+qfekOrrHgbejP1bkdfe9VzvnN8/TmFSoHFjQM
 dqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MHdxKsFqjn9JIHizAHLjgVQgY6D3oHhQhJ6Mqn2/Qis=;
 b=jXXtSAM0YjUqD5/SYUK+A8b8a0XI4wlWqltP7bEStuwmr4SFal0Jio/i9MZevHBUCH
 qWeVRG9c9tXr76YkLRWXG5omQRQj1NWTFIgtAbtGI4AYDb3PktVxaPqX+jwOFR6tc0Sm
 skLrKAGXLsapWce5gWd2VTIgZG7NV3Mv2+W6ZPQD8lwR8koz38UVun8rO18trpQIbzXk
 xSY9mnzhKzf3RpWfjzAyVeASsg11xdoB1gS3d8UGXz1o0lqjjCP6V/LufVLRQwY6fLfk
 4fBX9g1mABPVnDoOnJQl8chSt5YKq3nJIaqgN4d0apQXuRFr877Tt07H+EOUC0BfjJxz
 hfZQ==
X-Gm-Message-State: APjAAAUwtUXnud0sK2s7dLtna3xEcCy+mEsFasPMEffa3MhFxJONblzg
 LfA2GeFFujiHA86sp5Qv4Hk=
X-Google-Smtp-Source: APXvYqxMMBohwzZ+xCjsgq6JKN2mBCiIwV8Sg2mHwLWuAJb5J6RTlHaoYhCkAJ03i20k7n9FGw3M1w==
X-Received: by 2002:a62:1808:: with SMTP id 8mr32564790pfy.177.1567403383986; 
 Sun, 01 Sep 2019 22:49:43 -0700 (PDT)
Received: from localhost.localdomain ([45.114.62.203])
 by smtp.gmail.com with ESMTPSA id 136sm16533912pfz.123.2019.09.01.22.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Sep 2019 22:49:43 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCHv4-next 0/3] Odroid c2 usb fixs rebase on linux-next
Date: Mon,  2 Sep 2019 05:49:32 +0000
Message-Id: <20190902054935.4899-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190901_224946_489132_93E9533F 
X-CRM114-Status: UNSURE (   8.71  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Some time ago I had tired to enable usb bus 1 for Odroid C2/C1
but it's look like some more work is needed to u-boot and
usb_phy driver to initialize this port.

Below patches tries to address the issue regarding usb bus 2 (4 port)
while disable the usb bus 1 on this board.

Previous patch
[0] https://lkml.org/lkml/2019/1/29/325

Re send below series based re based on linux-next-20190830.
For review and testing.

[1] https://patchwork.kernel.org/cover/11113091/

Small changes from previous series.
Fix the commit message for patch 1

Best Regards
-Anand

Anand Moon (3):
  arm64: dts: meson: odroid-c2: p5v0 is the main 5V power input
  arm64: dts: meson: odroid-c2: Add missing linking regulator to usb bus
  arm64: dts: meson: odroid-c2: Disable usb_otg bus to avoid power
    failed warning

 .../boot/dts/amlogic/meson-gxbb-odroidc2.dts  | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
