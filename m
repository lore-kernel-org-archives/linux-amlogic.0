Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C730C61DA4
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Mar 2023 14:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+RTRv4Z8jwDYZjofatBsi8KNy3v7/V5vmR7xrapI3ZY=; b=z8X8oFxNy/MLL0
	zahyaXbBx7wF4ZD2/8Y5OjUKVwyLIT5uAH3L0jheFoiRR1/QUUs22Cr7Ys3iZXy/F9CYulBbvzdMk
	YQ8jT0KKlusJjxj+WyIiyU8osSqJITpFV9OndtCBWgsysxR/R1KnectbwjwGL3uQ4crkkaENSyidE
	7dhJOd+TGDGiO7jnVo2CzEo6sa7pqus8taPNg/b6sEPnUQ3oYKBiBq0BFUL9v2SIZY4YHEERjrBC2
	ZhasSMePftdpWL/HGO0ArmFqOOMLbc/ijCPnrobLbAet7qyqLwcvHjOzBtkRKgI/TXLqErHEKGXsS
	yJRYsJY1JZsInTBBkbfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYp9j-00AKnA-Tn; Sun, 05 Mar 2023 14:16:07 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYp9b-00AKkr-2y
	for linux-amlogic@lists.infradead.org; Sun, 05 Mar 2023 14:16:00 +0000
Received: by mail-ed1-x533.google.com with SMTP id cy23so28281612edb.12
        for <linux-amlogic@lists.infradead.org>; Sun, 05 Mar 2023 06:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678025755;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oaYWQsDCiMEerIaw7dOHXTP6aNCmcM9yYsYwMBjgWTo=;
        b=somdt7eCFBhFz4p5Fcw83vtP8kDwgksYd275RGqwFVBRz6Qgtoy4IhyFug/V02wYEH
         933pVJMdTKhTaNyNh2yUc8HdRzYAoECLeFeXmCDmqQtLgHXTT7/Hzhw5RyJk7EN/Qx6T
         Yt3JEuTZ+1s+yFO4LBpWjCg1/UVi/f45egBM5A+cL6kH8Cz/lmPqcF/wrU76TcuZoewz
         brjWrnAbbKGjaGfWz8MOoU7nnTVmVGnXNUDlehngOyY8/8yjXe1RK9TMhUUwRPAsC2JV
         rKIimdbE0emO94TyfAjRwEhBo6QBe7IKuXLCG+ALI19XWrlCUvQyEmcINv1hN4Ku7/6E
         IHNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678025755;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oaYWQsDCiMEerIaw7dOHXTP6aNCmcM9yYsYwMBjgWTo=;
        b=5dnwWbGkPv5M9+ZU3eOEOtZXU1duSWtnghOvGpbp2KVUvWNiYVrY2vSpYTqwX1CAzT
         qPlsT243BuZsT/cbExY/r2Pe4ftPIQw906pR8RuCwJm7SnS4HffqacXLmZZce4s0vSXF
         qEoJPhRo/ipe24KEHZlQULSEkrQqqSexp/edm+TiRY7h/tRUYgoXfbc+Zm+vXvhdufjI
         zLq09wjR8wG1tgj7DCxGQRixNjeoWCqhS9LklsYFqgcIismw9Anxno2roVAwYib7f/NP
         HoQ1dy7syYegAvr/s69xQhfF5fhojOXGkq5CYRDn2A6ZG01NK6ZRoGH/ydvi2MSYXD7q
         Drmg==
X-Gm-Message-State: AO0yUKXZpRki4pgrmTDBkQWXpgeluwsMqDnv2jyAIzDk6wQ6wQ5KzQVK
	sLO+2FqCN93vvYMMmsh6r1yPIg==
X-Google-Smtp-Source: AK7set+BgrmehdGCt23YQRzXQoQYxWkq2Jc6jPIS0i29bU4WQufydCFh3/GgV7ABlhrQjqtEnc+bDw==
X-Received: by 2002:a05:6402:3448:b0:4be:c6b:7436 with SMTP id l8-20020a056402344800b004be0c6b7436mr6291841edc.30.1678025755265;
        Sun, 05 Mar 2023 06:15:55 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:71e7:13d:1c29:505f? ([2a02:810d:15c0:828:71e7:13d:1c29:505f])
        by smtp.gmail.com with ESMTPSA id b30-20020a509f21000000b004a21263bbaasm3551737edf.49.2023.03.05.06.15.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Mar 2023 06:15:54 -0800 (PST)
Message-ID: <e52c4a1d-951e-8ce5-4aec-7f2b6d4c6c3a@linaro.org>
Date: Sun, 5 Mar 2023 15:15:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] arm64: dts: meson: add support for BananaPi M2S
 variants
Content-Language: en-US
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Linux Amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel@vger.kernel.org
References: <20230305132044.1596320-1-christianshewitt@gmail.com>
 <20230305132044.1596320-3-christianshewitt@gmail.com>
 <0d2184ee-679e-371e-8433-c38b22c97799@linaro.org>
 <9CC246C2-28A7-46DF-924F-8FBF5CDE16CA@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9CC246C2-28A7-46DF-924F-8FBF5CDE16CA@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230305_061559_135642_329DCB21 
X-CRM114-Status: GOOD (  11.72  )
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

T24gMDUvMDMvMjAyMyAxNDo0NywgQ2hyaXN0aWFuIEhld2l0dCB3cm90ZToKPiAKPj4gT24gNSBN
YXIgMjAyMywgYXQgNTozMCBwbSwgS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxv
d3NraUBsaW5hcm8ub3JnPiB3cm90ZToKPj4KPj4gT24gMDUvMDMvMjAyMyAxNDoyMCwgQ2hyaXN0
aWFuIEhld2l0dCB3cm90ZToKPj4+IEJhbmFuYVBpIE0yUyBzaGlwcyBpbiBBbWxvZ2ljIFM5MjJY
IGFuZCBBMzExRCB2YXJpYW50cyB3aXRoIHRoZQo+Pj4gZm9sbG93aW5nIGNvbW1vbiBzcGVjaWZp
Y2F0aW9uczoKPj4+Cj4+ICguLi4pCj4+Cj4+PiArCj4+PiArCWxlZHMgewo+Pj4gKwkJY29tcGF0
aWJsZSA9ICJncGlvLWxlZHMiOwo+Pj4gKwo+Pj4gKwkJYmx1ZSB7Cj4+Cj4+IGxlZC0wCj4+Cj4+
IERvZXMgbm90IGxvb2sgbGlrZSB5b3UgdGVzdGVkIHRoZSBEVFMgYWdhaW5zdCBiaW5kaW5ncy4g
UGxlYXNlIHJ1biBgbWFrZQo+PiBkdGJzX2NoZWNrYCAoc2VlIERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy93cml0aW5nLXNjaGVtYS5yc3QKPj4gZm9yIGluc3RydWN0aW9ucykuCj4g
Cj4gSeKAmW0gYnVpbGRpbmcgZXZlcnl0aGluZyBpbiBhIGNyb3NzLWNvbXBpbGUgYnVpbGQgc3lz
dGVtIHRoYXQgZG9lc27igJl0IGFsbG93Cj4gdGhpcyB0byBiZSBkb25lIHdpdGhvdXQgYSBwcm9i
bGVtIGFtb3VudCBvZiBob29wIGp1bXBpbmcuIEkgbmVlZCB0byB3b3JrIG9uCj4gYW5vdGhlciBh
cnJhbmdlbWVudCB0byBkbyB0aGlzIHRlc3RpbmcgKHdvcmstaW4tcHJvZ3Jlc3MpLiBUaGFua3Mg
Zm9yIHRoZQoKQ3Jvc3MgY29tcGlsaW5nIGtlcm5lbCBhbmQgcnVubmluZyB0aGlzIChhbHNvIGFz
IGNyb3NzIGNvbXBpbGVkKSBpcwp0cml2aWFsLCBzbyB3aGF0IGV4YWN0bHkgc3RvcHMgeW91PyBQ
YWNrYWdpbmcga2VybmVsIGZvciB5b3VyIHN5c3RlbQooZS5nLiBZb2N0bykgaXMgZGlmZmVyZW50
IHRvcGljLCBidXQgdGhhdCdzIGZpbmFsIHN0ZXAsIG5vdCBuZWNlc3NhcnkKZm9yIGRldmVsb3Bt
ZW50IG9mIERUUy4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
