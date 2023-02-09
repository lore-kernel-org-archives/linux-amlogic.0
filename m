Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C3AC05027
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Feb 2023 06:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zOHw6UMD4y52fDLRbSKS5hYklhkDQUoyO9N9N1x195Q=; b=RNgySEzSOh/uyV
	cJs6B92uiu/AR1rDbF+nJFks14eh0jf6wXvzRgRrFJIPx4t8VPyH3FO/IMhHPMCiNekSeOFYgOSkY
	xnvAP7B9RRlnzUC0Uei2Wk+QU59WP13Ovs4v/w7oqh1d3vnpnJNlDa/Bj0YaQ5Vp9kBg4zDdNsd7A
	y1TGNV5/d7Yc0rQ18dYqKb+VEZkSi1K44HiNM+A+lqIDapAnYR7LJ/Ug3HULWEv3xpV9VGdnrC/dh
	l19JBpvWBLV4wWlDf2iGFaM+gOwnCQvFODCKmj3uwa7XvnY2U8INZH1Ex420sDfAWe1SQqjGQ0ktI
	Ue0XOnyLvZfY5c/t+HPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ0fS-000IWD-Fp; Thu, 09 Feb 2023 06:44:26 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ0fF-000ITa-Ob; Thu, 09 Feb 2023 06:44:15 +0000
Received: by mail-ej1-x636.google.com with SMTP id sa10so3428411ejc.9;
        Wed, 08 Feb 2023 22:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pl8UfXfXOcA268c1AF2tJc6nqx7sCR8O8aA51K5pIto=;
        b=TVBr3VGjYOGs7MpwFOeDbFUnYqCWQD10w+iWtTaIFp0KVBpPJh0orTL9yUGg0WnzLi
         ++9eGJIVK+WKAGFnyFRC20e5YpZe2VxTWzXALUJvT/gLfU09dFnimP4WIm+7hfitlitu
         pa9b5Fsxn4gMnVsD40FmYyhzpI9lr77yalzAxk5RrW7RkK76bp3FICB960bvISRDonus
         m44ijYqKFXgjidATNCUDoHo0KWlHcZtfiyAG0Oct2UZ1RTSIgLMA7NvEPEZBzuRRGvEy
         VhZrYRLYkuYEYlP5lETsVplpeXYLVrPov9bQv76GP0MrMh8xfpgdGB1qdxBoBQGJ98KA
         HF7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pl8UfXfXOcA268c1AF2tJc6nqx7sCR8O8aA51K5pIto=;
        b=ivjO4KLs22hZuteVW5kn98bmntv/pMwpud8znhsui/Eoel208iRHA/BzaTJE1zbCa3
         JExxPWLnIpe5NXXdKqZmcB6nwZ+LhAEYDKieWpk+hU3ULZAC7QAsxsJar+WKK33sj6TN
         WzNkZdRHe5NeRTTS1prFEcBf8RZX8CcoycCg431ERasAfFcjPpII9Ujt4K72ctuXF9ws
         /rGYIEE01yBPeXVhb35tfggRzrgkGPMRfp/NEdl7n0jYpHX5NU6vwdH+kH++1TMBjA5K
         a77ylIjDKFPcXa9LFFvab+gKyHbzd5gdl/ssh2YeY2KBS+1wxwTd806wSeUNI+ve0LMm
         lPbw==
X-Gm-Message-State: AO0yUKV8K3VBAKzvRPnQ3xmGV+k85k/PKa09mxgCKxAzkF0iMwT2sJW7
	8AcGZk32qMzmdMJyOAyXyeo=
X-Google-Smtp-Source: AK7set8hdbPpp6+k2+Ssl4gYlQA1mqAcm/Hp514iOGifcna6ZJbKJxaFzF4g2Jj6qIPWvJ7x8DAyQw==
X-Received: by 2002:a17:906:3155:b0:87b:d597:1fd5 with SMTP id e21-20020a170906315500b0087bd5971fd5mr12219656eje.75.1675925050659;
        Wed, 08 Feb 2023 22:44:10 -0800 (PST)
Received: from ?IPV6:2a01:c23:c4df:e300:e1c2:7c84:c05c:ad3d? (dynamic-2a01-0c23-c4df-e300-e1c2-7c84-c05c-ad3d.c23.pool.telefonica.de. [2a01:c23:c4df:e300:e1c2:7c84:c05c:ad3d])
        by smtp.googlemail.com with ESMTPSA id v16-20020a170906381000b00889a9444e29sm472379ejc.14.2023.02.08.22.44.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 22:44:10 -0800 (PST)
Message-ID: <4dfc29ef-4d88-f899-3f96-fded32f5736f@gmail.com>
Date: Thu, 9 Feb 2023 07:44:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2] arm64: dts: amlogic: Make mmc host controller
 interrupts level-sensitive
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <d9721029-780e-09f1-0207-72d3897032a4@gmail.com>
 <f06d1676-4fce-846d-d8fe-fa68439b119e@linaro.org>
 <84d40502-fe1a-ef61-e945-9c581557f528@gmail.com>
 <61db3f1c-b780-4385-f991-ebb4c3423791@linaro.org>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <61db3f1c-b780-4385-f991-ebb4c3423791@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_224413_819987_C487C938 
X-CRM114-Status: GOOD (  18.58  )
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

T24gMDguMDIuMjAyMyAxMzo0MCwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gTGUgMjcvMDEvMjAy
MyDDoCAxNDowMiwgSGVpbmVyIEthbGx3ZWl0IGEgw6ljcml0wqA6Cj4+IE9uIDI3LjAxLjIwMjMg
MDg6NTksIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+Pj4gSGksCj4+Pgo+Pj4gT24gMjYvMDEvMjAy
MyAxNTowMywgSGVpbmVyIEthbGx3ZWl0IHdyb3RlOgo+Pj4+IFRoZSB1c2FnZSBvZiBlZGdlLXRy
aWdnZXJlZCBpbnRlcnJ1cHRzIGxlYWQgdG8gbG9zdCBpbnRlcnJ1cHRzIHVuZGVyIGxvYWQsCj4+
Pj4gc2VlIFswXS4gVGhpcyB3YXMgY29uZmlybWVkIHRvIGJlIGZpeGVkIGJ5IHVzaW5nIGxldmVs
LXRyaWdnZXJlZAo+Pj4+IGludGVycnVwdHMuCj4+Pj4gVGhlIHJlcG9ydCB3YXMgYWJvdXQgU0RJ
Ty4gSG93ZXZlciwgYXMgdGhlIGhvc3QgY29udHJvbGxlciBpcyB0aGUgc2FtZQo+Pj4+IGZvciBT
RCBhbmQgTU1DLCBhcHBseSB0aGUgY2hhbmdlIHRvIGFsbCBtbWMgY29udHJvbGxlciBpbnN0YW5j
ZXMuCj4+Pgo+Pj4gVGhhbmtzLCBJIGFwcGxpZWQgaXQgaW4gZm9yLW5leHQgc28gaXQgcnVucyBv
biB0aGUgQ0kgdGVzdHMuCj4+Pgo+Pj4+Cj4+Pj4gWzBdIGh0dHBzOi8vd3d3LnNwaW5pY3MubmV0
L2xpc3RzL2xpbnV4LW1tYy9tc2c3Mzk5MS5odG1sCj4+Pj4KPj4+PiBGaXhlczogMTQ5OTIxOGM4
MGM5ICgiYXJtNjQ6IGR0czogbW92ZSBjb21tb24gRzEyQSAmIEcxMkIgbW9kZXMgdG8gbWVzb24t
ZzEyLWNvbW1vbi5kdHNpIikKPj4+Cj4+PiBJIHRoaW5rIHdlIHNob3VsZCBmaW5kIGEgYmV0dGVy
IEZpeGVzIG9yIHBlcmhhcHMgc3BsaXQgaW4gMyBzbyBpdCB0YXJnZXRzIHRoZQo+Pj4gcmlnaHQg
Y29tbWl0IGFkZGluZyB0aGUgbm9kZXMgZm9yIGVhY2ggZmFtaWx5Lgo+Pj4KPj4gVGhpcyB3b3Vs
ZCBiZSB0aGUgY2xlYW5lc3Qgb3B0aW9uLCByaWdodC4gUHJhY3RpY2FsbHkgaXQgc2hvdWxkbid0
IG1ha2UKPj4gbXVjaCBvZiBhIGRpZmZlcmVuY2UuIFRoZSBjaG9zZW4gY29tbWl0IGlzIGZyb20g
MjAxOSwgU0RJTyBpbnRlcnJ1cHQKPj4gc3VwcG9ydCBoYXMgYmVlbiBhZGRlZCBqdXN0IHJlY2Vu
dGx5LCBhbmQgcmVnYXJkaW5nIE1NQy9TRCBpdCBzZWVtcyBubwo+PiBwcm9ibGVtcyBjYXVzZWQg
YnkgZWRnZS10cmlnZ2VyZWQgaW50ZXJydXB0cyBhcmUga25vd24uCj4gCj4gSSB1bmRlcnN0YW5k
LCBidXQgdGhlIEZpeGVzIHRhZyBtdXN0IHJlZmxlY3Qgd2hhdCBjb21taXQgaW50cm9kdWNlZCB0
aGUgYnJlYWthZ2UsCj4gc28gZWl0aGVyIGtlZXAgYSBzaW5nbGUgcGF0Y2ggYnV0IGxpc3QgYWxs
IGNvbW1pdHMgaW50cm9kdWNpbmcgdGhlIE1NQywgU0QgJiBTRElPIG5vZGVzCj4gb24gdGhlIDMg
ZmFtaWxpZXMsIG9yIHNwbGl0IGluIDMgYW5kIHNwZWNpZnkgdGhlIGNvbW1pdCBpbnRyb2R1Y2lu
ZyB0aGUgTU1DLCBTRCAmIFNESU8KPiBub2RlIG9uIGVhY2ggZmFtaWx5Lgo+IAo+IEknbGwgcHJl
ZmVyIHRoZSBsYXRlci4KPiAKPiBJZiB0aGUgcGF0Y2ggaXNuJ3QgYXBwbGljYWJsZSBmb3Igb2xk
ZXIga2VybmVscywgaXQgZG9lc24ndCBtYXR0ZXIgYXMgdGhlIHN0YWJsZSB0ZWFtCj4gd2lsbCBv
bmx5IGFwcGx5IHRoZSBmaXggb24gYSB0cmVlIGlmIGl0IGFwcGxpZXMgYW5kIGJ1aWxkcy4KPiBJ
ZiB5b3UgdGFyZ2V0IGFuIG9sZGVyIHJlbGVhc2UgeW91IGNhbiBzdWJtaXQgdGhlbSBhIHBhdGNo
IHJld29ya2VkIHRvIGFwcGx5Cj4gY29ycmVjdGx5IGlmIHRoZSBvcmlnaW5hbCBwYXRjaCBpcyBh
bHJlYWR5IG9ubHkgTGludXMgbWFzdGVyIHRyZWUuCj4gCkRvIHlvdSBuZWVkIGEgcmV2ZXJ0IGZv
ciB0aGUgY3VycmVudCAiVEVTVCItYW5ub3RhdGVkIGNvbW1pdCBpbiBsaW51eC1uZXh0CmFzIHBh
cnQgb2YgdGhlIHNlcmllcz8KCj4gQW5kIGRvbid0IGZvcmdldCBhZGRpbmcgdGhlIFRlc3RlZC1i
eSB0YWdzLgo+IAo+IFRoYW5rcywKPiBOZWlsCj4gCj4+Cj4+PiBJZiB0aGUgdGVzdCBkb2Vzbid0
IHJlcG9ydCBhbnkgYnJlYWthZ2UsIEknbGwgcHJvYmFibHkgYXNrIHlvdSB0aGF0Lgo+Pj4KPj4g
U3VyZS4KPj4KPj4+IE5laWwKPj4+Cj4+IEhlaW5lcgo+Pgo+IApIZWluZXIKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
