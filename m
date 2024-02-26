Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D541C54E49
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Feb 2024 11:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WVIpF7UlQvBr7PDpac0IZWz5naqhRH3njvT3rDuY50U=; b=rmARpc5ODwUF3P
	wTJyXyTEJ2xbg0acN2ppGSAbniY81trBXEQYIna8zQIKqWVaT+qYjI6UPgmDzanE4H+S2DdU1up4z
	5WpAZ2JjX05ZjhEbYrGB6ZsxChkELyUNLUCkGIe7DuK7AZXU3FhI1MdFG8KKeh77BYXOMwcxEmiif
	ebCgQDEDBjab9RqLa7oNHdp4Th4eyD3cMQTJlTf8M5fY8DdN0gB/VyyWHgnPIsGAzfDvBcb1T024p
	+DKrrfwVY47POjjUB5def5r6OxHpoARslqepW9YKXCQRPGe0XZRvm76xpRhXc13dXytVC5445RGSG
	qktYsEkxSDNn19poHRTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reZ0l-00000000JZt-0oBe;
	Mon, 26 Feb 2024 11:19:08 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reZ0h-00000000JYY-09hZ
	for linux-amlogic@lists.infradead.org;
	Mon, 26 Feb 2024 11:19:04 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-412a87f0d8eso1663945e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 26 Feb 2024 03:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708946341; x=1709551141; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EleSDnqn2DmNGxFOm08Vn/gCFQneKHwfcyjKv4Zvj64=;
        b=JrOfClqWidNUbGvM5u3rzgSlkbMygzdGiYrOn4+ipcRjkYEN+6TOFgT0fjxM6Fi+XG
         mZgUpdK5stIaBB7+nVf9RaOFP0qLFM67aEFudjD3QaaBYPMLYRv+wZd9hYVU7E232iwL
         /+BNYDQorGNt4wJ+nLHKy69MEUh9wB663mRSh/1QkGDgVzPsjDiZV1pLQU4D4dwUOqKq
         0wS0L++q1BiM41gfIWLnLHgCIg6xykzYJq7/CafaEXeKRjvplcT4T11FmehbOFT5nnPV
         M0ofKZGfJKfgKpAudX+eHF4jjbC8HK3fqSfbH1BxRbXzrn59bAhUUH9MlxqW47Ug1U6H
         uo8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708946341; x=1709551141;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EleSDnqn2DmNGxFOm08Vn/gCFQneKHwfcyjKv4Zvj64=;
        b=KWTWxNO65wBl5xvdj0qwJp4kWYFRFftn65Ah+p2gGczSU+10NI09yzRG3g/nduYBvH
         +AeB7iFhDFTF6OsawZulDk+tSVPSU8h0rN343f9/y+Emh5bW/NrmLo3iKrPID6I3r9hp
         20VQHXOBwp1h0ZrHDUA4QJAdGwnUXAenYt0wXRWhQ1FSPqOdlkA+LKRVeXTQwHRh8Mzj
         IT+5GTRWumDCWzHn0hU9h6JhSdOlX7f2tajHlK+Heu2/eNPpU8xp1zHZrC1zceLwDIS4
         v5vUyCGYLJyA6XpA5tmEuDHASYnu+8MvQ0a7noFLkCmR19tDNmsptZoS/J6h29Rywv6m
         64nw==
X-Forwarded-Encrypted: i=1; AJvYcCVQ6LaLb7xNsgnbH8rGTxOgcpXsBeEsq4jB98lsvExzxrXaEHSZm4UeVpPc0B1Bk8+2BvQswPk5+nTVsiwa19CGDDx7xOI+bYVbDOt0rKcaRVM=
X-Gm-Message-State: AOJu0YysuysFLTOCTYE5HMZMJMVxhMpDAwli+TDONEp1IJgklvfdlPD1
	+kPGe1wUunjbgRGjV8VI3qeZIjLsHbpDOM9PrQ5V6kBNIWcIGREwCvqWmnmUTXU5EyWLF012B/h
	F
X-Google-Smtp-Source: AGHT+IG3bdSVmimZkbgrLNvgYK4xA/yulode1gsew0jXP7RW4d2NEJAzN2NusJojTmT0EMFr2cTDdQ==
X-Received: by 2002:a05:600c:4e91:b0:412:a04f:7f5 with SMTP id f17-20020a05600c4e9100b00412a04f07f5mr2908198wmq.16.1708946341160;
        Mon, 26 Feb 2024 03:19:01 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id r1-20020a05600c35c100b0041228b2e179sm7933257wmq.39.2024.02.26.03.19.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 03:19:00 -0800 (PST)
Message-ID: <2a017b4d-f437-4752-975e-632b0293061e@linaro.org>
Date: Mon, 26 Feb 2024 12:18:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] clocksource/drivers/arm_global_timer: Three
 improvements
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 tglx@linutronix.de
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 patrice.chotard@foss.st.com, linux-amlogic@lists.infradead.org
References: <20240225151336.2728533-1-martin.blumenstingl@googlemail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240225151336.2728533-1-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_031903_101911_118B8913 
X-CRM114-Status: GOOD (  11.57  )
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

T24gMjUvMDIvMjAyNCAxNjoxMywgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBUaGVzZSBh
cmUgdGhyZWUgaW1wcm92ZW1lbnRzIC8gZml4ZXMgZm9yIHRoZSBhcm1fZ2xvYmFsX3RpbWVyIGRy
aXZlci4KPiAKPiBDaGFuZ2VzIGZyb20gdjIgYXQgWzFdOgo+IC0gYWRkIHBhdGNoZXMgMSBhbmQg
MiAod2hpY2ggaXMgd2h5IHRoaXMgaXMgbm93IGEgc2VyaWVzIGluc3RlYWQgb2YgYQo+ICAgIHNp
bmdsZSBwYXRjaCkgYXMgaW4gdGhlIGNvZGUgcmV2aWV3IHByb2Nlc3MgbW9yZSBpc3N1ZXMgaGF2
ZSBiZWVuCj4gICAgc3BvdHRlZCB0aGF0IG5lZWQgZml4aW5nCj4gLSByZW1vdmUgInBzdiA8IDAi
IGNoZWNrIGZyb20gcGF0Y2ggMyAoYXMgdGhpcyBjaGVjayBpcyBub3cgaW1wb3NzaWJsZQo+ICAg
IGFzIHBhdGNoIDIgbWFrZXMgdGhlIHZhcmlhYmxlIGluIHF1ZXN0aW9uIGFuIHVuc2lnbmVkIGxv
bmcgd2l0aCBhCj4gICAgY2hlY2sgZm9yIHplcm8gYW5kIHJldHVybmluZyBiZWZvcmUgZGVjcmVt
ZW50aW5nIHBzdikuCj4gCj4gQ2hhbmdlcyBmcm9tIHYxIGF0IFswXToKPiAtIHVzZSBGSUVMRF9G
SVQoKSB0byBjaGVjayB3aGV0aGVyIHBzdiBvdmVyZmxvd3MgdGhlIHJlZ2lzdGVyCj4gLSB1cGRh
dGUgdGhlIGRlc2NyaXB0aW9uIGFjY29yZGluZ2x5CgpBcHBsaWVkLCB0aGFua3MgZm9yIHRoZSBp
bXByb3ZlbWVudHMKCgotLSAKPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSC
IE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwoKRm9sbG93IExpbmFybzogIDxodHRw
Oi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0
dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xp
bmFyby1ibG9nLz4gQmxvZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
