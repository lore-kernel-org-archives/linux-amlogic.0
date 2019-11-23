Return-Path: <SRS0=icuB=ZP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5315FC432C0
	for <linux-amlogic@archiver.kernel.org>; Sat, 23 Nov 2019 09:40:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24E742068F
	for <linux-amlogic@archiver.kernel.org>; Sat, 23 Nov 2019 09:40:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TtdYl3mx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="euWLHJsj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24E742068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LxSax1gJebGjHZXB7Ea76ZGjj04WP8h50tj7ETbeREY=; b=TtdYl3mxEXBtlc
	neXkJQ3jexFmIor0J/0rscOOhE0LMD493RS3MMRU75Nat3MVKtvsJp7vXO1hy3ueVWtma/gB30INb
	02PIAf7sAjQqQ4veTwlaY0wmksS0tUtn1Ze51TdGRM3ek6ENUyNnR+ickUwbfYYd0XMnvBAlvZQD+
	D6T7PGkr246DxDqYOYJ4mBQpS4Gk5/fw9tH35dtq8N6RP6z6VhhwxQxmze6S8oeqqR8VtCPWV26ms
	NvhPYm9Oae45Ba0H1X1CEjX2X1Ji0HTt+mphDphzcaG/NLo22EGheLHc8ede/BFbcnl7t1ELEiG3I
	/KtpkWCrBYJVhPb2HVZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iYRu5-0006KO-PS; Sat, 23 Nov 2019 09:40:33 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iYRtx-0006Dl-Jy; Sat, 23 Nov 2019 09:40:26 +0000
Received: by mail-oi1-x241.google.com with SMTP id n14so8764172oie.13;
 Sat, 23 Nov 2019 01:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZFVPcc7HYr1DXGBw6B0Y4i+GsNOxok+nW/sn0ODa37c=;
 b=euWLHJsjDSHHUhkFQukkJpi2+WtZ1HbLt8BUlnTyoyjnbXvZphRUZ5t1XCw6ctv+A0
 3kZEr7epA1kbMe/eyMznLKzaL5PZf4vV+oenEeRhrZz+B/Jju7kFTImB4WMidU3SYgD9
 YiXBW5PGty7bH9evcidnP4y4UaLO7cTVUdHaYJ9MTsdLz+a+sLyTIVk0wYi+AwZJ3Hh5
 zBopbKC8G8wFzUBY3pvfkvn8rcm3U/AABEi5gkzb7FX4L3hO83HMwDsDR8/3XxrCSdn2
 kb0Qca99DNNeDl8qpcoy+kdLzXR9qv1REcKOsDFPpduKskFl/z+RaoXqorTpMZyNDkYQ
 h9Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZFVPcc7HYr1DXGBw6B0Y4i+GsNOxok+nW/sn0ODa37c=;
 b=o9qbrq36fTvksWj6Sr5wonrpJyVq6gyBvENylQq/syfn4gjXD/TVUNZhmJTYIhrmQN
 kQ9UyEhBGGWYBy7LqWJjeVFmfZJti9vB9sWmo2/QwbU0dnKNh1ue1bOnKyAlfTrcT/37
 U2shh9fuZgx7oDmNqFmIKuGkjLFM3wD1tuJHJ1ak9TojOyznxV9nJFHKV+NBWoJn+VZ0
 H7+Jhn6uDYRm/laNUj08U85ixUdmATF9ToD1UY6iiq6HRAnA5in5vBQiVFBFpmJdVvmG
 jPQcSt3R7zKztG9Cs1T/usr7Ni50WGUCPJxCuhvvsNALA8Bd7O5uQVRYXMozt26j8MmU
 30Gw==
X-Gm-Message-State: APjAAAUSTN6sD7Dpupk+ECAXIzZZxC0V28InKunL8Gx3MAvEjVp10MZf
 RU6p7oQV7aUTmtwuT+ig2eWuWxY8BOo39lN9+YQ=
X-Google-Smtp-Source: APXvYqxEobYWB+wm8NZyoL31WGqKZIHUtoRQmBKv8NBLUHjYyBjG9p7RelpPqsHHAe1j6jp5XCOopaMypuZDTUeKleI=
X-Received: by 2002:a54:4815:: with SMTP id j21mr15579811oij.15.1574502023475; 
 Sat, 23 Nov 2019 01:40:23 -0800 (PST)
MIME-Version: 1.0
References: <20191122225210.109172-1-colin.king@canonical.com>
In-Reply-To: <20191122225210.109172-1-colin.king@canonical.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 23 Nov 2019 10:40:12 +0100
Message-ID: <CAFBinCCd_jr7UDdQx15tnFnZwO1tCbJ+PnZtEn57LUDtiRV_eQ@mail.gmail.com>
Subject: Re: [PATCH] rtc: meson: remove redundant assignment to variable
 retries
To: Colin King <colin.king@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191123_014025_685181_C7CE4C69 
X-CRM114-Status: UNSURE (   8.87  )
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
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Kevin Hilman <khilman@baylibre.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Colin,

On Fri, Nov 22, 2019 at 11:52 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The variable retries is being initialized with a value that is never
> read and it is being updated later with a new value in a for-loop.
> The initialization is redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
thank you for addressing this!
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
