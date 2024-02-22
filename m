Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89339C47DD9
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Feb 2024 22:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dK6savLI9HosVBoAU2QRKX1THEAqoX5KUGOSLGgr0Qc=; b=S1UhWnQum2SLw4
	fyhB6uhPPq2XqRjy0XDCSbbHH4+kPmhYXhxZpfnE2ScInGLXExKbg9YzWzF483rk+6OyIY8GOJOFp
	4sufJfDjClUsqTnu/Sn42W0RuGj8CPESQRQUc3AzqNtdNYNhSDn8EIUR3k1r+9wN/F91Hql3Wv7Io
	nnSIEKDysrb7PX/vM+TTStX6EIGRDgONz8wU2qn2VPqjVFor1G1/4mkJILSTF8gUXNJasZs1Ne4MC
	v3ATfGm6n4oBxl4WtCfUKrcv0joQDQOfGkdF/S8fsiFbnWgq5oIL1IuHgalo/qzA0V0WyzazHEevD
	oHa9L6kHuW2CKSgmfq3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdHeH-00000006qo1-0kwY;
	Thu, 22 Feb 2024 22:34:37 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdHe7-00000006qje-2IUR
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Feb 2024 22:34:28 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4129017c942so1838775e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 22 Feb 2024 14:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708641265; x=1709246065; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=09lVyCcePOUyzrMf3zM5yudHpd6QLbyHExpRDXktLiE=;
        b=gUf+i0j4cpOb2gOGg11ih80oMco6UFjADCv9l3ESf5tlqoDssOUOgwtpTXHsg6dwyZ
         oPn2UDAS2egGZ//BsV7Km1S/BPSa2wBDP4kUkH+EV3FKq+uDQW1WeFMMfjI0qewxlz3G
         od5JIQTgyHH3hFm87f/iAhSy5l8rvBAPzGQr1yRt/lE86Fm4Y3Mrz6hFtR1phq404BMS
         jE+aPSUxfKb0rZaIHGkeV3p8faj+9R8MhSBNufOHaOzNF8lozTSE8DI0S4ikWXcAFVJC
         gfQaFst+pgQoN8k3sWV/7q5yJuo8x9OoZ3HwQfJ4qYsv7GRTwlePHQcXhC2NP+q3b0Xs
         cDMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708641265; x=1709246065;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=09lVyCcePOUyzrMf3zM5yudHpd6QLbyHExpRDXktLiE=;
        b=fHMzwt35wSgsD81J1Gjvu/P5ISascoIxk8s+At+303eOMmPku5nUC4Qmo83Uxik+Ys
         9s4yIeWNTkjR4MqoQCeT2c42INJ7ZOrjTJufM0a6Iz/oHGgZUvktq2FhFa3NddC3V4iJ
         TRTaJHetUxfUOFXOCkE3eRgs9/9dYh3xpCV+E7xAzLHic803cv9HmFPaVdaplR9tkc7u
         H7JGSdhT0djTQhjRPwK7AlgPFoB4PJxReHmqQ72cX7m8sliY90f5OQWd7t/r7sqyDtnz
         Egw1vLMIQNpCkcgUvrmPwcp84GriOs4t5FFPZla3OD889iF+ejZeRl2GOJ0ggJO5BqII
         9XZg==
X-Forwarded-Encrypted: i=1; AJvYcCVLh4myCfHvFyRT3LOnwYShaIOvHzsSlp8acxn/m+NY1YDZL6b4byJNDqfxhe88AfKs6EXPQzI/FGoYK7lD7hIMOuYtwtYF/X5oH5zQFqqmffs=
X-Gm-Message-State: AOJu0YyqJNUe097RfPGadE/WEJudBzYgw902MKSa1rxo6ChV3LDdATRL
	NF6W6/NG3hHYP6v3Jo4D7y+/Hf4bbIAyMCTVe0lwCSGWXsHfslLCf31JWQDddR2rtJ/JIv3CKar
	F
X-Google-Smtp-Source: AGHT+IG0Aw76kDBEFqJvdIng205GCG4/BqVAcV/vcsWDMEjbwaeVF9V2EWvO2/qNNewu64aXqFRWIA==
X-Received: by 2002:a05:600c:1c9d:b0:412:8c96:b15f with SMTP id k29-20020a05600c1c9d00b004128c96b15fmr41566wms.37.1708641265629;
        Thu, 22 Feb 2024 14:34:25 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id i4-20020adff304000000b0033d87f61613sm392857wro.58.2024.02.22.14.34.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 14:34:25 -0800 (PST)
Message-ID: <230587eb-dd68-414b-af15-47b1eb3d14e3@linaro.org>
Date: Thu, 22 Feb 2024 23:34:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] clocksource/drivers/arm_global_timer: Simplify
 prescaler register access
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: tglx@linutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, patrice.chotard@foss.st.com,
 linux-amlogic@lists.infradead.org
References: <20240221214348.2299636-1-martin.blumenstingl@googlemail.com>
 <a4f8fa60-7c03-4946-a135-a405d53f361b@linaro.org>
 <CAFBinCA3ho9fAb-iJhUEVw-=_Jbgd6UU8_9WEyvpt-+CL_V6ew@mail.gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <CAFBinCA3ho9fAb-iJhUEVw-=_Jbgd6UU8_9WEyvpt-+CL_V6ew@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_143427_592936_AE534ECF 
X-CRM114-Status: GOOD (  10.06  )
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

T24gMjIvMDIvMjAyNCAyMjo1NywgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBIaSBEYW5p
ZWwsCj4gCj4gT24gVGh1LCBGZWIgMjIsIDIwMjQgYXQgMTE6MDLigK9BTSBEYW5pZWwgTGV6Y2Fu
bwo+IDxkYW5pZWwubGV6Y2Fub0BsaW5hcm8ub3JnPiB3cm90ZToKPiBbIC4uLiBdCj4+Cj4+PiAg
ICAgICAgICAgICAgICAvKiBwcmVzY2FsZXIgd2l0aGluIGxlZ2FsIHJhbmdlPyAqLwo+Pj4gLSAg
ICAgICAgICAgICBpZiAocHN2IDwgMCB8fCBwc3YgPiBHVF9DT05UUk9MX1BSRVNDQUxFUl9NQVgp
Cj4+PiArICAgICAgICAgICAgIGlmIChwc3YgPCAwIHx8IHBzdiA+IEZJRUxEX0dFVChHVF9DT05U
Uk9MX1BSRVNDQUxFUl9NQVNLLCB+MCkpCj4+Cj4+ICAgICAgICAgICAgICAgICAgRklFTERfTUFY
KCkgPwo+IE9oLCBJIHdhcyBub3QgYXdhcmUgb2YgRklFTERfTUFYKCkgLSB0aGFuayB5b3UhCj4g
V2hpbGUgcmVzZWFyY2hpbmcgdGhhdCBJIGZvdW5kIHRoYXQgdGhlcmUncyBhbHNvIEZJRUxEX0ZJ
VCgpIHdoaWNoIEkKPiB0aGluayBpcyBwZXJmZWN0IGhlcmUuIFdoYXQgZG8geW91IHRoaW5rPwoK
QWggeWVzLCBldmVuIGJldHRlciA6KQoKLS0gCjxodHRwOi8vd3d3LmxpbmFyby5vcmcvPiBMaW5h
cm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKCkZvbGxvdyBMaW5h
cm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5jb20vcGFnZXMvTGluYXJvPiBGYWNlYm9vayB8Cjxo
dHRwOi8vdHdpdHRlci5jb20vIyEvbGluYXJvb3JnPiBUd2l0dGVyIHwKPGh0dHA6Ly93d3cubGlu
YXJvLm9yZy9saW5hcm8tYmxvZy8+IEJsb2cKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
