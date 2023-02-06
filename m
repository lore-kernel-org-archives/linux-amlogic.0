Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90843C05027
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Feb 2023 21:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eRX8OJM5+5UhV9oOVvaWImmIiA+5E25jTwWPRf6kqBU=; b=p0CD/qVn/Lzt7M
	vw+mX8PMbPObJbQE3bnNXKqKPT7q6998aayFpcVIblZb3k8UMOzuRwTa51CIwaQ3+If5VaT3xaZzl
	kDJol2b/LCw/oWOyR9qPvJjRFCcu1C02DmxZcko2VtYLNmY+8uiyy4Bdd14P80Z6wl/J6Pber1u9e
	lfQ3H1qmN2g1I7CfzhvvroAMDGS7k2GEX5mip/c9pqbhJKjJcl3DioZ38bH3fhRVrkC+HwLQARHvd
	pKRo9jH8en58X8AvaJrk1dBJqtGG9AiGi8pjvK5RW/Lw5AaYQG1gKuXUbBKa/9VhQdKAQN81/MHS4
	UNi+OiaVVTtxrvaF5T5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP8o6-009yBq-VY; Mon, 06 Feb 2023 21:13:47 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP8o3-009yB0-Ph; Mon, 06 Feb 2023 21:13:45 +0000
Received: by mail-ej1-x634.google.com with SMTP id sa10so7633541ejc.9;
        Mon, 06 Feb 2023 13:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VZtS5vyMO1j5bifjBnwS+OCCtmHppSGHkVWDdflpcgQ=;
        b=oP0XSEHQC5aWdClkeRnAbGc7ZoYQnto0IF7DVciCduEdRoBXp7b6ibFnUX2+EQTUzi
         lcXMi28emzQ8NkxhAv03VfY3uYx33fkMRhSGV1wUtOzRVVmXI5PT5InZ/30pLPmOetz8
         JCoOEl5fYU4NlBcuqU7PAzTDvlY+3HI0TKTnoMJZigL1uRPZjI8dHbh4DcPNCjijJpIk
         zpMFWbyFMitMbdV7UysPYr19tVmtWaFh/KQ9uws/dvT2LfVf3SqWNlzW+KgGQTFd4+pU
         6/T31ATcW82RKJM4zpGwFlDnBXJk5Wfv1jvrTbr1jg5o8jyQPxiwOyLUjaNjMMy2jRln
         1jwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VZtS5vyMO1j5bifjBnwS+OCCtmHppSGHkVWDdflpcgQ=;
        b=3ARi30kisYX/Gx5YkmnI88G4jSJAfVsLJm1naUUKQEndv2zLDZGTTYuLpCTYRtoWkB
         tNdsAhWXASlysCuxgW8cynwkv7pAGQVr95Bq4nYM1jYHA91OefsEEsmgQfoXCIDRRMTF
         tOdlTVUsq4JWAhW3ahQ7HHtCHYq3GnlNUeQ+DeYpSXKd9djt5cMmS7SXBsG8GafX0zG+
         ahFBsm0RncWg/i22elNUSSKBF5wXwKWwM/9Axbtz6EFxWYXZQjU3MRbJbHCxIXatn1ZM
         qSPwCDYteIRcCVQRZxgjMELH8piIOSThSjY7GEguv2ZS2z7mJRXPM6GN7cLrz6xx/s+m
         itRw==
X-Gm-Message-State: AO0yUKVx+KpG4VElfKGLLO5bt2Wizwb3lmywxOGrRo80UrVJIcUyKQpN
	L1R3BKnMd/IdNZVrywhBKYo=
X-Google-Smtp-Source: AK7set+3+FsYuhkU78K71Ir/e1the4l9Da6i5qqPjBJa0HxQQTAfi7NQdSv/CePdjqnOZ734eAFJVw==
X-Received: by 2002:a17:906:a102:b0:878:5e84:e1da with SMTP id t2-20020a170906a10200b008785e84e1damr804504ejy.27.1675718020715;
        Mon, 06 Feb 2023 13:13:40 -0800 (PST)
Received: from ?IPV6:2a01:c23:c485:9100:38f3:3203:b326:71ab? (dynamic-2a01-0c23-c485-9100-38f3-3203-b326-71ab.c23.pool.telefonica.de. [2a01:c23:c485:9100:38f3:3203:b326:71ab])
        by smtp.googlemail.com with ESMTPSA id d20-20020a17090694d400b0088e682e3a4csm5877799ejy.185.2023.02.06.13.13.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 13:13:40 -0800 (PST)
Message-ID: <63b86083-1b05-d851-d141-d3578e4dc724@gmail.com>
Date: Mon, 6 Feb 2023 22:13:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/4] dt-bindings: pwm: Convert Amlogic Meson PWM binding
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-pwm@vger.kernel.org
References: <8df4ceec-663c-dc68-d775-5caeb02c0cca@gmail.com>
 <5b83767e-c53d-316f-df10-45a39dbd9c88@gmail.com>
 <20230206082317.ygvixvhjqppz4nmy@pengutronix.de>
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <20230206082317.ygvixvhjqppz4nmy@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_131343_871053_F16C9E47 
X-CRM114-Status: GOOD (  10.85  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMDYuMDIuMjAyMyAwOToyMywgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gSGVsbG8sCj4g
Cj4gT24gV2VkLCBGZWIgMDEsIDIwMjMgYXQgMDk6MDA6MjFQTSArMDEwMCwgSGVpbmVyIEthbGx3
ZWl0IHdyb3RlOgo+PiBDb252ZXJ0IEFtbG9naWMgTWVzb24gUFdNIGJpbmRpbmcgdG8geWFtbC4K
Pj4KPj4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+Cj4+IFNp
Z25lZC1vZmYtYnk6IEhlaW5lciBLYWxsd2VpdCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+Cj4gCj4g
SG93IGlzIHN1cHBvc2VkIHRvIHBpY2sgdXAgdGhpcyBwYXRjaD8gRG9lcyBpdCBnbyBpbiB0b2dl
dGhlciB3aXRoIHRoZQo+IG90aGVyIHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMgdmlhIGFtbG9naWMv
YXJtOyBvciBpcyB0aGVyZSBhbiBleHBlY3RhdGlvbgo+IHRoYXQgaXQgZW50ZXJzIHZpYSBQV00/
Cj4gCk5laWwsCmFyZSB5b3UgZ29pbmcgdG8gdGFrZSB0aGlzIHZpYSB0aGUgYW1sb2dpYyB0cmVl
PwoKPiBCZXN0IHJlZ2FyZHMKPiBVd2UKPiAKSGVpbmVyCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
