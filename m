Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F819C433FE
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Nov 2022 07:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hPC28TLvVMINNKwSuwb9GpXgx291pDJ5cWajma/LgRc=; b=VnyrNeQPAslhMF
	fx1RHqpnbbWhs0w1J6fGYSHLAs0FBSJOvwLX62tKf8TDXXZJkPDKnFdhLI4xg6klIp4rqo9jLQ8Qg
	Y5RINLrq/20smNvWdQnIDLhaXH/pdgvqznChv8awCbwnlbZXVzZjaNqIdEBNh6f4r/sfopuTXXFU8
	e6kHGSayAN6UJ9B5XOxcjkOrcSWxGOoW0++MU5KL0pPTXdevU9TWct4/Pr1NMAqXmJiL5f7p/TbQk
	8VnyLorzHrPslzE+y36OI+jO0gzRawhVLZ5CGQZU+iBj3JRSrSIz+WOC+t0x0EeHEsLxycbB/9y5b
	tv0/McmkOnbPn/3+z/IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozYPA-00HCkN-53; Mon, 28 Nov 2022 07:18:16 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozYOv-00HCWL-Mw
	for linux-amlogic@lists.infradead.org; Mon, 28 Nov 2022 07:18:04 +0000
Received: by mail-wr1-x42f.google.com with SMTP id x17so15266720wrn.6
        for <linux-amlogic@lists.infradead.org>; Sun, 27 Nov 2022 23:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eG6Be3t23obGN2ATen8OVvK4rfTQoYDTZRglqML50dM=;
        b=poG5sOzFpRAXOKgMdrCfvvkeYKjQN58l3yG8Y0RXCFeucW9p7tCSm2XJDB/DM2Uwjw
         3/Y/na8LgamKOd7SmShUgO7J6B0oxo0mC3/UK16aji85NNE8emK0oIpso5ELBhGVu4bW
         sgaNaJbVk11x9JsZhsDDJzmF8yHn4GCmFdNkrdflrScLGBhbU92dXfgTDlhZRwWaR3Th
         WFHIN+Lf4JwcbjiLvKkRiUo+MHx1OIKsMpjn1ergLA5bSafz0z+WVyOjpd13JGT+gbLp
         dtJdFYD/kx0h98IMtd+SPaYDuIa/nkD2rTbLO0uJyIOJ07hjfTQFRKbZ7jYPrCWZUHOy
         wTnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eG6Be3t23obGN2ATen8OVvK4rfTQoYDTZRglqML50dM=;
        b=V9yIcdg+J7QQiw7azAJO50TYWTlW28haD8/V6mmIgrGYWel7yRaHwD/DrNWf1Tr5Mv
         68LP5An5aAx99wiEvSPeBkHkDxwI/P9H3o6fpT6UlDhsVSz/9ZGMghVfswDN8V8hIQuj
         kLPNHFOPLqvcelex8D8TmxWuOyGLUT623Nptfry/54okxWNhHDABNaiT0BesJIMAyIrw
         BeTvu4/DLxiV9irz2474Z8E9EyyN6rB/m93RIxeuIuZhJIaIkV4ucUNq8D7ue8CW/jXF
         IXOVPhGrfdyuI1YatldxuR2F5VbQE5QcBU+pVf5lvTVlnfgQB1r3f/54xn+2ycZVc51a
         7+Ug==
X-Gm-Message-State: ANoB5pml47EcHZh+EQ7cPaCvFCfS5vMijr1b3CH5Uz3hFbwHUiA9m2NK
	dwmvsreeU84yR4H6vYfHKcnN/w==
X-Google-Smtp-Source: AA0mqf6Pw15Eqs2pCDoN5k8uvi+hNG9DvT5YpbugugAhcBiKU7PpmSSF7GYVBfsCF2jNQBm6vp50Ag==
X-Received: by 2002:adf:eb92:0:b0:236:80a8:485e with SMTP id t18-20020adfeb92000000b0023680a8485emr22959279wrn.362.1669619863181;
        Sun, 27 Nov 2022 23:17:43 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:9475:5832:6c06:e04d? ([2a01:e0a:982:cbb0:9475:5832:6c06:e04d])
        by smtp.gmail.com with ESMTPSA id t2-20020a5d42c2000000b0023662d97130sm9879851wrr.20.2022.11.27.23.17.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 23:17:42 -0800 (PST)
Message-ID: <669d0399-dbc7-965a-9e50-017f017ca823@linaro.org>
Date: Mon, 28 Nov 2022 08:17:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH] arm64: dts: amlogic: align LED node names with dtschema
Content-Language: en-GB
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
 <a3b7e1f0-16cb-4284-c740-5b5874612ea4@linaro.org>
 <c89f9330-715f-4830-49fb-64c0b533ed39@linaro.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <c89f9330-715f-4830-49fb-64c0b533ed39@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_231801_794246_644C2772 
X-CRM114-Status: GOOD (  17.60  )
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

SGkgS3J6eXN6dG9mLAoKTGUgMjcvMTEvMjAyMiDDoCAyMDowNywgS3J6eXN6dG9mIEtvemxvd3Nr
aSBhIMOpY3JpdMKgOgo+IE9uIDI3LzExLzIwMjIgMTQ6MzMsIE5laWwgQXJtc3Ryb25nIHdyb3Rl
Ogo+Pgo+PiBMZSAyNy8xMS8yMDIyIMOgIDEzOjI1LCBLcnp5c3p0b2YgS296bG93c2tpIGEgw6lj
cml0wqA6Cj4+PiBPbiAyNi8xMS8yMDIyIDE3OjAzLCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPj4+
Pj4+PiBSZXZpZXdlZC1ieTogTmVpbCBBcm1zdHJvbmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5v
cmc+Cj4+Pj4+PiBBcmVuJ3QgeW91IG1haW50YWluZXIgb2YgdGhlIHBsYXRmb3JtPyBUaGlzIG1l
YW5zIEkgc2hvdWxkIHRha2UgY2FyZSBvZgo+Pj4+Pj4gdGhpcyBwYXRjaD8KPj4+Pj4gQWgsIHRo
aXMgd2lsbCBiZSBwaWNrZWQgdXAgYnkgS2V2aW4gb3IgSmVyb21lPyBTbyB0aGlzIHRhZyBtZWFu
cyBvbmx5Cj4+Pj4+IFJldmlld2VyJ3Mgc3RhdGVtZW50IG9mIG92ZXJzaWdodCwgcmlnaHQ/Cj4+
Pj4gT2YgY291cnNlIEknbGwgcGljayBpdC4KPj4+Pgo+Pj4gU28gdGhhdCdzIGNvbmZ1c2luZyB0
byBzZWUgUmV2aWV3IHdoaWNoIGRvZXMgbm90IG1lYW4gcmV2aWV3LCBidXQKPj4+IG1haW50YWlu
ZXIgcGljay4uLgo+Pgo+PiBSZXZpZXdlZC1ieSBtZWFucyByZXZpZXdlZCwgdGhlcmUncyBubyBj
b25mdXNpb24gaGVyZSwgdGhlIHNpZ25pZmljYW5jZQo+PiBpcyBjbGVhcmx5IGRvY3VtZW50ZWQg
b24gaHR0cHM6Ly9kb2NzLmtlcm5lbC5vcmcvcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMuaHRt
bAo+Pgo+Pj4KPj4+IFJldmlld2VkLWJ5IG1lYW5zLCBJIHNob3VsZCB0YWtlIHlvdXIgdGFnIGFu
ZCBhZGQgdG8gdjIgb3IgdGhlCj4+PiBtYWludGFpbmVyIHdpbGwgYWRkIGl0IHdoZW4gcGlja2lu
ZyB1cC4KPj4KPj4gUmV2aWV3ZWQtYnkgbWVhbnMgcmV2aWV3ZWQsIGZ1bGx5IHJldmlld2VkIHBh
dGNoZXMgYXJlIHJlYWR5IHRvCj4+IGJlIHBpY2tlZCB1bmxlc3MgYSBjaGFuZ2UgaXMgYXNrZWQg
YnkgYSByZXZpZXdlci4KPj4KPj4gRGVjaXNpb24gdG8gcGljayBvciBub3QgYSBwYXRjaCBkb2Vz
IG5vdCBkZXBlbmQgb24gYW55IHRhZ3MsIGJ1dAo+PiBpcyB0aGUgc29sZSBkZWNpc2lvbiBvZiB0
aGUgbWFpbnRhaW5lciBhZGRpbmcgaXQncyBTaWduZWQtb2ZmLWJ5Lgo+IAo+IFRoZW4gd2h5IGdp
dmluZyByZXZpZXcgdGFnIGFuZCBub3Qgbm90aWZ5aW5nIGFib3V0IHRoZSBwaWNrLCB3aGlsZSB0
aGUKPiBwaWNrIGFjdHVhbGx5IGhhcHBlbnM/IFRoaXMgaXMgY29uZnVzaW5nLiBXaGVuIHRoZSBt
YWludGFpbmVyLCB3aGljaCBpcwo+IHN1cHBvc2VkIHRvIHBpY2sgcGF0Y2gsIGdpdmVzIHJldmll
d2VkIGl0IG1lYW5zIGFsd2F5cyB0aGUgc2FtZSBhcwo+IGFja2VkLCBzbyB0aGUgcGF0Y2ggaXMg
ZXhwZWN0ZWQgdG8gZ28gb3RoZXIgd2F5LiBOb3QgdGhyb3VnaCB0aGF0Cj4gbWFpbnRhaW5lcidz
IHRyZWUuCj4gCj4gSWYgeW91IGp1c3QgYXBwbHkgaXQsIHNheSB5b3UgYXBwbHkgaXQuCgpUaGlz
IGxhc3QgcmVwbHkgZ29lcyBiZXlvbmQgYWNjZXB0YWJpbGl0eSBvbiBteSBzaWRlLCB0aGlzIHRo
cmVhZAp3ZW50IHRvbyBmYXIgYW5kIEknbGwgc3RvcCByZXBseWluZyBmdXJ0aGVyIGFmdGVyIHRo
aXMuCgpJZiB5b3VyIGdvYWwgd2FzIHRvIGtpbmRseSBhc2sgbWUgdG8gdXNlIEFja2VkLWJ5IHRv
IG5vdGlmeSB5b3UgSSdsbApwaWNrIHRoZSBwYXRjaCBpbiB0aGUgZnV0dXJlLCB3aGlsZSB0aGlz
ICJydWxlIiBpcyBvbmx5IGltcGxpY2l0LAp0aGUgYWN0dWFsIGZvcm0gaXMgZmFyIGZyb20gaXQu
CgpDb25jZXJuaW5nIHRoaXMgcGF0Y2gsIHNpbmNlIEkgYWxyZWFkeSBzZW50IHRoZSBBUk02NCBE
VCBQUiBmb3IgdjYuMiwKYW5kIEkgdXN1YWxseSBkb24ndCB0YWtlIG5ldyBjaGFuZ2VzIGV4Y2Vw
dCB1cmdlbnQgb25lcyBhZnRlciByYzYsIEknbGwKcGljayB0aGlzIHBhdGNoIGFuZCAiMjAyMjEx
MjUxNDQxMjAuNDc2OTMzLTEta3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnIgphZnRlciB0
aGUgbmV4dCBtZXJnZSB3aW5kb3cgYW5kIHlvdSdsbCBiZSBub3RpZmllZCBhcyBJIGFsd2F5cyBk
by4KCj4gCj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgo+IAoKTmVpbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
