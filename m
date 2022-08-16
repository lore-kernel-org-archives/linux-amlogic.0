Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08603C19F2C
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Aug 2022 05:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YwiYb8MqG+/nrjbie8jXflq1I5O4y2Hw1rP+GdkJHUM=; b=LA4UpOBE3nrVc1
	XF23M/mLUPJwwxBYp084sDCswe1T5XHWqilKsG0c/uK53NT/HSt1eRPr1LL+Ua5Yje51fAeTY4tIl
	jMA3nA/Na0cl08RiOFFyv7tfu2KsPKvO6XQtAEkH291uY8awiq2aJw83Fk5hnJ94tQH4haQWr0yC7
	6easowpenbkuYOLgnFpBDL+qG7eoudV+7SKVez9V0n93pBjVYqUnB6gWkXAgB/xMHvFPZ3HRhZ6UV
	M9FYYaRVQZlgL4ALcR9JaFj5vF9eglAjViiBs7BxPTDVrvzltahvggo5pwdAZU2FfFnCTQsqPBhtu
	IK0IwAhlecnzcLVs3aJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNpaf-00CwpP-EP; Tue, 16 Aug 2022 05:58:13 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNpaZ-00CwKH-QV
	for linux-amlogic@lists.infradead.org; Tue, 16 Aug 2022 05:58:09 +0000
Received: by mail-lf1-x136.google.com with SMTP id x19so13418479lfq.7
        for <linux-amlogic@lists.infradead.org>; Mon, 15 Aug 2022 22:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=fG6ebq+esaR04I5xSnC4xD/7QUDUFnAnjiwTJZuzpTU=;
        b=HbRzk/VSqzFdbWnSmSJYeONLMiDIX4eolFhsG+ovtUIrYQaEt4fOkjoEJEklJPfWAB
         hCtkii2R/7FvDwsdApsi3VZBEdLZne1ZnDTzCRqDftnrYKUD52HjeIOx//p0e8J5jS/G
         +0BsgvCxCyLK5ILdUXZdVnnYzzfd4HzpH4nuMgS9jiScfrd0v5sTuOmjgyl4sP4ls2Fj
         LJzCTUrSbBmEF//F3bcwugnym76jL/d6xod76SEqG4tpMyPReYWiOb9c1bPCh80CKUUt
         RotrAblPLD/bJQnlvo8zkzY3hH8+Nn1YP/OqkdB7xDZx9hkL0n0Z/3sFwEKwSyiWZxtl
         4cKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=fG6ebq+esaR04I5xSnC4xD/7QUDUFnAnjiwTJZuzpTU=;
        b=Kd4sWYd0C2RCarOyPU5XkJfE3RuQI8naVm6n70s+hBuyG7IKa9X41Xn6dc/3AMsytn
         PR8INzxEOf300WEyTFYePJoFMQyW0FP+i87ahfDHW4T2ggeoAgQqOzO2xVUHswnBcjgH
         hFONCkOjz9lZX0H4RjD8XCsiv0PL2OT0vfXQGnz368wIz+j6pJ4GlQ1bBYueWHcZscz7
         Tj3lcLPHpSY2Kk6T54jPNaKsryh7EbwYW7ZYm9mRKlT0CQbXryAfSkYqZNEnvJ479b1g
         yS3bbzkzcIxvTSgWt6cSmR+kEyWKKlAYr1v28bnp3LpoJydyoSHqmUPCXHS4GZ6bmPc1
         89vg==
X-Gm-Message-State: ACgBeo2Nl7oK2bXHjx1fW58kh9YuNA2A97W/vfnfvjUotKTE7m2auHIC
	jhXj3Uq9gdh9SZQJdIiOA0b3+Q==
X-Google-Smtp-Source: AA6agR6nWRLeZKfkfbcHhmb0twzixrU6OVenWmTfNeYj4Zbsb7EQ2O2nQhUNQ/z+EXIsHXvCkdP56w==
X-Received: by 2002:a05:6512:3d8f:b0:48f:a80b:1872 with SMTP id k15-20020a0565123d8f00b0048fa80b1872mr5975131lfv.21.1660629478374;
        Mon, 15 Aug 2022 22:57:58 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:1782:dd68:b0c1:c1a4? (d15l54g8c71znbtrbzt-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1782:dd68:b0c1:c1a4])
        by smtp.gmail.com with ESMTPSA id h6-20020a2ea486000000b0025e57b40009sm1675557lji.89.2022.08.15.22.57.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Aug 2022 22:57:57 -0700 (PDT)
Message-ID: <96e4a9f2-96a0-764e-8060-58f2c1b23a5b@linaro.org>
Date: Tue, 16 Aug 2022 08:57:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 4/4] dt-binding: perf: Add Amlogic DDR PMU
Content-Language: en-US
To: Jiucheng Xu <jiucheng.xu@amlogic.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chris Healy <cphealy@gmail.com>
References: <20220805071426.2598818-1-jiucheng.xu@amlogic.com>
 <20220805071426.2598818-4-jiucheng.xu@amlogic.com>
 <a3cd55ad-cec2-9570-2078-6724ab1d7300@linaro.org>
 <880842a1-a769-f228-7c91-5402e6d9391e@amlogic.com>
 <c57044ca-3742-37c1-b8ad-14806cbc05ea@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c57044ca-3742-37c1-b8ad-14806cbc05ea@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_225807_984764_EB1FF2F8 
X-CRM114-Status: UNSURE (   8.95  )
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

T24gMTUvMDgvMjAyMiAxMjowNCwgSml1Y2hlbmcgWHUgd3JvdGU6Cj4+Pj4gK3Byb3BlcnRpZXM6
Cj4+Pj4gK8KgIGNvbXBhdGlibGU6Cj4+Pj4gK8KgwqDCoCBpdGVtczoKPj4+IFlvdSBoYXZlIG9u
bHkgb25lIGl0ZW0sIHNvIHJlbW92ZSAiaXRlbXMiLgo+IAo+IEhpIEtyenlzenRvZiwKPiAKPiBJ
IGhhdmUgdHJpZWQgdG8gcmVtb3ZlICJpdGVtcyIsIGJ1dCBlcnJvciBjb21lcy4KPiAKPiBwcm9w
ZXJ0aWVzOgo+ICDCoCBjb21wYXRpYmxlOgo+ICDCoMKgwqAgLSBlbnVtOgo+ICDCoMKgwqDCoMKg
IC0gYW1sb2dpYyxnMTJhLWRkci1wbXUKPiAgwqDCoMKgwqDCoCAtIGFtbG9naWMsZzEyYi1kZHIt
cG11Cj4gIMKgwqDCoMKgwqAgLSBhbWxvZ2ljLHNtMS1kZHItcG11Cj4gCj4gRG8gSSBnZXQgbWlz
dW5kZXJzdGFuZD8gSSB0aGluayB0aGUgIml0ZW0iIGlzIG5lY2Vzc2FyeS4KCkFuZCBob3cgb3Ro
ZXIgYmluZGluZ3MgYXJlIGRvaW5nIGl0PwoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
