Return-Path: <SRS0=JUPl=DO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD4AFC47423
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2020 08:08:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34DCE2076C
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2020 08:08:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NEq8hWUi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="bSN8spIR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34DCE2076C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g4lJGVdE2MQJlLE9aWEZXcfAmNsaBSFvDT7NZSpwwRg=; b=NEq8hWUirG1zgjxUhDPRsCsLAs
	pYCoAs2S8EAAgU2Xzlf44RODn3EWOmF+k0doB1YJU2fc2T2vn5gQNkb5+V5GmofrzprEJ6/y6jVT+
	PXVVRbaGJ3S57xqOCqCU+z1/AETgSCE4Loa/MgO1sskSBHPE+QhkV/aFmHScktOZ5SmZ9oSBHo+Ym
	Ugf22FjUSb0+DAkV3stgO7L15tOo6jufG21ckljD5iN1O5CcmRM6JQ1Z2lWil2xol3+jAf/Cpu4nu
	+g3UWODwU7o9BrGNrbFC70lGbT+2APahYRUL8nSEJdHb8yAVX/hmM2axv3n9pK3k7AvszLndE9RT9
	6G/XGZVg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQ4Un-0000L7-CK; Wed, 07 Oct 2020 08:08:21 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQ4Ud-0000Eg-45
 for linux-amlogic@lists.infradead.org; Wed, 07 Oct 2020 08:08:13 +0000
Received: by mail-ed1-x542.google.com with SMTP id i5so1201996edr.5
 for <linux-amlogic@lists.infradead.org>; Wed, 07 Oct 2020 01:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bGSaUBpUa7h3fJNtYObjMDqGR9Ro46H8/LDVOVOxdpA=;
 b=bSN8spIR9xUdSRkZ32gyacqTUcBVqvjgg+fTC1ekYl0AokfdWqIn8LFypvOYpbo38i
 cMTvixuZ/BStwWXTskgekW/5ucWRgKrX86vmjkGne7IqqShgah/SJRgB+CVrmTDvTfpz
 MnN4Jbgs9uvd6rnOErAqgY6cu/xXcld8dzrEubFtqqzlJ4SYJ6pOs9sTKrDCET55sgGF
 driJcWaouxN8vLSnxF4T0p5EUExeyhnVmGI+JH5D1OJ0zqECV+7uv20hREo2JVEuDclB
 ubVry93jRm7PVxX4vVmtawhppul8FdyFe1TOQXm928FO1UK1Rfo5fafKxZ4omdilI00I
 5CaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bGSaUBpUa7h3fJNtYObjMDqGR9Ro46H8/LDVOVOxdpA=;
 b=B7Z/2T6lH58fugfM30uodtUhEhsFwFsn+W8sMnx7HUI4byHdBEUFXjQWZdqYEYTg4s
 4kpwHG0PRjOBeV3s4cYeXC/ANGx8QZwDW5GzxbKQ6jZSuB5suMm0Qx6WzMqZhvWp8/Sm
 ERlj6b7YqAMs8ytC2M3d8Dk4g9HxMEdlD8W//Dd+YlcoNGiKy/TulFmhtk7ogSWvQlrp
 6NEgTSlVUsN+aJ6xp62lPJBbGXnXMVfy9FpqSLuhc7RUWFftcxM4LN0ogryMewqqjOVZ
 9+wEqRhRXAYECLo9vVjCHkmBpET4+2yX3GK2+ISNvcmotOryktHlKsMYmp1guy8+0zs6
 u6DQ==
X-Gm-Message-State: AOAM532Pl3an4pH51ySzeJF6dvKiCgEtbMxXjQRlGw5IdK47TvOtqOpf
 Crr2UxTkp6ByeEZ0QkXpIuBfKA==
X-Google-Smtp-Source: ABdhPJwq4DM7Wcl63R3341ewtPx1CDtsyrwGljNdz6qXSDJ5K2AqSjcd8k6iCCwk/nBKKBLAmDFYLQ==
X-Received: by 2002:aa7:cb05:: with SMTP id s5mr2224828edt.363.1602058088071; 
 Wed, 07 Oct 2020 01:08:08 -0700 (PDT)
Received: from starbuck.lan (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id p11sm888645edu.93.2020.10.07.01.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 01:08:07 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Wolfram Sang <wsa@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 0/3] i2c: meson: scl rate fixups
Date: Wed,  7 Oct 2020 10:07:48 +0200
Message-Id: <20201007080751.1259442-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_040811_340894_73C144D8 
X-CRM114-Status: GOOD (  11.26  )
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
 linux-i2c@vger.kernel.org, Nicolas Belin <nbelin@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset fixes various issues related to SCL rate on AML SoCs.
We retain the method which was used so far to set the SCL rate.
This method does not provide manual control of the clock duty cycle
but so far it does seems to be a problem for anyone.

Amlogic vendor kernel source uses "HIGH/LOW" method which allows to set
the rate and the duty cycle of the clock. However the documentation
around this method could be better and the result on actual HW is not
perfectly aligned with the comments in AML code. In case the current
method ever becomes a problem, we might consider switching to this
HIGH/LOW method.

Jerome Brunet (2):
  i2c: meson: fix clock setting overwrite
  i2c: meson: keep peripheral clock enabled

Nicolas Belin (1):
  i2c: meson: fixup rate calculation with filter delay

 drivers/i2c/busses/i2c-meson.c | 52 +++++++++++++++++++++-------------
 1 file changed, 33 insertions(+), 19 deletions(-)

-- 
2.25.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
