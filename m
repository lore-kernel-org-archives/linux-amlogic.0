Return-Path: <SRS0=BjI6=TK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EDBDC46476
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 May 2019 15:53:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60FB920881
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 May 2019 15:53:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BZqYEa27";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="C0hRRVJk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60FB920881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=64kzUsjRFOH3c32U42bVT/NOj1unoJka8cw1brdzg7o=; b=BZqYEa27Psc3wx
	rGBZN4UUsMDL2uncKZoqKH6IeBWyBbls4YCxkVV+OubaXTXduu785qgDMMVqiWfT9h8f3Ji7oTvv6
	JQSFEYgoqAIXIWIu208VHCBfwsAmXopRWVdIBkFNpQ9+HH7dUC1RBI6X4QfybXD5tLus7iR/AfzNQ
	YXv2Ww0mOr0IGWijJQShgIT3fhJ0qTji6TFBz9Sul44ctc7xfrxQouW01bwt7C6ACNnoTef1dzaoN
	3j78+zW7SIgc/T0YnaoUL6oGndGeSu4cNYMT465r3WwmDiZ49ptGF83cb44nX8nY/ANHeZSLDz4HJ
	R1KwMbgun9lOpAH3jQNg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hP7q5-0008Vf-K8; Fri, 10 May 2019 15:53:37 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hP7q2-0008Tm-GT
 for linux-amlogic@lists.infradead.org; Fri, 10 May 2019 15:53:36 +0000
Received: by mail-wr1-x429.google.com with SMTP id w8so6049957wrl.6
 for <linux-amlogic@lists.infradead.org>; Fri, 10 May 2019 08:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WmYcNnwfKVscZCmwdjK6jhJ9WBHb6BXwy0H5GLHZ/VU=;
 b=C0hRRVJkS6zB+gVPwbTFLoQ/yrTJe0AdMUE73ja1XnESm9WmkHP+J9t1kL18F89+Ar
 Egg+kK9TylG8JTm6oqDQCeiK74nWu62vsP4nIgEBc8KBnTx6Cf8K8cgtOQEyVzIVKj21
 6wnLy3HMAlGd7LjVvWStoqLs91EkMu4NqovsGbMkzOIo+ayRm8P3sVzd52760Q3bQ8Kv
 NktQEj+r/gGlKKS/J2qED2hxbwxNRj/NjVGpeZxBbtTmR0nZxmetlLSK8lIbKSa9epcP
 DSog5ymi+1RkFJTHrMV2sRa/tkMuTeaU3G/LXcDIoQ/5nEsU5Cgcr9F+RoM3IXjR52Pp
 H/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WmYcNnwfKVscZCmwdjK6jhJ9WBHb6BXwy0H5GLHZ/VU=;
 b=dASn+3XH6rGuBstDepiQmoaCAygTvdS2f8LLC2dtdxv376UmCVL3LYsBXllkAJBkJo
 6s9WmW02h0DmzxAxWWLQrJjXpiipxaJMKLYAwjyFh6xtSD9/8bH9mpFqafw82Hl2ecNi
 AR/37xf3sq2hz58oUNVw6DXINgBy34IlzOf744zfpp0HN9AByNnWwB4D5cRoKyOfaY13
 wQFKufdap42+OHBSHMQzfo/Ax7fxRKce2B2szPuCukRYgukRAqvhycboTtCko3KtSiW3
 8KYIA5rVJNUJF0Rj1dMCLIdcDmBUA1sjUGGDgp0cOmkO2L6VQLuEYrptubIQ5OU+vcK/
 9QwA==
X-Gm-Message-State: APjAAAVXuVDLI2n+PyKaxvLkQpE6kODeAHhDDJAC7VvcTq88tx1dum+Z
 l7hG0LsMArp6Pz7rk1FgfwVQ3ZvcqyM=
X-Google-Smtp-Source: APXvYqxG++tIt5+P1saVu6V+j0sm+4hTQruPueDBJA4MZeuRgE44zFdvgStVURuvnv+y7381WMKuKA==
X-Received: by 2002:adf:e5cc:: with SMTP id a12mr8663276wrn.78.1557503610457; 
 Fri, 10 May 2019 08:53:30 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id u14sm5333860wrn.30.2019.05.10.08.53.29
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 10 May 2019 08:53:29 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 0/2] arm64: dts: meson: g12a board node order
Date: Fri, 10 May 2019 17:53:25 +0200
Message-Id: <20190510155327.5759-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190510_085334_689354_9FBE8674 
X-CRM114-Status: UNSURE (   6.63  )
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
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The order of the nodes in the u200 and sei510 is bit fancy.
Order nodes by address, then node name, then aliases.

This makes rebasing is little less painful

Jerome Brunet (2):
  arm64: dts: meson: sei510: consistently order nodes
  arm64: dts: meson: u200: consistently order nodes

 .../boot/dts/amlogic/meson-g12a-sei510.dts    | 92 +++++++++----------
 .../boot/dts/amlogic/meson-g12a-u200.dts      | 50 +++++-----
 2 files changed, 72 insertions(+), 70 deletions(-)

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
