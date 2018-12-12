Return-Path: <SRS0=dvnd=OV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 970D0C04EB8
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Dec 2018 10:26:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DA7B2084E
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Dec 2018 10:26:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MAiOTZmR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="IO4Qo34v";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="hn6s3Fs/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DA7B2084E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=78k7v/f++iWUPBmdiPhJHUbD/1ft2b2+hmMW/5Bm5G4=; b=MAiOTZmR6iUOTC
	RHtS9A5B64LwyUBUm7tg783wReaDOh1Tu6csYFLnTl1ddHbOb3H9IHBadFIqNZPmvjaYsa8S0Zd6i
	tsXhGdojILnuI9uwFfXx6v85B8j5zu9T5Betak/kmOOdU7iL/WKnmT7asB1D8AixIASntadBfHH9P
	IBgnLGfJEIzpUd/B7zKzsPbtTRyHG565gY7rmeGiuFc2csEhcGv6woJcclrMp1mEznQlnvF1o50lI
	rSyOEUw/z7HrDvSb0Gv9PankWO3vz75UK47KJV0SE051m82XcVtsf0R/mSYJNidRcsPiyGjRvmnbk
	9zxbigFspBy2HRc1tnAQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gX1if-0004lE-RI; Wed, 12 Dec 2018 10:26:21 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gX1i6-0004IY-QD
 for linux-amlogic@bombadil.infradead.org; Wed, 12 Dec 2018 10:25:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nv8bbRUzaZfQDsS8yEcIj3gOlk8xcibqLVUbMTOOInI=; b=IO4Qo34vHF6vKtd9jf0HS8UmTZ
 jsZ5797cdTMW/s57ASfSwQ9eBcgkMkv3hYl2pp7WlEsKQwe4yZLyruOEtmnpH5f225fBRfbTluUYv
 c+4ikhaS9eN/nasLSxU18Udvs28MU0zHM2Z+oyfVzTMhIKyrtgLwLQ7UJ8xjLRAGlYxchQJOt0IJE
 e1qG4fm4/9g2nkOgwTL58rct4GreLylrk3rC/tWhuGrYW7THcmK2y+e7xS86lfTTSK9fCn2dm6IE8
 DD9V51CwuCk19jzDjel4Fg70JwbchAsUBCDOmiDRDANmkvDJiOCS7zrZzvMDKD6nBoUmU394cZ9hH
 XI/7mFcA==;
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gX1CB-0006pc-G5
 for linux-amlogic@lists.infradead.org; Wed, 12 Dec 2018 09:52:51 +0000
Received: by mail-wr1-x441.google.com with SMTP id p4so16984270wrt.7
 for <linux-amlogic@lists.infradead.org>; Wed, 12 Dec 2018 01:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=nv8bbRUzaZfQDsS8yEcIj3gOlk8xcibqLVUbMTOOInI=;
 b=hn6s3Fs/vTQPdf24mHkDcXC2Hbj1+0alDqmBCHE1+3f3rwYM+PbHVWpykJSlF9/SNY
 gRGKmmafyODbDSwgXUh19ioM3fuC/8ypjRe4wao2ubIcTI9rmNkUa5uKqUMW+WFqvcxm
 A2nyY7ed0QHqQojroBRQ6Px0WwkA6g4drb925NFSYZQ+8elIenH4O4XHDKGIwolnJhiU
 ABnhQEf5Zp+10qWKJ5/PqSlJu2Y62A/czQAYQqwe88vFwI3S1hGCBz+gM3HVBGjNTFdg
 SOnd1sjVKW6ttvblIi+GScP6eYSHZECmc6B8REPqaaNPsq4FutqeHGMVB2AUl6UVK5o8
 v+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=nv8bbRUzaZfQDsS8yEcIj3gOlk8xcibqLVUbMTOOInI=;
 b=g1dt7vkjHj7oQNDPS7B3o5cVfhSvcQcBKw1SiUWtRawMYJUWmogw7MGUIeJWXHC/Kk
 rvdbi/8Ls9tN+GJfYSHS8D10eHLYoUg7yhbEqOtAhFM/sm9bvuGMejvWS+tpJVlpENvk
 15ys+6bzrul0HiSIm2hCThcUgzfu9HicSpfwiPGMtRzZ710Qzn+MEskzAjsVutT/yBxP
 wCFJX0WU7/Zq0OdXWY53gQqI1vMdeab1DYt1RhbIqFzR8dm3Fff9x64rgkkIQBzMgpuI
 QaOsx1TTzgnCIbtx9CRDspFnKe0TcHFQygDzudEi9fJR4eOse4W6V84LMX0Y7lx1GITF
 MW4A==
X-Gm-Message-State: AA+aEWYqoIuKlMjS6FwuCj4Oo7UEcg6sqC6g/Kn4PZkOXll08P/4FZBK
 YuKlvFyr+RccHJhV3TvQjLZ6iQ==
X-Google-Smtp-Source: AFSGD/VHzTlTXbjrVTR5xJoi4oFPqYWwRPJmN0zGrViJZFr3TL31IG7c7Yri1KPawuhFEVGTz4N4nw==
X-Received: by 2002:a5d:65ce:: with SMTP id e14mr16110339wrw.150.1544608354032; 
 Wed, 12 Dec 2018 01:52:34 -0800 (PST)
Received: from [10.1.3.173] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id i192sm2420979wmg.7.2018.12.12.01.52.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Dec 2018 01:52:33 -0800 (PST)
Subject: Re: [PATCH v2 0/3] ARM: dts: meson: add the APB/APB2 busses
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20181208165025.27689-1-martin.blumenstingl@googlemail.com>
 <ba3e4fef-7a18-8c7d-e0ea-05c541b29913@baylibre.com>
 <CAFBinCBYBAqtKp_edgs6b44MpOhc-iN_FwR425bkU4xirGQKvA@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT7CwHsEEwEKACUC
 GyMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheABQJXDO2CAhkBAAoJEBaat7Gkz/iubGIH/iyk
 RqvgB62oKOFlgOTYCMkYpm2aAOZZLf6VKHKc7DoVwuUkjHfIRXdslbrxi4pk5VKU6ZP9AKsN
 NtMZntB8WrBTtkAZfZbTF7850uwd3eU5cN/7N1Q6g0JQihE7w4GlIkEpQ8vwSg5W7hkx3yQ6
 2YzrUZh/b7QThXbNZ7xOeSEms014QXazx8+txR7jrGF3dYxBsCkotO/8DNtZ1R+aUvRfpKg5
 ZgABTC0LmAQnuUUf2PHcKFAHZo5KrdO+tyfL+LgTUXIXkK+tenkLsAJ0cagz1EZ5gntuheLD
 YJuzS4zN+1Asmb9kVKxhjSQOcIh6g2tw7vaYJgL/OzJtZi6JlIXOwE0ETVkGzwEIALyKDN/O
 GURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYpQTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXM
 coJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hi
 SvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY4yG6xI99NIPEVE9lNBXBKIlewIyVlkOa
 YvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoMMtsyw18YoX9BqMFInxqYQQ3j/HpVgTSv
 mo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUXoUk33HEAEQEAAcLAXwQYAQIACQUCTVkG
 zwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfnM7IbRuiSZS1unlySUVYu3SD6YBYnNi3G
 5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa33eDIHu/zr1HMKErm+2SD6PO9umRef8V8
 2o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCSKmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+
 RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJ
 C3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTTQbM0WUIBIcGmq38+OgUsMYu4NzLu7uZF
 Acmp6h8g
Organization: Baylibre
Message-ID: <3aad3554-9320-e356-c78d-5dec0cccb380@baylibre.com>
Date: Wed, 12 Dec 2018 10:52:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAFBinCBYBAqtKp_edgs6b44MpOhc-iN_FwR425bkU4xirGQKvA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181212_045247_609437_9C501735 
X-CRM114-Status: GOOD (  21.62  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 khilman@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 11/12/2018 23:09, Martin Blumenstingl wrote:
> Hi Neil,
> 
> On Tue, Dec 11, 2018 at 10:16 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> On 08/12/2018 17:50, Martin Blumenstingl wrote:
>>> This adds the APB bus on Meson8 and Meson8b as well as the APB2 bus on
>>> Meson6. This is preparation work for adding the Mali GPU which is
>>> located on theses busses.
>>>
>>> Meson6 seems to have it's APB at 0xc8000000 instead of 0xd0000000. The
>>> region at 0xd0000000 is called APB2 or A9_APB and it has a different
>>> size (256k) compared to Meson8 and Meson8b (2M).
>>>
>>> Addresses and sizes are taken from the Amlogic 3.10 kernel sources:
>>> - Meson6: [0]
>>> - Meson8: [1]
>>> - Meson8b: [2]
>>>
>>>
>>> Changes since v1 at [3]:
>>> - re-send the patches but this time don't include the old patches
>>>   which still had a typo in the patch description (ABP vs APB)
>>>
>>>
>>> [0] https://github.com/endlessm/linux-meson/blob/cd4096c3ff4eb5b8a8a5581bb46508601c5470dc/arch/arm/mach-meson6/include/mach/io.h#L61
>>> [1] https://github.com/endlessm/linux-meson/blob/cd4096c3ff4eb5b8a8a5581bb46508601c5470dc/arch/arm/mach-meson8/include/mach/io.h#L53
>>> [2] https://github.com/endlessm/linux-meson/blob/cd4096c3ff4eb5b8a8a5581bb46508601c5470dc/arch/arm/mach-meson8b/include/mach/io.h#L53
>>> [3] http://lists.infradead.org/pipermail/linux-amlogic/2018-December/009424.html
>>>
>>>
>>> Martin Blumenstingl (3):
>>>   ARM: dts: meson6: add the APB2 bus
>>>   ARM: dts: meson8: add the APB bus
>>>   ARM: dts: meson8b: add the APB bus
>>>
>>>  arch/arm/boot/dts/meson6.dtsi  | 8 ++++++++
>>>  arch/arm/boot/dts/meson8.dtsi  | 8 ++++++++
>>>  arch/arm/boot/dts/meson8b.dtsi | 8 ++++++++
>>>  3 files changed, 24 insertions(+)
>>>
>>
>> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> thank you for taking the time to review this!
> 
>> But frankly I'll squash the meson8/meson8b patches with the mali node patches !
> I didn't do this because I realized that there are different busses
> between Meson6 and Meson8/Meson8b. so I wanted to have a commit
> message which describes this.
> if you prefer I can still squash the Meson8 and Meson8b patches into
> their corresponding GPU .dts patch but I would like to keep the Meson6
> patch (as I'm not planning to add the Mali GPU until someone can
> actually test it on that SoC)

Yes this is what I was thinking actually !

Neil

> 
> 
> Regards
> Martin
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
