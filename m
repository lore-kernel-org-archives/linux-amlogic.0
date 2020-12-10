Return-Path: <SRS0=VBOb=FO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB4EDC0018C
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Dec 2020 17:35:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9FEB23DE3
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Dec 2020 17:35:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9FEB23DE3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nblhHiCRFfCbJ3hxWsYSuHD6wZnmiy0XF9zmNudVR0Q=; b=HMp2HbHIhbo/j12kobvwEXHbH
	rMrpD2ECyIrBer0sAry/XaGsBOYXMf+UPsd7PZxUeX407mpCJtkWcl3n1v2aK5UvfsycDITBifvI6
	nOYy4yaF0BGENwk+GAPeaMPLfGa4rO/+WQ6ItsJZ572H2ihVJ+gALGyty/c0MTH1v9RtKzb3LB/J3
	KK5ZtuRH/RAFmhtoIrTMS62a0KiEX/PrzmGgc2mVkTs9PHuewF+lXzv63XF82tvMFSfJ9h55niz2c
	N391yzQ7DEFfyHEF33ZCVs7E59nHqIg1Mht1bPQDCYb4hC8nfVnOmNW670tS2otJDp6b0pvyiYQW9
	0x2KMIlAQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knPqi-0002KA-JE; Thu, 10 Dec 2020 17:35:28 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knPqe-0002Ig-KI
 for linux-amlogic@lists.infradead.org; Thu, 10 Dec 2020 17:35:26 +0000
Received: by mail-wm1-x342.google.com with SMTP id q75so6152225wme.2
 for <linux-amlogic@lists.infradead.org>; Thu, 10 Dec 2020 09:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=3OOtstF0oi5Pj3WzkLhAlF1kOotO4HUwZrv4mEkOcmo=;
 b=xXdMrXB67v5iPn3t4QpIjOgfd0dw29zJu80kxy5UApfv54VaGek06iQq6xi97NjVI6
 k0/UVkzqokkl27JFCGZ0n2FWPtOf+ZNuVm3iw/w+zsbxi4GaB6qQbF8O3i79Hb6a0bNC
 mlLDtf4o0iLI7B4FuyVmYKeu5WrQm3gNRF1a0IB8KkJts+MLZbi4PYzrliQYm3yBOeUS
 k1+9098CJumH6wwGAr49YhRKpEa04RyvH8xiKeZnwuo1P9Q82hZrF/0yqV/jvX0wOjSf
 Hj83mbr2ydtlTm4gXkHZmp7irrssK6GtcROU0JDvmEHvbPl97sx1RWhl65dReJkhOk2Y
 d/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=3OOtstF0oi5Pj3WzkLhAlF1kOotO4HUwZrv4mEkOcmo=;
 b=N7moUcKmcuk0xIqAtX0mnI5cJoM2ojJ7MysM+EKbM6MHf5hfHoGfRkq0m/K85LARNE
 gD9FprczFVZahYgUq6ocJ3yZYZyR+JzCQ44XN1bmDFDM6uFkQd5fBBcVV/xVIubxrivN
 qPJP1P4Tvjs3+kFnf7t2UHp5pAQ0S+dtB+1H53aV6V6MuBR6V1THa5lCqNaIcC+KknU+
 SCajlQw+5lb1cJwip+JpXSEmX7u/GrI6Y7JenCBzxXFzKr2lEGYfoAPZRk0CPVaML2Li
 00VOYLtklAnhcXVMAAAsPLS2xRlAqgG9a9GIsn8WKCjff/A7Yvw+KzAItaPeiWeaCx83
 GUcg==
X-Gm-Message-State: AOAM530Vz/U0GOZEJAqFJyts/sTmAEBvTvrGkeJQk9BTuyKA57zdqkLu
 QkHYaadtRgIhuwuzisXjs4Kv+A==
X-Google-Smtp-Source: ABdhPJxg2Z1jDKGv7Agg09j/xGG65aYo0VOQopc5QtI3X7SwMN+hdglx/8BTCGE8Sjgpz2I/OiqxFA==
X-Received: by 2002:a1c:a785:: with SMTP id q127mr5215807wme.25.1607621722139; 
 Thu, 10 Dec 2020 09:35:22 -0800 (PST)
Received: from ?IPv6:2001:861:3a84:7260:5514:1343:4704:99a?
 ([2001:861:3a84:7260:5514:1343:4704:99a])
 by smtp.gmail.com with ESMTPSA id o83sm10647057wme.21.2020.12.10.09.35.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Dec 2020 09:35:21 -0800 (PST)
Subject: Re: [PATCH v2 2/3] usb: dwc3: meson-g12a: fix shared reset control use
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20201201190100.17831-1-aouledameur@baylibre.com>
 <20201201190100.17831-3-aouledameur@baylibre.com>
 <CAFBinCCovB9e1_AwXv0Jcn3p69LN5KAdzttfZcY+=_TEZTCn6Q@mail.gmail.com>
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Message-ID: <d4a6d417-1cc2-e1eb-e7b5-6707f8602db3@baylibre.com>
Date: Thu, 10 Dec 2020 18:35:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCCovB9e1_AwXv0Jcn3p69LN5KAdzttfZcY+=_TEZTCn6Q@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_123524_796135_53FBA6D0 
X-CRM114-Status: GOOD (  18.79  )
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
Cc: Felipe Balbi <balbi@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Martin


On 05/12/2020 22:42, Martin Blumenstingl wrote:

>    
> Hello Amjad,
>
> On Tue, Dec 1, 2020 at 8:01 PM Amjad Ouled-Ameur
> <aouledameur@baylibre.com> wrote:
>    
>> reset_control_(de)assert() calls are called on a shared reset line when
>> reset_control_reset has been used. This is not allowed by the reset
>> framework.
>>
>> Use reset_control_rearm() call in suspend() and remove() as a way to state
>> that the resource is no longer used, hence the shared reset line
>> may be triggered again by other devices. Use reset_control_rearm() also in
>> case probe fails after reset() has been called.
>>
>> reset_control_rearm() keeps use of triggered_count sane in the reset
>> framework, use of reset_control_reset() on shared reset line should be
>> balanced with reset_control_rearm().
>    
> I think this should be updated after [0] is applied
> The goto from that patch needs to use err_rearm from this patch.
>
>
> Best regards,
> Martin
>
>
> [0] https://patchwork.kernel.org/project/linux-usb/patch/20201111095256.10477-1-zhengzengkai@huawei.com/

Thank you Martin for reviewing this patchset.

I have reviewed the patch you mentioned, and I think as well that
we should use 'err_rearm' instead of 'err_disable_clks' to
cleanup things properly in case setup_regmaps fails.


Best,

Amjad


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
