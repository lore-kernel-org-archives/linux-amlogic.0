Return-Path: <SRS0=ZFy2=FH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C47EAC63777
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Dec 2020 06:00:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5170220705
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Dec 2020 06:00:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5170220705
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zhsolvv15nFvIV6zbOUHzlcuzDMVeT1xlI74f0Z04lU=; b=LUfqBoyUOYrFoM75QPAvmWNMJf
	qASuA5jT9XiO+VmO3zknondbsyL+NzPmc82XgY9qsjDFQAMtwkDI9S6+G3gS7f+GHHZ5FO6/dAPUH
	LB9xGfIMnIFUkqGDTsVSEJvYXbEnG4JSYLMnRa3hNjqeuSNEHbbkn7LN6su0kvPaWxygDgQgfTffX
	m+KN43NuoQKjtWsErZrFMun5Le4ERXt6najY5Vpw9VRvJ19aTnX4m6Y+Gv6FDMOnTG7o9hh/druVt
	8/P8h9u6cJ9RzwwlSUt2TQggUgMcrVXh5H65nKiPX+WukGCAsT6Y0VMI/+nMc1dZ7P34OnkWHXxJd
	6DBmsn7g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkhfR-0008Lg-Sy; Thu, 03 Dec 2020 06:00:37 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkhfK-0008JY-OH; Thu, 03 Dec 2020 06:00:31 +0000
Received: by mail-wr1-x42e.google.com with SMTP id l1so601303wrb.9;
 Wed, 02 Dec 2020 22:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=FgP7aBE8aKGLuFedysVwA7KL29Dq1oiQSpDqT6u+4VI=;
 b=h4Lb0tD7YcJ2v1bsPqUsKQ9RPQ2a1WMayCpc0Pt95GMhoEPUs5a4G7VOQpBnNkwWJE
 Eo5ELadpnQjo2ML7qWxuKTuyVUTHLEztQBKT859ug+MGuGxBDSANnVQ3puvlVAMsBHjM
 GDcqU9OCjAqGRUvw/MTpzzJ5D5NI9lv79yVGB6Ro00wPCKonxCxSGQJz2yqB0CCp4WCl
 P4GnlZxVqNe4bjhPLZpv0JpySazPmdM6sm/m1iZn2kXy1cggTJAd70ChA2Effh1gQSKt
 9cre7qLUWL+PChhZSyL6k/PJ7tVIvK+FjVS0OssJNnTn5sGtR6413MU4NDYsTocPAFM6
 IDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=FgP7aBE8aKGLuFedysVwA7KL29Dq1oiQSpDqT6u+4VI=;
 b=e0xo65urGbk6NlfuWhYf60sNGXDqIDX5ZwjcU6+hZB+43CgQMy5EuOuj8vQLG7ssIK
 pWKwZhukKcpEhfbXObL7puZw2DOgAxv/2dsSIuhi87sbordtvxcmsK1cbDxMS0CO+IQn
 9Z0yXGQoExwYrOemUHP77GIawMB8C7a6n22yquhNr/LL6UZvk6hWET+nwHKnW+E3+3v3
 mWz5zUIxM4j5ycW10E6HBNO77vncNFOv1JHlf6V64Xnaqyt8n4CVGunXxL52mL9jeeRL
 ewv8ne3x1IYVQaf0qCSb/Rzfmdb/bAZdtmNkk8f/ZdPHn2vrJaTLvR3gv20JceS4Yizk
 GLQQ==
X-Gm-Message-State: AOAM533iCUwYDN5I+qYqZ3uTGVmnU4bkCEpJh3/eDC94Px9XULIj5QRZ
 R90nVvGwb6aTY+iszBpXjc2utkfGAp0=
X-Google-Smtp-Source: ABdhPJzGCGuP5kscbpV5BX+E0FsFhFfbzFF/ey1HKAGsMH6YD4c+lt9NmwX6UPoMLk2rDqA6RcjbVg==
X-Received: by 2002:adf:bc13:: with SMTP id s19mr1662859wrg.397.1606975227952; 
 Wed, 02 Dec 2020 22:00:27 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id i11sm218439wro.85.2020.12.02.22.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 22:00:27 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/7] arm64: dts: meson: add more GX soundcards
Date: Thu,  3 Dec 2020 06:00:16 +0000
Message-Id: <20201203060023.9454-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_010030_831202_4E95C711 
X-CRM114-Status: GOOD (  11.98  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This series adds basic support for LPCM audio over HDMI and S/PDIF
to GXBB/GXL/GXM devices that I own and have tested with. Audio can
be extended in the future (some devices have DACs and headphone
hardware to connect) but this gets the basics working.

Changes from v3
- Drop includes tidying in patches 2,3
- Add Jerome's acks

Changes from v2
- Drop p200/p201/p212-s905x/vega-s95 changes
- Add khadas-vim(1)

Changes from v1
- Drop nexbox-a1 and rbox-pro 

Christian Hewitt (7):
  arm64: dts: meson: add audio playback to a95x
  arm64: dts: meson: add audio playback to khadas-vim
  arm64: dts: meson: add audio playback to khadas-vim2
  arm64: dts: meson: add audio playback to nanopi-k2
  arm64: dts: meson: add audio playback to odroid-c2
  arm64: dts: meson: add audio playback to wetek-hub
  arm64: dts: meson: add audio playback to wetek-play2

 .../boot/dts/amlogic/meson-gxbb-nanopi-k2.dts | 40 ++++++++++++
 .../dts/amlogic/meson-gxbb-nexbox-a95x.dts    | 40 ++++++++++++
 .../boot/dts/amlogic/meson-gxbb-odroidc2.dts  | 40 ++++++++++++
 .../boot/dts/amlogic/meson-gxbb-wetek-hub.dts | 40 ++++++++++++
 .../dts/amlogic/meson-gxbb-wetek-play2.dts    | 61 +++++++++++++++++++
 .../amlogic/meson-gxl-s905x-khadas-vim.dts    | 43 ++++++++++++-
 .../dts/amlogic/meson-gxm-khadas-vim2.dts     | 44 ++++++++++++-
 7 files changed, 303 insertions(+), 5 deletions(-)

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
