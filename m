Return-Path: <SRS0=9NnP=YA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9789ECE58C
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2019 22:58:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB54B20867
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2019 22:58:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BNXwonve";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="A94WXkxS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB54B20867
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dh0J8Bg9jC9q1nkf1VIroDa4SD/6MC0h2WZUWHwv23M=; b=BNXwonvekvOvLo
	I4+mCyhIf9JuaWnb/6pfvH4WgB0ZJWWsG1cOi/WxY/R6izjq2HljPcxuOnBtoSOg0PYsM/KGxVum9
	XUwiIPsZfm8jEsFbFXJpg554RpikQv3y8c2IF9h3zasFzjqdW6PVljtlPtvf03JDfjQMMXDvKC9l/
	+bMAztY6rNCH/qlOq+oQx2oSR/RBWyWK/BI3W7NWIm3Wm0z6H+s5jJDuCOulb+GBOibTF+0kWaPNA
	MQOrKObTgPdM8xNdeht9OpvH52RAzAQ3KmDUprC1lpseKXJgki3Wq5HIbC/s3Ua6Eh6qJh6hYyjSN
	sAB5lHO4/R3F4WfNd+yQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHbx9-0006Mr-EU; Mon, 07 Oct 2019 22:58:07 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHbx5-0006Li-Sn
 for linux-amlogic@lists.infradead.org; Mon, 07 Oct 2019 22:58:05 +0000
Received: by mail-pl1-x641.google.com with SMTP id j11so7580945plk.3
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Oct 2019 15:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=HcljqBtqZ0n7Ky2kGCyvmwQmBy2Uww4x9f71GEl4Z8U=;
 b=A94WXkxSy/iySlIL7pQDbk5PyEHAV56d2+iR4LFGlii5+pbrJhkGI9GamLLoNTp12V
 g3e9CFHLq2AC728cDVClIDG2UxNJ5N3fH1AfNYALNjvbTpOSGmomeBb3eXQ08eJYoZk6
 LU41rYaKI7Zmb1wKEoQWeSRAZ3gyy7X2TzCqPh41wNYsvmoupQFVQLsv8o0uOBqnW001
 TNxb1jdGtt62cUx/R+dWLujDN5vi+hdJ/P/yrqpBibd5wr3zkNV+jGHXKk8g1j0fjxcL
 ShHB6G/+3rJf1OdL2Syq7gxBYqmuuArpeguVvRhkfckQBq3io5FGAOPIrLkybmRobMO9
 hkIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=HcljqBtqZ0n7Ky2kGCyvmwQmBy2Uww4x9f71GEl4Z8U=;
 b=tLTD1AsVFjXn70MhFzb9uPZ3TtNLj9sLUdWWk6HWScH/DBOnjDOAlqzjQR0DMeVdlI
 YyagMWNYxVEBy0wCtrvBv79Jkb4TW28E8WyGOu+i2nCmTBzXFOAEZqR1oCdzCafzPyte
 HxHo4WWdGr4sYjkztibajR6VNETvjzfUnCwovs5FTbAs/M2kBqdfrTPbPARTtxE/5drA
 Lu5UDGsWqVmdUv5oQMTv71YvtH6w9xyDNA2p8AFhCMF2YlmJ9SkD7JzdA2HnJjVf0wEk
 R21sGsIVauMCsVws8Aq3g0UZwRnBlPruQgM2S+BDXwV8Ve7ChoEb/t42Aur82Tgpp0VA
 sN7Q==
X-Gm-Message-State: APjAAAXo1C3xqDNWpu2JxdUpwRTC5YaqI1zaYyBsGdsWafOugFu+NbwL
 5O+UYtKg83eI7NpidOsBD/63wg==
X-Google-Smtp-Source: APXvYqzkOuhDdUWLlgA6SbWta6SkUoWU+Z0M/BpBE4YDjY9UHet/ggDjHI1KlYIoeSDu6bnRUGp2SA==
X-Received: by 2002:a17:902:9a06:: with SMTP id
 v6mr25829128plp.221.1570489081140; 
 Mon, 07 Oct 2019 15:58:01 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:ad34:3a95:9a31:e6bb])
 by smtp.gmail.com with ESMTPSA id f62sm16453675pfg.74.2019.10.07.15.57.59
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 07 Oct 2019 15:58:00 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Anand Moon <linux.amoon@gmail.com>
Subject: Re: [RFCv1 5/5] arm64/ARM: configs: Change CONFIG_PWM_MESON from m to
 y
In-Reply-To: <CAFBinCAoJLZj9Kh+SfF4Q+0OCzac2+huon_BU=Q3yE7Fu38U3w@mail.gmail.com>
References: <20191007131649.1768-1-linux.amoon@gmail.com>
 <20191007131649.1768-6-linux.amoon@gmail.com>
 <CAFBinCAoJLZj9Kh+SfF4Q+0OCzac2+huon_BU=Q3yE7Fu38U3w@mail.gmail.com>
Date: Mon, 07 Oct 2019 15:57:59 -0700
Message-ID: <7hsgo4cgeg.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191007_155803_981374_DAB9FF3A 
X-CRM114-Status: GOOD (  12.71  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> On Mon, Oct 7, 2019 at 3:17 PM Anand Moon <linux.amoon@gmail.com> wrote:
> [...]
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index c9a867ac32d4..72f6a7dca0d6 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -774,7 +774,7 @@ CONFIG_MPL3115=m
>>  CONFIG_PWM=y
>>  CONFIG_PWM_BCM2835=m
>>  CONFIG_PWM_CROS_EC=m
>> -CONFIG_PWM_MESON=m
>> +CONFIG_PWM_MESON=y
>
> some time ago I submitted a similar patch for the 32-bit SoCs
> it turned that that pwm-meson can be built as module because the
> kernel will run without CPU DVFS as long as the clock and regulator
> drivers are returning -EPROBE_DEFER (-517)

On 64-bit SoCs, the kernel boots with PWM as a module also, but DVFS
only works sometimes, and making it built-in fixes the problem.
Actually, it doesn't fix, it just hides the problem, which is likely a
race or timeout happening during deferred probing.

> did you check whether there's some other problem like some unused
> clock which is being disabled at that moment?
> I've been hunting weird problems in the past where it turned out that
> changing kernel config bits changed the boot timing - that masked the
> original problem

Right, I would definitely prefer to not make this built-in without a lot
more information to *why* this is needed.  In figuring that out, we'll
probably find the race/timeout that's the root cause.

Kevin



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
