Return-Path: <SRS0=+WvW=DG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98C8CC4727C
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 13:43:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17BB4208FE
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 13:43:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lCr2+Qh9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Z34rZ/ds"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17BB4208FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=s6PezkrHZZ33FmqSOk4liw5hU0EZPaAnzMm43TO52Qs=; b=lCr2+Qh9mee5fFiQnJhle2a3i
	+O1CJcZraN8CSlqk/eooAOxl98wZ+jpm+e6v1vW+vNn+vS+CTVaXj4A2WFc+YsXwvevDDxTYdMaIU
	Wp7ZFdZXOk9U/Qz4y5kQCFkwfSaRKEqsKrr/ttWKip1CQmiwbezAeaXYl5S2sX3gUmleY71ycpG47
	E9cI/ZcJezligvXbGIaf5WFAM2pkDaQ5hNC9KKIMfvkvAPia/7Miz1QHZFInjtbM151Ebb7Gf8bn+
	Vkz96wxdXJfXi44n25L+RkMVC2GCndqQmKun3bMNZ0PTMlrBllvkJNedM3oux089CWLdUpByZUNHv
	qGtgBKvPA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNFuL-0004XA-OX; Tue, 29 Sep 2020 13:43:05 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNFu9-0004Rr-JO
 for linux-amlogic@lists.infradead.org; Tue, 29 Sep 2020 13:42:54 +0000
Received: by mail-ot1-x341.google.com with SMTP id m12so4483493otr.0
 for <linux-amlogic@lists.infradead.org>; Tue, 29 Sep 2020 06:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7Re7sYUHoP/OO8RJy6m0dCE8FjQyDvN9idLxneZjSGs=;
 b=Z34rZ/ds72mfUVTwVAO13Bpz4khcxmzLmZRTJ6BeCzZVGwvFQBFtfTqV+Mw0LWRYNM
 uCrAI5JhrSTo6VZxNGORq4+uDlbuWvNn0BzZwcj+1vO5F++bvuicz0Q+A30JgXV/f7rA
 Rk9jpCrpw+utP3CvREty99qb9cv8smpJnWoLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7Re7sYUHoP/OO8RJy6m0dCE8FjQyDvN9idLxneZjSGs=;
 b=mPuP3BbkS2qNfKdSklLefFWsXjAHDBU3hMCn8SEi5XIlP+TAp87aDUYuXhqyiH7owR
 BhUqgT0yt3xlajdtnuVElHB7crrC7OX7jh+vU1XMJGK+WZChVa4EAwaHEWQiayGvgUEg
 Ob+OYc2DRi8GWJFiUWJwujWqceFLvriS9ducb7RDci5AjWCfp66KNWg+HTIMGHRw5uNs
 ickRn5I3fQTpqePcosf2TFmao+1Qz8dTt9eNvIo7cVrzaNRWh1Z76mCo8hqfsCGBfrXv
 6wqhCcCRj3GobQojs7OOs8UbE+5pHfHDWOGB4wehKLIduKUhjBkPthaDuf6uIv3TcqrX
 i1eQ==
X-Gm-Message-State: AOAM532lV/jPG7HW3V83Qo4vIz1fan1DDqfBzSj2HB4ywsozfJshG7oi
 5PwFAIkbPTfXOsoDtEGVy150HA==
X-Google-Smtp-Source: ABdhPJxomgEcCkXHcyd2u2LBzXalo3/5KY6BNqNVB1FRlJIPPq8bhwRXFJ9dfNYvva75m6zRbuIoZQ==
X-Received: by 2002:a05:6830:196:: with SMTP id
 q22mr2688536ota.221.1601386971432; 
 Tue, 29 Sep 2020 06:42:51 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id l4sm993642oie.25.2020.09.29.06.42.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2020 06:42:50 -0700 (PDT)
Subject: Re: [PATCH 00/18] use semicolons rather than commas to separate
 statements
To: Joe Perches <joe@perches.com>, Julia Lawall <julia.lawall@inria.fr>,
 Dan Carpenter <dan.carpenter@oracle.com>, Shuah Khan <shuah@kernel.org>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
 <CAMj1kXGh+CzuXkAnqsoMO2A3T1p=D6uFOV347Ym5+VFn5U1gWg@mail.gmail.com>
 <20200929124108.GY4282@kadam>
 <alpine.DEB.2.22.394.2009291445050.2808@hadrien>
 <5f0d2b20f5088281363bb4a35c5652a2c087f159.camel@perches.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <cd75e2d1-9923-b725-78cd-fd5611431584@linuxfoundation.org>
Date: Tue, 29 Sep 2020 07:42:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5f0d2b20f5088281363bb4a35c5652a2c087f159.camel@perches.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_094253_817957_479768AF 
X-CRM114-Status: GOOD (  17.43  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-iio@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-clk@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, David Lechner <david@lechnology.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-block@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
 drbd-dev@tron.linbit.com, linux-amlogic@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?Q?Valdis_Kl=c4=93tnieks?= <valdis.kletnieks@vt.edu>,
 linux-wireless@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 openipmi-developer@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 9/29/20 7:34 AM, Joe Perches wrote:
> On Tue, 2020-09-29 at 14:47 +0200, Julia Lawall wrote:
>> On Tue, 29 Sep 2020, Dan Carpenter wrote:
>>> The times where commas are used deliberately to replace curly braces are
>>> just evil.  Either way the code is cleaner with semi-colons.
>>
>> I also found exaamples like the following to be particularly unforunate:
>>
>>                                  fprintf(stderr,
>>                                          "page_nr %lu wrong count %Lu %Lu\n",
>>                                         page_nr, count,
>>                                         count_verify[page_nr]), exit(1);
>>
>> The exit is very hard to see, unless you know to look for it.
> 
> I sent that patch last month.
> https://patchwork.kernel.org/patch/11734877/
> 

I see what happened. This patch touches lib, cpupower, and selftests.
Guess lost in the limbo of who takes it.

  tools/lib/subcmd/help.c                    |  10 +-
  tools/power/cpupower/utils/cpufreq-set.c   |  14 +-
  tools/testing/selftests/vm/gup_benchmark.c |  18 +-
  tools/testing/selftests/vm/userfaultfd.c   | 296 +++++++++++++--------
  4 files changed, 210 insertions(+), 128 deletions(-)

I can take it through one of my trees.

thanks,
-- Shuah

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
