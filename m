Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B918CEB64D7
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Jun 2023 13:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:References:Cc:To:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i6KL97o0yM7hZJXKi6DFJ5nsSiw0i1NmbPUoVlacAxc=; b=cp4pHbQ16alvw0f374mzwTkiIK
	d2r3+RVNaiyz7DGXNGsjfnpzNYIDYho+b7tbbM6heaT8zxvehuCSvqjKiGaJTijbQIr93Nqx48Ofs
	QS+WZgcGkX3qrVOYmHs7avXQ5xSmPhM+JwjVamK2l5hxAIa+mKdyyXNC3Hn9CiKeBzWkYJvtnCd12
	O5mANqZo79401UQem2WsFXGi96qhQ1GAn4gpCzxscGxWkVZlxwrB3ngZzuN/k6HtrfEmB46llI+w5
	IP3B6v7khejdBeCGxUEEX6Oi4bSmR86SC4euYP5Cvxw/pQyKcMI5O8i+1B+He7njG+LMLwFV0jagL
	Euwqn2Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDmMk-00AJ4I-0I;
	Mon, 26 Jun 2023 13:34:50 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDmMf-00AJ33-1I
	for linux-amlogic@lists.infradead.org;
	Mon, 26 Jun 2023 13:34:47 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fb10fd9ae9so5470775e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 26 Jun 2023 06:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687786480; x=1690378480;
        h=content-transfer-encoding:in-reply-to:subject:organization
         :references:cc:to:content-language:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XTy4+4mz1Xv+hO2QkRYCxGcmjBnoyskfZ70PBhrVWPg=;
        b=X9FyjOr+9j9nF8uQ6LF0ueEWWm8rvM0Uxko0LNrCZEAVSngWkps7zOAhDW3QqNlzQK
         tTlB97Xgffkm/MyQaHC3bM06xbeHGPCkfWQ4g5afHa0z7C0zWmD6iavKdq29BrlHROCZ
         gwzrC7UzHVdHoYUeCC1b+7KK4pFllrOx5dh2EIWxgp/h2VtKqy4ItNB0q+6ER+iN8MJR
         e4q9d1wuwCJod7asqts7SiN6CcJ27NPNiVwGEDjlqmmPDOcLh7bWF2VSUiJLpkyfc6Cd
         UfOO4LTaBW1OO7peVsa4Rqc6lsTG+97uLymaa0/pBqhy7K9aDrNdRzGJU+dxCBnR8qht
         9vOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687786480; x=1690378480;
        h=content-transfer-encoding:in-reply-to:subject:organization
         :references:cc:to:content-language:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XTy4+4mz1Xv+hO2QkRYCxGcmjBnoyskfZ70PBhrVWPg=;
        b=OdzUowYIDQcipIHmmBhG4u+aVVOVg7oaADNepFzxcBJZvkAPXHVXpDXRH9EMQP834q
         m13Wc0g5x1x22BReF6rMt7et6zyouQfqs1j0090Pyitfcvsgfi+c0fvO1o/F3MXvmrQa
         a9+EiAQPgcEWsvM/y7um9UWju8Dnxn+vpH7VNVtO6TgYlpcJ4GrtcsNgf06ZY6quhALA
         EkiB2lkgqg6AiGW3AcrWksJ5R60oaIdigTneRQi0TGYhlP/7OP0VkG321/Dl5TOcgkkY
         vOsge/9CZYTHocpZFZE9z7uCn0ONvoK1PXLRtw1XwWhJXXIwwDW5QX47Z5mP7lwI23sm
         FqRQ==
X-Gm-Message-State: AC+VfDyPee5FPl+GFhq17IpyKfIbi32bk5Qkr8jmDaVHqCQrWqYd35pt
	5sPnW2MSz0csSbOEFusV4SgpMQ==
X-Google-Smtp-Source: ACHHUZ5xQtzeHOpw0ffYUZA/AnEmNgE4fRcdnyVlDsZmROa6fECRMPsqisOS2KcQnrRsrkW/fVqKig==
X-Received: by 2002:a05:600c:24d:b0:3f9:c77c:a5f with SMTP id 13-20020a05600c024d00b003f9c77c0a5fmr10102981wmj.13.1687786480242;
        Mon, 26 Jun 2023 06:34:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b25a:b26e:71f3:870c? ([2a01:e0a:982:cbb0:b25a:b26e:71f3:870c])
        by smtp.gmail.com with ESMTPSA id m21-20020a7bca55000000b003f4248dcfcbsm10667039wml.30.2023.06.26.06.34.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 06:34:39 -0700 (PDT)
Message-ID: <c41d2d9f-7ddd-160d-d455-ba4fece7ff93@linaro.org>
Date: Mon, 26 Jun 2023 15:34:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: neil.armstrong@linaro.org
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc: jbrunet@baylibre.com, mturquette@baylibre.com, sboyd@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
 conor+dt@kernel.org, kernel@sberdevices.ru, sdfw_system_team@sberdevices.ru,
 rockosov@gmail.com, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Oleg Lyovin <ovlevin@sberdevices.ru>
References: <20230607201641.20982-1-ddrokosov@sberdevices.ru>
 <20230607201641.20982-6-ddrokosov@sberdevices.ru>
 <CAFBinCD-5RD_iszZZRg58XqTHDEHnipJkf2aAex8MdUyh=bVCw@mail.gmail.com>
Organization: Linaro Developer Services
Subject: Re: [PATCH v1 5/6] arm64: dts: meson: a1: introduce UART_AO mux
 definitions
In-Reply-To: <CAFBinCD-5RD_iszZZRg58XqTHDEHnipJkf2aAex8MdUyh=bVCw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_063445_437627_7747265E 
X-CRM114-Status: GOOD (  23.17  )
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

SGksCgpPbiAyNS8wNi8yMDIzIDIzOjA3LCBNYXJ0aW4gQmx1bWVuc3RpbmdsIHdyb3RlOgo+IE9u
IFdlZCwgSnVuIDcsIDIwMjMgYXQgMTA6MTbigK9QTSBEbWl0cnkgUm9rb3NvdiA8ZGRyb2tvc292
QHNiZXJkZXZpY2VzLnJ1PiB3cm90ZToKPj4KPj4gRnJvbTogT2xlZyBMeW92aW4gPG92bGV2aW5A
c2JlcmRldmljZXMucnU+Cj4+Cj4+IFRoZSBBbWxvZ2ljIEExIGhhcyBhIFVBUlRfQU8gcG9ydCwg
d2hpY2ggY2FuIGJlIHVzZWQsIGZvciBleGFtcGxlLCBmb3IKPj4gQlQgSENJIEg0IGNvbm5lY3Rp
b24uCj4+Cj4+IFRoaXMgcGF0Y2ggYWRkcyBtdXggZGVmaW5pdGlvbnMgZm9yIGl0Lgo+IEluIHRo
ZSBwYXN0IHdlJ3ZlIG9ubHkgdGFrZW4gdGhlIHBpbmN0cmwgZGVmaW5pdGlvbnMgaWYgd2UgaGF2
ZSBhCj4gYm9hcmQgdGhhdCB1c2VzIHRoZW0uCj4gTmVpbCwgZG8gd2Ugc3RpbGwgaGF2ZSB0aGUg
c2FtZSBwb2xpY3kgaW4gcGxhY2U/IElmIHNvIHRoaXMgcGF0Y2gKPiBzaG91bGQgYmUgc2VudCB3
aXRoIHRoZSBzZXJpZXMgdGhhdCBhZGRzIHN1cHBvcnQgZm9yIHlvdXIgQTEgYm9hcmQuCgpZZXMg
YW5kIG5vLCBpZiB0aGUgd29yayBpcyBkb25lIEknbGwgdGFrZSBpdCwgYnV0IHllYWggc2luY2Ug
dXBzdHJlYW0gbGludXgKaGF0ZXMgZGVhZCBjb2RlLCBsZXQncyBvbmx5IGRlZmluZSB3aGF0J3Mg
bmVjZXNzYXJ5LgoKPiAKPj4gU2lnbmVkLW9mZi1ieTogT2xlZyBMeW92aW4gPG92bGV2aW5Ac2Jl
cmRldmljZXMucnU+Cj4+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBSb2tvc292IDxkZHJva29zb3ZA
c2JlcmRldmljZXMucnU+Cj4+IC0tLQo+PiAgIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9t
ZXNvbi1hMS5kdHNpIHwgMTYgKysrKysrKysrKysrKysrKwo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAx
NiBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2Ft
bG9naWMvbWVzb24tYTEuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1h
MS5kdHNpCj4+IGluZGV4IDBlZmQ5MjJjYTdlMS4uM2ViNmFhOWMwMGUwIDEwMDY0NAo+PiAtLS0g
YS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tYTEuZHRzaQo+PiArKysgYi9hcmNo
L2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tYTEuZHRzaQo+PiBAQCAtMTE4LDYgKzExOCwy
MiBAQCBncGlvOiBiYW5rQDQwMCB7Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgZ3Bpby1yYW5nZXMgPSA8JnBlcmlwaHNfcGluY3RybCAwIDAgNjI+Owo+PiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9Owo+Pgo+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHVhcnRfYV9waW5zOiB1YXJ0X2Egewo+IE9ubHkgb3VyIG5ld2VyIC5kdHNp
IChlLmcuIG1lc29uLWcxMi1jb21tb24uZHRzaSkgYXJlIGZvbGxvd2luZyB0aGUKPiBwYXR0ZXJu
IHdoZXJlIG5vZGUgbmFtZXMgc2hvdWxkIHVzZSBkYXNoZXMgaW5zdGVhZCBvZiB1bmRlcnNjb3Jl
cy4KPiBTbyBwbGVhc2UgdXNlOiB1YXJ0X2FfcGluczogdWFydC1hIHsgLi4uCgpUaGUgbmV3IHNj
aGVtZSB3aGljaCBzaG91bGQgYmUgdXNlIHNob3VsZCBiZToKCnVhcnRfYV9waW5zOiB1YXJ0LWEt
cGlucy1zdGF0ZSB7CgpidXQgaXQgd2Fzbid0IGVuZm9yY2VkIGluIHRoZSBwaW5jdHJsIHlhbWwg
cHVzaGVkIGJ5IGhlaW5lciwgYnV0IGZvciBzdXJlCm5vIHVuZGVyc2NvcmVzIGluIHRoZSBub2Rl
IG5hbWUuCgo+IAo+IFsuLi5dCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWFy
dF9hX2N0c19ydHNfcGluczogdWFydF9hX2N0c19ydHMgewo+IHNpbWlsYXIgdG8gdGhlIGNvbW1l
bnQgZnJvbSBhYm92ZToKPiB1YXJ0X2FfY3RzX3J0c19waW5zOiB1YXJ0LWEtY3RzLXJ0cyB7IC4u
Lgo+IAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbXV4IHsKPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ3JvdXBzID0g
InVhcnRfYV9jdHMiLAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAidWFydF9hX3J0cyI7Cj4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGZ1bmN0aW9uID0gInVhcnRfYSI7Cj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJpYXMtcHVsbC1kb3duOwo+
IE91dCBvZiBjdXJpb3NpdHk6IGlzIHRoaXMgcHVsbCBkb3duIG5lZWRlZCBvbiBhbGwgYm9hcmRz
IG9yIGp1c3Qgc3BlY2lmaWMgb25lcz8KPiBJdCBzZWVtcyBsaWtlIGFsbCBvdGhlciBTb0NzIHVz
ZSBiaWFzLWRpc2FibGUgZm9yIHRoZSBSVFMvQ1RTIHBpbnMuCj4gCj4gCj4gQmVzdCByZWdhcmRz
LAo+IE1hcnRpbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWFtbG9naWMK
