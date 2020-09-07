Return-Path: <SRS0=IdmP=CQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E40CC43461
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 09:38:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D64D120C09
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 09:38:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rhnSFG1s";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="mJi1fSz7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D64D120C09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QN0Ttr0BVI/y4oiqFTzeCD+VmBGrj3OIuy90TCiYkFM=; b=rhnSFG1sjF4v31SNMJXIw8dwrN
	/28qumLMmKbkHB3TWwuQD/917bsCmLydcQzYIdJisqVZwHHbdarnAffULjjrEUWOujrT9ZiQ/G4X0
	T9tYI4d3bp8HDd/PYP2eRahabZKpC5Qbzd5Lo2hy5cOGI4i6LTFpIctB9Dr9kCVuNEBMRvsltxiCg
	HtJRG7a51i1joUS9ygCKiQ4Wqp1pyvRNQbtAxIfdI7iPwlhX5n9N9Wx1qhnzlynpU6u8f5iY7rttj
	Lj01LDYeokiwwgOpzleqxWhriE/2HJMpUP6Oe3vLLjJpgwvy2ncaFCD4cRpoLJ1dsFBHY0MxcktzD
	BsY1Dppw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFDbQ-00045x-5p; Mon, 07 Sep 2020 09:38:20 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFDbL-00043C-3i
 for linux-amlogic@lists.infradead.org; Mon, 07 Sep 2020 09:38:16 +0000
Received: by mail-wr1-x441.google.com with SMTP id z1so15108658wrt.3
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Sep 2020 02:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q9bP/xoJ+T6gS3ooO5y+uznagdOfHkS2kkQH3P/gVPE=;
 b=mJi1fSz7M5Lr031HrqOc2vIpZdQEGkG0kniFjTC+Efro5LjGWBiFhbr/W8/CfaGgUL
 8VC2+kZcZjCsAHUtHRfzdynmLK99Gk68kAUZdqRNt6F/VrUlfhgxBv5sdYZRa1Ok+YxG
 70oVXdN2vUs7vNwy2fdxiogKZHzniD9lVkijsf8hKWD+2GfEhgS4TuOY3Cnx1HX9riz8
 kKm4O1vkqHDJSb8/WanZi8DOeK2ALLKVuF0tjKVl9lcmOgS7nA0+TCk4EAKwPHiZaIJ/
 AP81EU26AHAgVP68NhyrEWf62ZfW5jZ3kxvOvXIEXOK1idHlX74cCb28DF2HAGt3GhK8
 E3Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q9bP/xoJ+T6gS3ooO5y+uznagdOfHkS2kkQH3P/gVPE=;
 b=PeRaDfsnVYdxXxwnzOhmaxWEFCiu/kygksgobDKgLvil3ipXXR04ueBIPC4NE8dlm2
 /x0WROcPUmEbhYnLrOwadEV9sIzeCxdTKxZBJr/Kmx2gEaAPjjD4FoMh8gLxzMFDviSG
 gFFW9pzeKiw3DAIG53ES8a5Ff4PMAEY2qC6v3i674BzlT4DL7HYgQZXK0Osd8tqGY+Hp
 N6z3vIqo/HBF6QWrTcw5KMYh5ZjAg3m0Eu6aJ2vsAj3g9yVnq0rlVyJbydCOA6P3CfpK
 iLvC8+tMqy39hwBzGzjJaP9vhhYNqj1K4OYFfmLlYDifKn4+x3YRDXimL0F1qm9tg78I
 zSXg==
X-Gm-Message-State: AOAM533n9veiBxQycQjdJdNGZSKfnblzq5qeBdq+cx9cTdp4gGuY0kQE
 6OPgS5Qkz9Pyc0VtDdPZS0XGww==
X-Google-Smtp-Source: ABdhPJwanebMcJF3b2wK++MK94YD9JrWiXeqBZFXJwRJfjn+8khXs/yrtoWZ3SVcFI6GcFsVI4vi/w==
X-Received: by 2002:a5d:570b:: with SMTP id a11mr17548904wrv.139.1599471493555; 
 Mon, 07 Sep 2020 02:38:13 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id n17sm25170687wrw.0.2020.09.07.02.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 02:38:12 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com
Subject: [PATCH 0/4] clk: meson: axg: add clocks for MIPI-DSI support
Date: Mon,  7 Sep 2020 11:38:06 +0200
Message-Id: <20200907093810.6585-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_053815_201840_EF44D69A 
X-CRM114-Status: UNSURE (   9.28  )
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds the VPU & VAPB clocks along the MIPI DSI Host clock.

The clock scheme is based on the GXBB & G12A VPU clocks, with a different CTS
clock output used for MIPI-DSI.

Neil Armstrong (4):
  dt-bindings: clk: axg-clkc: add Video Clocks
  dt-bindings: clk: axg-clkc: add MIPI DSI Host clock binding
  clk: meson: axg: add Video Clocks
  clk: meson: axg: add MIPI DSI Host clock

 drivers/clk/meson/axg.c              | 840 +++++++++++++++++++++++++++
 drivers/clk/meson/axg.h              |  23 +-
 include/dt-bindings/clock/axg-clkc.h |  25 +
 3 files changed, 887 insertions(+), 1 deletion(-)

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
