Return-Path: <SRS0=hCbX=HE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6400DC4332B
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Feb 2021 23:11:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17ECC64F75
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Feb 2021 23:11:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17ECC64F75
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=mailbox.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NKY+H49EjfHABE4aDRlyPSLbcAdEvJ61eNr6/c828mg=; b=G9OoxEn5zkkj90zTFm5KBkLtj
	mdSjGZZsmqbQsVruDCeAwoAwSnnVeMVoNILa9U0YSTQWjOdq1Gq3wsa0UsNRYjGeGpE96gP9OoBdW
	rP4TA+fuYWz/TfccOQVsL7qNl1s7r6qzSNutOeJqChFmscGXS0uJCHnfyGHDO9NT85IgglxcPvmoL
	q5nspy+qacjplhlIpfQO/OP+cKZ+2WZyZrGrux7NTq25mxutOmqnSpG013HD8Ux6GXSjjs1OVZhYt
	IJYuKhkGmNeLNhQ3k4uK2OWvjAEuNbk1y6/u9DLDBHZOIAeMOjxzxKqqTQd4YiefcaWde3rnAuvZ2
	7GsFqRetQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l74p4-00033t-IM; Tue, 02 Feb 2021 23:11:02 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050::465:102])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l74p0-000330-IH; Tue, 02 Feb 2021 23:11:00 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4DVgXb4GB3zQkm3;
 Wed,  3 Feb 2021 00:10:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:message-id:date:date:subject:subject
 :from:from:received; s=mail20150812; t=1612307451; bh=C9SJkyFqEs
 ER8CQT20DEacyLoTmusZfYNglvdMUK1uY=; b=Zhtxxsdoux8hWM6mvN81W7AWs8
 s+paWTmOL7Z2Ac28rl+jc7egKxFiO1uWr/zfC7NXVaizxEbQx+mNlJnEuXhjeUNJ
 aGKqzUcXAVJf6X4jk6eGufeG9ZR2Vd1GGtgYR4WIlZSZZb+rqL5xBdpIXJM0lJ8B
 AMQ7O6h5VqGFQUC/FavkBZIs4JuZlE5TLXqhsk22/a/M6WMWIBMQ0UlZyqBb1LpY
 aaAs1CYXw6WFu3AGbuCO12W2iCMTpPmc8eoy/p5htN1DOI/d7H3jVdMRUqgsKLrp
 aAziQ0yIV5EGmieMBtynwGPsxZl4FbxkCtoV1orlaB3IUviysuAX3dzTOuJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1612307453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C9SJkyFqEsER8CQT20DEacyLoTmusZfYNglvdMUK1uY=;
 b=NwMnbK4oYhJuSSVaELV1Ejg9OUW5KJSbkRXsIb81Nz0Q/XsLWfe9QhBkFwa+6XcnPOCn5Y
 DDX6OhI831+TsjXl4apJpD2WhzxedvWD0HnatxQK2LhL2wKAhxjp81U13X6GrdE53+SxlH
 FyMOrIOsM+lcp0Xku+EYc7yUYTdRv2kaYgy8xKPX/qHc+eLiK32kQ1tZMv1mVW0SMuHdEy
 5BP6pGzLGWmY6Yvk5Or6VUSCAg/jhsQhgas/ll6tLnolUq2Br1WhINXp2Yf5XGQfJZYkKl
 yYOxfc89Rfn+eEPAhB8vncBCqivId2OtfY9Gn9Ujx0AGju8P3LEy32Y3qwDFCA==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172])
 (amavisd-new, port 10030)
 with ESMTP id EEK49OlZuCI8; Wed,  3 Feb 2021 00:10:51 +0100 (CET)
From: Alexander Stein <alexander.stein@mailbox.org>
To: Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/1] arm64: dts: meson: g12b: odroid-n2: Add I2C RTC
 device node
Date: Wed, 03 Feb 2021 00:10:47 +0100
Message-ID: <1904272.QyYuPWqPJX@kongar>
In-Reply-To: <c63a4da5-b598-2484-24bf-d7b4697e28e1@baylibre.com>
References: <20210202170846.81685-1-alexander.stein@mailbox.org>
 <c63a4da5-b598-2484-24bf-d7b4697e28e1@baylibre.com>
MIME-Version: 1.0
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -0.75 / 15.00 / 15.00
X-Rspamd-Queue-Id: 357F017BF
X-Rspamd-UID: 51debf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_181059_010923_686D48B4 
X-CRM114-Status: UNSURE (   7.57  )
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
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Nevermind,

I just saw that an identical patch has already been accepted, but is not in
Linus's tree yet.
See https://patchwork.kernel.org/project/linux-amlogic/patch/20210111135831.2218-1-christianshewitt@gmail.com/

Sorry for the noise and best regards,
Alexander



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
