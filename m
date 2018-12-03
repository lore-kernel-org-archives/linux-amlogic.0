Return-Path: <SRS0=94bh=OM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F529C04EBF
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 13:19:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 600A1206B7
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 13:19:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DFOAjWEE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="vtsq5oFh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 600A1206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4foZvfARJ8xWOyA2IzeTyQqXSxJx7aFIZwPubulzbNo=; b=DFOAjWEE480YwX
	u7Q3ah8JR83bJ7c/sA/d3NWv0HRcLZ4Em4o2fgZlXLzYdak+OEZarrMbxJTng2yeMH5FnGIB5i2U8
	LAfNdp63St8krosvT9V2Ld8x+tiowLB9o6zGXW2BORIydofYhMZLQ5IGWNy8rzpEfKurJzNl+H14a
	bIge6sMDGj0LnUXZ6/9VDLYxtKIlHuOCvN43E9IxdXG5ZANYROTGBE47iBZxPWgbY3/MguOJV8NeV
	1YMZ+L5uUTju2s1c3zAvtWokbnjNvFpg2b1M69e8y1KxqXCLiw0bRuZctqt6p4ft11cJJuSMaCoUO
	ZQU6dQsFjoyVBL5ypmTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gTo86-0007KS-3B; Mon, 03 Dec 2018 13:19:18 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTo80-0007Gc-6N
 for linux-amlogic@lists.infradead.org; Mon, 03 Dec 2018 13:19:15 +0000
Received: by mail-wr1-x441.google.com with SMTP id p4so12121593wrt.7
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Dec 2018 05:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dDYWcGw/WcqQiCks78l9uhvporxrTWQBg5cG5YlzJMs=;
 b=vtsq5oFhnv3QDDJDm6k9H9hwhp7LnKzGVO/zNsUWhrEkD4wQt1KYCoy+BymPHXiCQZ
 ODKEAEIQxaiye8SXsKGVTSoVlFAVqAS4HQXsfxo4bmJs6BA8Xe9i6hOfsyvBunLZ/s/5
 ZNNGIU+oe7acy4ZhT+YWU+PBPGGiOVOnWmorYVNDHGOmnH6Pg2W5cEYCZWp+Stt0//gy
 Dz/IxHCqkFuN8eTqFbARI9qAZH5fAb2MQZb0MgnQGYnhSiL5eI36e03OWgj5EE031rm4
 wblbVKQaGhh3kcUFXCSIA2et63ilR50K4EDe/HfO+0h2WSxpENnyr0Q0bG2X6X3I0cgV
 Qz6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dDYWcGw/WcqQiCks78l9uhvporxrTWQBg5cG5YlzJMs=;
 b=tLUui5xMLvX3FzfKdhbr6qEZE13jSFc1t7KkUOZHQ7BaaZxDe7B3iklrIKwl/OB6/B
 o7ugrH13VBdcL5t0occzEw7gAcTKLKpeRnh9MtU2ovEXrFNmI/YB1XfFNXwq1zm8eac1
 J9dSwjQLjI8ZXKc5a1pEIjl0QfzHuIXlR20lM9tYXo+OHuNl2gzTiKfuq7E4LSGm4SMH
 esAMec3EDAsmzMTya6CmvIs5ZbFhYBuGvzOQRGNFe2TqR29QLlwYZRjM23c14898e06d
 eehct/iZpRxpyUPnF/+yoIP6QN+/qvIujzAsSf//z0z5YXxfpt7rkDe0Sx5M0zJcjcxS
 dBnA==
X-Gm-Message-State: AA+aEWZmV3J0/rggEOm3IrzyJiiiNN0Bs5tlC0RkTim2LqLD+/a+LF/2
 isSrR6VmBm27s6muDVhOap10JA==
X-Google-Smtp-Source: AFSGD/WMzOvJuYZbJ+eVbN6i3kOLdbpS+y7D8KK91Vq79ZJQ1zydvhB6h67gWMBnKRZjBbrymliHUg==
X-Received: by 2002:a5d:6a42:: with SMTP id t2mr15162979wrw.50.1543843140373; 
 Mon, 03 Dec 2018 05:19:00 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id n19sm6371063wmh.26.2018.12.03.05.18.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Dec 2018 05:18:59 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Carlo Caione <carlo@caione.org>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 0/3] arm64: dts: meson: add clock controllers input clocks
Date: Mon,  3 Dec 2018 14:18:47 +0100
Message-Id: <20181203131850.31388-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181203_051912_248448_35120C58 
X-CRM114-Status: UNSURE (   8.67  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset is the first step that needs to be done so the
amlogic clock controllers properly claim their input clocks
through DT instead of relying on fixed names.

I'll be waiting for this hit mainline before sending the related
driver changes.

Changes since v1: [0]
- add clock-names for the main clock controller

[0]: https://lkml.kernel.org/r/20181129164524.18670-1-jbrunet@baylibre.com

Jerome Brunet (3):
  dt-bindings: clk: meson: add ao controller clock inputs
  dt-bindings: clk: meson: add main controller clock input
  arm64: dts: meson: add clock controller clock inputs

 .../devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt     | 8 +++++++-
 .../devicetree/bindings/clock/amlogic,gxbb-clkc.txt       | 5 +++++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi                | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi               | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi                | 4 ++++
 5 files changed, 24 insertions(+), 1 deletion(-)

-- 
2.19.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
