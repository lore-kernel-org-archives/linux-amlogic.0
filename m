Return-Path: <SRS0=mf6+=ZN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07AB1C432C0
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Nov 2019 23:28:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5C2120674
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Nov 2019 23:28:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ccKzg5kh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="vD8iksYR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5C2120674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Tdb+a+DmTfkZx/fI3eO2lAVX7DU1V40kAdhqQJ/QXQ=; b=ccKzg5khvYi/cv
	FrW5yubIKPSiGQQY6eq4AycpygWN9bEk2CQmA5efvjsNHbcjPm4YSmZpTpqkb5U4VEnWaEzvlJ0e3
	AvXkf0TWmkvRMZisfd05ql0DS5TV3LoQmpCv4u7/x+cGE/S7QPPkm0cCqLBzHE7+EPYJ+0d1Tev8e
	IdJ3ESfXHXJAJy2mOKAGA8kgJRzrZ8rrn7TptjGpXSS9YvDnWbZ44u63e68d9TS9b4t3QsSrMDVmB
	lgwhcPj/Sa/05fPMRRo1L/jAJBvhTWkmfNoD8dQXMs67AQZk/WK1USRFHlESVLk4P1wJ51db8G+wC
	rwctfQLrlgsxbojOh60w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXvsR-0000TM-2H; Thu, 21 Nov 2019 23:28:43 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXvsG-0000M5-7F
 for linux-amlogic@lists.infradead.org; Thu, 21 Nov 2019 23:28:35 +0000
Received: by mail-pg1-x544.google.com with SMTP id e6so2410172pgi.11
 for <linux-amlogic@lists.infradead.org>; Thu, 21 Nov 2019 15:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=i0z/1OaECwr1imppf4Bt21QJXpxn3YyaLp+8xHiQvN8=;
 b=vD8iksYRA8ofjoIM56DEBfrvwi7AhJdrBvhWoKWt3SZ0ZNFx1vn98Szq60Qn6zjyNh
 cjXQMpZFpCAk7UxOUCYAoM7OB0LJJybZ22wvd4AmrV1RG7XdQ9GJ93xxA8ItKgXR4KWr
 mUIIqsFagER9I/3EeBbthYi53zu7VSo9zPbsn6HGe1vO/7qtwJ806D+MgBGsNXCPx9wh
 QXUrfJC966c3xb7jJvBgVi2k4CB3jIfEzY0aODyc0WUqUTi5MDNKf62MU0r3C6bEpuBG
 q9gzg6ffvLwGVRbrY3nLehthJuNJke+5/LJB1O79BAHupfZPSLFOQJsEVqPUUr+jHTC2
 ZD5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=i0z/1OaECwr1imppf4Bt21QJXpxn3YyaLp+8xHiQvN8=;
 b=aOii3je3poZD+D08l5iwu1pVG2CYdECuA3yEKoUoxWUn02ZEaM/QOV9EAbRIUBo+Ga
 qBYeEpqikiWrf9VnbeT7+EcYrhV5IRqnVaaDozgeVdJNpsYtw6U0p9k41EpTYNpbDtAn
 zYkcWh7AEhfujUbw6v9VEgK3saK0jJSVTw8ODAo8frOqk75Emr7aH3uCSLp7AWVXUSyU
 THg3xnu3oAcZRYLKtBM2yibflpqPwbo+zFUvSNSpEZQzKp4/f++fYeWZbWXV5ZpyMMEh
 QH6icSiRdjVAxkfKfjcrvqdvH6OfphMZlZzeSWeLkFkqGeIwlIK5jkSHbK7WOZvoVFyF
 V1eQ==
X-Gm-Message-State: APjAAAX0JROQI7IsNTHl/rDUEqdQ7uN6ONjLHzpaNqSzP9O5KZ45q/JQ
 28HRkqA/4tvIoLa6WUtG5XReIg==
X-Google-Smtp-Source: APXvYqxx51Asre1IY3pY4JpWhwntATKvJHOJXADsxNRbnQbMK+EIp0yoOUiHb7Qdv5SwaqY0PuMsEA==
X-Received: by 2002:a63:553:: with SMTP id 80mr12149847pgf.366.1574378909591; 
 Thu, 21 Nov 2019 15:28:29 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id c64sm4656814pfb.177.2019.11.21.15.28.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 21 Nov 2019 15:28:29 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: meson-sm1-sei610: gpio-keys: switch to
 IRQs
In-Reply-To: <CAFBinCDYbHW-7XOo1O1M-ghNj-7R+A4j6Y1skenuz6-TG8e9wQ@mail.gmail.com>
References: <20191121183711.19785-1-khilman@kernel.org>
 <CAFBinCDYbHW-7XOo1O1M-ghNj-7R+A4j6Y1skenuz6-TG8e9wQ@mail.gmail.com>
Date: Thu, 21 Nov 2019 15:28:28 -0800
Message-ID: <7h4kywollv.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191121_152832_308291_EAD8B3FE 
X-CRM114-Status: UNSURE (   9.12  )
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 =?utf-8?B?SsOpcsO0bWU=?= Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Martin,

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> On Thu, Nov 21, 2019 at 7:37 PM Kevin Hilman <khilman@kernel.org> wrote:
>>
>> From: Kevin Hilman <khilman@baylibre.com>
>>
>> Switch the GPIO buttons/switches to use interrupts instead of polling.
>> While at it, add the mic mute switch and the power button.
>>
>> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
>
> (I don't have the schematics of the board so I have to assume that the
> GPIOs are the right ones - based on that)

I have the schematics, and I also forgot to mention that I tested this
on the SEI610 board, and can watch the interrupt counts in
/proc/interrupts increase for each of the buttons/switches.

> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Thanks for the review,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
