Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8427AC64EC4
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Mar 2023 08:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t6wtXsCxq+TEl4L0yx4dBcjdXbH9T/4A4RnncrONWXg=; b=UyUH0lxYF6r97ctwFPu4oThB/D
	1+G0ABBlrkpcfb6IlETDG7GiWGw/MnajRhfMpAEyivgqatKpLCILXe3mZmXHwiw4KVK6hQVioQCmT
	2B/ykOgdiKioDAHPKGFZDZVUAY8NB59htQUPn4wiwWY4JJYHYhuKA2alInku+GBdlM+kQ7JrG+ZxH
	AwoVOmW7olluQx4G0UoqZHGkVg479mQhTqUDDomlGYTMmjRmYfc9Dh6YENIFJm1ZcQQyyAqqn+p5o
	axUNZ8LACGHk/nfsfOlcuZpBJqzZUSfGwZfa7Qod3iaxlFamlF9lVLrPeTHd1JEShujy5DJukBMiz
	WlqXfTmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paYNn-00Dkr8-30; Fri, 10 Mar 2023 08:45:47 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paYNj-00DkpL-En
	for linux-amlogic@lists.infradead.org; Fri, 10 Mar 2023 08:45:44 +0000
Received: by mail-wr1-x436.google.com with SMTP id f11so4291483wrv.8
        for <linux-amlogic@lists.infradead.org>; Fri, 10 Mar 2023 00:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678437941;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=a5HfvYhncPc5WkXrx7TXneqdnHtHjSlY0/csmSTBCvo=;
        b=d5DjCqtS1+wN5j6vUJj7e3Eh3ats3MfHXSD61no9fO/w96/O2QtOiJgXFVhIiqxDcH
         zS9jLB7ReWNugjGwREbBgZqmSkUg9imCpwV1NN3LKCtr2O+E/1fSHNNMcz3yPcO2djRS
         SZQZcKbtFzA5Z0hFKeHuWZBvED7P8ADQRDUkskjd25TWB1ixPiXeluhVoIaMt86xPCE1
         fs1oCox37wkeJL55NerrEfOMPh1Xqxu/HvSaomnTgZN59R67im5Cy1WxYgcqWXhjug+L
         RaEoNuvPZQOeyCh1RdZdCphyM+7nvUGpj8t7BgzdYUFO9fW7rhJYvkLn7pPgkoyTSK/p
         77EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678437941;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a5HfvYhncPc5WkXrx7TXneqdnHtHjSlY0/csmSTBCvo=;
        b=zZnBj5r4hxox7NQkEG+VNu2GB93xMVEWqCia3ZhnaOnxPCQ5dNA/pDadQIiPsfUIlD
         8DH5a4i81/6C4DUNJtlomUHYirLgLyFoCFxmMUCWLf4jnICR/QxG0A1kXNep9loP/GbS
         6A2vvzqmq4MYLj7fd2WqyyibsDx+kpcujWfmlgBV20S96JfGoQZEu/C/+RBmjZnPDABv
         wUAk8LLZuNz8ObZSafmvW8bOgvah/G8zCmL2aMzmjswE5Twl8drYNJ0GA/RNDnLSMw3p
         lIidhfR5G2t7k8cj2YBy7NynybUzX3IyaNyyIV5yBL1mjVXhaTrr6uXXTqXmRt7em0Oe
         4kPg==
X-Gm-Message-State: AO0yUKWMWvysKOCxB8cK4pqW0s5gegeP3MVr9lSdrqYZUOs3QCYmb6QU
	zSzF79rRM0NJ7aSjE09tpg/1qA==
X-Google-Smtp-Source: AK7set8UnLvEQ6jzYl0bMA8Ja77/zqGkBDrnSBl43cDzrY0EJHmrPi2vPwdTN7pXsULDyM93kionLg==
X-Received: by 2002:a05:6000:110d:b0:2c5:4c0e:3736 with SMTP id z13-20020a056000110d00b002c54c0e3736mr16024988wrw.24.1678437941380;
        Fri, 10 Mar 2023 00:45:41 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:566:5b64:c228:1137? ([2a01:e0a:982:cbb0:566:5b64:c228:1137])
        by smtp.gmail.com with ESMTPSA id s8-20020adfdb08000000b002c70d97af78sm1513245wri.85.2023.03.10.00.45.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 00:45:40 -0800 (PST)
Message-ID: <1ef5f606-ffe5-eefb-c3fe-e81093e1a35b@linaro.org>
Date: Fri, 10 Mar 2023 09:45:39 +0100
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
X-CRM114-CacheID: sfid-20230310_004543_514363_0F1D3B94 
X-CRM114-Status: GOOD (  15.49  )
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
LT5oZG1pdHhfYXBiID0gZGV2bV9yZXNldF9jb250cm9sX2dldF9leGNsdXNpdmUoZGV2LAoKSSds
bCBuZWVkIHRvIHdhaXQgdW50aWwgdjYuMy1yYzEgaXMgYmFja21lcmdlZCBpbnRvIGRybS1taXNj
LWZpeGVzIHRvIGFwcGx5IGl0LgoKVGhhbmtzLApOZWlsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
