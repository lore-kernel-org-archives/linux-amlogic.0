Return-Path: <SRS0=mi7Q=HF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6D30C433E0
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Feb 2021 16:47:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5616F64F7E
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Feb 2021 16:47:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5616F64F7E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=mailbox.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NKY+H49EjfHABE4aDRlyPSLbcAdEvJ61eNr6/c828mg=; b=T9RDpTEz0RA01bMiUvYsT91FI
	W5xIOUABUsgkWT5OYsd1GYWRAKNdBR1hllS/XWyNsmuqdCgsBAxWvngnvhtFnwpyC7VXKqMZT7PK8
	g8MRMVoUBMexf3Eh+Spq2cocTVjpY39g1tGM/yCTT7ykYnQo8XOasjCEhIgu2i7HMsuE7E6Q89Q/D
	61RSE4Wx/eWagGHpsvYBVZYD5MKNPg6Mqlfy3SjDTYiBEitekJTFZHJUELA5isUYH4B314/UA918c
	HGyDUcU6QeXzcg/o+yssC/QyiHp/7OOYVT0yWCkqIvh5NWtaSXYwNcBmzGvMD1IkQgZShP8R6zHBF
	G1loMO+Xw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7LJg-00032V-C3; Wed, 03 Feb 2021 16:47:44 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050::465:101])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7LJc-00031i-QU; Wed, 03 Feb 2021 16:47:42 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4DW6zs4l7FzQlNs;
 Wed,  3 Feb 2021 17:47:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:message-id:date:date:subject:subject
 :from:from:received; s=mail20150812; t=1612370854; bh=C9SJkyFqEs
 ER8CQT20DEacyLoTmusZfYNglvdMUK1uY=; b=EZoXfyww0GRcwMrJhlWBQ8h6GA
 7Xv8g8b0DGqTG89Lw3bL51or/do8Mm5hM5LilDLeSLXP/R9zunFOUHLopgmW2Ssl
 8efWhvJpSKObB2vmQFdzvQkQU05akqEXY2Fd09NJfEZKx90dRw020CkYrkbxQrv6
 dXnMusQ/AiODI4lxP8elT27vC3ldfyfEGek8bICAgo6RWwjEYsLkad7EJ8Qsp5ea
 8uQG2np5Kyj862dJeqLmeIJZchQtHzfLuRSzyDTD8Il0/OQwyJkC9rkXL34HuzMc
 rDOQU1RF06ovePeyQlb0UhRlOUrYwVfZ0gCQT1EflFnVp+gm3rjpxjT1vQWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1612370855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C9SJkyFqEsER8CQT20DEacyLoTmusZfYNglvdMUK1uY=;
 b=SmG97IXy44jhBJQHPJNphFmrwu+wAGm806o4pX3Z40lMiQSrwU/LKz5Q95CBxmxJpKpcjl
 C4zrH6ZLy+UShXlCuItLOGIWFcaetG4BGZvPvdXWOaGtvVG40x5uTfEC8ObgF1CVckmfLe
 QPHyCJsNlZoP2Y/k+DUEPuzoWyYTJA9ioNtprJNtB8nM0qaRgwHTqe06BSdFArtBUQLBKQ
 5n1yKaQunUftf6QI2PBU7ysh9HtIaZoIhcazbaJYCd00CmAb8HG+vB4p98h5R+sAFl5DBD
 Lpw3DOxjKF8JMPK7DQV3T0V/rMfJQ0aj3azgTD31L2xk++g4JEma7Jk4HVYC8A==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de
 [80.241.56.122]) (amavisd-new, port 10030)
 with ESMTP id mWk_flSMrE_E; Wed,  3 Feb 2021 17:47:34 +0100 (CET)
From: Alexander Stein <alexander.stein@mailbox.org>
To: Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/1] arm64: dts: meson: g12b: odroid-n2: Add I2C RTC
 device node
Date: Wed, 03 Feb 2021 17:47:34 +0100
Message-ID: <2620452.Uv0mdyZMoP@kongar>
In-Reply-To: <c63a4da5-b598-2484-24bf-d7b4697e28e1@baylibre.com>
References: <20210202170846.81685-1-alexander.stein@mailbox.org>
 <c63a4da5-b598-2484-24bf-d7b4697e28e1@baylibre.com>
MIME-Version: 1.0
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -0.75 / 15.00 / 15.00
X-Rspamd-Queue-Id: 6F2A717BF
X-Rspamd-UID: a08374
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_114741_249919_4E98BD72 
X-CRM114-Status: UNSURE (   7.32  )
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
