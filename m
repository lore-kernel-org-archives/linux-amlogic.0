Return-Path: <SRS0=BTcE=EU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97FBEC5519F
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Nov 2020 21:00:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44BA82242E
	for <linux-amlogic@archiver.kernel.org>; Sat, 14 Nov 2020 21:00:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iwqBO02f";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="XaogDyR4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44BA82242E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xilh79F/Xu0qH99xwj0McQh98qA4uQQ3jFxVgeAg228=; b=iwqBO02fiLEJ9KzAJj/EOv4Ic
	H/PMrjQQugsS6iiEgIzud3qa6fX8j34L86VBDbN5Gc5APvCG35lHqpFujbgbranwHHZAA+j83VTw2
	WhnlNp+2ZFjh7xIsnb5mbNkfiM8kpDDoG4FACOj+a1olAHSfrpIaDrBNtTRCd9pe8yQOidaGRDhXS
	jBUUB2aprXFphryvZYfuXEHGF4T5vIoJYuL30Rxx1tMkmx5nLQ/zTNLcHLzMbYfWtUIR/TYUVSi2b
	VUu+FdHGkTcAXErHF1gOtGpRLzsWO2f2D7IB54nB7toajOtOYhTqAjrbOftj+U6nZylaqPmK7JXpi
	M4xO9gPVg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ke2eQ-0000Xz-R4; Sat, 14 Nov 2020 21:00:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ke2eO-0000Wh-10
 for linux-amlogic@lists.infradead.org; Sat, 14 Nov 2020 21:00:00 +0000
Received: from kernel.org (unknown [104.132.1.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1E5942242E;
 Sat, 14 Nov 2020 20:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605387599;
 bh=CVhcELNHGDJeD6M6OtXOaCXhZiojf65RjCbtjNj/52s=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=XaogDyR4QoLWUiUknaKwa/6s7otzZQ6l3ZP/PukPRZfMfDX1J+UHsOMWDj+hO27iF
 eoo2WhimgEo3NqakWtMKDxCDIlDtrD6Pdy2Caq6875/FS+Is+4fXxL+8JouqA6HEqQ
 M+K//gZDSORniFvL8v+UqHBFl2weg73cfNe1q8AI=
MIME-Version: 1.0
In-Reply-To: <20201021163847.595189-1-jbrunet@baylibre.com>
References: <20201021163847.595189-1-jbrunet@baylibre.com>
Subject: Re: [PATCH 0/2] clk: add devm variant of clk_notifier_register
From: Stephen Boyd <sboyd@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Sat, 14 Nov 2020 12:59:57 -0800
Message-ID: <160538759797.60232.1575446972976252677@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201114_160000_133128_9EE443C8 
X-CRM114-Status: UNSURE (   8.68  )
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
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Jerome Brunet (2020-10-21 09:38:45)
> This patchset adds memory managed variant of clk_notifier_register and
> a first usage of it the amlogic clock controller of the g12 SoC family.
> 
> Jerome Brunet (2):
>   clk: add devm variant of clk_notifier_register

I'm not sure if we want to document these in the devres document?

Documentation/driver-api/driver-model/devres.rst

It would be nice if that thing could auto-generate the list of devres
APIs somehow.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
