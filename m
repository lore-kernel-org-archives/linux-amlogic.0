Return-Path: <SRS0=JCZT=UJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E0DCC31E40
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jun 2019 16:45:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00E44206C3
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jun 2019 16:45:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QDSrGM25";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="dLs3GkEG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00E44206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vS6nzUTS9SH1HjDacojxYKEuhbCUQuMmakOl1sMsGrg=; b=QDSrGM25odT4eB
	ILTg6N1ofXCesDpLbs8G3Go4fdoX3lyl4uxPyuHjxVXP7zmkCVKR4QXXfKFa13N3miALrZhW3ulRZ
	yKm1jIbD+zoJ3QO4pVDoO/MIO0//Mggj7ECDDxglQW/hoC+5T5Qci7Pggtj0n/oqZdw9Uh5layMwx
	FaHIj81jzRep41tWasIz9e6Cssk6SdNM+8oUoLbn38CcrpG4DNn6omC7wUWYGJGkwg79WSSx2P8Tu
	g6s3+hXNP5WMPsYNhTlPea+/aCkZaBasqTaNwWW3v0++mTVV4rdXdm7GPRPHCyqC7l4EN8UEGkq6q
	nUSmSovQlAXdoiZYjNPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1haNQW-0003Zs-Gl; Mon, 10 Jun 2019 16:45:44 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1haNQT-0003Xj-B2; Mon, 10 Jun 2019 16:45:42 +0000
Received: by mail-wr1-x443.google.com with SMTP id c2so9884129wrm.8;
 Mon, 10 Jun 2019 09:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=atD0PAi5sOPjSTIUUiE9fFF80lpCvQQKnWdofwI4CI8=;
 b=dLs3GkEG06LBImSCtU4a4V8jXEuk8rKwMUHm/kWB8kFTH1DYKZXAc5sf8OLn11z4Qi
 CT518WxPuKwwWBMO5Cht9KvgWQmqpjALn6YS94P4IM+0OEbL6aNxKpvwMlmoanOEG8e1
 sr6+yB0LwZxDJmkipEhPMBL7em/oi+hHiIqlfqZBhwxaPN3perkctaBNG2sRbs9+gY6Z
 V/Dkx0SVfgqYKC9yXWIiOx3mpC9GguyMzUFfaqe5Wu5g84L4IDygZjWfgp7rW8hFMbp2
 NysgQxSw1r0XKDeLLCvlCECQF6nIHnzEvUxNdnWyI7KsZ6TmEM0zQgJgznSPfNesMR0d
 O39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=atD0PAi5sOPjSTIUUiE9fFF80lpCvQQKnWdofwI4CI8=;
 b=DHRr7J8rKBIjs3rKyKFB1OCUYhJFCJqeNaxvYgHP0o1BdaT+JrupfLv+UqVzJu8IKX
 tH/g6HscXybFcaRaR0hW33i3vFOT1mG0zsWvscwQ6ohgkerD7I9M4eYCCUgam4/bTCut
 5uZ2rDHVaN1bbGFiMiJ0Hu2C1h9EFUY96suBHAbkMebpht+JemiPTKgNWlGeRJMeewM3
 Jzm9CL2hsNWTaJZexVW+WfMRJgm7DhlPqn1ZDlz+qFxiUwvrQb0XtFPjW5GuxL1tBuR7
 t10f/aqr9cMY3bEa3+WKtiFeuILahXKkHqJDD6C0oTe8oXjmbrQKQ0GAEKl91Dh0kCYP
 YYuw==
X-Gm-Message-State: APjAAAXQdDUjUVWMobCCWvAf/3tkrCnqUV7Fa4PUGi4XMamw1CV8bVB5
 ZQUGzHEEcU2TZzANhJ285xxZpI3z
X-Google-Smtp-Source: APXvYqwAlPuwzIPq1MSOToglEmT/DFNbT0pEDv8nx8cpyBG5z+0hTiPXvPFfRewOCOPc/g9BnsUZOw==
X-Received: by 2002:a5d:5510:: with SMTP id b16mr11138175wrv.267.1560185139530; 
 Mon, 10 Jun 2019 09:45:39 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133DDA40000C4C39937FBD289.dip0.t-ipconnect.de.
 [2003:f1:33dd:a400:c4:c399:37fb:d289])
 by smtp.googlemail.com with ESMTPSA id g17sm11441158wrm.7.2019.06.10.09.45.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 10 Jun 2019 09:45:39 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 0/2] arm64: dts: g12a/g12b: add the Ethernet PHY GPIO IRQs
Date: Mon, 10 Jun 2019 18:45:29 +0200
Message-Id: <20190610164531.8303-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190610_094541_410903_46041EC0 
X-CRM114-Status: UNSURE (   8.16  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Avoid polling of the PHY status by passing the Ethernet PHY's GPIO
interrupt line to the PHY node.

I tested this successfully on my X96 Max, but I don't have an Odroid-N2
to test it there. The reset and interrupt GPIO part of the schematics
seems to be identical for both boards (and probably other "reference
design" based boards as well).

This depends on two of my other series:
1. "irqchip/meson-gpio: Add support for Meson-G12A SoC" from [0]
2. "Ethernet PHY reset GPIO updates for Amlogic SoCs" from [1]


[0] https://patchwork.kernel.org/cover/10983339/
[1] https://patchwork.kernel.org/cover/10985155/


Martin Blumenstingl (2):
  arm64: dts: meson: g12b: odroid-n2: add the Ethernet PHY interrupt
    line
  arm64: dts: meson: g12a: x96-max: add the Ethernet PHY interrupt line

 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts   | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts | 4 ++++
 2 files changed, 8 insertions(+)

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
