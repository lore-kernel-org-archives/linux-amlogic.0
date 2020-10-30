Return-Path: <SRS0=7VJA=EF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3429C4363A
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Oct 2020 14:38:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41B41221FF
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Oct 2020 14:38:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C8IFfDa5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="mmMNE5mQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41B41221FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Gvip+Eo/PcLJ861lwbiHJ1AXTUzqWM2J9Bi3Taz0680=; b=C8IFfDa52wC/TBuvUxMkAta6N
	cBe3MaeHr2NWGHebn7yWOijydTZGTZIwKBO8DpcCvBO6Cnh+L5TmFd9UhejaoWIaLnuQP9RFJgWm3
	KpSXNuhkyrsnwRA+5fxsGxbB1NtrBgNC+eYYZKJ57HZ8KbXEkNugTuo/ObMchavaFD02LWa35EpGL
	x4XYhXJaMKJgpMnXovSDDURpDj9VLEX8EB55DRvazb0fxFSeuBKkFmZ7zc609PlGXnHVkkxkGh44F
	KOACCukalQprr2L2y/FwopDGO/s6fgqkvaeZRNRA4iO1wuVnopJGtZ2YhKDDiecV2LHfy8w/UhAep
	n6T6EOOCw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYVXx-0000bO-6t; Fri, 30 Oct 2020 14:38:29 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYVXO-0000QB-IG
 for linux-amlogic@lists.infradead.org; Fri, 30 Oct 2020 14:38:03 +0000
Received: by mail-wr1-x442.google.com with SMTP id w14so6703751wrs.9
 for <linux-amlogic@lists.infradead.org>; Fri, 30 Oct 2020 07:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OwtNdHIPSabqM1aRDu7jm8OQIX10dof411XMNae48b0=;
 b=mmMNE5mQrE5Ex3idb16Mw57c1SrldmI18PsAc/aatGvCSPh0OxUKBeczmUeqIg728h
 mghTsn9j8ZrqHvqSuiepxePhZzAetlJ+KUNrd++fT9nGGY0CuxqjA4biJfPpelCU04fD
 lpDwSiZBnakBIusEueqzC1/t+HcWypq4P0iZpHtyPMxi2Q/pcb+k9ENFkqnlw9Q6hKqS
 9GxmKeuGpYrn7iCE5uMiXkv6belgQYQ0R060vWreCrO1nzO3K/rh2amsFNVo0NbUVqFd
 dodc/zxIFBg9/7mw3GcS3yjekZe9mXGyg1bmOYNfeNzygbWufO7UEjALySvjVUdTEOtt
 p4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OwtNdHIPSabqM1aRDu7jm8OQIX10dof411XMNae48b0=;
 b=q4XZpr/eXDmlwjcZ9D8bwDOSVHdbTKLcWSbokN12drEfb2qbzuo0Z5VppCQ7sk+60E
 eiisjDbp6syw/2yoM2L4cZH8IpR9u6RYEmqOnC9uIg7HwYT17yOzLV9KXIqkVY2P1oPx
 uHVSG9or+G+3ggQT8Q7rd5IPKC92iY+4NMC8hLaQ+8sFVno5PyDmyivg1p17hkOnQQhc
 bOfM6X/ADzh/2+BrSpuN2rtqIOYMi+sKB6Y48iXHOBWA9frNemwVuBuCNJNIoLtSLt5v
 2R/okv5v61/AATYsaTJH1mYVGhX8FGzy7YToOD3lJxtacuch2v53b7PY3MwRqgqg1aLu
 ukag==
X-Gm-Message-State: AOAM532A77tkA1gX9JB+PEvH0Ri3INo12Z3+A81qM3p9B6zKxadIkqQj
 9vMOLOSqxvdItX79aIQzPQ3L26N2ZidJfjctbrk=
X-Google-Smtp-Source: ABdhPJzcGa5JPgiKW9L1GHX3i2KkDFiru4v1nYIA/xefaOCkFhXzo7NKbTSfOX5xpjiQviBULSGH0w==
X-Received: by 2002:adf:8366:: with SMTP id 93mr3621462wrd.6.1604068672995;
 Fri, 30 Oct 2020 07:37:52 -0700 (PDT)
Received: from localhost.localdomain ([37.172.114.188])
 by smtp.gmail.com with ESMTPSA id y200sm351481wmc.23.2020.10.30.07.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 07:37:52 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: hverkuil@xs4all.nl
Subject: [PATCH v2 3/4] MAINTAINERS: Add myself as maintainer of the Amlogic
 GE2D driver
Date: Fri, 30 Oct 2020 15:37:14 +0100
Message-Id: <20201030143715.577641-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201030143715.577641-1-narmstrong@baylibre.com>
References: <20201030143715.577641-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_103754_721011_FCF0EDF9 
X-CRM114-Status: GOOD (  10.11  )
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
Cc: linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e73636b75f29..db93156dcaba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11412,6 +11412,15 @@ F:	Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
 F:	drivers/media/cec/platform/meson/ao-cec-g12a.c
 F:	drivers/media/cec/platform/meson/ao-cec.c
 
+MESON GE2D DRIVER FOR AMLOGIC SOCS
+M:	Neil Armstrong <narmstrong@baylibre.com>
+L:	linux-media@vger.kernel.org
+L:	linux-amlogic@lists.infradead.org
+S:	Supported
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml
+F:	drivers/media/meson/ge2d/
+
 MESON NAND CONTROLLER DRIVER FOR AMLOGIC SOCS
 M:	Liang Yang <liang.yang@amlogic.com>
 L:	linux-mtd@lists.infradead.org
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
