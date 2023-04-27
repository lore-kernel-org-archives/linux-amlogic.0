Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F8D6C77B61
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Apr 2023 12:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NELcEfpehvxgGEMFFD3pFAgwaEKG1OZid39Ycv+bSsU=; b=LhC8qGr1DPT53eufKfKwypZjA6
	Dx0hxi0n7z+bGJ3TCxG3DoJuuiPIBQrsHTBi8OjaiApz65ET7ksM/VSTnqXeh5XXnUqo2mFVxZJ99
	TbIZLmQEG9gr6bVwPfRP3CXiV+95O7BoAhoORwOeBdgUBHdyGzPiJdqGF+Jef6Tcj3+Z8S/ZE6R11
	GGdbVi5d6aFHHxV2x5nwpCgQMeEdvwSm74mKE54Amvhdhz1bB8C3o2xkaz0Eqp/NjalNuKM+2F/+K
	PQOeqV723XqQ+3OrkBePd4+53FOPw8MQTuuGHhz1yCMjEoujDj4jrgUU6AociCr/ZK0hpoJ4mTFfR
	PkLP3z/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ps17A-006ZyR-2J;
	Thu, 27 Apr 2023 12:52:48 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ps177-006ZwR-27
	for linux-amlogic@lists.infradead.org;
	Thu, 27 Apr 2023 12:52:47 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-94f3cd32799so1609909766b.0
        for <linux-amlogic@lists.infradead.org>; Thu, 27 Apr 2023 05:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682599962; x=1685191962;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=S7zteozI39e1f65YN+KzAHLQjEDIyO2L33ga1+sRYY4=;
        b=mCesDhSP3FewVqDSHL8uW6t62XOJs7Mm2UPiEwaNG1BQ3A+BJTogaTNooGq+Zqq8yx
         hgg738DXifPkOF9OvN2YxMQVdewpRO40p3/GCuBuzjYtQ+T0WSPShrTgw9CUs4vtqsMU
         /HANP9ecdASW/o9MRN1AfTEOJnMDLgdqwW08273ZPjgN6/xnaWxSFu03QIjBhubQlcmJ
         F5+pOy5eKt/0ZFAHMIut0AB4i8l7FPJSw7dW/HuS/TKVWM9b2DAhTMGVlhP7pmK76SC5
         wg3rJWOnWaLxuQKaYgB+MUW3cd6DWvR8/TDII532wGIJERpWPA0SPX9eGDgkLslHvLCZ
         F7Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682599962; x=1685191962;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S7zteozI39e1f65YN+KzAHLQjEDIyO2L33ga1+sRYY4=;
        b=AMQKW7F638v+3B12GibzrBR3Lo2OczTAmV6C97YJ2lORUcAA8zdd+4Lbs9tuL/l+BY
         w2r4OoLH6uwATN6QaJyO51vDGE3aBMi/EKbNwS8h+xmt8txIMGhBLGJotdveLg51q29T
         4+TMiEGgACSF16ATwt3G6/GxymXY/MyT9wQaQyLZyupX+dVwJwTz38zGNtqugy2eJRC7
         LoBOSAisFRqsJV2QkMYE3x6Q/XXefPbFBax89TtO7TZGktWsT0rGSRWR65+j9QbVQVyl
         5MEZhHRmanHJiIFyFoBlV+ti/reyDwOMEGX7D7hjX5gG/B/fEV8PyogjdR9RIWq6xmOM
         ZoaQ==
X-Gm-Message-State: AC+VfDyd+xORzMyybT8ibxV5t4ZoOrV1GpLJ6VFRD3DEItxo2Pg8oSpf
	h0o03YTtEUdKvN7Xhge6QOp2yw==
X-Google-Smtp-Source: ACHHUZ7C2fjLjPXdjFbhPrME9i5Fnu4UpIc98ohf679GmbE5etDN0uDNhkWQgrKRKJuMzV1PFyNPAA==
X-Received: by 2002:a17:906:5d0b:b0:95e:d468:c35f with SMTP id g11-20020a1709065d0b00b0095ed468c35fmr1494912ejt.57.1682599961882;
        Thu, 27 Apr 2023 05:52:41 -0700 (PDT)
Received: from [172.23.2.82] ([195.167.132.10])
        by smtp.gmail.com with ESMTPSA id q26-20020a170906941a00b0094f01aa9567sm9525405ejx.20.2023.04.27.05.52.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Apr 2023 05:52:41 -0700 (PDT)
Message-ID: <3d76d332-f1a4-d363-fcdd-b7f08afdd55b@linaro.org>
Date: Thu, 27 Apr 2023 14:52:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/meson: set variables meson_hdmi_*
 storage-class-specifier to static
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Tom Rix <trix@redhat.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, khilman@baylibre.com,
 jbrunet@baylibre.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230423145300.3937831-1-trix@redhat.com>
 <CAFBinCDQRwaTNLeHD973gD-g9aHOwnu+G+U2di7Tz17LPT2DXg@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CAFBinCDQRwaTNLeHD973gD-g9aHOwnu+G+U2di7Tz17LPT2DXg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_055245_695311_8BAACAD6 
X-CRM114-Status: UNSURE (   8.48  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMjMvMDQvMjAyMyAyMzozNiwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBPbiBTdW4s
IEFwciAyMywgMjAyMyBhdCA0OjUz4oCvUE0gVG9tIFJpeCA8dHJpeEByZWRoYXQuY29tPiB3cm90
ZToKPj4KPj4gc21hdGNoIGhhcyBzZXZlcmFsIHNpbWFpbGFyIHdhcm5pbmdzIHRvCj4gcy9zaW1h
aWxhci9zaW1pbGFyLwo+IAo+PiBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmVuYy5jOjE4
OToyODogd2FybmluZzogc3ltYm9sCj4+ICAgICdtZXNvbl9oZG1pX2VuY2lfbW9kZV80ODBpJyB3
YXMgbm90IGRlY2xhcmVkLiBTaG91bGQgaXQgYmUgc3RhdGljPwo+Pgo+PiBUaGVzZSB2YXJpYWJs
ZXMgYXJlIG9ubHkgdXNlZCBpbiB0aGVpciBkZWZpbmluZyBmaWxlIHNvIHNob3VsZCBiZSBzdGF0
aWMKPj4KPj4gU2lnbmVkLW9mZi1ieTogVG9tIFJpeCA8dHJpeEByZWRoYXQuY29tPgo+IFdpdGgg
YWJvdmUgdHlwbyBmaXhlZCAob3Igd2l0aCBhIGNvbW1lbnQgZnJvbSB0aGUgbWFpbnRhaW5lcnMg
dGhhdAo+IHRoZXkgY2FuIGZpeCBpdCB3aGlsZSBhcHBseWluZyk6Cj4gQWNrZWQtYnk6IE1hcnRp
biBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+CgpUaGFu
a3MsIGZpeGVkIHdoaWxlIGFwcGx5aW5nLgoKTmVpbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
