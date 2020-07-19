Return-Path: <SRS0=UX1O=A6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D012EC433E6
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Jul 2020 17:37:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A428E21744
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Jul 2020 17:37:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S7TZKjEb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="PqocFj0J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A428E21744
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EzhivENwxrPFzeF5fsBlcTUV72/+JZmaucYcQR48NZA=; b=S7TZKjEbiUjO5WpXU2/eWRVwiu
	e7Viri2p8RLCEs04QI2C8kuswf0B67UhPDRETEMNpRNOkqCh3pirQwGe7Ff9AoTTc2KOzIZgxZZZW
	nkB518gOeGMZG3iZovocRbiAzefOY42Sz1KLLcprUond5MNJoVIeNp45VNAef8d83pZMHdr6in7rV
	fJl23hNVgpwJpMYqZHsSHDzl5OTkd0yRdBK2dtWM6CJYVhkMA5BHaGNemOdndzlWffxuxoCOXBAXe
	OoIR5LZ75sZxH+roGgA/Q2BUrZqedTc6ERieGXozqh3AADaH1Q0dTB86x4WhkR3hMLVzVy214xXI+
	/uTUYqXQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxDFo-0007pu-VA; Sun, 19 Jul 2020 17:37:37 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxDFm-0007ot-Ku; Sun, 19 Jul 2020 17:37:35 +0000
Received: by mail-ej1-x641.google.com with SMTP id a21so15782381ejj.10;
 Sun, 19 Jul 2020 10:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9mR0eGFh9MH9sNZOZh0ch4XwokpANORC/EtJxy7S/4c=;
 b=PqocFj0Jsii8lhfLE+i9nkHhQxwb+4fvkmQpIk+6oQvM4O3P1R6HdSLNpjJ2S0vqmy
 ImMCCRT9lJxe6ZvaVRavb8zChQ48lbv52AN/5xEA7ZeDWl4psh9eNt+ILjvRy4SYfN/P
 VB9+wrEW9dck4RyXBIToou5kroxexoONJE25Esnmj9A+jYpgeZ8kkmp26VUup9m3S1mg
 AodQzZrEgo9hTSYVCYvcPpQdLOZJSiejtxpHpofvHVlSutLrX2TOeJii3XVXweAQboF+
 Xw9K4SgsQH3jVPTqQkCZ2KKW7S9T9z9HHS3GZjbwiG6p14VToyv8ALRjIBIg2cFWHk+O
 +cLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9mR0eGFh9MH9sNZOZh0ch4XwokpANORC/EtJxy7S/4c=;
 b=U8olkdAofWyC/o6TtFtOe1hMnEn9Vx8WTC/ZnsBtUqP6a2JNxX5qw/gbzDxg9aF2zV
 rU116oJctt7YTr464OBKQ5fwIZFyTxR4PbAyx34Q5VyGgN3F8y4kf0a8dRT6pGgHvlIV
 EV7NIXYilaeHSs44klRe7v58nQBlWcNopl0GmgHPimXCGWVG39q25MJSBsawxviqVB5N
 h9gN6sok0RLctL/d/pIBuaViA0pMmyLR6dS4JRw5SknYqnyScZvnxX/g8B0IcEYS0g++
 1Wx5I4UBhIr6J5JFO/QnugNp3BiSjyFn49HrBKwhlPWoo/lUqU21WvfgNpAMFFyb4fGn
 kLbA==
X-Gm-Message-State: AOAM531I4+20iBJ1nt61XueUhIwsW/B4CvZU0cayHdh9oCkzF9g133wD
 HQm+mv+wAvET61WJm7O3zQGOO/0Rp1A=
X-Google-Smtp-Source: ABdhPJzdG3bG+QiQ6JAaqQvzVrYAYHyHbzTb+FaypiX/eZFje/aNBPy5qd9VGW+15tq5at4aC546Eg==
X-Received: by 2002:a17:906:d057:: with SMTP id
 bo23mr17450701ejb.210.1595180252411; 
 Sun, 19 Jul 2020 10:37:32 -0700 (PDT)
Received: from localhost.localdomain
 (p200300f13716be00428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3716:be00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id
 bc23sm13563208edb.90.2020.07.19.10.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jul 2020 10:37:31 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH v2 0/3] GPU DVFS for Meson GXBB/GXL/GXM/G12A/G12B/SM1
Date: Sun, 19 Jul 2020 19:32:10 +0200
Message-Id: <20200719173213.639540-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200719_133734_763785_5BCBC37F 
X-CRM114-Status: GOOD (  13.00  )
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 narmstrong@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Now that we have GPU DVFS support in lima [0] (in Linux 5.7) and
panfrost we can make it work on Amlogic SoCs.

I decided to remove code duplication for the Mali-450 GPU on GXBB and
GXL so it will be easier to maintain this. This refactoring is part of
patch #1. Patches #2 (GXM) and #3 (G12A, G12B, SM1) are straight
forward; it replaces the hardcoded clock settings with the the GPU OPP
table.

I used the userspace devfreq governor to cycle through all available
GPU frequency settings on GXL, GXM and G12A (which covers all relevant
GPU driver and clock driver combinations). I have taken the GPU OPP
tables from Amlogic's 4.9 vendor kernel and the voltage settings
(opp-microvolt property) from the public dataseheets for all SoCs.


Changes since v1 at [1]:
- removed the clock patches from this series as they are already
  applied (in Linux 5.8)
- rebased on top of Neil's recent patch "arm64: dts: meson-gxl-s805x:
  reduce initial Mali450 core frequency"
- adapted patch #1 after Neil's GXL S805X patch to keep the 744MHz OPP
  disabled on that package
- added a comment about GP0_PLL (as to why it's needed) to all patch
  descriptions
- removed RFC prefix


[0] https://cgit.freedesktop.org/drm-misc/commit/?id=1996970773a323533e1cc1b6b97f00a95d675f32
[1] https://patchwork.kernel.org/cover/11466399/


Martin Blumenstingl (3):
  arm64: dts: amlogic: meson-gx: add the Mali-450 OPP table and use DVFS
  arm64: dts: amlogic: meson-gxm: add the Mali OPP table and use DVFS
  arm64: dts: amlogic: meson-g12: add the Mali OPP table and use DVFS

 .../boot/dts/amlogic/meson-g12-common.dtsi    | 49 ++++++++++-----
 .../boot/dts/amlogic/meson-gx-mali450.dtsi    | 61 +++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi   | 51 ++++------------
 .../boot/dts/amlogic/meson-gxl-mali.dtsi      | 46 +++-----------
 .../boot/dts/amlogic/meson-gxl-s805x.dtsi     | 17 +++---
 arch/arm64/boot/dts/amlogic/meson-gxm.dtsi    | 45 +++++++++-----
 6 files changed, 153 insertions(+), 116 deletions(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gx-mali450.dtsi

-- 
2.27.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
