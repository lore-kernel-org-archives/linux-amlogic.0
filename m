Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C273AC6FD19
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Mar 2023 07:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rXvErsUF9+DxURx8scDbuXH2kv9hfMu/DRVdASCq5Jg=; b=rOtM2jYDQp0gUO
	rDuYrhvbJsoXFdvXYFHSeqUD16SLA/csMoTpEPXtt73XwV5ElZPbfK9CFVkHPm0XzH6CaTB5gWkYV
	8y0R7hkhb3Le3t4GKSFbnFY1nUebAUU23nQ+HxzXRPLZDMAX6phU58XDUevC5AHZNjgWt+h59FDXg
	hjC+/uxDDbRCIyVOIa7iXhEZiYoTJKpBBhKHaPe4il1lXMISCO/+hLj7Y7bs+zfNW3q4cCXRLtOGc
	XZOfs+YPjC7zm6XBHiges6nlvsmuKOCAJaoZ3//VOCK1i1QSiOgBDiEJPyUQbZwmVcNNf2VsZNkTW
	FzFTEke77VGFYZjkftoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbcw0-004ebH-Qg; Mon, 13 Mar 2023 07:49:32 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbcvp-004eYg-Mw
	for linux-amlogic@lists.infradead.org; Mon, 13 Mar 2023 07:49:23 +0000
Received: by mail-ed1-x530.google.com with SMTP id g10so15983161eda.1
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Mar 2023 00:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678693754;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5jZ1IbIr7Zjo01eYTloNIdK6OVrxZIVge0vl1sSC9YE=;
        b=lKQNsIjMsx98tsdY+JngqLf9AyXzUGO8cqatxvtWVsTbR6r5nN6/uDXGfra34R2yPr
         ExTyaEaXfbiC/Xfp4AiADZzIE93nZC5NDFQOPN0VHCJ3dX/bg5YjXEPps/gybYY2dj8s
         6OXDVt479ojVZZNpBrWUDG1HZ1I72OyDDaxMLSTFqWuFxs90y2/xhpgFRwq5Xx0heTF9
         hBAeF3csfwIwOnl8ASiROb758XRrSNEZ9aB7xCmUyZUnbxNat50vBQ5pK6pVOWyTLqVd
         aVMPazbdovrizIA0nVvpAq/m+GqEEzLU7l/0zpRmcW0mXBH/HWjVZ3nngur8fcNdmiTz
         Z7gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678693754;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5jZ1IbIr7Zjo01eYTloNIdK6OVrxZIVge0vl1sSC9YE=;
        b=bybXoXz/kop5PBJUubD5HwhRduakph1me7u7OkqwXBUKnvka38hb+OEhMP9h0zx6IB
         jK87xTvirm2czqzoeb33y5S69i0xwksQTp2/xX+08xnEkuM6AwAtadMHn3W9UEqpkpyO
         D7h1Erun7A6ujXEw0pxr8F5f6l8YcxxV9f5ErpNgbQ6baEmICh2Vp4rXx0E2Fgk9ooof
         YxVYspQ8ZoY5oixqtj5CBK7yw4YEc5KsVrmYa4ZElNdqIWDl34X+hTujuauCQWsZWCZE
         apf1hIj8e3ainyOq+CRSWr4ozhr1v31GYuLuYtR8IBbJCAFAxTSeghMSmNkfcM6xhukS
         PSYQ==
X-Gm-Message-State: AO0yUKULw+AP5S29k+Wxv+m/0SK4hLl/jGeCUi4N5NM1nW52YJysL+fh
	7BCm4n2wrs9Wu+KAlYv7srL8CA==
X-Google-Smtp-Source: AK7set/tvTnTSzZy6q1lJj4ECVHedAf0H9uyNqrDdZ/WinBo8XXlu77jRfU2myjfTAFP3kuAx13E3w==
X-Received: by 2002:a17:906:304a:b0:8ab:4c4:d0f6 with SMTP id d10-20020a170906304a00b008ab04c4d0f6mr30733533ejd.56.1678693754381;
        Mon, 13 Mar 2023 00:49:14 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:f052:f15:3f90:fcb3? ([2a02:810d:15c0:828:f052:f15:3f90:fcb3])
        by smtp.gmail.com with ESMTPSA id p8-20020a170906140800b008d044ede804sm3083562ejc.163.2023.03.13.00.49.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 00:49:14 -0700 (PDT)
Message-ID: <ed2dc73d-d4cc-95fc-cd8b-52d37ebf149a@linaro.org>
Date: Mon, 13 Mar 2023 08:49:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RESEND v4] dt-bindings: pwm: Convert Amlogic Meson PWM
 binding
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 linux-pwm@vger.kernel.org,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <3edc5ba6-bf3d-e45b-377a-9e7ece7642a7@gmail.com>
 <20230310181135.kiajexld3v655tph@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230310181135.kiajexld3v655tph@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_004921_795995_0C7149D1 
X-CRM114-Status: GOOD (  17.03  )
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

T24gMTAvMDMvMjAyMyAxOToxMSwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gT24gTW9uLCBG
ZWIgMjAsIDIwMjMgYXQgMTA6MTk6MzBQTSArMDEwMCwgSGVpbmVyIEthbGx3ZWl0IHdyb3RlOgo+
PiBDb252ZXJ0IEFtbG9naWMgTWVzb24gUFdNIGJpbmRpbmcgdG8geWFtbC4KPj4KPj4gUmV2aWV3
ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4+IFNpZ25lZC1vZmYtYnk6IEhl
aW5lciBLYWxsd2VpdCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+Cj4+IC0tLQo+PiBTZWVtcyBwYXRj
aCBnb3QgbG9zdCBvdmVyIHRoZSBxdWVzdGlvbiB3aG8gdGFrZXMgaXQuCj4+IFBsZWFzZSBhcHBs
eSB0aHJvdWdoIHRoZSBwd20gdHJlZS4KPiAKPiBIbW0sIEkgZm91bmQKPiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1wd20vYWFhNzM5MDMtMTgzNy1kOWM4LThjNDUtNTRiNDQ3M2ZkNTQ4
QGdtYWlsLmNvbQo+IHdoaWNoIGhhZCBubyBSZXZpZXdlZC1ieSB0YWcgd2hlcmUgS3J6eXN6dG9m
IEtvemxvd3NraSByZXBsaWVkIHdyaXRpbmc6Cj4gIllvdSBnb3QgaGVyZSBhIHRhZyBhbmQgbXkg
Y29tbWVudCB3YXMgYWJvdXQgbWlub3IgaXNzdWUsIHNvIHBsZWFzZSBrZWVwCj4gdGhhdCB0YWcu
IiBJIGRpZG4ndCBmaW5kIGEgdGhyZWFkIHdoZXJlIHN1Y2ggYSB0YWcgd2FzIGdpdmVuLCB0aG91
Z2guIEkKPiBvbmx5IGZvdW5kIGEgcmV2aWV3IHJlcGx5IG9uIHYzIHdoZXJlIEtyenlzenRvZiBy
ZXF1ZXN0ZWQgYSBjaGFuZ2UgKGFuZAo+IGRpZG4ndCBwcm92aWRlIGEgdGFnKS4KPiAKPiBUaGUg
UmV2aWV3ZWQtYnkgdGFnIGZvciBSb2IgcHJvYmFibHkgb3JpZ2luYXRlcyBmcm9tCj4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcHdtLzIwMjMwMTMwMjEyMTIxLkdBMzQ2ODEwMC1yb2Jo
QGtlcm5lbC5vcmcvLgoKWWVzLCBSb2IgcHJvdmlkZWQgdGhhdCB0YWcuIFNpbmNlIGl0IGlzIGlu
Y2x1ZGVkIGhlcmUsIGxvb2tzIGZpbmUuCgo+IAo+IEFuZCB0aGVyZSBpcyBhbm90aGVyIHZhcmlh
bnQgd2hlcmUgdGhpcyBwYXRjaCB3YXMgcGFydCBvZiBhIHNlcmllcyBhdAo+IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xpbnV4LXB3bS81YjgzNzY3ZS1jNTNkLTMxNmYtZGYxMC00NWEzOWRiZDlj
ODhAZ21haWwuY29tCj4gd2hlcmUgaXQgZ290IGFuIGFjayBmcm9tIG1lIHdoaWNoIHdhc24ndCBp
bmNsdWRlZCBoZXJlLgo+IAo+IFRvIGZpeCB0aGlzOgo+IAo+IEFja2VkLWJ5OiBVd2UgS2xlaW5l
LUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgo+IAo+IGJ1dCBwbGVhc2Ug
bm90ZSB0aGF0IHlvdSBjYW4gc2F2ZSBzb21lIHNjYXJjZSBtYWludGFpbmVyIHRpbWUgaWYgeW91
J3JlCj4gbW9yZSBjYXJlZnVsIGhlcmUuCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
