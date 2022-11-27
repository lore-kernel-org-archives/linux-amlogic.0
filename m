Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87720C46467
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Nov 2022 13:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3cgr1Bm+52wBtvTfUlufTEYC6FhiWaiHPDSwtXYMobQ=; b=jw85gICF3hadLB
	TZDJeJK6wMDLGz5kn2WTRb8nNwWHezMBNrX1/EH1Jqo0NHbs7HIO3DRnwl00GljKKk1y+BQo3ymQH
	+jeaHzycttQCtadmhGsrK6HBWdlafiJ8LrFjYWSW9vC5dpg/1sXbcf86MitaTotPQpRbMVSm2Tj2S
	zDnD2BvbOsFg5ZQLoI1tSoTTqct3hcWukGIYK4gyDZqPw2ohol8Ur7CbLeCsc4xp69GQ+upSHjBgq
	qJx75x5kblud2m+qMsjpdAveKpN2CBpuBtli+JEa/6dIElVL8U9vWA0WHOeeFdld/bY0b3bXhze4/
	+A1sVBx/thjF9s2+z8hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozHnA-00BPJA-7j; Sun, 27 Nov 2022 13:33:56 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozHmz-00BPC1-PU
	for linux-amlogic@lists.infradead.org; Sun, 27 Nov 2022 13:33:48 +0000
Received: by mail-wr1-x432.google.com with SMTP id x17so12996930wrn.6
        for <linux-amlogic@lists.infradead.org>; Sun, 27 Nov 2022 05:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hg/2EU+buogzSqoelI9afCNbICE9qEW32jUEItbW9t8=;
        b=LgdbEr0YYr3yeSEJ8Y/zKSVMO2/ME2GhJZHozXfA9cjTpzHIPxD7/dpJkMefwv1Khw
         fhB9AtIzWUL7AJC+ObTaZ+CvtU/sr8BpO+OuKbj+tBFD0eDN893QqnFmM5rfyOHpw5/6
         T7GwkaUuLHDIPUVpy7cqF6IIUn7Bic4JOab9F2d9JqUai7JgeReqLS0IlgOUe8KVzJbD
         zBJev9lRenRuI1l+IFHMxApI8ab2R+3iQEugX6HvyFGjzmNCfkoybTM/TPZDbNKxCfkz
         un0/POOJ4dGDRfo+1qWbeXoTek/+j1HZehhqey4dVjDbDf/YkQbhoMArE/L/NvweGshM
         dQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hg/2EU+buogzSqoelI9afCNbICE9qEW32jUEItbW9t8=;
        b=AddRwsFw25Q3J38em+cvKVoWLxyntxLSZ2QkQSUlNIBeYjhpmRvzTjExXcxcOSbMYJ
         u66SkE0UxSQHuyqA+qCZR01Ap71tL/n1Sid78Oe0MPF/MqD0/lnah+ALJiuwE4JGy5nN
         M/HtWXnmZvHMGjPibTZ+Qlb1UncaQguxCayKcY7httPWPCsTNi7VmwnqeboccituIBTy
         IqNx5W+YlGclbiEa3NzXjExXhxYePH4VF1ofifPjgFgU/K0jChQAZ8qwBdwlvJjAkpSt
         h5SA23m71oQNTn/alHFD3Q+14DCQ+trtPJW/1Wcl5+vJO2b6f2eFxl4n5i446n6HZQ2f
         I05w==
X-Gm-Message-State: ANoB5pm354sECdMFzJDnDmSexM/T7g4hQ4/ZdGSj5AnxrGSU9AL50wEH
	2sdevt3wtLRj1Y4d9q+Gp+6gwQ==
X-Google-Smtp-Source: AA0mqf6B8T4sysHqbVRfj3HQ8EoZ4WpBbUsWQcUE4DXv48X1Ubfz0bcfS4kFb7AMLHzB32sMuKZr2w==
X-Received: by 2002:adf:de03:0:b0:236:c820:97e6 with SMTP id b3-20020adfde03000000b00236c82097e6mr28000618wrm.215.1669556022263;
        Sun, 27 Nov 2022 05:33:42 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:9475:5832:6c06:e04d? ([2a01:e0a:982:cbb0:9475:5832:6c06:e04d])
        by smtp.gmail.com with ESMTPSA id x10-20020a05600c21ca00b003a6125562e1sm10961953wmj.46.2022.11.27.05.33.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 05:33:41 -0800 (PST)
Message-ID: <a3b7e1f0-16cb-4284-c740-5b5874612ea4@linaro.org>
Date: Sun, 27 Nov 2022 14:33:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH] arm64: dts: amlogic: align LED node names with dtschema
Content-Language: fr
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221125144141.477253-1-krzysztof.kozlowski@linaro.org>
 <3719828c-0ac5-34c9-a04b-251cbeb5f6ef@linaro.org>
 <a135f93a-235a-27b8-f649-69d62f6ebd30@linaro.org>
 <54f500cb-d7d0-8af1-eb58-99fbe71791a5@linaro.org>
 <CAB6niQ4808JEgdQEvRvaYqq8YmFCGo_YLnxXo+rjpSgxQxu+7g@mail.gmail.com>
 <615eb86b-a00a-56bc-ae1a-9f0e4e86f77c@linaro.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <615eb86b-a00a-56bc-ae1a-9f0e4e86f77c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_053345_832078_C6A3F303 
X-CRM114-Status: GOOD (  11.95  )
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

CkxlIDI3LzExLzIwMjIgw6AgMTM6MjUsIEtyenlzenRvZiBLb3psb3dza2kgYSDDqWNyaXTCoDoK
PiBPbiAyNi8xMS8yMDIyIDE3OjAzLCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPj4+Pj4gUmV2aWV3
ZWQtYnk6IE5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPgo+Pj4+IEFy
ZW4ndCB5b3UgbWFpbnRhaW5lciBvZiB0aGUgcGxhdGZvcm0/IFRoaXMgbWVhbnMgSSBzaG91bGQg
dGFrZSBjYXJlIG9mCj4+Pj4gdGhpcyBwYXRjaD8KPj4+IEFoLCB0aGlzIHdpbGwgYmUgcGlja2Vk
IHVwIGJ5IEtldmluIG9yIEplcm9tZT8gU28gdGhpcyB0YWcgbWVhbnMgb25seQo+Pj4gUmV2aWV3
ZXIncyBzdGF0ZW1lbnQgb2Ygb3ZlcnNpZ2h0LCByaWdodD8KPj4gT2YgY291cnNlIEknbGwgcGlj
ayBpdC4KPj4KPiBTbyB0aGF0J3MgY29uZnVzaW5nIHRvIHNlZSBSZXZpZXcgd2hpY2ggZG9lcyBu
b3QgbWVhbiByZXZpZXcsIGJ1dAo+IG1haW50YWluZXIgcGljay4uLgoKUmV2aWV3ZWQtYnkgbWVh
bnMgcmV2aWV3ZWQsIHRoZXJlJ3Mgbm8gY29uZnVzaW9uIGhlcmUsIHRoZSBzaWduaWZpY2FuY2UK
aXMgY2xlYXJseSBkb2N1bWVudGVkIG9uIGh0dHBzOi8vZG9jcy5rZXJuZWwub3JnL3Byb2Nlc3Mv
c3VibWl0dGluZy1wYXRjaGVzLmh0bWwKCj4KPiBSZXZpZXdlZC1ieSBtZWFucywgSSBzaG91bGQg
dGFrZSB5b3VyIHRhZyBhbmQgYWRkIHRvIHYyIG9yIHRoZQo+IG1haW50YWluZXIgd2lsbCBhZGQg
aXQgd2hlbiBwaWNraW5nIHVwLgoKUmV2aWV3ZWQtYnkgbWVhbnMgcmV2aWV3ZWQsIGZ1bGx5IHJl
dmlld2VkIHBhdGNoZXMgYXJlIHJlYWR5IHRvCmJlIHBpY2tlZCB1bmxlc3MgYSBjaGFuZ2UgaXMg
YXNrZWQgYnkgYSByZXZpZXdlci4KCkRlY2lzaW9uIHRvIHBpY2sgb3Igbm90IGEgcGF0Y2ggZG9l
cyBub3QgZGVwZW5kIG9uIGFueSB0YWdzLCBidXQKaXMgdGhlIHNvbGUgZGVjaXNpb24gb2YgdGhl
IG1haW50YWluZXIgYWRkaW5nIGl0J3MgU2lnbmVkLW9mZi1ieS4KCldoaWxlIEkgdXNlIEFja2Vk
LWJ5IHRvIHNpZ25pZnkgYWNjZXB0YW5jZSB0byBvdGhlciBtYWludGFpbmVycwpvbiBmaWxlcyBJ
IGF1dGhvcmVkIG9yIGZpbGVzIEkgbWFpbnRhaW4gYnV0IGNhbm5vdCBwaWNrLCBoZXJlIEkgZG9u
J3QKbmVlZCB0byBzaWduaWZ5IGFjY2VwdGFuY2UgdG8gbXlzZWxmLgoKTmVpbAoKPgo+IEJlc3Qg
cmVnYXJkcywKPiBLcnp5c3p0b2YKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
