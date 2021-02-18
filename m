Return-Path: <SRS0=0aRn=HU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23048C433E6
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Feb 2021 18:10:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9813864ECD
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Feb 2021 18:10:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9813864ECD
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=mailbox.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wCfibVnhsoqe3ySkKAvXzqgQaSH+DUVd9XgDdh2aRKE=; b=aFYcH27YTTVZcXCL/0QohmiaT
	3UyoM+dDkXe+hOmyXo+xt2EcjnAzIq5+mqGrKUm/gs26AXACjen0TzTfTpKt3+o6zpw0X8D0js6E/
	2bUJuP+uRnvxEhrKuO5IkD8eKlTApJyNKMgr2J1YD0PoNbqzdGZBaTrnnOFpyf15j79vzlyuLez4Q
	OSxltikKltBtRTjYKSUP45WhdaZdrgoWsZetx/UJLtNXA7lrjHxPQdwtlMJjoYPqbxSGA5fv2vbJU
	xfhyB62RDjp2+Pb2GhWH0z10HErLwkpt4/olmSBe6Ka8KfxaVSR/qt0YOY53j8Ia+20cFW+ei6pQg
	ckO2XMEpQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCnkI-0004jr-W0; Thu, 18 Feb 2021 18:09:47 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050::465:102])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCnkD-0004if-FJ; Thu, 18 Feb 2021 18:09:45 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4DhN5Y3LpYzQk8g;
 Thu, 18 Feb 2021 19:09:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:message-id:date:date:subject:subject
 :from:from:received; s=mail20150812; t=1613671773; bh=W/Dls4BBn0
 cZBu0J1HB0GO9lXeKTSNrYr87sAw81zvc=; b=ENGz48t9l3y4/vBYGldpgWmr+y
 nONQUabzsiW2uW3eRVexRkteGu46ZE1l4KefYDfbKI/pKNOiReaJ7C84PMQ9/hsU
 ZA5TOCEJFxKGsFOwfDwtwW06AQZ440HiKBNdrvKR+FTpHYzT5oSHybaxkYxXVC+q
 9HzwYXtWX3xy2NL6sT2QbqX+pNL65gbBxLGYbJCkZDQaFB//78I4UTzc4U2glZ5e
 PMgZ2WqOmFTnEMQYL9q+fya/vZGyNcTkf65OQ4VAhP6AmsLki/X9UTSL9/lQRCbv
 NaG410FYx4yyjANiDY08Q6tMXrJOUMnoYMO/sPLsGGfDPwibHy4DXCwzF7xg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1613671775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ZCc8BafT07k/uY7SVF+4P/8ZypzbJUznZWOpeKSXpQ=;
 b=X2d5YBZmnZgIn6wfcC64zps2sccljYASZfY9eiXvoSZY8yMt/aBSYqCBuX2BUntMSEDX4O
 tCB86ubvH2Yj7J+VUwjr4y09iVshlGpDMXaW+ikVLczFs1JYK0gfRjb8OGUH8O7zTYSQQr
 vkkMWknB/c5rg7CuIyhzQ5qz4rzOZcRBi3lLYkiHHfT46/568JR/pS56Iro9yH2lj5fSF5
 RY3/Q2qPjJq8kw4/Y6TR4g9tQ5qZd8AR2MqvT06o3GKs62tQU5eQa4RAmn5puGxm/HJy5q
 PZt2OKAxZRrPk9m949c6M1lJFA8zc7BxU1517sqKVyHOlaB/AidH3U0TP6sykg==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de
 [80.241.56.115]) (amavisd-new, port 10030)
 with ESMTP id xu8EzBvS0Qa0; Thu, 18 Feb 2021 19:09:33 +0100 (CET)
From: Alexander Stein <alexander.stein@mailbox.org>
To: Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v3 1/1] arm64: dts: amlogic: Assign a fixed index to mmc
 devices
Date: Thu, 18 Feb 2021 19:09:30 +0100
Message-ID: <2921197.CJbAp5Dgou@natsu>
In-Reply-To: <20210203192824.854491-1-alexander.stein@mailbox.org>
References: <20210127230852.66686-1-alexander.stein@mailbox.org>
 <20210203192824.854491-1-alexander.stein@mailbox.org>
MIME-Version: 1.0
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -3.39 / 15.00 / 15.00
X-Rspamd-Queue-Id: 1A87917D1
X-Rspamd-UID: 48e893
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210218_130941_899637_1700D638 
X-CRM114-Status: GOOD (  15.01  )
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

Am Mittwoch, 3. Februar 2021, 20:28:24 CET schrieb Alexander Stein:
> Recently introduced async probe on mmc devices can shuffle block IDs.
> Pin them to fixed values to ease booting in environments where UUIDs
> are not practical. Use newly introduced aliases for mmcblk devices from [1].
> [1]
> https://patchwork.kernel.org/patch/11747669/
> 
> Commit message taken from commit 0011c6d18277 ("arm64: dts: rockchip: Assign
> a fixed index to mmc devices on rk3399 boards.")
> 
> The unconventional order (B, C, A) is due to the fact that sd_emmc_a is
> (according to the comments) only used for SDIO.
> 
> AFAICS all boards either have both sd_emmc_b and sd_emmc_c or only one of
> them enabled. So the alias order should match the previous non-async order
> for all of them.
> 
> Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>

Any feedback on this?

Best regards,
Alexander



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
