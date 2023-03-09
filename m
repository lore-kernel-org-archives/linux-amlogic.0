Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C28C64EC4
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Mar 2023 16:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MdN7VzWE7qGVQAhajM1ekybHrUmtN06mKFK+zl0BKiY=; b=t1IN0yEM1J15bsF5diJPY6VYMF
	NnqgaFHb1/Al6512InE0lsq/VdDUhEelaIHpi/mekdFGtGpGIzdbc+2ybjzI9t+jpuNTWHta2gGPC
	uAzquQ9m6rUfWxpjvHGRjiLH3373UPhtVK6qhj5u2NK0UczSpIkl/eu0kxLls5eBSsmBpRInEV19R
	KNWKyncsZR2RseU/Twt4h4nhFtBIs8gBgMhQ1ukwY9IJ73xH1Hpai3PnnuNsIIUv7wi/vIgOlSfyq
	2CBdWvIFBTdbVCmf1zFnDIgTiGkKOEVihrW+qlONiguRnA+4+UDD0yWRJ2/4Zx+IpAIuHdu98B1TI
	7Vmi/fiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paIpe-00BCbg-UB; Thu, 09 Mar 2023 16:09:30 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paIpb-00BCZB-G6
	for linux-amlogic@lists.infradead.org; Thu, 09 Mar 2023 16:09:28 +0000
Received: by mail-wm1-x334.google.com with SMTP id p16so1513806wmq.5
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Mar 2023 08:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678378166;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=baM3HjE9DHLDRhWVfhwj4CxYGrNduMCVIYgW3lJTrXk=;
        b=iaa/1vV1rmISH0Ji0xGX1OzifywbERYgyvuDecuzcJOkhUt4LmFcJUpILJWa4bnadW
         JRkFU61L6fCQU1oia8nnXtry9uhoYL7NCFdXs2CrKDXCvlIgvd8n7Odx8TK87Or57hAQ
         mKMUVWoMqD8nLBo4LZpAF3AH55oTY8FRfsRMmqsafX5k36uWJIVRRGl8mHez7IiqDe7o
         vimG3FTnFTJ4sZQHGMsd3i6wYpE2FdkpGLCY/jq6AhyVSTkP1uVatZjoAu5WG5plA9xz
         LKySpBsMjYqJQ8FXGsLu8A58gVsYy5MAwtUKlZ5v2re5OBisMlx6CFcFjrXu8nU1wzae
         blKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678378166;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=baM3HjE9DHLDRhWVfhwj4CxYGrNduMCVIYgW3lJTrXk=;
        b=RafC6Tvpp91fVK41F2s+7SaN4LAr5sY9rOBA7QXWzXuh+PURZTAEvgUvaUeFGkUkic
         3Yv/Zr2IUrH8wuJCIslAUkxZ7reeEHXokPniIfjXVmTYroEaFT9CDqIiO9O1Q9CbRc6x
         J1giYYRBLO3drdyjirc+lmo/jMJPQnW1g6pJdJaHdouwnRKnt1qYWWFnRdqWXOJ5Vzq9
         XFEZq0SDJ6MJ91rJtftc7gvFqsUyU1AhROj84TTywMYtIjKZCFvnOWBD/7tVABStmOFa
         3SgyqyV1ea1sGOeopcQkfU3i1ZKmOJCcadx5wzUxh3SP0fRmqjyGS9kJ+J+K3Sc6pQMN
         0PWA==
X-Gm-Message-State: AO0yUKUKQrdzH2h/5re4nUyfClZIb9bQmC4lQknfTJrytwPUaib2yrDG
	hViH3CtI9fB2KHNzsdG86VWWfA==
X-Google-Smtp-Source: AK7set9lWqVBezY8rlJKRdM/6lwliOySmAqXpeWCr+d3/Ss6zcbxSKWYzxPcdKzRhY/uCL02e259/w==
X-Received: by 2002:a1c:7417:0:b0:3eb:2b69:c3c4 with SMTP id p23-20020a1c7417000000b003eb2b69c3c4mr21108056wmc.36.1678378165794;
        Thu, 09 Mar 2023 08:09:25 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:9df7:bf3e:9813:995a? ([2a01:e0a:982:cbb0:9df7:bf3e:9813:995a])
        by smtp.gmail.com with ESMTPSA id p9-20020a05600c468900b003ebf73acf9asm338152wmo.3.2023.03.09.08.09.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 08:09:25 -0800 (PST)
Message-ID: <c0eecc5e-4ad9-b9ea-137c-903abfad849f@linaro.org>
Date: Thu, 9 Mar 2023 17:09:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/meson: dw-hdmi: Fix devm_regulator_*get_enable*()
 conversion again
Content-Language: en-US
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org
Cc: Matti Vaittinen <mazziesaccount@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Mark Brown <broonie@kernel.org>,
 =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>
References: <CGME20230309152453eucas1p28e1870593875304648243c9dead4b256@eucas1p2.samsung.com>
 <20230309152446.104913-1-m.szyprowski@samsung.com>
Organization: Linaro Developer Services
In-Reply-To: <20230309152446.104913-1-m.szyprowski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_080927_574589_7CB4CCC9 
X-CRM114-Status: GOOD (  15.50  )
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

T24gMDkvMDMvMjAyMyAxNjoyNCwgTWFyZWsgU3p5cHJvd3NraSB3cm90ZToKPiBkZXZtX3JlZ3Vs
YXRvcl9nZXRfZW5hYmxlX29wdGlvbmFsKCkgcmV0dXJucyAtRU5PREVWIGlmIHJlcXVlc3RlZAo+
IG9wdGlvbmFsIHJlZ3VsYXRvciBpcyBub3QgcHJlc2VudC4gQWRqdXN0IGNvZGUgZm9yIHRoYXQs
IGJlY2F1c2UgaW4gdGhlCj4gNjdkMGEzMDEyOGM5IEkndmUgaW5jb3JyZWN0bHkgYXNzdW1lZCB0
aGF0IGl0IGFsc28gcmV0dXJucyAwIHdoZW4KPiByZWd1bGF0b3IgaXMgbm90IHByZXNlbnQuCj4g
Cj4gUmVwb3J0ZWQtYnk6IFJpY2FyZG8gQ2HDsXVlbG8gPHJpY2FyZG8uY2FudWVsb0Bjb2xsYWJv
cmEuY29tPgo+IEZpeGVzOiA2N2QwYTMwMTI4YzkgKCJkcm0vbWVzb246IGR3LWhkbWk6IEZpeCBk
ZXZtX3JlZ3VsYXRvcl8qZ2V0X2VuYWJsZSooKSBjb252ZXJzaW9uIikKPiBTaWduZWQtb2ZmLWJ5
OiBNYXJlayBTenlwcm93c2tpIDxtLnN6eXByb3dza2lAc2Ftc3VuZy5jb20+Cj4gLS0tCj4gICBk
cml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHdfaGRtaS5jIHwgMiArLQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVz
b24vbWVzb25fZHdfaGRtaS5jCj4gaW5kZXggNTM0NjIxYTEzYTM0Li4zZDA0Njg3OGNlNmMgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2R3X2hkbWkuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19oZG1pLmMKPiBAQCAtNzE4LDcgKzcxOCw3
IEBAIHN0YXRpYyBpbnQgbWVzb25fZHdfaGRtaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3Ry
dWN0IGRldmljZSAqbWFzdGVyLAo+ICAgCWR3X3BsYXRfZGF0YSA9ICZtZXNvbl9kd19oZG1pLT5k
d19wbGF0X2RhdGE7Cj4gICAKPiAgIAlyZXQgPSBkZXZtX3JlZ3VsYXRvcl9nZXRfZW5hYmxlX29w
dGlvbmFsKGRldiwgImhkbWkiKTsKPiAtCWlmIChyZXQgPCAwKQo+ICsJaWYgKHJldCA8IDAgJiYg
cmV0ICE9IC1FTk9ERVYpCj4gICAJCXJldHVybiByZXQ7Cj4gICAKPiAgIAltZXNvbl9kd19oZG1p
LT5oZG1pdHhfYXBiID0gZGV2bV9yZXNldF9jb250cm9sX2dldF9leGNsdXNpdmUoZGV2LAoKQWNr
ZWQtYnk6IE5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
