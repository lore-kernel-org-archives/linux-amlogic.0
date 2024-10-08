Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7814DCED274
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Oct 2024 07:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NkUkqLhfSvcAiyNUzWROgr/kIlwdOakts925YZWAOQA=; b=CsHFYdg+e/5eZk
	/YTXOOoYza82wZ4qIvMjrmzpkN2RavB5Qxdb9dv6bkbkiwnH5FCOe7X3UlBxCfCpd6pAvS85Ltve4
	VvVPhuE60PgQpcVkhJJWrEDWDPK5drD1tvE7We+xquA9IG8qco981yLvBaRB6NBCNYu5WbpOig7wg
	fJkzTXZsurymPeGKaKN95ZcdOHdkL+r/hKMxXpugJnlO32S/cjM59xygc6PnHTxofZkYPLVy7OZd5
	XyosNJys4dx2+iUpowolsagqEpYpS2Cyn9kpMGR80PDOKRCUw19IcVU6SyTsUlo5vN+xCx+PcYz3f
	psbyaQxwhU78wX0YVSAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy52s-00000004t1m-3SmP;
	Tue, 08 Oct 2024 07:54:14 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4zs-00000004sOf-0PRV
	for linux-amlogic@lists.infradead.org;
	Tue, 08 Oct 2024 07:51:09 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5369f1c7cb8so5616871e87.1
        for <linux-amlogic@lists.infradead.org>; Tue, 08 Oct 2024 00:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728373866; x=1728978666; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6KHz3KiZo21KykOoqgFqxWCqTKLqgL0/6CBnTEd5EiM=;
        b=iCszVf14YMieKYxL38KNfUU7HuRfcqMNUnDt4yVTtNw6mGuxScYY1jDC2i2+cURf5I
         N8VlYmqpK7uqQHQigM8W0EsgkXuthayBUEmAf5zJuTfHH5lqstljRWpHiEzcu69l9vKc
         AnC/i6nmZtKHg0jC7HtUi1yPs1jxGmGDwIARXZxX9HFVvMgreEgN7C6WOaUg5R5zHiI4
         dx4MFu+MsPL0GhgocuUBESh7fH7o/e2eqsglRKguB/n4/etCjZ6HqHYw50qWzXapD6gH
         u8o6BgSmZ7jMV3mfwYWWmfNg5XqjmjrzjofX9lwWPC0KOUlgNiPZ3YIgeKpnXi5TZCVV
         4igQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728373866; x=1728978666;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6KHz3KiZo21KykOoqgFqxWCqTKLqgL0/6CBnTEd5EiM=;
        b=adDDsIHMmKQx2AwL6DzJxbegbJ69kbcBuZqOWdOalVGjROXP7rJgVVXPoF89TAUQF8
         CaJXX7/DgxNY3P8LrnLSdf7qptWc7fLkqUuMd7NL1J8Q0T9NWIdMuPV8W4ON597ciodl
         n+fbREUEJSOci4AUqN4BmcV6574mSgaFcKsl6FdhI7N1JKMH8fLS78AtgOOeR0bMp0VM
         Ki0hPw69/gaiJHbdKTLznpq9KMbUHDBo6QFFu3v7uhFEPlO7Kao4Ousd/Hn6TGDxl4ys
         gommicB3WaABSgkXag36bXhMAM+LuG01gkE0RzGzjDmAdRgrRoq5lePtgN7wzkLWciEz
         /LJA==
X-Forwarded-Encrypted: i=1; AJvYcCUuD/p3024apaXIOaFiY6mbp3KtZS500Tirvv/GgcN7sLH1cLiXH08Ol4wiwcuihxJuv+gWfndyB2pQmulM@lists.infradead.org
X-Gm-Message-State: AOJu0YxSdRa8GJAXzivnpveB0DXmJEgNAWyQ5/orvB3E4/v1AsUhCezw
	3frnRnRfILID1b22TE27TtKmYMO7saBmYIUQPxPNrAZmKJvLxIZbf6q8m+qc2sw=
X-Google-Smtp-Source: AGHT+IG4vpUdXYwtmOCnAcFKZqVApaWhwicEgsFa7rtwGdLJNYFbFhoeLDq7nn3P7PK4dXCmzuxWyw==
X-Received: by 2002:a05:6512:2349:b0:536:a52d:f94b with SMTP id 2adb3069b0e04-539ab85b54fmr7094255e87.8.1728373865922;
        Tue, 08 Oct 2024 00:51:05 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:41f2:4244:ce34:c273])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f89ec644dsm100527175e9.37.2024.10.08.00.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 00:51:05 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Stephen Boyd <sboyd@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,  Jiucheng Xu
 <jiucheng.xu@amlogic.com>,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 8/9] reset: amlogic: split the device core and
 platform probe
In-Reply-To: <21c65903b243b677d8e84c84acf89c93a45ab1e5.camel@pengutronix.de>
	(Philipp Zabel's message of "Mon, 07 Oct 2024 10:37:46 +0200")
References: <20240910-meson-rst-aux-v5-0-60be62635d3e@baylibre.com>
	<20240910-meson-rst-aux-v5-8-60be62635d3e@baylibre.com>
	<8cb81058c8f45e378675e078e296336a2cf74308.camel@pengutronix.de>
	<1jldzwkpsu.fsf@starbuckisacylon.baylibre.com>
	<01aff9c0f129f8c1cf41c7ae53dac38048aa34a8.camel@pengutronix.de>
	<1jsetcro5n.fsf@starbuckisacylon.baylibre.com>
	<21c65903b243b677d8e84c84acf89c93a45ab1e5.camel@pengutronix.de>
Date: Tue, 08 Oct 2024 09:51:04 +0200
Message-ID: <1jh69nrq1j.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_005108_158438_5CD95849 
X-CRM114-Status: GOOD (  13.30  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon 07 Oct 2024 at 10:37, Philipp Zabel <p.zabel@pengutronix.de> wrote:

> Hi Jerome,
>
> On Fr, 2024-10-04 at 15:30 +0200, Jerome Brunet wrote:
>> On Mon 30 Sep 2024 at 18:56, Philipp Zabel <p.zabel@pengutronix.de> wrote:
>> 
>> 
>> > I've applied them to reset/next them unchanged, at:
>> > https://git.pengutronix.de/cgit/pza/linux/commit/?id=5b93105afcdc
>> > and sent a follow-up patch to fix the alignment.
>> 
>> Thanks Philipp.
>> 
>> Would it be possible for you to tag it, so I can pull it the amlogic
>> without waiting for the next rc1 ?
>> 
>> We have couple of changes pending depending on this.
>
> Stable tag at
>
>   git://git.pengutronix.de/pza/linux.git tags/reset-amlogic-aux
>

Thanks a lot Philipp
It will be in my next PR to Stephen.

>
> regards
> Philipp

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
