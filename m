Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1082C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 14:59:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 818552082C
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 14:59:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sZj0+jsy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Rqt6f9n5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 818552082C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NagmUwRgDFQ0Eevfq2NeWmDUcF3r4Mn90IN9uGULHU8=; b=sZj0+jsypVOj/y
	j3TEoBlqOdGDtijudd+FvwwHsd2MfmgqO2iI768t3MIfcaPwMNCJohxM34UQcSg/YNu2e92YgTzX+
	iPPZE5iOWQX0otIuo3VDcBvsL5rlBIuY9nNSN94Bjiduibx4BroD0phDr1U3n4x0N/SfIRMEmNioA
	YPcPKvSwnXXefA3CHFBu2HTaOCqdYn1S3HFi5NEycnU8cNymfHANKVmTfuGvQaSoiCNEnRtAtK7/x
	4Xys5Ye+31uSuuNZw1IGBGbWG23JApj8i1Tc1ehowmV+jHA9zt00gNqvPvg53VqrU/Z7AssMHwWTr
	PuYllOk8ak2dE5FdPozA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8R4V-000615-Da; Mon, 25 Mar 2019 14:59:31 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8R4N-0005rg-HT
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 14:59:26 +0000
Received: by mail-wr1-x430.google.com with SMTP id g3so7050479wrx.9
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 07:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vlkR8cS9veKc4DBkyJ0Dz8LYpBdCv0R0a/FSIyLYoHU=;
 b=Rqt6f9n5FrrAQkazqeHSi0rCZC9HpVSK3p0kWpMHiiPDs9MGUp1lV1TE/fYwJ74nUb
 rNz49iJKFIq1KWuLZQvQLXkvrbe2LVoMAfPnRb5a/ANkiq8Vio9tHy/mlIJ/kQ5ktFxG
 Rh8bHkiwsW0rJotMVPqiPhwWPE4F4FVzh/AhvEsnEHUZbN0PGDGCpBsup279t3cOQS7Z
 SBdPC99eycltCJBI3VK+hp1h0g1dkFkt8c27Ml3LIdlHlhfL2JN6XsV3cApRc1ALsecp
 gIf7KDrM5a7b2T0/IlLBJT/drXvaVirghgrPJKwbcOsO+OHdVD7CdhOi1t9ax+/0qAKJ
 pvyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vlkR8cS9veKc4DBkyJ0Dz8LYpBdCv0R0a/FSIyLYoHU=;
 b=pNcFi7xP/y3dg5ovVYNnSoiXpCsS2trnQrY/EZtm2xSi9l8Cl2ex3x7gZ3tOc3KEjX
 jOIZMqT8lZt245t98v3D0f6nBhDeBxznVGYBTKkBj4g5nt8mzl1kxk91bEXca56wx4K7
 FUM8tiULwQxDlD5Z8PcYCM4N9aIDTOWLgZsJXLcNJ9GGI7nZmN2r8TUjZ+XX2iLYLroa
 kLmI5JLcdr1m7cbQFQtOzSKB6jeOiX19GRgeVhdNaVoc/729azvFZb6iIgOYatzZxxHT
 3WdEvvZM3EI+jpAw2X3jsx2cfPijhGfb2PgIFzQ4KOkRsFxpxtbJbo91x02Edj9pv9rt
 j0Og==
X-Gm-Message-State: APjAAAW4MAVChJMTDhq7lNR5dM9vtzfRvViUC7Bg5quZMOVgB/3skvu/
 HCzSoMAZbL080dv/q82RmtI7imOF6Cq68w==
X-Google-Smtp-Source: APXvYqwh0JeEjGa/4T+EwMcccP1D8+Rt9OYAbnAc45hn7AqWmP4FOEEZLIqbT0r4h90cmmY40rKjEw==
X-Received: by 2002:adf:e443:: with SMTP id t3mr17025185wrm.257.1553525957734; 
 Mon, 25 Mar 2019 07:59:17 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id d11sm12836156wmb.19.2019.03.25.07.59.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 25 Mar 2019 07:59:17 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 0/5] arm64: dts: meson-g12a: Add support for Video Display
Date: Mon, 25 Mar 2019 15:59:09 +0100
Message-Id: <20190325145914.32391-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_075923_577782_53817073 
X-CRM114-Status: UNSURE (   7.36  )
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

This patchset adds nodes for Video Display support.

Dependencies :
- patch 1: VPU, HDMI & Power Controller bindings still in reviewe at [1]
- patch 2: None
- patch 3, 4, 5: Patch 1

[1] https://lkml.kernel.org/r/20190313141030.5958-1-narmstrong@baylibre.com

Neil Armstrong (5):
  arm64: dts: meson-g12a: Add VPU and HDMI related nodes
  arm64: dts: meson-g12a: Add AO-CEC-A nodes
  arm64: dts: meson-g12a-x96-max: Add support for Video Display
  arm64: dts: meson-g12a-sei510: Add support for Video Display
  arm64: dts: meson-g12a-u200: Add support for Video Display

 .../boot/dts/amlogic/meson-g12a-sei510.dts    |  46 ++++++
 .../boot/dts/amlogic/meson-g12a-u200.dts      |  47 ++++++
 .../boot/dts/amlogic/meson-g12a-x96-max.dts   |  47 ++++++
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi   | 149 ++++++++++++++++++
 4 files changed, 289 insertions(+)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
