Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC39DC43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 10:15:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B63C20879
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 10:15:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rB8iT7X1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Sab03Xgv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B63C20879
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nRkSGI/6KsryfgVxu4AuYYg1BbsbWf/NztgLNaxD92g=; b=rB8iT7X1ftfxSV
	xd1nSzhgUBPIL6Wuz4kZ4kKybAMcySNJrUd3Qt+zeDLhHQHUIKAkODqF0uIbdQVvAQ4F6cTG6Z0ve
	WUmAvu1xTnBm8SoZlRiqaGoTS/4tWuLrxq2RZ2yOgu6IyBnjZ69e4CEGJkbF4nNuw8omli4dplwbK
	d3XtBw3DIhVXZqmrRvEV23YS4VTrsNK5cIILihO+kusbRY0ZVQJ6Gsl06vW8Ow2/OyAyNG0QYjNWz
	qwywWYk+apafI7068ES4BpRotngxH0uFOSIg4O+KTRADFd5wiD3QaWbf5sZNIShNKXp0BELQ5OWQv
	fVrHR+hESOWZ6bY/Hing==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8MdU-0002Go-UP; Mon, 25 Mar 2019 10:15:20 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8Md9-0000ja-U7
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 10:15:06 +0000
Received: by mail-wm1-x32f.google.com with SMTP id q16so8220686wmj.3
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 03:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/8o+LOU1T1ETU6b8hAChcmqvwxIICB9hO51bblD2L9U=;
 b=Sab03Xgv7Fjl6R5FlBon9XdX7SHnlouqsD+wv85qjeWYRzwH+KqMRt38uPCcn8Vdld
 mWxKgc6pmcRczSb3XKo3DZgl9eDoj56+AMUofjU2m1G3KKgukyzjvb4VYhFaFkKecb9/
 z/fAlsqeMBQG/StELz1L5nXArKb66KQ3rzPf5vL8scAJ1YNCxBe7qSilv+BLIo2SIHuW
 NsW7GF6dV6EcDs83+DdALzoJrS/eIsmQNXkzrwUD+Kd5ib53KYNp1LnzGoqL0R1tKKeH
 lr175Tbqm3Nt7dj1x4+sieO00lxjtVw5Apc3vuN6ve9Fph/tYEBHIORePhT7att/6+Y4
 YvHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/8o+LOU1T1ETU6b8hAChcmqvwxIICB9hO51bblD2L9U=;
 b=YPwI1ab073xj6Cbhyr05Adicb1y7yJ5U0EPGHKroh8WVEKFpqOcHyjfk3r6bHwQ/0R
 XL6T56Tmkr9FDYSg7Skh1rV86rbQu3IPo8aFqHpuBE8qInsbsCPeXfl3cP4h07Lnwmtf
 iQIla6y0WD5Wglr9Xuf5zS7I+1D0XyR/uFux6BIUJ02afDkRZJQI4M52WAKz0fR2ThUM
 VV0mxlSxgX9NMKOAW/E1OY+vzLTcbTSy0dkTSp4Rxmdt5yVIjRwr8jiZLsSzoj3cc9z1
 3NseWUNwzUnq0dvwnE2jJm/1g0l8nw+7CJFk3xYl1KuND3QEc4X32MgZ9J2ADJXImzwv
 WFoQ==
X-Gm-Message-State: APjAAAW74aRxVg/PYykAMy472FG1fYxXu5sIcszmaqAz/63gRQB//0qB
 1nrRWYFKC3X5nBN5QJ9qBbIBQC5MqoJVog==
X-Google-Smtp-Source: APXvYqxFXgCghasvdXR9NXeqm91C6VP9B+1+B8C875TVNExSHsoA58wXRlC3w3+NPQzhuj8uTvKCjA==
X-Received: by 2002:a7b:c446:: with SMTP id l6mr7138333wmi.80.1553508895899;
 Mon, 25 Mar 2019 03:14:55 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id v14sm20049484wrr.20.2019.03.25.03.14.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 25 Mar 2019 03:14:55 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v3 0/6] arm64: dts: g12a: Add boards peripherals
Date: Mon, 25 Mar 2019 11:14:47 +0100
Message-Id: <20190325101453.3009-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_031500_202972_CABF76D9 
X-CRM114-Status: UNSURE (   7.26  )
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

Following [1], add regulators, bluetooth and ADC keys on :
- meson-g12a-x96-max
- meson-g12a-u200
- meson-g12a-sei510

Dependencies :
- Patch 1, 2: None
- Patch 3: SAR ADC node at [2]
- Patches 4, 5, & 6: USB nodes at [3]

Changes since v2:
- Dropped already applied patches
- Collected martin's reviewed-bys
- Fixed x96 5v regulator polarity

Changes since v1:
- Collected martin's reviewed-bys
- Added missing regulators in commit logs
- fixed x96 dc_in regulator
- fixed includes overall
- removed dwc2 enable floowing disabled remove in [1]

[1] https://lkml.kernel.org/r/20190325100339.749-1-narmstrong@baylibre.com
[2] https://lkml.kernel.org/r/20190325100339.749-2-narmstrong@baylibre.com
[3] https://lkml.kernel.org/r/20190325100339.749-3-narmstrong@baylibre.com

Guillaume La Roque (1):
  arm64: dts: meson-g12a-x96-max: add regulators

Neil Armstrong (5):
  arm64: dts: meson-g12a-x96-max: Enable BT Module
  arm64: dts: meson-g12a-sei510: Add ADC Key and BT support
  arm64: dts: meson-g12a-sei510: Enable USB
  arm64: dts: meson-g12a-u200: Enable USB
  arm64: dts: meson-g12a-x96-max: Enable USB

 .../boot/dts/amlogic/meson-g12a-sei510.dts    | 35 ++++++++
 .../boot/dts/amlogic/meson-g12a-u200.dts      | 12 +++
 .../boot/dts/amlogic/meson-g12a-x96-max.dts   | 84 +++++++++++++++++++
 3 files changed, 131 insertions(+)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
