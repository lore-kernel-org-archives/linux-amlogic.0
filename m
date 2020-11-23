Return-Path: <SRS0=nSpp=E5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B39BC2D0E4
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Nov 2020 08:39:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 080C420729
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Nov 2020 08:39:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SKpIAVPf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="2DbOn2nB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 080C420729
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=g7pScE1/NgBX8minyNzqArXhTH7moBNVILDC0xj9dnU=; b=SKpIAVPfLdpaEqrYsUdfjZRko
	z2/w01NrIyw7QffVHXFt6d0LcdL4hgL0exCaBQlxm60WoyK1m4eN3B5rk+QkbNmRNxJInh2Ff6obJ
	v7iEIGuEveSJCkZ3cHVEyWef6GdQq8oL63t2H3490qOtmQEIoCQ6deHskHu+lG0ICW16jG+TXMNIv
	brEWDu38/xo/XAyMx0GeNqs6TYa2GyPYq+XV6ZDQLiyXzZYYz7UIZXkoAu/arHUtk7spTyNmx4wJf
	HD7H2Ww+NDqDYwO5kyiuIPyQGgzZ2roJnjgdABd1mHWZFvfGSf+Gwdq/ns4Kn5B1Ad8nhJ35i4y81
	/r+876aIw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kh7NL-00008o-Ky; Mon, 23 Nov 2020 08:39:07 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kh7NH-00007d-Rt
 for linux-amlogic@lists.infradead.org; Mon, 23 Nov 2020 08:39:05 +0000
Received: by mail-wr1-x444.google.com with SMTP id g14so2516697wrm.13
 for <linux-amlogic@lists.infradead.org>; Mon, 23 Nov 2020 00:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/54P3IVxiLchyIcFPJPaYb6mXbc9y5ouF75KC2QKsAw=;
 b=2DbOn2nBEXvdAsZRLh8pRVLmDmBPSMFcefhCFRpkh8GWFP2R0nU0+229Gc31IxYtNF
 YoyNexmf4shNm5BlTJMopS0CmIxP04JgZhYAKghcXquCYUOZmYhtlMQDmlsQd3fv0d5t
 FTfcfQr0DY20HahHP7Y1BMkhtxg6WKfXB29svqhomqU00uhPyaAbqNwF4T2t3Np9zQ7K
 jgB7tUr8FdXUga8u/yC8Scy9t7JHRZG6JXLr3zO6YuyfYox2r4QjDAAfOSSzjAVj+RSk
 1XS0DY7ryh/WKNh8LxBjFsr9u115coouTG2j9dIIs83sX4bp9JcfoGw7lZ8SURbMpOMe
 CeNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=/54P3IVxiLchyIcFPJPaYb6mXbc9y5ouF75KC2QKsAw=;
 b=op2C3LVcgHK8R3ZEV7/pTiqtOHTxa2uwBkDa3iX4jpPGM5t0/h5C9HnoIoUxkXBthi
 3eLm9QJby6WxVq/Yh5JU0ZFya8lwoUwssZng1zFdhvVOzhYZzeN588ZlfkUcdi0uP76W
 heKKcBrA7rYYVNdc28LsEipqfGfV7/HjTXRr9HyvAH/av5Z/mfz7H9Ypu3ryrBExZTN9
 rGEgHeVZ06wM+ysi7kHe011Ycxsz4QI1NJpEOJZwScYzZS2g+9j6UO6ss4dUQFlF0klU
 auw6rMYYntVCRkRj1eDHbu0EjVpkZHH67ftgebyIoxXpU2z+ZQ4Oj5LZiDey9TcL4q5C
 uUHg==
X-Gm-Message-State: AOAM531tumiIXO3J2fzzLRZno8AMig1qQwbmNZ+6Of6dYHxLAiCQhRd2
 mhmtkFC0XOi/qOkkQKH3m0+EqQ==
X-Google-Smtp-Source: ABdhPJyY5e2ZnZtPB05IfBg9qEIwFKgWZutXPn8wM1Ywo1gZesLhjNa7hCzc6AnvinhfWjPhDGQR8w==
X-Received: by 2002:a5d:40cd:: with SMTP id b13mr29477138wrq.52.1606120742305; 
 Mon, 23 Nov 2020 00:39:02 -0800 (PST)
Received: from ?IPv6:2a01:e35:2ec0:82b0:9541:d2fd:3a68:67ae?
 ([2a01:e35:2ec0:82b0:9541:d2fd:3a68:67ae])
 by smtp.gmail.com with ESMTPSA id o197sm15608161wme.17.2020.11.23.00.39.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2020 00:39:01 -0800 (PST)
Subject: Re: [PATCH 0/2] arm64: dts: meson-axg-s400: add support for Power
 Controller & MIPI-DSI PHY
To: Kevin Hilman <khilman@baylibre.com>
References: <20201120152131.3918814-1-narmstrong@baylibre.com>
 <7hzh3bsvjc.fsf@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <f8b1dd90-1ea2-ff6d-32df-589ac8637af9@baylibre.com>
Date: Mon, 23 Nov 2020 09:39:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7hzh3bsvjc.fsf@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_033903_967003_53AB33B2 
X-CRM114-Status: GOOD (  18.57  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On 20/11/2020 20:00, Kevin Hilman wrote:
> Neil Armstrong <narmstrong@baylibre.com> writes:
> 
>> This adds the Power Controller and MIPI DSI PHY nodes to AXG, since the corresponding
>> driver and dt-bindings had been applied for next release.
>>
>> Dependencies:
>> - Patch 1: [1] applied for 5.11 in meson-clk tree & [2] merged for 5.10
>> - Patch 2: [3] & [4] both applied for 5.11 in phy tree
> 
> Thanks for describing the dependencies in detail.
> 
> Looks like only [1] is needed a build time.  Could you give me a
> immutable tag from the clk tree (or clk-meson) I could use in my dt64
> branch to ensure my dt64 branch is buildable.

Here you go:

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.11-headers-1

for you to fetch changes up to cd3caa573ebd1f32727962cf7dead43f5144d080:

  dt-bindings: clk: axg-clkc: add MIPI DSI Host clock binding (2020-11-23 09:06:34 +0100)

----------------------------------------------------------------
Amlogic clock headers updates for v5.11

* Add axg's video clocks

----------------------------------------------------------------
Neil Armstrong (2):
      dt-bindings: clk: axg-clkc: add Video Clocks
      dt-bindings: clk: axg-clkc: add MIPI DSI Host clock binding

 include/dt-bindings/clock/axg-clkc.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

Thanks,
Neil

> 
> Thanks,
> 
> Kevin
> 
> 
>> [1] https://lore.kernel.org/r/20200915124553.8056-1-narmstrong@baylibre.com
>> [2] https://lore.kernel.org/r/20200917064702.1459-1-narmstrong@baylibre.com
>> [3] https://lore.kernel.org/r/20201116101315.71720-1-narmstrong@baylibre.com
>> [4] https://lore.kernel.org/r/20201116101647.73448-1-narmstrong@baylibre.com
>>
>> Neil Armstrong (2):
>>   arm64: dts: meson-axg: add PWRC node
>>   arm64: dts: meson-axg: add MIPI DSI PHY nodes
>>
>>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 61 ++++++++++++++++++++++
>>  1 file changed, 61 insertions(+)
>>
>> -- 
>> 2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
