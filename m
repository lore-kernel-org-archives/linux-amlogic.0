Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF488C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 09:59:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF288217D8
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 09:59:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rRMfvEDb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="cly5J5GV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF288217D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4zvs6bGaywvCOS51T9s6ZXLIybe6+PRm0UYqe6vY148=; b=rRMfvEDbmBTWgV
	8mVhWWsUhJYmX38zJYshBjwkrlf4u8hXLtb2WWcULHRTd1ayZnKgGYtHIQ/YtbZtwj8TaH64/6x8S
	UY909KwQfYqbHw0hNBsbrgtFbx6+Zd6EpPWe1c6YhzH3fsLIB3OP7C2KTNOIPX0HoBi+ZwvjoTpwt
	lggJl4zzUuygAhIrzgpiFC/WZmqGp628Bb3vMdLNtuu/Ij2I6oU6IxLDvQCbfi4S0hIz+I6tkPetn
	Qv6EiFt7TsZS//SkLZoyyNph1PaZNixibedDURb7eGDnTnn19S0RK4y5XF8FWHkfd3OoYuaCtvvEF
	yRFDG6f8GETsgvZd5dkg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5p2q-0003aQ-8P; Mon, 18 Mar 2019 09:59:00 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5p2l-0003So-OC
 for linux-amlogic@lists.infradead.org; Mon, 18 Mar 2019 09:58:57 +0000
Received: by mail-wm1-x342.google.com with SMTP id 81so4759786wme.0
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Mar 2019 02:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nu4wz8X7eesuq9FeuUSWJQWjJaEoKZGjh4U1VvIO+mE=;
 b=cly5J5GV6va+MStGvubIKbR3YMVGk6tDL3MH03NDYJBA+wNqTUKuVnqo6yyeobgsKI
 XvMbcXd5CpmDSrvaQquSgxbkyGdfNAudXC3JLGeh4JVHcpXKqov2nDIdU8IcZYkf3blR
 ZgtsB76vvqWPqTlWz5uFIinGVfkeY9KluAqrCF3v0s1A7d0cdhMTr1mdK4KJRPxo31Mb
 vODEwsuoT/M7fyPzXt95Sjim3J+4d6XWcU5IpOJgXUbq1khK/P+VOPPRhuz3aWztj1SV
 4apDRGS/fl/08JakyleUU9CwOfVhptHYOFWnuv3HWGGlqP7IyNpAdtsGm20JxCdb6zhf
 8Ntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nu4wz8X7eesuq9FeuUSWJQWjJaEoKZGjh4U1VvIO+mE=;
 b=LQ3YBdzSquwargmXXxtI8eJOtV9gmqTePu/O2F7uu87nPmGkcBFCt33Vl2Eym3bUsf
 IuRn5YtfR5IyipPF8F75Xl8klMeOI+uRpfdafBOYbEmSyd4aEdo97sgHyWSLsG5wp1aX
 NVa6HWobm0euhaPKdPs2eXdcZL360W7WZprSnmIq5MNnx1i59aVOxrDFIgszREzhyHA1
 UZB57orW1ZRErB2yySeM1MAEGBrkI3HbiypqiV+vtjZmebEv1wc3WcsiM7ZwqXpx+SR/
 +Ec8O6PKX4HBZM0iGmrmyJGMlcpUQIkqMaP8fpFpjwzW9abCF2KD/B9AWJX+6RsyBGf/
 ENUQ==
X-Gm-Message-State: APjAAAWMDDCOd31lRXXWvPpHbH4FeA32ia5bR2OXpgYKiLUPbJSLN89K
 O/oM9C4sULJAexl4QzsOQU108A==
X-Google-Smtp-Source: APXvYqw61n1UVwTrZftVRkMR9MY26PpUenbqvt75pFnU6UY0mN1ZrA6SPV6bdZYLGZi+JZgKsyHG6Q==
X-Received: by 2002:a7b:c00e:: with SMTP id c14mr3161799wmb.110.1552903134285; 
 Mon, 18 Mar 2019 02:58:54 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g8sm5459034wro.77.2019.03.18.02.58.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 18 Mar 2019 02:58:53 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 0/8] arm64: dts: g12a: Add peripherals
Date: Mon, 18 Mar 2019 10:58:43 +0100
Message-Id: <20190318095851.4062-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_025856_097074_F491F3C5 
X-CRM114-Status: UNSURE (   6.95  )
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

Add following peripherals :
- AO Clock + Reset Controller
- Pinctrl
- UARTs
- SAR-ADC
- USB
- Mali GPU

USB depends on the PCIE clock and missing Reset bindings.

SARADC bindings is merged.

USB bindings has been reviewed, but not merged yet.

Mali GPU bindings are still in review.

Changes since v1 :
- dropped already applied "Add AO Secure node"
- dropped meson-g12a-u200.dts uart_AO change
- fixed includes overall to fix build for each patches
- removed disabled status in dwc2 node
- removed uart_ao_a_c pinctrl
- fixed uart pinctrl node name

Jerome Brunet (3):
  arm64: dts: meson: g12a: add pinctrl support controllers
  arm64: dts: meson: g12a: add uart_ao_a pinctrl
  arm64: dts: meson: g12a: add reset controller

Neil Armstrong (5):
  arm64: dts: meson: g12a: Add AO Clock + Reset Controller support
  arm64: dts: meson: g12a: Add UART A, B & C nodes and pins
  arm64: dts: meson: g12a: Add SAR ADC node
  arm64: dts: meson: g12a: Add G12A USB nodes
  arm64: dts: meson: g12a: Add mali-g31 gpu node

 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 274 ++++++++++++++++++++
 1 file changed, 274 insertions(+)

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
