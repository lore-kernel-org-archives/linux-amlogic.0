Return-Path: <SRS0=y0rr=E2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECA48C5519F
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 09:42:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7773D2240A
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2020 09:42:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aHCbuJPa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="YlefRCN3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7773D2240A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=obAMlz4ReqPQXjLE9JFYrPfHB4Hw9Jrn2ZGMx8Necj4=; b=aHCbuJPaT9ofjN0M8jlVdr0hhV
	fP1AYTD1T0mGTUyO2UybAilHh3pMjeHWk7M7LAc3FJ7e5lQHA8/Qpjto/lPLrcE0zJ3uN1iuT5Glf
	3O0q3cABqucU9P7lIa8Z4EEghLNA5m9QPRnptPEIKs3pig8S+U1HOu0MaX31cD8kCZE6R5Ypphkxi
	JhAnszjm7z5gzywFQalFqiNpqOuXghXYa8dxMLeNuHxy3pxfS86zTHpk9f8ayZZBrQ11eGQjs7f7N
	OVvN5cX4zMGvV0QyO5YkQVoL2XUARL7YWXbuBx4I1Y/hk7Mw8rAMVvoMpZcfP6ff3HgtUPkSi8pHk
	A9/7j1QA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg2vn-0004HF-0u; Fri, 20 Nov 2020 09:42:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg2vk-0004Fk-J6; Fri, 20 Nov 2020 09:42:13 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3A3AE223B0;
 Fri, 20 Nov 2020 09:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605865331;
 bh=07pOOQlCf1AGEDTz1zs87GUSSMbKSFGMWO3JJGzRHPA=;
 h=From:To:Cc:Subject:Date:From;
 b=YlefRCN3zf5t5Fs8vJbnE671oSCmica0pA8MVDzFZFPRILhxbSFH0SEBTxkqGTlrS
 0Lb1thKVxN+O94OfspWVuT71QXDyXMwUvqIASQ3bafn0VjyUEQqs5S1fTOdv1f6vUG
 HJO5ZsKSNG5ECQB+1SgpA0GMTUByLQ9+ttnHiwmE=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why.lan) by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1kg2vh-00CDFB-6P; Fri, 20 Nov 2020 09:42:09 +0000
From: Marc Zyngier <maz@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 0/2] More meson HDMI fixes
Date: Fri, 20 Nov 2020 09:42:03 +0000
Message-Id: <20201120094205.525228-1-maz@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: narmstrong@baylibre.com, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 guillaume.tucker@collabora.com, kernel-team@android.com,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_044212_880752_2DC0803E 
X-CRM114-Status: GOOD (  12.95  )
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
 Guillaume Tucker <guillaume.tucker@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Guillaume reported that my earlier fixes for the meson HDMI driver
broke another set of machines which are now exploding (clock not
enabled).

I have thus reconsidered the approach and came up with an alternative
fix (enable a missing clock), which Guillaume confirmed to be working.
Jerome pointed out that this driver is leaking clock references like a
sieve, so that needed addressing too.

The first patch start by fixing the clock leakage using a devm
facility.

The second patch addresses the earlier crash by reusing the
infrastructure put together in the first patch.

Tested on VIM3l.

Marc Zyngier (2):
  drm/meson: dw-hdmi: Disable clocks on driver teardown
  drm/meson: dw-hdmi: Enable the iahb clock early enough

 drivers/gpu/drm/meson/meson_dw_hdmi.c | 51 ++++++++++++++++++---------
 1 file changed, 35 insertions(+), 16 deletions(-)

-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
