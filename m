Return-Path: <SRS0=ciOP=AK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 145EFC433E0
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jun 2020 23:20:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D517020776
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jun 2020 23:20:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mijiFdiz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="TNGaxkB4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D517020776
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/UjW5USlcQmOWhkqr7/+j/aRZV1HBPgWBnMOaDywbTE=; b=mijiFdizaismudNyeubmuVjuC
	q6OhhzviiXH8F7apGryS13SB3J9IdY3MoGPtn5grXP+pGHUazfQ3j2MPHAILtsenU9g+Zs842H0pk
	KNlx+KiJFcEK3it3Qq5GpKQM16NSpmqvUxOLXW3u4BglYbuJRpnIqje3ZXKRNr8tUfjby2iw8L3Mi
	786BoRyyPgkFFz1JCmeDUPc44lkEwvmTFcBigrHlmLW4Kl8rPPj0mM4/6avgrXnKvB+E8ntZWCrJy
	+0hQP2YJ10XcCabT87A4Uj2kElxEd+BECrMbHXhMi48cee02cWrmEEBJyiSPlAWrgklpvNF5hj5kN
	30fwJA3CQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jq345-0006Ff-Fl; Mon, 29 Jun 2020 23:19:53 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jq342-0006En-VG
 for linux-amlogic@lists.infradead.org; Mon, 29 Jun 2020 23:19:52 +0000
Received: by mail-pl1-x643.google.com with SMTP id f2so7690723plr.8
 for <linux-amlogic@lists.infradead.org>; Mon, 29 Jun 2020 16:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7BCJlfo7G05xbD0az983kKAGFwTGf/oknVgG88bEOuo=;
 b=TNGaxkB4WqrzO1Rk2s8RincaD8Rigbs1OexXplCAyMg266FHEL1M5oJZrqqCc4OtXC
 dp31cQYL6GvgZWbR4tfGNlmCwOL8ISJsaS6+8H/YyjK816ypFrD15qyg/sygrl2v6rKS
 KvaPkQipNntsnindjHXBkzi19Wb2/S9eqVQ84Gy22MprFtGor1olAX78/0rFk/syv8J2
 XRmPVPpEOBPLPUURo9vOOiZ9w040EIggc2A2RC6p3/F4ePo0v5eDZr+AaHShDKt1pcnp
 WWU/sRbTyynjwsbTCN/rjvHArtlod0LWN3Sj6mMcXhil62v6nUoNNXdJd7tMDct8s2m9
 Gd0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7BCJlfo7G05xbD0az983kKAGFwTGf/oknVgG88bEOuo=;
 b=kegEimKkNyX4xelbbUHdpLlYGKkBbHPnOe3q0BC7kPtQ81mKvBBiN8i28wnzM8Y87j
 ZFcH0mlmAc3zgWIpa5/lWdTUf0dSnInUgnniPPs931KZFUdIkwW4apx1tKcPxLyPcXPe
 QsE65ly3+3CWi+6QGslXCa4QEhDaLltB4Y28IxtIn5Nv5xzpRksJt1j0H9nVn8OtGMKn
 3hFXxcDIG10tmx6RV0G6U90seySSvkLZNMgWw1s3J8MDnOarGYzhJH0WDRKdAycMlDwa
 pwgvI7YFrc8AyDunHf70TqxSCOin3T4MTrllPdM7rsS3JNHOLZef16nG7/sEM2ZB9G8/
 FTpA==
X-Gm-Message-State: AOAM532VD9fm0vtte4j7PjdFmloXisgLd7eLaI84fSV9vekvq6/ewhkq
 /4lhcAp3QyyNlCc64ex8Xjl+wA==
X-Google-Smtp-Source: ABdhPJx0eXNtAX3bA2KoFAmvdhYvpSuaxwQz3i/aAvo77Rr8UlXpr4imdKYkriuLLMVI7PdD3GaHpQ==
X-Received: by 2002:a17:902:b90c:: with SMTP id
 bf12mr15253811plb.61.1593472787396; 
 Mon, 29 Jun 2020 16:19:47 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id 9sm623822pfh.160.2020.06.29.16.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 16:19:46 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson: add missing gxl rng clock
Date: Mon, 29 Jun 2020 16:19:44 -0700
Message-Id: <159347276726.1911.12754465903057336311.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200617125346.1163527-1-jbrunet@baylibre.com>
References: <20200617125346.1163527-1-jbrunet@baylibre.com>
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, 17 Jun 2020 14:53:46 +0200, Jerome Brunet wrote:
> The peripheral clock of the RNG is missing for gxl while it is present
> for gxbb.

Applied, thanks!

[1/1] arm64: dts: meson: add missing gxl rng clock
      commit: 95ca6f06dd4827ff63be5154120c7a8511cd9a41

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
