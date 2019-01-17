Return-Path: <SRS0=bSlY=PZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB587C43612
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 10:32:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8772A20851
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 10:32:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="abNRb2Et";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="taU9ucdC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8772A20851
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lz2iRgmtAfd1lwk9HlSjOJvMMrYJXOZGuKkhHbvscOc=; b=abNRb2EtrRYWne
	KdVB9vQ9j1pWeFtoemN+V31mTdVTdYhjDNBu3P9rVz74t5vbl9GeEK1lB98lEe+od6ttUTRFfZNvg
	OPVPuiXN/JyxyjLtOwuOVuPquPr4+RYAWSPZN39E8tYFNKzHnhHMZpASLzMImSuU2d2LmZ4rrWS8L
	YHQz1KQjiVneieNHWQ2D7egKaVuQhv+2tjtGjusxhFnecfAU7+C20x1yhUSUPInYFrP78vwEpjI4+
	1rJcI1Nd4ZrlScxig1/LzjqyBTKtDAnYvVaCC8/S0AlxSro1RzBLD/UWUA1lVyZX2S1etpR/OCQoj
	WOQl6TOjwoI0oy+uwJ3g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gk4xu-0000Uh-LT; Thu, 17 Jan 2019 10:32:02 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gk4xr-0000Tu-Hc
 for linux-amlogic@lists.infradead.org; Thu, 17 Jan 2019 10:32:01 +0000
Received: by mail-wr1-x442.google.com with SMTP id r10so10348610wrs.10
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Jan 2019 02:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mzTeS35Xi5XfGByr4FUaAaL7DLLfUheX6N30Odpo+mg=;
 b=taU9ucdCWHkHft20+Kl5P0JPusw8M9Hr1qddMGDs805w2f1qEDINOQw/MTUhD8+x1r
 V3KxfkJIjMCy25TJqZUl3aoS+pEvjCrQCuQwA+dgVyzI+W9doxX1wNOuLRxldk7Jl3Or
 lAwiwj12bV5fOqANAZMJa+xEzQRQ7miDu0bk/o1rFqBXGJgRgv6NiH9PLCOoDHK/BW6f
 FhM/FeyYlVYxfRUKGUpgXWAbxqVPmDydYZfBq528MrF8dQ+n+Ix0FJcEPxds2DRHM7aK
 MESlMCfSJ1oCwvS+VUVV46S0d0Dy/2mUT1/VH++FIzDqnoeHx5IuGUlb+Rl3AWh5hBaI
 ZdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mzTeS35Xi5XfGByr4FUaAaL7DLLfUheX6N30Odpo+mg=;
 b=EAPpml4iPq1w9KdVvdSpJYmtjcsAhW8cMjU3ieUoaPb8FDJZAXtpliKzzcbH8Py1Yi
 pxYH2rdiBGVUq+3XFvbHN3/erBL9XSsepLBzd85XJb5C3g4G4/0m+4EWtoYalATMKpXO
 4VDa3syTBm1sQg/AY233ms/Fh1MHqq7yIaqz0LjG3iPxTtNqyioBakH4/4bn7AZ+IguR
 hWn33RFMEaPpRZzcFjS4r3FOnqDWPuWQc2C35eq1m6ISauDU6WevnJOfo0jRvcE0Smzm
 AI+jfB6ul/Lxp6aDT+1zJJ036C4WGndivKnzsbG9wAeA8jNJqGL7tclrRbaYQCJYy5BW
 5INQ==
X-Gm-Message-State: AJcUukdpusW7r+MHo4EkMiw2WUKHbMJViK2nNgKGjr3ePwfzhyPXS7+e
 4RHb2XZk2BolGXzwa04/YxNGNtWxt3Q=
X-Google-Smtp-Source: ALg8bN7inE6nQd4uTWaM6jTWAqGhnRpYa+NC6cDLq50DFQQ87QBhQBk7n5igViHc6abHii7Fz1TKpQ==
X-Received: by 2002:a5d:494a:: with SMTP id r10mr11730171wrs.272.1547721118055; 
 Thu, 17 Jan 2019 02:31:58 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id 143sm77658107wml.14.2019.01.17.02.31.56
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 17 Jan 2019 02:31:57 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 0/2] arm64: dts: meson: g12a: enable pinctrl
Date: Thu, 17 Jan 2019 11:31:49 +0100
Message-Id: <20190117103151.3349-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_023159_577369_90EB3C25 
X-CRM114-Status: UNSURE (   6.46  )
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
 patchwork-bot+notify@kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset enables pinctrl on the g12a and adds the necessary
pinctrl settings to the u200 uart

Kevin, please note that this patchset depends on the:
* dts bus fixup: [0]
* pinctrl region fixes [1].

[0]: https://lkml.kernel.org/r/20190116165236.8330-1-jbrunet@baylibre.com
[1]: https://lkml.kernel.org/r/20190117102315.1833-1-jbrunet@baylibre.com

Cheers.

Jerome Brunet (2):
  arm64: dts: meson: g12a: add pinctrl support controllers
  arm64: dts: meson: g12a: add uart_ao_a pinctrl

 .../boot/dts/amlogic/meson-g12a-u200.dts      |  2 +
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi   | 67 +++++++++++++++++++
 2 files changed, 69 insertions(+)

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
