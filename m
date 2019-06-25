Return-Path: <SRS0=SHiD=UY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76DCDC48BD5
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Jun 2019 09:26:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AE5A20883
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Jun 2019 09:26:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fjvWQEeV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="W/ctZ5sK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AE5A20883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nIINNRUmoDBFyIpNssFOHssClcsWxNoVb4cq/WefyjM=; b=fjvWQEeVSCVtnb
	bpFOgzaB+36m/1hDiVNa5wVWsScXWI7WsROPoR2b1A7a9KcMstQlL95s7m/OADkgd9VVjah6FrByu
	jGYHStq6AMZfwpyanu1oJ9tykV1KmAJmG/8LOZrL1icyghaemoQaursE1Tq7roTV8dmRPEpIcNZGA
	bJDwD/se8e8//wE80i+CbNVOH8HPrbvPM4MCgKOu7lZhLEIjNR9Aiqh8WAiPicxYkY0B/QpxHE28h
	r+zXurpLRKn2kts2A9OTzx9AYJsp/BtwgEVZSh+IoOJma4jnZZPKaCpc25p1JTky8uXN0BeaPYqMm
	X6J5uXjS+8X5KFuTiVHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfhiZ-0000MA-2L; Tue, 25 Jun 2019 09:26:23 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfhiW-0000La-DO
 for linux-amlogic@lists.infradead.org; Tue, 25 Jun 2019 09:26:21 +0000
Received: by mail-wm1-x335.google.com with SMTP id c6so2194365wml.0
 for <linux-amlogic@lists.infradead.org>; Tue, 25 Jun 2019 02:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=/458Fsfbmxm3r35MW4l5JCPflKQAaAPGKlBQ13aGDYg=;
 b=W/ctZ5sKpFFzLmeDLTZeNdA1KRnAT3H/e+0IDSuP05zSFgDWJNknbQJSqU8zh5bjRy
 Hb4A51RLamU36+wFsxxVZ0brdvip6L6rSxRQzNjZ09B0kXdQZd/t3DlIjResWXl/wr7f
 6OKNSNY9XGBCfQN9ZOIB/5Qmxm5g4HXxMcRAWZrc/ksWHbfd96X4CBlBitTg7S+fQjzk
 9o9gyTb1GbbgUg1zCRax/pWViIPPALnts1xRSZAdzymSyMXIajjpC1Wjg84UcYU2HT29
 9UauFzSCwlr6pzQwDL0ob7TEXs10/YDeJrj9JxfkXVZI8rgc1bwyXl5n3k0kDoWsCYlB
 ZkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=/458Fsfbmxm3r35MW4l5JCPflKQAaAPGKlBQ13aGDYg=;
 b=CrjvhKeRQZuBIPdvWz3z4+6o8nuFClNLlXJLv5l9LnPDnQEEebmF6pRD9YfdoKnyNk
 A/QOMcRLI3tTA5SiiOwLrZNQ3kyMUBVhT77mlc9yVzGRLh63McAU4cuzGhlFINPih9rg
 vWNd79xH0ltJbt7TQPcR1HMJw6PuXSVTsvHBbRF79RJfsO3LqRvcBq0HTgNLjk16E4Jo
 wMmc+dzUYjc0mkVTq8rYcfoJ7wG97WK4qqLie48H40zAuSEPirafR6h/XBiXBl8O7rlW
 qQ8L0QH6zEJiY7l7u4JoRfb9i1dG40+CRkat0hXAdn8H6nOfEEuzwuQB3HwYBQ0F28Kq
 EcvA==
X-Gm-Message-State: APjAAAXXgeTsOI7pcckjUr8bGEyGIqpHpko4rwur6Ud9Crr0kJ+P59O+
 j7sBA0rbJFPixaSW1jxdc7ziOA==
X-Google-Smtp-Source: APXvYqxKxw5Ug545jBsBa5P365/JMaSJWj3VKzQDexpDtRW8cZ87UyO23ZxOXVh5oOzKqh7FmzClAA==
X-Received: by 2002:a1c:18a:: with SMTP id 132mr19341185wmb.101.1561454778702; 
 Tue, 25 Jun 2019 02:26:18 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a67sm2140439wmh.40.2019.06.25.02.26.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 02:26:18 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: Re: [GIT PULL] clk: meson: update for v5.3
In-Reply-To: <1jv9wuyrfh.fsf@starbuckisacylon.baylibre.com>
References: <39ccc93ddd8bc64af85541086190e563fa13f038.camel@baylibre.com>
 <1jv9wuyrfh.fsf@starbuckisacylon.baylibre.com>
Date: Tue, 25 Jun 2019 11:26:17 +0200
Message-ID: <1jsgryyq12.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190625_022620_461496_328FA482 
X-CRM114-Status: UNSURE (   8.49  )
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
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Kevin Hilman <khilman@gmail.com>, linux-clk <linux-clk@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue 25 Jun 2019 at 10:56, Jerome Brunet <jbrunet@baylibre.com> wrote:

> On Tue 11 Jun 2019 at 14:38, Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>> Dear clock maintainers,
>>
>> Below is a request to pull Amlogic clock update for v5.3 based on the fixes
>> we just send. This update add the init() callback to the mpll clock driver
>> as discussed in the previous cycle. As promised, the rework to register/deregister
>> will follow.
>>
>> Apart from this, we've got a fairly regular update, adding a bunch of new
>> clocks to several SoC families. It also adds support for g12b derived from the
>> g12a, which explains the significant line count in the g12a file.
>>
>> The following changes since commit 3ff46efbcd90d3d469de8eddaf03d12293aaa50c:
>>
>>   clk: meson: meson8b: fix a typo in the VPU parent names array variable (2019-05-20 12:11:08 +0200)
>>
>> are available in the Git repository at:
>>
>>   git://github.com/BayLibre/clk-meson.git tags/clk-meson-5.3-1
>>
>> for you to fetch changes up to eda91833f099277998814105c77b5b12cbfab6db:
>>
>>   clk: meson: g12a: mark fclk_div3 as critical (2019-06-11 11:28:44 +0200)
>>
>
> Hi Stephen,
>
> Could let us if you intend to take this PR as it is or if you are expecting
> any change ?
>
> Best regards
> Jerome

Nevermind, I missed your reply.
Thanks for merging.

Regards

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
