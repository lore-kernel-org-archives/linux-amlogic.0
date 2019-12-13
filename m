Return-Path: <SRS0=Q7B6=2D=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B717DC00454
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Dec 2019 22:25:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 900BF2077B
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Dec 2019 22:25:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lJE1lYDK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="cjQ0OZb/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 900BF2077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=ikAWBR1/rY4RtD+k9AlnD05kikm7x2d3erdq4Iu+Voc=; b=lJE
	1lYDKCdGcWacF6df5S/xcupbdBx9ZvlMWkoxFGsdM3a+cH+hX9NqTlO+EHlbQA41Fc0haiAZWGvh/
	OCmKDTM8Y6hilrORCkfE82Xd4OPjYVh8r+H9JKboANwtqxkj0rMboSffuTWr7pWVUOCvgGrLDPIp7
	rEMmqGSxsZ+jbBLn5F00qvOJMtMHEW80W9FLOL9kAlX/XszvDYxeMmEgkLAml5DZ+lQaLJQt38Kph
	7xcrTHRts5SQlRP0z5eyCNZu8p1M0WXVSeYhMsxycQsQbsrQYYRHswDtanxbVoWGZoe3eqFByaMj5
	c6I3BPwOePqXUu1qsZVR9zdocn+W9WQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifl1W-0008Gs-GU; Fri, 13 Dec 2019 13:30:26 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifl16-0006qM-3d
 for linux-amlogic@lists.infradead.org; Fri, 13 Dec 2019 13:30:01 +0000
Received: by mail-wr1-x441.google.com with SMTP id c9so6649111wrw.8
 for <linux-amlogic@lists.infradead.org>; Fri, 13 Dec 2019 05:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=CcxRGFcCrtkq/Fa7c3EWJk3tVffr+ohpXoBBbiHwCUs=;
 b=cjQ0OZb/t830fsiw1m+88Q5m3W6dN8tb2EKys48brHEsYFriumeCBYH1gzs1T6XiNa
 KhtuxYzXEWvJPJ27bZlxSWvgp7VYtFnP2QlusXGZlXlPvJbKt2yi2FynYUxkpECpAjNm
 TG8sHRSnfxO2OIzRCaJjOpo0Puq/OiXDeuxQOxVouZaPxq1TPv8BC4HTqVZXsDFgTMVE
 gnT14QHP3ipUClIjCClxZu9mh6ubayg9egpQUtNgDdiDOctC5rkkQwl2TY0lewF4war9
 O5/PVU/RtFElEAoU45X82nuswfcKwyuaX0qqBIdLUPqb3f+GeNmBT6XkHKCD5RFxZOnw
 20Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=CcxRGFcCrtkq/Fa7c3EWJk3tVffr+ohpXoBBbiHwCUs=;
 b=bsi5s+Nb036lPEFQVNLv6FGACRGHA5K40SfTPRCcT3fEu/faaxLBbs0z7ps3eF2Fa3
 nz+wPtujK9bZRS359B8Q7x0gHuacql1SPgiKzbntlk2ubaig+d2PhwLImEbuDbVtH8Z9
 oBVxBi9jXBSWS+hA9IO1kN2tVsVVJVn7CJl8P921/4AI64MnrqfdZT3/gtB8ZpFgwgO4
 YOCxxYKzVpkHNyUC6GF8d3ZUv83QazkZgNU0HaQxY/7ZS1WOfpfJJJBsXkroSv8KtLLd
 b3S+Gcn+bfSOwSLRPSk9b6tukQ4Sf8Bkoidhr4/FJdyAjXDGysGVcpyq6o+jvRKm95is
 VfmA==
X-Gm-Message-State: APjAAAXRsdJPRM3csxaYetYrNgHoMfpzvCP3QTZFNDttnpOCGFJvQkoi
 cRoxkf92f0s9gBuyngoQeT6S9Q==
X-Google-Smtp-Source: APXvYqz43qjGSJwCgT1Fuw9onIXmdIlL82ZNT9dug1PH1gM72NKtNtBBRiNR6mykRXSa3xxRxVS7Ig==
X-Received: by 2002:a5d:65cf:: with SMTP id e15mr13144184wrw.126.1576243798663; 
 Fri, 13 Dec 2019 05:29:58 -0800 (PST)
Received: from localhost.localdomain ([2a01:cb1d:6e7:d500:82a9:347a:43f3:d2ca])
 by smtp.gmail.com with ESMTPSA id n3sm10540543wmc.27.2019.12.13.05.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 05:29:58 -0800 (PST)
From: Guillaume La Roque <glaroque@baylibre.com>
To: narmstrong@baylibre.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
 khilman@baylibre.com, devicetree@vger.kernel.org
Subject: [PATCH v2 0/3] Add support of CEC wakeup on Amlogic G12 and SM1 SoCs
Date: Fri, 13 Dec 2019 14:29:53 +0100
Message-Id: <20191213132956.11074-1-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191213_053000_143772_B39D64E6 
X-CRM114-Status: UNSURE (   7.81  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

this patchset add support of CEC wakeup.
We need to set logical address and activate some options in registers before going in suspend.
Registers address and options values come from amlogic driver.

Changes since v1:
- fix bad mask variable use to set logical address.
- use FIELD_PREP instead of shift value.

Guillaume La Roque (3):
  media: dt-bindings: media: meson-ao-cec: Add support of ao-sysctrl
    syscon
  arm64: dts: meson-g12g12: add syscon phandle in cec node
  media: platform: meson-ao-cec-g12a: add wakeup support

 .../media/amlogic,meson-gx-ao-cec.yaml        |  4 +++
 .../boot/dts/amlogic/meson-g12-common.dtsi    |  1 +
 drivers/media/platform/meson/ao-cec-g12a.c    | 33 +++++++++++++++++++
 3 files changed, 38 insertions(+)

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
