Return-Path: <SRS0=/5FS=RH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92AA7C43381
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Mar 2019 11:12:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6279D20663
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Mar 2019 11:12:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mK5KhWv8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1XiiH+DH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6279D20663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DNZ61vY3UM91GaKUbu1jp2Bpx+/meJ6OtrtBw1pFndA=; b=mK5KhWv8cDMaf6
	V6XTD8tiPbUVn4+QQxHNSGVHhp9dlekESTOStt0gbZuI3cjs5C6/2p6H2dFK/ppc1nPrZaEDH5NDG
	vA3WOSQG04MnTfWjDymqvsILW9ciDAFEouQe+gAbK7EJnUN/2QTUJ/yEhJRyxx4OGI5sQKfsunvGE
	MLOMrJLPK52AuAsfejZiBzpY71s5hDDFG1d3pHEhWGmOl1Ygo14lKqanppCO4bn1B3/ykhT4P1U6P
	Yo5AifQDUkonVkyazp9Cbdoz95BymDMUiSdSHfv7OQKbu1QQZEl5GD4eEgnW1Cx6hkMMx3cwXbn2H
	MPAsDg1yjvTFxNzldPEg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0lWD-0003ng-15; Mon, 04 Mar 2019 11:12:25 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0lW8-0003l4-W0
 for linux-amlogic@lists.infradead.org; Mon, 04 Mar 2019 11:12:22 +0000
Received: by mail-wr1-x442.google.com with SMTP id w2so5056541wrt.11
 for <linux-amlogic@lists.infradead.org>; Mon, 04 Mar 2019 03:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kt+Hk5/oMuNB0FtHQXSEVhQxJl+kK6ZHXguTCM5Bsq8=;
 b=1XiiH+DHPD22LPCcQOXYW8hkyG8hMpajX3zQzlFpBqGikf6VFZIvjCVrhh7LcxOu9l
 mINZ35XkSO/p1k/VZbvjpsuAqK/OU7cKotpvnsPxR02YjaQV2RVGXKpjFgG0m/mI7suu
 VaZzbhGfZ9bbuOC5oFrOv1FLrlcFugLCpT6SUVXpTTu18ipBBUOBHrhphKovtKBAWP+d
 PW8sWJil70g2PZr66NACwQaUWGYQ5BiVDiGJsDokkdPowIWlEXB1YVJVJZktUo47Jscu
 BNFjowVmpcHAa7UsBdj49RSbwE5ff+DWZHlHnu0/FAQMNpKpM2bzRmam+oSGwYoAOGLY
 SKOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kt+Hk5/oMuNB0FtHQXSEVhQxJl+kK6ZHXguTCM5Bsq8=;
 b=FIe8JslIurh8/Mme+ZS98VRNwufq27MdgbqwTZ3yt6qD1PqvL/JziLJJyj+q4IHall
 mLRNE+7xnviq+W5nKw+9dpT+/phIRlKHHyD8DdoCJW/GvoLXdxUj1CsHR4ge9dk0QXNE
 rHA7kkAs5aoOb1Dw/lo9CkB9u+9WGcFKEuPLg+05in395lYRWkpMSeFyByv6d3w6qSV0
 qAZQwWeX9W1uW90/J8FPBn0VFpaE9H0MOdP+cMdk3B8Ivq604PZHdZE244KLFMF/+2fv
 hLB3CVyYGNmKiY0xNsQHdDVl93KNsmLqZWLyXbok2CSi1ZHxvJ2vB91P4qARFiTWJ9Ny
 dKvw==
X-Gm-Message-State: APjAAAUbra/rRGbf43ChKqjTCStDQtVKOdDHEICNAP0zspHS9Lg6DHly
 BXDvyBa7k73t0oqIVygzTXEGPg==
X-Google-Smtp-Source: APXvYqxmtZiRHWjqyZ8LPaJKvzRXF1dSEQP7xsRNBQUM9LjMtG2cTEOoWkUweH2jMjpiSNfewul6Ng==
X-Received: by 2002:adf:f388:: with SMTP id m8mr12993720wro.133.1551697939218; 
 Mon, 04 Mar 2019 03:12:19 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id x22sm37727402wmc.19.2019.03.04.03.12.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 04 Mar 2019 03:12:18 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: linux-iio@vger.kernel.org,
	martin.blumenstingl@googlemail.com
Subject: [PATCH 0/2] Add Meson SAR ADC support for G12A
Date: Mon,  4 Mar 2019 12:12:15 +0100
Message-Id: <20190304111217.882-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_031221_028671_D65C513A 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

These patches adds SAR ADC support for the G12A SoCs, using
the same setup/configuration as AXG and GXL.

The only change is the clocks, they are now handled by the AO
Clock Controller, but it doesn't change the bindings or the driver.

Neil Armstrong (2):
  dt-bindings: iio: adc: document the Meson G12A support
  iio: adc: meson-saradc: add support for Meson G12A

 .../devicetree/bindings/iio/adc/amlogic,meson-saradc.txt  | 1 +
 drivers/iio/adc/meson_saradc.c                            | 8 ++++++++
 2 files changed, 9 insertions(+)

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
