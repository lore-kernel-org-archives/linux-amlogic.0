Return-Path: <SRS0=v2ss=SS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6307C10F14
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Apr 2019 19:02:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB5B620663
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Apr 2019 19:02:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fn8v+DVA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="weiOap0w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB5B620663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tUDFYQO7O7fOqykzAs/gX4vGwE5pzOdZubR3vTBovig=; b=fn8v+DVArnUVNm
	1MTpFyl5XnyjjIe07yo4T/w/MhpfpzIjvTohVWSV8kEFPzGLlaXPVd8t3a36ZbvcJL70dll6uOjqg
	sL1fjIzujW9+qgzOyWg92bX8g8jYLDYax3ksCRUqoodx0zONoomv/32BPfFXGz3DQmVWnNiYtBhz/
	u9gDItw7Kv1UpaTtE5/ip6t/jPbVBzn3jfscogLHhsygV7BU1GBcCeb30V8Lc8zpG0nJEC4CM29no
	a29W0KIZ02wyBXg6GupUIoWHUruHlFayx6mGLC/xe0q08GY1lCRzTZMuoVsBiKohN+H8jvXs3QdR3
	LwRCfkKGxKmpnVkhyPWg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGTLH-0003Xy-Qw; Tue, 16 Apr 2019 19:02:03 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGTL8-0003P9-Ot
 for linux-amlogic@lists.infradead.org; Tue, 16 Apr 2019 19:01:56 +0000
Received: by mail-pf1-x442.google.com with SMTP id h5so10882076pfo.0
 for <linux-amlogic@lists.infradead.org>; Tue, 16 Apr 2019 12:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=JjKjlAh6nXxaI77IalZgHFwuGMAQ1dUUJW+n8kgkchA=;
 b=weiOap0wETK3URoZ3gB9iY1HvaLmuWvlOgd2JRAWkiYwSrk8eYOz01lSQKtu+1NLTE
 vDpGI18PD+cEFz2qLQnjDvgdFU2kSi+5ERpMYbVBqT6WQXJkRMtXTWJTh4loXgDy/z0s
 vaud26XTDOy6S3i7Pu/LAs9/Bs24pqHnYJDPJG1ZN1C+OmO+i3lXk6KUNSmxYP0uH/VT
 EpwUwpDCbVmCSaB4Ovv0V2J0tSDxVrW6Y8Qyh+9FyiubZ06KtsPnUvBDC9Y2mVbwKdVc
 E7x44hmTZ/tv5FOiCcBkgH5uxV+tJndy0JG2BNRvtbQ33dLhUAAQ70wPvvVUvT266lF1
 Mzuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=JjKjlAh6nXxaI77IalZgHFwuGMAQ1dUUJW+n8kgkchA=;
 b=gv4bZRBFAV9rDaVsxFOD/kMqDuoyv5sB87/VxuKZhxnyy/D7Ja0Zf3juYXT1RSHqMz
 /VaboKZQGSwPggh0HLPHWQUDW8mo0cPckC3wnabILXMRxTD4CUNm7T/KtOvmqCieMzhp
 g6e+sk5+xELYkIUcMFCVJAHJ8pNnnh2AHKzYP+1qZH3W/lJ8N0sPQf4ovphJcTsblnv1
 xR3rj7k1BO5SGAGLp9c+Fb2KEaIaYutOWAGyyH+iN1e5/6afUL8CU+TEMrhpt3wJCF57
 6Pzeaao4WXaH4TojXGr19J0goHVCiTe4KrMyBCNhmmLealqMljS1bJjQDm1jpm6I3/od
 qMeQ==
X-Gm-Message-State: APjAAAUWfY/2/qstIucVrNjWJs4nJkJ4OaeRiLoQEGV80H/ssc82gTy/
 XX/2XqKX/53gMac6y78b+F69/w==
X-Google-Smtp-Source: APXvYqyQhjqvViAPOX+VaJxDS6fn0AGOzQMbz/Onhxz8k2K/WJC7xYmGsyQbvKSrxDomwIjmve9msQ==
X-Received: by 2002:a63:c112:: with SMTP id w18mr79326612pgf.200.1555441313986; 
 Tue, 16 Apr 2019 12:01:53 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:c45e:7ed8:c242:3563])
 by smtp.googlemail.com with ESMTPSA id 10sm94248745pft.100.2019.04.16.12.01.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 16 Apr 2019 12:01:53 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 0/3] Meson8b: add support for the RTC on EC-100 and
 Odroid-C1
In-Reply-To: <20190413163423.15149-1-martin.blumenstingl@googlemail.com>
References: <20190413163423.15149-1-martin.blumenstingl@googlemail.com>
Date: Tue, 16 Apr 2019 12:01:52 -0700
Message-ID: <7hr2a1ojtr.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190416_120154_805263_E26A9BC5 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
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
 jianxin.pan@amlogic.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ccaione@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> This adds support for the RTC on the Meson8b EC-100 and Odroid-C1
> boards. Example kernel log snippet while booting my EC-100:
>   [    5.713750] meson-rtc c8100740.rtc: setting system clock to 2019-04-13T16:21:48 UTC (1555172508)
>
> I am only 99% sure about the naming of the clock in patch 2 and 3.
> The public S805 datasheet from Hardkernel shows (on page 24 for example)
> that clk81 can use "XTAL/32khz" as clock input. That "XTAL/32khz" clock
> is described as a mux between 24MHz (our main XTAL) and 32kHz ("that
> other XTAL").
> I believe that this other 32kHz XTAL is NOT the RTC32K crystal because:
> - schematics of the EC-100 and Odroid-C1 clearly show that the SoC input
>   for the RTC32K clock is labeled RTC32K_XI / RTC32K_XO
> - GPIOAO_6 has a CLK_32KIN function (shows in EC-100 and Odroid-C1
>   schematics as well as the public S805 datasheet)
> - Always On domain PWR_CNTL0[11:10] (public S805 datasheet page 19)
>   describes it as "Alternate 32khz input clock select from GPIO pad"
>
> Thus I believe that the naming of the RTC32K clock is correct, but I
> wanted to point out that I'm only 99% (instead of 100%) sure.
> Jianxin, please let me know if you disagree with my findings.

99% confidence is higher than we normally have, so that's fine by me. :)
And, we can fix if we get any updated info from Jianxin.

Thanks for the detailed description.

Queuing for v5.2,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
