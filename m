Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A01C433FE
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Oct 2022 12:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K18ZMCwbZwrT3PtoqQpx2wY+OC3BjsRKu8EzVNvNWS4=; b=a9e3bPE33BYfnK
	6nOFw2lActWVdep6teOWP0e64K9wW/mw1mGXuzHbZDhYc2gvSsliFydVtjkbxFzCStPRf8Ut/Dz3V
	EBCKpU0DHBc0OJ5vwMUgx1gvwdKNOFvX9uAeMr/EQHktzqbV/3B7O9m+YBQnognghRuKW2SE7Udql
	5HJ6MNSihHBdAwP6Rp9T/b8EZrJIpyLYXxqfOMfTNio0CUQGe28VK8CvEtkI6XmfHDnDEcW+7olhQ
	1OcQ7uBZuEk6WWbjoSCCskWInwvGZdFYpYj1EVqLaqkhCsA1AoihhkxaCnIwU7HlEqQehpJf/fv+G
	p7YTXDkAN7g9CXRhLltA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olrXi-007jfZ-EU; Fri, 21 Oct 2022 12:54:30 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olrXV-007jb7-H1
	for linux-amlogic@lists.infradead.org; Fri, 21 Oct 2022 12:54:19 +0000
Received: by mail-wm1-x32b.google.com with SMTP id az22-20020a05600c601600b003c6b72797fdso1890479wmb.5
        for <linux-amlogic@lists.infradead.org>; Fri, 21 Oct 2022 05:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dcJ0BXzywjnrhti2p9MqhHIKm9sRkuR/9GbeUPAwfiI=;
        b=wX+jp2ux54182Z8x2Qwm/qwDyhMnic5dnmOdyq4OJf4qq+urYKyfHlPxL/in0oa5oF
         4qLB2JlpciF4ApNRMDcWA7A4cyvRRbOdo0Lc3VCE9MEJ5VvAeQgBhrh7agYl9OS1dIef
         aj7xwk1SLPArT/0Nw7IMxsWhui2uWtgEl5krn5a38S3qeA4MPuGW1HrdF6BfPOJPQXgT
         sl3UZgW1GejlPA1sde8euEY8rnngkUHgXYVI88BzrsfK71/jJZq0c7XYMmlfQAwuadSM
         MalxMQBacmlBQDSQ7Y+5HuKVWIEb0gGqAUYGfWT0CM27tWmu1lMpCo53wxLxx3AQ0iEk
         fwQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dcJ0BXzywjnrhti2p9MqhHIKm9sRkuR/9GbeUPAwfiI=;
        b=erLIey2w/etDh1PIT8ixlaZUaVoWUI0xK0HpcyZcw6tU+v8usK8erioca9qUirwNao
         KSY7+6Fe7aaYNzHiGjJdJKTY9abUJ9S8EZr9TAh/Zu9jwQYEDeE06hqaOuMa5Nj8gADE
         7lEHLITthGt4uMSnKXlx8ksCLU73isfSD1Nv2+ZBqb84OgkJZYPWGhzE9f63mC4xH4WJ
         pxK/l5FVB6lauPCx4fcfFH5r95tMDvjGySV4OaXYpaEg4gREx76Vz7yRNdraZ0a/u2EZ
         4/7CFq7BpO7lObFHNoLSWh6MEhIx8WyV3AvUMV47/ZDyBDejMdcXho2boMXLZm3xfwLG
         6Z0w==
X-Gm-Message-State: ACrzQf1rFW3CaL5pmPnU+cW46j1whOd5izc0gfEWNq3hht8IgHapKPrD
	Ib4lBKesnVcC/ci/vKDZ+PwP0A==
X-Google-Smtp-Source: AMsMyM6kt3xg2Xdg1CINtQr1rmLE0ZAUwFgzhyCyK+jU6LLz4X4K28erCFd4qZOffTf1L/Q7a3BJYw==
X-Received: by 2002:a05:600c:198d:b0:3b4:a62c:a085 with SMTP id t13-20020a05600c198d00b003b4a62ca085mr32345777wmq.140.1666356852156;
        Fri, 21 Oct 2022 05:54:12 -0700 (PDT)
Received: from [192.168.0.20] (210.145.15.109.rev.sfr.net. [109.15.145.210])
        by smtp.gmail.com with ESMTPSA id o10-20020a1c750a000000b003b4868eb6bbsm3033961wmc.23.2022.10.21.05.54.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Oct 2022 05:54:11 -0700 (PDT)
Message-ID: <df1895c8-aec6-cada-e208-ccda8042860d@baylibre.com>
Date: Fri, 21 Oct 2022 14:54:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v3 1/2] spi: dt-bindings: amlogic, meson-gx-spicc: Add
 pinctrl names for SPI signal states
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 neil.armstrong@linaro.org, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>
Cc: Da Xue <da@libre.computer>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221004-up-aml-fix-spi-v3-0-89de126fd163@baylibre.com>
 <20221004-up-aml-fix-spi-v3-1-89de126fd163@baylibre.com>
 <d355ee40-5905-4d10-8300-81e9a63117ee@linaro.org>
 <dc918114-8b89-441b-5ba1-aaf3ae084860@linaro.org>
 <20c115e0-0acf-dac2-2a30-0f394fa513ab@linaro.org>
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
In-Reply-To: <20c115e0-0acf-dac2-2a30-0f394fa513ab@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_055417_576393_05D71FD6 
X-CRM114-Status: UNSURE (   9.51  )
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

SGkKCk9uIDEwLzIwLzIyIDE0OjQ5LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+Pj4+ICsg
ICAgICBwcm9wZXJ0aWVzOgo+Pj4+ICsgICAgICAgIHBpbmN0cmwtbmFtZXM6Cj4+Pj4gKyAgICAg
ICAgICBtaW5JdGVtczogMQo+Pj4+ICsgICAgICAgICAgaXRlbXM6Cj4+Pj4gKyAgICAgICAgICAg
IC0gY29uc3Q6IGRlZmF1bHQKPj4+PiArICAgICAgICAgICAgLSBjb25zdDogaWRsZS1oaWdoCj4+
Pj4gKyAgICAgICAgICAgIC0gY29uc3Q6IGlkbGUtbG93Cj4+PiBZb3Ugc2hvdWxkIGFsc28gZGVm
aW5lIGluIHN1Y2ggY2FzZSBwaW5jdHJsLTAgYW5kIG90aGVycy4KPj4gT2sgSSB0aG91Z2h0IGl0
IHdvdWxkIGJlIGNvdmVyZWQgYnkgdGhlIHBpbmN0cmwtY29uc3VtZXIueWFtbAo+PiBidXQgeWVh
aCB3ZSBzaG91bGQgYWxsb3cgcGluY3RybC0xIGFuZCBwaW5jdHJsLTIgaGVyZSBhc3dlbGwgYnkg
YWRkaW5nOgo+Pgo+PiAgICAgICAgICAgICAgIHBpbmN0cmwtMTogdHJ1ZQo+PiAgICAgICAgICAg
ICAgIHBpbmN0cmwtMjogdHJ1ZQo+Pgo+PgpJbiBzdWNoIGNhc2UsIHNob3VsZCBJIGRlZmluZSBw
aW5jdHJsLSBhcyBwYXJ0IG9mIHRoZSBpZiBzdGF0ZW1lbnQsIGFzIHNob3duIGJlbG93LAoKb3Ig
YmVmb3JlIGFsbE9mID8KClsuLi5dCgogwqAgLSBpZjoKIMKgwqDCoMKgwqAgcHJvcGVydGllczoK
IMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGU6CiDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGFpbnM6
CiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVudW06CiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAtIGFtbG9naWMsbWVzb24tZ3gtc3BpY2MKCiDCoMKgwqAgdGhlbjoKIMKgwqDCoMKgwqAgcHJv
cGVydGllczoKIMKgwqDCoMKgwqDCoMKgIHBpbmN0cmwtMDogdHJ1ZQogwqDCoMKgwqDCoMKgwqAg
cGluY3RybC0xOiB0cnVlCiDCoMKgwqDCoMKgwqDCoCBwaW5jdHJsLTI6IHRydWUKCiDCoMKgwqDC
oMKgwqDCoCBwaW5jdHJsLW5hbWVzOgogwqDCoMKgwqDCoMKgwqDCoMKgIG1pbkl0ZW1zOiAxCiDC
oMKgwqDCoMKgwqDCoMKgwqAgaXRlbXM6CiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gY29uc3Q6
IGRlZmF1bHQKIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBjb25zdDogaWRsZS1oaWdoCiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIC0gY29uc3Q6IGlkbGUtbG93CgpbLi4uXQoKUmVnYXJkcwoKQW1q
YWQKCj4gWWVzLgo+Cj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgo+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcg
bGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
