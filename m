Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE66C48BEB
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Feb 2024 10:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rn8dBX3hYfvWFHAo0MT8D/ONremsf+M/ZFphsusCPtg=; b=iSz+n5k9zmmg5o
	S1ysl8j72W0GtMpp6J+6flBzwmX6USZ/WG2+AZIYjBtgJwuf/1cyINMZqUOqzt3HXLIekyvQzQXOk
	0CP93TAACY6jvhSGDobRKeZsadj+lddkiEUxUQuknc4pzIHSY89gHxmsKrqmtDa6bLm6p4gjZHI4c
	0pFecDxfTkvzD/u+Oavoa7CFPEJkqFJ+Kh+AN7gHiqIsXQsZlmrWe5EzDubhg/ShXNSvsZXqebJ9N
	CWdy92Ud8QtxhBe80/pyCbVcwgnMEQ8qC1hoA3D/FK7bOZ3YS35Sx8e/FC9WgK3OyZ+0EhkINDFzF
	zalWh5phgQ69tEMb0YYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5uP-00000004PNg-2c8j;
	Thu, 22 Feb 2024 10:02:29 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5uK-00000004PKq-3tZ2
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Feb 2024 10:02:27 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-412698ac6f9so3880545e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 22 Feb 2024 02:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708596143; x=1709200943; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kFYHd6+4AFKoS9s0Ghxng7Vd4m1eqNVYafg51WuAAFY=;
        b=CKKuBGjIxma1ilNg5sZyMokqsz83rygGaJsE6cs4a8Gd6w2V0rnbw9WPxmidz00/JQ
         5OIO6QAsEBfeabNW+9JEOwh1tBouO/SEku5mHpCZYiCEOyIMcdNy/5fNzjPruujCLxdz
         qjMhUVyZMnyiLimFBVpsM+QaRaIG+GC6MDmGIb8zi2eg1dJfU5s2rysdR+anGqeZNQEu
         /6BYWGdslokDt2YLW3h55J/0QnYzFCjyTGQyctj/01sSsrkuI94Vqli9zT4BvJ6C9Mrd
         V/EYyzanhf3M8lFQEsxmazI1Pkjia4Zyq9VAn8LPlmxSKeAI9Qr25irnwHqMJUdMM6Q6
         G4Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708596143; x=1709200943;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kFYHd6+4AFKoS9s0Ghxng7Vd4m1eqNVYafg51WuAAFY=;
        b=pkLrStUSHkCUIaxHJ9LmvpWEMA4qcWM3lqtzmDP0ObNr6qygjKRk1SPEmlUKfWhfpS
         dQ8gwbp2a6uvxN+g9wOcxuPBZ6FEGMbyczjRg7k9pAShKR6qE3IWjXJAamsKF6UuXR2k
         llgl8Ft13hfhuLrDKzhqfVOHdC19oKO5Sskrijw4otlOh29mk4qiBqrVkvy6sW3ypbqg
         QlXghNjUR+bBR0ZtgYwaJp6xVpPS0seNvoLpLM+vKGMUYDxy8Bm2DPxjmExj7GH+VnbE
         dmhmeFsdON+5YRP4VNvNhpdLee3nwthiETC0dQ+i3EItGWSZd1/u1dxeVKBIQAIk0Qj4
         b1eQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaXXSVc4TlcsL2/clkh6b8IJQFWstpVyE/Z3tncO7X03Fm5V9y7WAFCtMmOX4uA0LJ8roZmZYGUjjMQfwXf+nNREfV5ra3twKThB0Poldsv1A=
X-Gm-Message-State: AOJu0Yw+ydMK9zE8XNxVwVVKCuRewweEjjVavCX1TdyGc51I/oA5qT43
	HOnNW3zJkZAcQjxOdqd2bEigmQCTTK829CoYGcDjSJ1zd/Nrc8lrltJqdivmrsI=
X-Google-Smtp-Source: AGHT+IF3t8KxDgoDIJivDdmBnVEfL+G0xlPoeOkFEyc7ma9OQbx/VZ8G5e7i3Xh2q0TvvIpR1dxcpQ==
X-Received: by 2002:a05:600c:3b16:b0:411:b2f4:16e9 with SMTP id m22-20020a05600c3b1600b00411b2f416e9mr1920979wms.14.1708596142728;
        Thu, 22 Feb 2024 02:02:22 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id i8-20020a05600c354800b004127488c941sm5700224wmq.22.2024.02.22.02.02.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 02:02:22 -0800 (PST)
Message-ID: <a4f8fa60-7c03-4946-a135-a405d53f361b@linaro.org>
Date: Thu, 22 Feb 2024 11:02:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] clocksource/drivers/arm_global_timer: Simplify
 prescaler register access
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 tglx@linutronix.de
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 patrice.chotard@foss.st.com, linux-amlogic@lists.infradead.org
References: <20240221214348.2299636-1-martin.blumenstingl@googlemail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240221214348.2299636-1-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_020225_100057_A0E0FB3C 
X-CRM114-Status: UNSURE (   5.92  )
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

CkhpIE1hcnRpbiwKCnRoYW5rIHlvdSBmb3IgcHJvdmlkaW5nIHRoZXNlIGNsZWFudXBzLgoKT25l
IHF1ZXN0aW9uIGJlbG93OgoKCk9uIDIxLzAyLzIwMjQgMjI6NDMsIE1hcnRpbiBCbHVtZW5zdGlu
Z2wgd3JvdGU6CgpbIC4uLiBdCgo+ICAgCQkvKiBwcmVzY2FsZXIgd2l0aGluIGxlZ2FsIHJhbmdl
PyAqLwo+IC0JCWlmIChwc3YgPCAwIHx8IHBzdiA+IEdUX0NPTlRST0xfUFJFU0NBTEVSX01BWCkK
PiArCQlpZiAocHN2IDwgMCB8fCBwc3YgPiBGSUVMRF9HRVQoR1RfQ09OVFJPTF9QUkVTQ0FMRVJf
TUFTSywgfjApKQoKCQlGSUVMRF9NQVgoKSA/CgpbIC4uLiBdCgotLSAKPGh0dHA6Ly93d3cubGlu
YXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29D
cwoKRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+
IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8
aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
