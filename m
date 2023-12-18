Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA5CCC35274
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Dec 2023 21:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9EH8FwfXOLsBYl10zJWOYbPI1RKYFpzqKxGLD53boyk=; b=MSl9A2mV5lMXQ8
	x3fWoVFsfKdFa8LKgJiK687ZutQh6m9nI/KHbH+vuciCK57tk3ze4plPpcEuc4GUDzj0fk0ec6Tmt
	PE2fBZs1pzohJGmh4B5F22PhQ+9OMSYUlDJMRrliGD5VBFq8ibFIKuO2+02q1yUP4pprWUh3gU5Pi
	Nc7vWyQUoClelbWLVfQU8RiQFF84ovlkK+Txw5BlDQvA4jc5iAxiD2pGsm9lnBSNzGZVYq4GhOoDx
	c2UZrsiYi1w98V+ZIO5d+Wlq7UQhVJ7p+QoF04BuD+z6TuckVvf5y0MAHWpm9veZw0WFTUsQxA6Rc
	tosGVyoFnZ9T6OYlxg/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFKxF-00C6aa-1S;
	Mon, 18 Dec 2023 21:15:13 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFKx9-00C6a6-1f
	for linux-amlogic@lists.infradead.org;
	Mon, 18 Dec 2023 21:15:09 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-33670b90013so87329f8f.1
        for <linux-amlogic@lists.infradead.org>; Mon, 18 Dec 2023 13:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702934105; x=1703538905; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fv24oW/gwKlTm4nSPBKnWVRVDoSmeowuplphlT2qguQ=;
        b=Rlh8D/ng9vZE81C5jWYDEJgRiityBEY932bfxe2ka0w22eSuColALhOPdUJdVBBb4g
         208XKVc/qyk/UhY8c6kJJYtd0h9pMyuU3xBozflxXIU1NzCftju4SdMfBiwjA37OuElW
         T/UKa4qlNHHEcGzfoIFlvBTfD4imairO4ooyUJDgk8QgE6rBmHgD5Qs5BBZadklt4tWs
         hhhVlWsxBe50JL+RstRQX1j/nhKEfs52P7Z6d/3STdnUxob4UHhiaMlb7OqJksceawuV
         VVzEP6CkrXQV/L62FZGu/X09oLWtS4EzPnGS/pff8jzk0WKhKa4mrjLchlhryS8U1Ek6
         WiIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702934105; x=1703538905;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fv24oW/gwKlTm4nSPBKnWVRVDoSmeowuplphlT2qguQ=;
        b=VV9fQG7dJtYNK0oiu1JO12WHbmPuf8ZePpSWUxahx/JhlZg8bG1vS+oOS4dmZfOjOY
         yDRh3bdtux+QfO2OcuNOeHtBMnx6mHSl72XUYJiU1uMDE/VFiBALYwVqANGh+HdxbAj4
         7GrZ+ufP0rASnpsF+n38RmE8/udeM01AmC03mQB+TWczPi7xd/Grupg+yGmyRtA6hfv5
         J5mKQY7aoj1lb/i5S+ost+E+p6Rj3mS4Ae+eH8G6eN4+9IzNdSYFf5Q+Xax02HT6f60x
         BlMXShmtwptZJCmrc6j/7kaOcEmdWGeTW5c+slpQiXDgsaF/PAxyIoISZ1+QyDDjJYvg
         Kq1Q==
X-Gm-Message-State: AOJu0YzgqgqsgtEU/FwN4b+MdTMjVtFpOAnwKuDnEpSpZwEh3+9K1o2P
	KQD23Yap+qTfh9NIRnws6UyzkI5kZm06EA==
X-Google-Smtp-Source: AGHT+IEvghUjytmbhBXnljV4EQLrT+EIoJ9XKEPZ+BLCvC/NkGpKwEVOHmRvZ/bsGYj24OiPmM0gzA==
X-Received: by 2002:adf:e40c:0:b0:336:6f8a:264a with SMTP id g12-20020adfe40c000000b003366f8a264amr2471wrm.26.1702934104812;
        Mon, 18 Dec 2023 13:15:04 -0800 (PST)
Received: from [192.168.165.171] ([37.170.230.132])
        by smtp.googlemail.com with ESMTPSA id h6-20020a5d6886000000b00336430ad57csm14648636wru.106.2023.12.18.13.15.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Dec 2023 13:15:04 -0800 (PST)
Message-ID: <3bebfe0f-1eb6-4d28-8bd8-2cc30d84a6e7@linaro.org>
Date: Mon, 18 Dec 2023 22:15:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] thermal: amlogic: Two cleanups
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Guillaume La Roque <glaroque@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-amlogic@lists.infradead.org, Zhang Rui <rui.zhang@intel.com>,
 kernel@pengutronix.de, Lukasz Luba <lukasz.luba@arm.com>,
 linux-pm@vger.kernel.org
References: <20231116112633.668826-1-u.kleine-koenig@pengutronix.de>
 <7r2dj6eggv5lb4j7twcooykvahwnyhqay3evqjclu33z47dm7c@guvng32lhvtj>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <7r2dj6eggv5lb4j7twcooykvahwnyhqay3evqjclu33z47dm7c@guvng32lhvtj>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_131507_589170_4EF8AFBE 
X-CRM114-Status: UNSURE (   7.43  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMTgvMTIvMjAyMyAyMTo0OCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gSGVsbG8sCj4g
Cj4gT24gVGh1LCBOb3YgMTYsIDIwMjMgYXQgMTI6MjY6MzRQTSArMDEwMCwgVXdlIEtsZWluZS1L
w7ZuaWcgd3JvdGU6Cj4+IHdoaWxlIHJlYmFzaW5nIG15IHBhdGNoIHN0YWNrIHRvIHY2LjctcmMx
IEkgc3BvdHRlZCB0aGVzZSB0d28gcGF0Y2gKPj4gb3Bwb3J0dW5pdGllcyBmb3IgdGhlIGFtbG9n
aWMgdGhlcm1hbCBkcml2ZXIuCj4+Cj4+IEJlc3QgcmVnYXJkcwo+PiBVd2UKPj4KPj4gVXdlIEts
ZWluZS1Lw7ZuaWcgKDIpOgo+PiAgICB0aGVybWFsOiBhbWxvZ2ljOiBNYWtlIGFtbG9naWNfdGhl
cm1hbF9kaXNhYmxlKCkgcmV0dXJuIHZvaWQKPj4gICAgdGhlcm1hbDogYW1sb2dpYzogVXNlIERF
RklORV9TSU1QTEVfREVWX1BNX09QUyBmb3IgUE0gZnVuY3Rpb25zCj4gCj4gZ2VudGxlIHBpbmch
IElzIHRoZXJlIGEgY2hhbmNlIHRoZXNlIHBhdGNoZXMgbWFrZSBpdCBpbnRvIHY2LjgtcmMxPwoK
WWVzIDspCgotLSAKPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4g
c291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwoKRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3
LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNv
bS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1i
bG9nLz4gQmxvZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
