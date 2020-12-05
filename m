Return-Path: <SRS0=t4U2=FJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9BACC433FE
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Dec 2020 17:56:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA8A922D72
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Dec 2020 17:56:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA8A922D72
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=88ckpczyIM7ujvTGgwvqCphF8ynr62yvLSV7kOfeUAs=; b=vHrcJvH6CPzsyY+wAJ2eDN+W2
	MQ5vGQmHr9WN+FteJGzxkAtZ3K6XoutrZHEkseFYTzGGK+XQJ0R9ANFmqgisOXcbrR3Vw19njsbyA
	QXiBdr1dqdDdQVPHZbGLEwNo1bbdxHkN4fjbnM1FWO+hFjNYjFPDtJzkv5WXWfxpjSSpukk2G6Um+
	Ip5GgHFSnv6GAVvdIGYvonqc9oDaVXUoCCOj70bOW7JPVEbvgxGpqMOpzYQ7iSgbdt8U/cOYcgP+W
	4d1V1slm7L1L2itF/LNNTwdr7z9xe9f/+MEXLlNc1l2lVnqxSxgQa2N46hD/LgKfj9URh6KuYmVJD
	Vi8lRQVTg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klbml-0007TN-8l; Sat, 05 Dec 2020 17:55:55 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klbmh-0007Sx-Ac
 for linux-amlogic@lists.infradead.org; Sat, 05 Dec 2020 17:55:54 +0000
Received: by mail-wm1-x333.google.com with SMTP id x22so8001565wmc.5
 for <linux-amlogic@lists.infradead.org>; Sat, 05 Dec 2020 09:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=ShrpRxCRDSFuegFEC+mO5LWHn840hNK9yWMo6lf5Wpo=;
 b=Yx+4BuKtf1C0Q7cWF7vF3DCElOWRkkl0ag14GQcBquVXOrNCUn6/n4DqkPD5t7+fQT
 FU646OONhZrjbO3zHdCNsIHrRVul8i0RcL02Mx0b0yX2ST4tmylK86M4aMZ7yTlPKq/7
 1D0fgf8KIju3Y0G7VLDEr6+v+0tj+nGtrmaRhaSaVGLu9CJzrAQFQCtlczbiJ1W+jFf5
 aozTWwpQDxEh2anOkq2GU9cvBUnTJrYGilRztN9yF8YkQhRV7xjxdME4/Uy8EKLkSpVg
 Hc2ca43KCWGV/TfLr7ZdPxo/JQFl7xGqkmaOrBjGNYKp1OYWXA4ed9UrlHUtj2ZEOVU9
 sp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=ShrpRxCRDSFuegFEC+mO5LWHn840hNK9yWMo6lf5Wpo=;
 b=tWYGdsxdgcjFvqJK6Cafvs+oHL0SGJPFpZgIUQBrN0vaxlQVI76V1skYpRPoikt6vI
 VDIPh2BjaipIz5ZpFsfUSVT+U+U2gzUZSsbACV0H0InsosjvpL5/qz4115jPWHHAgdb+
 XnI8Ogp+fN+KyKyCuC84jU5dRZOqIq6BHg2+32KZWa4Igcp7+DetI6lJvurOLVuAhDXB
 uYUsrI7Chrh8L0AgYTtJDc3SBHmeJ8lMphh82GYOsxmt814wk+HCJcXxw0TI/ChsgQht
 VWHYzDxu76+ue8bKfUUTs9SKK4ceR1RjXfWvYUdLXBo32PPsAM4Rx8lIJPSLCevDBKPd
 5EuA==
X-Gm-Message-State: AOAM5311rmpkVIdR8iRLSkmWVBYQofCP9XRjFJQ+a2R7kg/cgiNyW+Z0
 OeO28cspV1IOC/gS1rrFV9iXyw==
X-Google-Smtp-Source: ABdhPJyqYfb/4J8xZBewMqf1WV9fEhMTai0WBw0KHvmhiRiCkRsRxDj2kn0GzmWxjy6uNo19tm8aIQ==
X-Received: by 2002:a1c:4843:: with SMTP id v64mr10375605wma.186.1607190948174; 
 Sat, 05 Dec 2020 09:55:48 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id b12sm7619307wmj.2.2020.12.05.09.55.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Dec 2020 09:55:47 -0800 (PST)
References: <1jtut7yjj3.fsf@starbuckisacylon.baylibre.com>
 <160714961471.1580929.6506196779990620974@swboyd.mtv.corp.google.com>
User-agent: mu4e 1.4.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [GIT PULL]: clk: meson: amlogic updates for v5.11
In-reply-to: <160714961471.1580929.6506196779990620974@swboyd.mtv.corp.google.com>
Message-ID: <1j5z5gp271.fsf@starbuckisacylon.baylibre.com>
Date: Sat, 05 Dec 2020 18:55:46 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201205_125551_501229_1B837042 
X-CRM114-Status: GOOD (  11.17  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Sat 05 Dec 2020 at 07:26, Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Jerome Brunet (2020-11-29 12:50:40)
>> 
>> Hi Stephen,
>> 
>> Here are the updates for amlogic clocks for v5.11. This is based on your
>> clk-hw branch, instead of the usual rc1, since it depends on clk_hw
>> stuff you've already applied.
>> 
>> Please Pull.
>> Thx.
>
> Ok. Where do I pull from!?
>
> :)
>

:) seems I forgot a tiny detail ... sorry about that, resending

>> 
>> Cheers
>> Jerome
>> 
>> ----------------------------------------------------------------
>> Amlogic clock changes for v5.11
>> 
>> * Add MIPI DSI clocks for axg and g12
>> * Make it possible to build controllers as modules
>> * Fix Video PLL clock dependency
>> 
>> ----------------------------------------------------------------
>> Jerome Brunet (2):
>>       Merge branch 'v5.11/headers' into integ
>>       Merge branch 'v5.11/headers' into v5.11/drivers
>> 
>> Kevin Hilman (2):
>>       clk: meson: Kconfig: fix dependency for G12A
>>       clk: meson: enable building as modules
>> 
>> Neil Armstrong (6):
>>       dt-bindings: clk: axg-clkc: add Video Clocks
>>       dt-bindings: clk: axg-clkc: add MIPI DSI Host clock binding
>>       clk: meson: axg: add Video Clocks
>>       clk: meson: axg: add MIPI DSI Host clock
>>       dt-bindings: clk: g12a-clkc: add DSI Pixel clock bindings
>>       clk: meson: g12a: add MIPI DSI Host Pixel Clock
>> 
>>  drivers/clk/meson/Kconfig             |   7 +-
>>  drivers/clk/meson/axg-aoclk.c         |   5 +-
>>  drivers/clk/meson/axg.c               | 824 +++++++++++++++++++++++++++++++++-
>>  drivers/clk/meson/axg.h               |  23 +-
>>  drivers/clk/meson/g12a-aoclk.c        |   5 +-
>>  drivers/clk/meson/g12a.c              |  79 +++-
>>  drivers/clk/meson/g12a.h              |   3 +-
>>  drivers/clk/meson/gxbb-aoclk.c        |   5 +-
>>  drivers/clk/meson/gxbb.c              |   5 +-
>>  drivers/clk/meson/meson-aoclk.c       |   4 +
>>  drivers/clk/meson/meson-eeclk.c       |   3 +
>>  include/dt-bindings/clock/axg-clkc.h  |  25 ++
>>  include/dt-bindings/clock/g12a-clkc.h |   2 +
>>  13 files changed, 979 insertions(+), 11 deletions(-)


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
