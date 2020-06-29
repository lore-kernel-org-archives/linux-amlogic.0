Return-Path: <SRS0=ciOP=AK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2FAFC433DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jun 2020 20:39:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AA0D206C0
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jun 2020 20:39:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ItREeo+0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="D215U9Pl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AA0D206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=plpnp2hrLHz9IRfhS+MnnpWbqer8SXVIBliqNooCAig=; b=ItREeo+0TQJlvTVmINaP+Q3g84
	4sttFnbNZsbVxCxMOzs9Jl/MRrT2q2QWejsWPqdh/Yn7suJgm87euriQ08zNpO/JWvyXhoqAsAUKP
	ZmtdA8wGFhx2lrGw/+182IDdraeIKA3FKGaNw7pWp2e3mz7RQEU4+UAK4F2kgwesIV6o2txdXak+4
	mLFJ7WytvMMpkRrS3bisB2bpkQRz9zVZI1b2jZR5QgwCZsPIrek08fH1sIyelmaOq7C/F+2KtdymB
	0A+ppysReFmq62k8s03ebm07uIK+4XQdllyMLW/yywmlKKCgcbv9Jy5nbotARrICllfO87fJPO2kl
	xtSZY3cw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jq0Ye-0008TV-3e; Mon, 29 Jun 2020 20:39:16 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jq0Yb-0008T1-PT; Mon, 29 Jun 2020 20:39:14 +0000
Received: by mail-ej1-x643.google.com with SMTP id i14so18174821ejr.9;
 Mon, 29 Jun 2020 13:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VDcfDi33is5NY8p30BbC+tdqixJSzaPLxC/pjqPob+s=;
 b=D215U9PlHx8PJ9SEK+W5s386BoBCjwOl7sEWwACwHjGfRs4myi0BKaXRwKfuiF2LgH
 aTDMRGFRTdYU8Psuvc1vbWw4DbK9tURwNNRf9isVbJTOsg1FmT1N6Z67k3eRZ0M59jrf
 dgt4RAOjy5T1Eu0yXfCnhDvheP6Uo7EpwhEaKlLUaFuHHdQv9WcRBJ0COXGyadig3/CP
 e7fCuQLZr/A7RdsHg+s+MznW9E4P7yEqlGzuzdjO2ZqDeJt/WTEsTaj1esfsOy3p2uKC
 Jd+2gjg25pyo0RmyBb+ZeMC725UaQsw9zq1NyX3XsPH/Ux9jNj4shk77aSwo5aofORWV
 vnUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VDcfDi33is5NY8p30BbC+tdqixJSzaPLxC/pjqPob+s=;
 b=MLn264zentEAfCG65zce6+3k/gX28eIZeBu9kUw8xnXj7vDB9MnVdazJ5vnQuE9J9m
 ZL/MwrDpfj8F58VBth7PLOwcwuUDM1fT8xdqayFojWcEnKaQfh/AiycwotecVoSvYeYF
 jC6o3AnicBAq7Tl+KQCQV0u4FPnkFS3/Kero0D+XjyMsaVQoyKWy9k/HB8MxcI0pAXIK
 WzHVHw5PpBkgiwh0oVth+eyM7hCG1AONav2aLgVij3BvzZZxKzvrTI4vAyPFxfqqqyMd
 5F5MfXVwUibEKw/MOUODR4Z4vyfQsObb+hHzPgz850Vgw/yV7t/h3VfJQsBJ0daFzZWv
 b/ZA==
X-Gm-Message-State: AOAM5322HyVIqrorJ0en6KUDtZwYYKsvqS+09GobJXw6ySsxIHGUz94H
 DKGnSR/79wi09RCNYDs4vDN50iT7
X-Google-Smtp-Source: ABdhPJznGeaPUprOzPLGXLcxSwmKDdYs7ILTrx7FQdFileRyIvg1SNNGT6TjxGnbAO7dm9g6osvOkQ==
X-Received: by 2002:a17:906:364e:: with SMTP id
 r14mr5016296ejb.258.1593463151413; 
 Mon, 29 Jun 2020 13:39:11 -0700 (PDT)
Received: from localhost.localdomain
 (p200300f137396800428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3739:6800:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id j24sm706741edp.22.2020.06.29.13.39.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 13:39:10 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: jbrunet@baylibre.com,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 0/2] clk: meson8b: add two missing gate clocks
Date: Mon, 29 Jun 2020 22:39:02 +0200
Message-Id: <20200629203904.2989007-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, narmstrong@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

While trying to figure out how to set up the video clocks on the 32-bit
SoCs I found that the current clock tree is missing two gates. This adds
the missing gates based on evidence found in the public S805 datasheet,
the GXBB clock driver and 3.10 vendor kernel.

I didn't add any Fixes tag because this clock tree is still read-only
and the HDMI PLL (the top-most clock in this tree) needs more work as
well.


Martin Blumenstingl (2):
  clk: meson: meson8b: add the vclk_en gate clock
  clk: meson: meson8b: add the vclk2_en gate clock

 drivers/clk/meson/meson8b.c | 60 ++++++++++++++++++++++++++++++-------
 drivers/clk/meson/meson8b.h |  4 ++-
 2 files changed, 53 insertions(+), 11 deletions(-)

-- 
2.27.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
