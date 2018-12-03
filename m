Return-Path: <SRS0=94bh=OM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF347C04EBF
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 10:51:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A85DA20848
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 10:51:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TUL8PkjS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="IrTMr2qz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A85DA20848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n9LIkOq0eb/vVrC/gSOM6XrFdNF8jfiHExocfTnCwMs=; b=TUL8PkjSoX0bC/
	N8+00rHMC2/KJjELCeWgVtx9633KI6PL9M7EfV/qxUAmFgjrekRlEgMjTBR33s8+QzaOvkqkmx86r
	ugyDsF/z1YXZEYlY/abopOaeGk0/wWiHmMps0vZJf6/e1eOa0uESWQlVMU5tOnQVFp2Eh+KTsZT+O
	XXryEqeNwdlb0Oamr0JvDddqlih9HzNdQbuHirA/5G4Bd9qejXPlvfqr1hG/w43HsxZLIqMPpyCuT
	eS5z17NI8NaDo33VYz0/bv9E+LFyqVeqrTUucm493KNSMZzX9P2pq3WsZB1q+U4pSv57hXi/f67RE
	TCY1CAZU6XfyiBpXh6Lw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gTlpF-0001fV-Fd; Mon, 03 Dec 2018 10:51:41 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTlp5-0001XZ-I6
 for linux-amlogic@lists.infradead.org; Mon, 03 Dec 2018 10:51:33 +0000
Received: by mail-wr1-x442.google.com with SMTP id q18so11606839wrx.9
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Dec 2018 02:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=PpJXPEBKm0YV7zWjZGCDQm3zabwlJCEUsGi4KlSMAkQ=;
 b=IrTMr2qzzQyg5LuhiaNjRlSxCD5NtLTVO3Pt6CVMk1Joz9tVX6FDFsiQX5mtB8EvtI
 txS8CiiI5386/lBFzk03TNfnizkvn80m4fPgn+NqdbpvEAYLiuCZn+arFQgwe74PLtji
 e12gK8csMJn3yk6J2K9JETgQXAFoPq4q3SCtkNZ93c9OP0KjCdiJtvu8kldsj4rGnekf
 UtcXHm1cxQ+nNcvf/47ckLVy/iCBO6v9CazU9nhahcgj3heYXQoIxMpvSp4ee9Mb+NFp
 Yu69jczTckD82ZROLyOvGqvy3eyGHhydycCYnhN1St0ed+m78vGJ1pnmzfGbZmNgziOm
 6kKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=PpJXPEBKm0YV7zWjZGCDQm3zabwlJCEUsGi4KlSMAkQ=;
 b=hCYEie/p4OZoDV8Wx1fKnOmNxlFaHFjOluVteiCUJVSsPCsH9uSV+iZOGXM1uGg3Vz
 HaalOJxVmsZSIM41v/L9Wbe3P2TZdE32CCzNfAjR+pbPeARaqlT5QAL62gpidRgImUAO
 ZgTrSm6+KooDjUnnMAPtqrBV6N2+Rqg7hCFk3e4JUw48/xBsG03q42AKaX0mZ0M05ts8
 UCIrrSirZKmgM3XFjv8UFFhh0lLqiYnixXgUrzfdlSEaQCfKYx51rsnAUoYCO8VhUODQ
 WbPaGD9AUKsTwX6p4Ub1Byvxngu1jXw9hGdHoRznQXXG+aI6dgoQB3mofLYezYxRGVcn
 XtPg==
X-Gm-Message-State: AA+aEWZPRfqvvb55M3HTCPpsgWEPZCibxrOZhGUI5+bENtOD5/5srdMc
 IiFAELK3xfECObS1goJOYhW3ZQ==
X-Google-Smtp-Source: AFSGD/VJLZG7gcXeociyEgZjIjXppPPBqbbfWpXxr9QJTcRERYQerUIETedTQcNWph4gVXQTq7Yp3w==
X-Received: by 2002:adf:ef88:: with SMTP id d8mr13510970wro.163.1543834279625; 
 Mon, 03 Dec 2018 02:51:19 -0800 (PST)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id q185sm7198774wmg.14.2018.12.03.02.51.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Dec 2018 02:51:18 -0800 (PST)
Subject: Re: [PATCH 0/3] - clk: meson8b: add the (read-only) video clock trees
To: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
References: <20181202214220.7715-1-martin.blumenstingl@googlemail.com>
 <d52679a197a46fa19fb44c446c52fd286ad639f2.camel@baylibre.com>
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
Message-ID: <913fbbd7-88a3-b6a8-74d3-4687ea62bcdd@baylibre.com>
Date: Mon, 3 Dec 2018 11:51:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <d52679a197a46fa19fb44c446c52fd286ad639f2.camel@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181203_025131_596774_72915B2A 
X-CRM114-Status: GOOD (  13.35  )
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
Cc: sboyd@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 03/12/2018 10:42, Jerome Brunet wrote:
> On Sun, 2018-12-02 at 22:42 +0100, Martin Blumenstingl wrote:
>> Martin Blumenstingl (3):
>>   - clk: meson: meson8b: fix the offset of -- vid_pll_dco's N value
>>   - clk: meson: meson8b: add the fractional divider for -- vid_pll_dco
>>   - clk: meson: meson8b: add the read-only video clock trees
>>
>>  drivers/clk/meson/meson8b.c | 746 +++++++++++++++++++++++++++++++++++-
>>  drivers/clk/meson/meson8b.h |  54 ++-
>>  2 files changed, 789 insertions(+), 11 deletions(-)
> 
> Looks good to me
> 
> Acked-by: Jerome Brunet <jbrunet@baylibre.com>
> 

Same,

Applied to next-drivers !

I'll be great when we finally have video support on Meson8/Meson8b !

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
