Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA7DC54798
	for <linux-amlogic@archiver.kernel.org>; Sat,  2 Mar 2024 15:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QkIXBWuW8ao+lM1YAO0K6Rsk6QmDN3PpCBiTP9i/Vow=; b=SZlXBsWhP6PDQ5
	pMzXLTZofS6PMeblb0kkXnj3krBTG0eUWva3OEkpU45oCclZc0Snfrrhs6+MHgOInbPqMBGOWgVtr
	UWd2jJDyf9CefeeLR7R3TQ9gVEYVSjdEUF+0JReE8NFH3ulzWjK4/7/6wES80pckHmq6YkxAvdL7E
	DvhxoxlZICFKkWkeEXJyPhtDGniMVbWLxNXtXeEgkOy3WDguf2oSoATZneVQTP48HmS11lqwHcdPi
	n18Ed4J3a1Si7tH5or6IHsjWm8RP06LGjBq3Z1COnnVEbvjvpyvYdoPQrIIiD9zSZCxB8+FhDgS+c
	rBYxl6uUtKmsAuL0b4aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgRf8-00000003t10-2PrN;
	Sat, 02 Mar 2024 15:52:34 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgRf4-00000003t0A-2uSF
	for linux-amlogic@lists.infradead.org;
	Sat, 02 Mar 2024 15:52:32 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-412c24280ffso18622105e9.3
        for <linux-amlogic@lists.infradead.org>; Sat, 02 Mar 2024 07:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1709394748; x=1709999548; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HFHn5+gTrYvZdU2UMo/5Uu0slaoxEdGH237gIhxi8Fk=;
        b=rb5wicXcytUwQxxV+a/tkCYDpOulxkLTiuM+D/G/zyFfCL2uec/2hwbOZBCuD+ARmY
         E0p4uWvIXoOqJFW4/7e/Q9vLDLzStT1jYaSV4i7aRyaOguNReX4DkJMG8KSuMM0Y3AJq
         bPbyt2YGicyv3N8WcOzGDU6f6Vdr92ISvoLinRagn9o7On795t+b/MogVegKP2EJzb1o
         UYRYQFXa614w6LcqD9OASb0gRJrRh8ctMQDen08xxgVyT/6MHezHo5kxmXGBU8q+Sb3P
         f0ZXy5dD97hdj8Ai6hemFzI9/IdR4XPnPHn1dQT9Y7g/eVwDQFuWbUKfJzfY+izbSIVZ
         Dgxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709394748; x=1709999548;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HFHn5+gTrYvZdU2UMo/5Uu0slaoxEdGH237gIhxi8Fk=;
        b=NfaMCK4PInm3Qchi7mlinHY+gevtRdg6MK8mxlyPVZq53yrp1bUVFnNjFdqZE7/ts4
         MlGHvcvQ+FTmYr4LRcWrwRqP5/BaxMNIhlhWV/Q/KLhdVZweHOUh0Ov72kU9a+JpJMOb
         8ZY0/KOCbCsCzyDIcr3snenoF9dOfSS/Hx8Fl0fe1tRNBiKqe6si4IvWgASpcbCLMi/V
         J+2iVB4MxqV5jLthB6E4FmSiyN0JY/+L2sQ9ZdiMgQnZbACAsSZRhQwCLNM1ubj+ETmi
         Qj4GxKVotoTwwtm9y3jmIVgrWZ46+0u4KIIhLX6aQIdsBN/m85OoJR9nkn2GF1waa+bX
         VuiA==
X-Forwarded-Encrypted: i=1; AJvYcCUVAtu5cRUd0bqAE6ab4koUwoTGfF1lWZbj2kxrKx+zIbvcv5mtjuePVx5HzpfS/zz3B+n0cbIfTKtcUJKBWxHlNi8lHxlBqMSmVM3qTGvIGAc=
X-Gm-Message-State: AOJu0Yxd8oUONbqpjQmMLgCv6ujNdREdO9/d2umu1CJJLT9P/PD85oFV
	aALTK2OS+Kw/xwyex4veomTuuPGkPsX9ESAZWZVzOtcHSC0mxxnHaV9XqQLxVZ4=
X-Google-Smtp-Source: AGHT+IHPEsKg9YL345VNJehawUEGJqX6jI1a45uLPxbSI3cJXqB9wbFooKxQnCv4HflprTmT7kTmXA==
X-Received: by 2002:a05:600c:4f44:b0:412:a5ed:bb57 with SMTP id m4-20020a05600c4f4400b00412a5edbb57mr4177808wmq.31.1709394747993;
        Sat, 02 Mar 2024 07:52:27 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:a62b:dc91:b659:dbf5])
        by smtp.gmail.com with ESMTPSA id d22-20020a05600c34d600b00412d6357945sm2015404wmq.27.2024.03.02.07.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Mar 2024 07:52:27 -0800 (PST)
References: <20240221151154.26452-1-jbrunet@baylibre.com>
 <b6jyherdfnehu3xrg6ulkxlcfknfej6ali2om27d7rjmwncwxz@3wrtx6sv4xm7>
User-agent: mu4e 1.10.8; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org, JunYi Zhao
 <junyi.zhao@amlogic.com>
Subject: Re: [PATCH v5 0/5] pwm: meson: dt-bindings fixup
Date: Sat, 02 Mar 2024 16:50:11 +0100
In-reply-to: <b6jyherdfnehu3xrg6ulkxlcfknfej6ali2om27d7rjmwncwxz@3wrtx6sv4xm7>
Message-ID: <1jsf18skat.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240302_075230_970761_88C44D36 
X-CRM114-Status: UNSURE (   9.61  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Ck9uIFNhdCAwMiBNYXIgMjAyNCBhdCAxMTowNCwgVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5l
LWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cgo+IFtbUEdQIFNpZ25lZCBQYXJ0OlVuZGVj
aWRlZF1dCj4gSGVsbG8gSmVyb21lLAo+Cj4gT24gV2VkLCBGZWIgMjEsIDIwMjQgYXQgMDQ6MTE6
NDZQTSArMDEwMCwgSmVyb21lIEJydW5ldCB3cm90ZToKPj4gSmVyb21lIEJydW5ldCAoNSk6Cj4+
ICAgZHQtYmluZGluZ3M6IHB3bTogYW1sb2dpYzogZml4IHM0IGJpbmRpbmdzCj4+ICAgZHQtYmlu
ZGluZ3M6IHB3bTogYW1sb2dpYzogQWRkIGEgbmV3IGJpbmRpbmcgZm9yIG1lc29uOCBwd20gdHlw
ZXMKPj4gICBwd206IG1lc29uOiBnZW5lcmFsaXplIDQgaW5wdXRzIGNsb2NrIG9uIG1lc29uOCBw
d20gdHlwZQo+PiAgIHB3bTogbWVzb246IGRvbid0IGNhcnJ5IGludGVybmFsIGNsb2NrIGVsZW1l
bnRzIGFyb3VuZAo+PiAgIHB3bTogbWVzb246IGFkZCBnZW5lcmljIGNvbXBhdGlibGUgZm9yIG1l
c29uOCB0byBzbTEKPgo+IEkgYXBwbGllZCBwYXRjaGVzICMxIHRvICMzLiBUaGlzIGRvZXNuJ3Qg
bWVhbiAjNCBhbmQgIzUgYXJlIGJhZCwganVzdAo+IHRoYXQgSSBuZWVkIHNvbWUgbW9yZSB0aW1l
IGZvciByZXZpZXcuCgpObyB3b3JyaWVzLiBUaGUgY2hhbmdlIGluIHRob3NlLCBlc3BlY2lhbGx5
ICM1LCBhcmUgcHJldHR5IHNpbXBsZSBidXQKdGhlIGRpZmYgYXJlIGluZGVlZCBoYXJkIHRvIHJl
YWQgOi8KCj4KPiBCZXN0IHJlZ2FyZHMKPiBVd2UKCgotLSAKSmVyb21lCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcg
bGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
