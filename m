Return-Path: <SRS0=cow0=5P=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F120C2D0F2
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Mar 2020 23:46:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F010C20774
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Mar 2020 23:46:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eYY0xWiM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="ABb6LM8T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F010C20774
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3sU3JqUgjF4RzHaheX3cs9v3BSumlp409N4xoYyvke8=; b=eYY0xWiMMfm6ES
	tyeoc1tL8ttMl4PWmFjBbyb5BC95Tj3OjBujmTegsD+eTbtlJ4g9Elm+vM5JiGXl0vCvwShSs0JWs
	SN/qQwSM+feD3VMReD9Ny8CgjWW3DaStiPxI99FcXz8SebuQBkA5vE7ktl/io/ZDhZ+PMNJyvnd77
	N5su6dwUpfHp4otOvMbwEwhqHeLXtGjRu1dEXJFyksmoeEBLVFTWgL+xHwJ8bjHI5toiNKN0BvBYK
	9b+na6ZFhhC/jj7QTGNRQegHK8qifL48WVBeIMFjVS7qVSgtMwGQwMtTCCgGE3Przkxk7tNp4eYNl
	jLmdZm8iXBFTHSY+Q9Bw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJ46L-0004Rr-SW; Mon, 30 Mar 2020 23:45:53 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJ46I-0004QX-UK; Mon, 30 Mar 2020 23:45:52 +0000
Received: by mail-wr1-x42e.google.com with SMTP id 65so23792471wrl.1;
 Mon, 30 Mar 2020 16:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GDnGHW3qNkgvLRDgu5vu6hawny2amkhzRWQ0FmPc35g=;
 b=ABb6LM8ToMRg6Yrah5JleJW/rhbs3rC5+MnLM5ss4L9Xfh1nULPqhBYzglKJ13bYnM
 GeMRq2+Nae3IN7gnVkDxuLoCOSqaXmP3MXm2UxG5mWjL36W+Ya2eqTCk4NFSwP0k2SYN
 WxuwWXZV1tzZ0bydrILV8rQTb4H1n7CLzuxE1H0slY4VXo+0N8gIVUNCsGhMgxSQ9euT
 k6aFpVUbFO3hYCImRqCGFZOWn8Ua52XZPtsPRe2hRh1FcsqWqJf1lcdnDgyDnU5XjZVz
 7f9PE5gLJi+8GIpORxYMWz6v3qCnGsJZLirxmsBijnz7AqnYcccjMG3WmJDP/+FkHeYi
 ocOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GDnGHW3qNkgvLRDgu5vu6hawny2amkhzRWQ0FmPc35g=;
 b=Loxh7HvyW1nmhefS9Vi6QiuIjRKTzE+ax0vYGlDkRVzhT2nK8TsT2NjUQthbHoCzx6
 MEvhbC7EMgoPexb+BHzRNinxQWaeCzmslykTren8GPdz70gLUmYmx7mgyZXOLRzMakkw
 FSYS6YdN0pvTnoBybTUo0jjni/DDr2p78VmRKVmpk+TndxLLIgKf/sxSNh8B5HVj1Maz
 pvoCVESz0qwDBLkZlt6qFy/r+uc9sy0wTBNCOkIFGXVqbig2ox9Aswcr5c3qV01ogkxm
 UlXwEDx9c1QyX7YdjtSVWAR+7w0YcNoML5yI+IeKN17zbwpzBt4LjLQWiqIJN1YRYmcV
 EdHw==
X-Gm-Message-State: ANhLgQ2zJPe0A3LNsefrV4NxS+FgwqHeACaBdgthKHexPH+zJIJ6IP9M
 J2OXwq/mFSGITOYcJzks9kwYOq9o
X-Google-Smtp-Source: ADFU+vsRAJpOrFH+eER9+kJfJgrHjQ2G/YBnZW8feggG/5Lyp88bIurZ3HekKzw9sQpYyAPLoBJuvA==
X-Received: by 2002:a5d:60ca:: with SMTP id x10mr11321086wrt.372.1585611947798; 
 Mon, 30 Mar 2020 16:45:47 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F13710ED00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3710:ed00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id v186sm1392953wme.24.2020.03.30.16.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 16:45:47 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, jbrunet@baylibre.com,
 narmstrong@baylibre.com
Subject: [PATCH 0/2] clk: meson8b: allow the HDMI driver to manage "hdmi_sys"
Date: Tue, 31 Mar 2020 01:45:33 +0200
Message-Id: <20200330234535.3327513-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200330_164551_001591_9FA4748F 
X-CRM114-Status: GOOD (  10.40  )
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
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The "hdmi_sys" clock is driving the HDMI TX controller. The
controller's IP seems to use this clock for example to derived the DDC
clock.

Testing has shown that we can disable this clock without locking up the
system (as long as we don't read the HDMI TX registers while this clock
is disabled - this can't happen as we don't have a driver yet and once
we have one that driver will enable this clock).


Martin Blumenstingl (2):
  clk: meson8b: export the HDMI system clock
  clk: meson: meson8b: make the hdmi_sys clock tree mutable

 drivers/clk/meson/meson8b.c              | 6 +++---
 drivers/clk/meson/meson8b.h              | 1 -
 include/dt-bindings/clock/meson8b-clkc.h | 1 +
 3 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.26.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
