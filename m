Return-Path: <SRS0=Lisw=5I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D108C4332B
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Mar 2020 09:04:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 062D52072D
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Mar 2020 09:04:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M1ACKSHr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="waSIN8+A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 062D52072D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WGLRmYFDjDFD9Z4UDcUcOF02oDk8fH2h5i2D3uMUdHY=; b=M1ACKSHrnr/PjUUVvESeKzbRSF
	MkPP4uD1wL/JK21TGrIpi7D2LSN6Jom/Z5B1rru187GV/6lnqSsnX6dExJOQcpDIQmWW4is4qTQOq
	srjcvkZf0GvwoOqGcGLCcUbLYdozRywe0jhKVJzIBcANQbKosmkza1bXbNd5SCSaY0AHQDWZcibHk
	/FBvgNepyvKrXpv3IWjbpNyGLwT418rakiA8dJ++yalw1bh9STQ8Q2yEmAP2nhvJOtzTmSh5ter6s
	cB1tUDxtoPTrKV1PE5ItAZ2hRsgBesrACW9aZf4mQUvAzWWoWob3ktZUIu/J5Or/AaTC+uARpBZ+r
	uqW0BvXQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGJ0J-0004oR-QI; Mon, 23 Mar 2020 09:04:15 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGJ02-0004e8-Ug
 for linux-amlogic@lists.infradead.org; Mon, 23 Mar 2020 09:04:01 +0000
Received: by mail-wm1-x341.google.com with SMTP id 6so13683501wmi.5
 for <linux-amlogic@lists.infradead.org>; Mon, 23 Mar 2020 02:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=lPutVzS3Ynb1eSmgIsa4JmohPw4ZclRrh1KFVq8nWQ0=;
 b=waSIN8+ApYqW/LXnPGRL/NvneWe4/UMrJ9lHgLm+ihlGugDYOwJ6NZkrFpWxvP6MC8
 GNsIhdx1sE0PQNevvLnFU8JLGhBZQCcM2iuXOWZHDd6af+85XDnWTjRVbwkVfZgA6PeF
 l0e1vdhqnc8FBwWg8vUGp27gtAkcfvVU/5tktj+zX+p8+lBs6MC90BoMyIOLPH2MhaTo
 45RTZrMkvxEjep4JO6e+BufQZJamczxfLM8nme9e6rCkqkb9C0FBnOjVf9PxprElx5Zj
 rmrlPd6yS7hTFWmy4oW4XCTX9u6yeSNaotUzdicCYqM0JaLIz/ug+LCBJ9x1OWwCwopN
 OKDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=lPutVzS3Ynb1eSmgIsa4JmohPw4ZclRrh1KFVq8nWQ0=;
 b=uoPIU8E7RtHv6FsSbWvXSijJ9B7FDi21vh73uMFwOixmPrat0zLKUAGOvliQZdJtuC
 S0R2Z42G8dWBMHBmrm0M289mBM7ESqPpg3Y8AsbzzlINBpNiAMUYmmgCNaYknnmx9PPF
 z7Za6CbolifhftOhmwVrkQ2lejG5k7KRQRxVdJxSnKHt0uCiNRZy/+PYFbhh+fZPVfnz
 IKgiMFpZGuQCC7RXoSviO3+Vdgujaaxq3wY2JXozHVsbZ8Pc+UImUljpIDje+RlIBJhn
 KydT/g7A7QIIwO01lTmNAYncwqakQA3kmNGbRKGmPdIB4ccn5XMpEtsbRAZZWen4h4Gt
 9d7g==
X-Gm-Message-State: ANhLgQ1FzQrHpBazFxyj+IcWDxu1gB3lmjjLT1gVfjFy/wEDlpkra4+1
 Hsw8MI5KNbJ0kPuVgB04a8Q4eQ==
X-Google-Smtp-Source: ADFU+vta0fIyRtESZphpxuC88pwvr1xjRflNRJ4U+UNesyEuY+m+xd0K3+8cVkrJCyM2KNvZ6DRGtA==
X-Received: by 2002:a1c:b144:: with SMTP id a65mr27313095wmf.54.1584954237568; 
 Mon, 23 Mar 2020 02:03:57 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id f15sm22881505wru.83.2020.03.23.02.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 02:03:56 -0700 (PDT)
References: <20200302125310.742-1-linux.amoon@gmail.com>
 <20200302125310.742-3-linux.amoon@gmail.com> <7hlfoir8rj.fsf@baylibre.com>
 <CAFBinCB2WXZNRg4wdFD0RJ5k4hHqcfAOCHemvHzZE42-Mo5vzA@mail.gmail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCHv2 2/2] clk: meson: g12a: set cpub_clk flags to
 CLK_IS_CRITICAL
In-reply-to: <CAFBinCB2WXZNRg4wdFD0RJ5k4hHqcfAOCHemvHzZE42-Mo5vzA@mail.gmail.com>
Date: Mon, 23 Mar 2020 10:03:55 +0100
Message-ID: <1jr1xjcuis.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_020359_057181_21D1F120 
X-CRM114-Status: GOOD (  18.13  )
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
 Neil Armstrong <narmstrong@baylibre.com>, Anand Moon <linux.amoon@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Fri 20 Mar 2020 at 00:39, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Hi Kevin,
>
> On Mon, Mar 2, 2020 at 6:01 PM Kevin Hilman <khilman@baylibre.com> wrote:
> [...]
>> > updating flags to CLK_IS_CRITICAL which help enable all the parent for
>> > cpub_clk.
>>
>> With current mainline, I've tested DVFS using CPUfreq on both clusters
>> on odroid-n2, and both clusters are booting, so I don't understand the
>> need for this patch.
> I *think* there is a race condition at kernel boot between cpufreq and
> disabling orphaned clocks
> I'm not sure I fully understand it though and I don't have any G12B
> board to verify it
>
> my understanding is that u-boot runs Linux off CPU0 which is clocked by cpub_clk
> this means we need to keep cpub_clk enabled as long as Linux wants the
> CPU0 processor to be enabled (on 32-bit ARM platforms that would be
> smp_operations.cpu_{kill,die})
> cpufreq does not call clk_prepare_enable on the CPU clocks so this
> means that the orphaned clock cleanup mechanism can disable it "at any
> time",

If nothing calls enable the cpu clock while it is managed by Linux
(cpufreq), there might something worth fixing. Adding CLK_IS_CRITICAL
will mask an issue that is still not explained.

"at any time": absolutely not.
Disabling unused clocks, is done only once, at during the late_init
stage.

If your clock gets disabled later on, it means it has been turned on and
off by another driver (possibly due to probe deferral)

> killing everything running on CPU0 and CPU1 (which are both
> clocked by cpub_clk)
>
> I have no explanation why this depends on booting from SD or eMMC.
>
> for the 32-bit SoCs we have CLK_IS_CRITICAL on the CPU clock as well
> since commit 0dad1ec65bc30a
> on G12A we have CLK_IS_CRITICAL on the sys_pll clocks, however my
> understanding is that cpub_clk could also be fed by one of the
> fixed_pll derived clocks (which have a gate as well, which may or may
> not be turned off by the orphaned clock cleanup - that is pure
> speculation from my side though).

Yes there are other critical clocks on Amlogic, mostly because the SCP Fw
driver does not claim the clocks it depends on. At least we know why
this flag is set and there should be a comment associated with it.

ATM, the issue reported by Anand (anyone else ?) is not explained. 

>
>
> Martin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
