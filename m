Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 722D5C77B73
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 May 2023 07:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LWYHyPqUABLauEzF1wfIkiVkmd3HBCLjtpYKfD21qe0=; b=NikpKh2iQsgqBaT4kKogkDTYpc
	3LBTD6vyYm3EARDb+1HI8jPr80upJM/m7NAaIfanYi0sBKO1hgjR0vjEq3amNdyOCQXSTetbkGemf
	YHlGcimscCZZOKuzlgT5uzL2MfICw26QvhsN4lbmYlBRExzvZw2Gpi4yss3+5KPezSUd8USF1E/AY
	HKY5kL8evXZ0yW1bLogQoEzgVhBIVQzbWdHNvB+oZO44WxD2+dvezvFlhBVYhOuzypGrDcW6IrKH3
	zC/HpYDddee/gkKJK0e/cpqJUWL53aH3VvO6KTH9SUkQ7Ncs28OIbc53EIN0P1Ul4AXvZhlYSDB7k
	MumHRQOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptkLK-000T12-2Y;
	Tue, 02 May 2023 07:22:34 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptkLG-000SzI-2e
	for linux-amlogic@lists.infradead.org;
	Tue, 02 May 2023 07:22:32 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3f19b9d5358so33333655e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 02 May 2023 00:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683012146; x=1685604146;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cfc3shu25VAQBLjR0CRWBWzFrWGG2Jfrb9akd4uF1fc=;
        b=b0Fed6b+eCmT8cV3xr3wlG4FF8mw3G/wDBEk06E4EJlwgGLdhjYYmaTHanorpuU5xU
         SAUybqW0SFDeWqgmj1Gbu+Ho+8CS0HQ57uAlfCfb14Feln32WDvAvTJgQMi2ZwzaewIl
         RQJ9MpLuwcJOULjBA+YC1gbkJcJmyLeTpSNciXhFkctHhbFjVsefgxDrVL3v0BA6DSqA
         WdgpWxxAWEmJxANsrf35sLT07alHX99MNorU34Kd7N5u9RnLC/LbHn2LydQPh798aFwW
         HsOKvEQwFDTzAh60j/TiLHoh7x/JvuTl0NybV4G+9DpvDzf22aQ+YUQqT1NHnUCiZFJ8
         Kslg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683012146; x=1685604146;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cfc3shu25VAQBLjR0CRWBWzFrWGG2Jfrb9akd4uF1fc=;
        b=g8VPmBg3rkYQ6f9wzFVjCN9CU3pFDJQJ+GLbPmyuOIcNCdaKz4m6ngpM7fXwRnqmh7
         QQWnyU7CvNy82OJxMALQ8RMsFcoJxKSQItMBWYFPBDzjQd2EDyMKxY5LDCpcgOhOfeqt
         tZFpLArlGN547hhDZg2JNz/yQQHKrbVnG6l9CGbDwWayFvEp+gm3VnGp2K6nWlj3w7Du
         SDsjHXyms4Y5puE/m9d29RvJPP+68s1cirAnQa+S9DRk1w8vzaduw/DvA5hRasMQQ+7w
         0+YPbT6IpCozIg78P5apWCoVOO6R8UqeTjqEGslaVQaLbtpz3qo+EbqCuPrjchoaJEdk
         090Q==
X-Gm-Message-State: AC+VfDwom7nmzOc574PValSae+Plaxsj8j6f0MKi7Jo7RlIBvUNgCiHh
	ZmDQmWWHYEln2bj11tXM+Tu0lnMAFm/efVn+mxDk4g==
X-Google-Smtp-Source: ACHHUZ6Ty7St5+Sjn/T8sAFgQsPINWtfyPc/hBOGyfBpwxQPyOXrdrAjjcNqquluIL42F0ajaoYRKg==
X-Received: by 2002:a7b:cb85:0:b0:3f1:7136:dd45 with SMTP id m5-20020a7bcb85000000b003f17136dd45mr11226104wmi.30.1683012146663;
        Tue, 02 May 2023 00:22:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:e265:b513:556a:4149? ([2a01:e0a:982:cbb0:e265:b513:556a:4149])
        by smtp.gmail.com with ESMTPSA id bi26-20020a05600c3d9a00b003eddc6aa5fasm34009357wmb.39.2023.05.02.00.22.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 00:22:26 -0700 (PDT)
Message-ID: <e7a8e78e-9e99-91fd-40a9-5cb8623f287e@linaro.org>
Date: Tue, 2 May 2023 09:22:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v5 2/2] arm64: dts: meson-gxl: add support for Xiaomi Mi
 box 3
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Karl Chan <exkcmailist@inbox.lv>
Cc: linux-amlogic@lists.infradead.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
 jbrunet@baylibre.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230425165624.11999-1-exkcmailist@inbox.lv>
 <20230425165624.11999-3-exkcmailist@inbox.lv>
 <CAFBinCA4c1qDC5=NWJKEMkTh5HfhkqpgrpetgEH3kJTY_qLVHA@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CAFBinCA4c1qDC5=NWJKEMkTh5HfhkqpgrpetgEH3kJTY_qLVHA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_002230_880379_820C8A44 
X-CRM114-Status: UNSURE (   9.59  )
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

T24gMDEvMDUvMjAyMyAxNDo1NCwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBPbiBUdWUs
IEFwciAyNSwgMjAyMyBhdCA2OjU34oCvUE0gS2FybCBDaGFuIDxleGtjbWFpbGlzdEBpbmJveC5s
dj4gd3JvdGU6Cj4+Cj4+IEZyb206ICJLYXJsIENoYW4iICA8ZXhrY21haWxpc3RAaW5ib3gubHY+
Cj4+Cj4+IFRoZSBYaWFvbWkgTWkgYm94IDMgaXMgYSBUViBib3ggYmFzZWQgb24gdGhlIEFtbG9n
aWMgUzkwNVggY2hpcHNldC4KPj4gVGhlcmUgYXJlIHR3byB2YXJpYW50czoKPj4gLSAyIEdpQi84
R0lCCj4+IC0gMSBHaUIvNEdJQgo+Pgo+PiBCb3RoIHZhcmlhbnRzIGNvbWUgd2l0aDoKPj4gLSA4
MDIuMTFhL2IvZy9uL2FjIHdpZmkgKEJDTTQzNDUpCj4+IC0gSERNSSAsIEFWIChDVkJTKSBhbmQg
Uy9QRElGIG9wdGljYWwgb3V0cHV0Cj4+IC0gMXggVVNCCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEth
cmwgQ2hhbiA8ZXhrY21haWxpc3RAaW5ib3gubHY+Cj4gUmV2aWV3ZWQtYnk6IE1hcnRpbiBCbHVt
ZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+Cj4gCj4gTm90ZTog
TmVpbCB3aWxsIHByb2JhYmx5IG9ubHkgYXBwbHkgdGhpcyAoYW5kIHRoZSBvdGhlciBwYXRjaCBm
cm9tCj4gdGhpcyBzZXJpZXMpIGFmdGVyIDYuNC1yYzEgaGFzIGJlZW4gcmVsZWFzZWQKCkV4YWN0
ICEKClRoYW5rcywKTmVpbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
