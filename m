Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9412C05027
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Jan 2023 08:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z6/ogy0wW5y4FoRrsHXuciLRKrcpuIvMR4ZBQoSfSZo=; b=Ghc+MLa9TBYmfX
	3nspBaQsnPZzXFARQEXz1yMCEwzV88y7sLZOUjBVzunjuqtvSiZ9FNUx+uyuvJm4ewM2TIrBK0r2B
	tVx7I1xiE5DR3fe5E80tOREaEgrVt0Pe6+waIrqTLkiIqzrzSPPnCKADuxW0asZ/dOCh6Gt96X9bQ
	7ImOaTQNCoyH4WtKyE7UYeYMXatDNIJ9prdW87biANKBBFsfCQqqqN0wub4aAk9wXGhArNz5JRqe2
	ITqkx0Ov5iWaOxTcfiJRGTY0yxYE1qPwUfnWHac54thpvUpwBYVJCRIL2TczK9lM+GVkPCx5MoYyh
	RHaKnPh3lO4v3HyetlNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKxxf-00A6mN-Az; Thu, 26 Jan 2023 08:50:23 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKxs6-00A4SO-DA; Thu, 26 Jan 2023 08:44:40 +0000
Received: by mail-wm1-x32c.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so2792425wma.1;
        Thu, 26 Jan 2023 00:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SbYlGevNKB62GXyU/rx67Jf4BE8GrxNTyP6+q38eEsg=;
        b=MBuBeEt+l7abDnFNWDrK5q9VzVpmnHIK/OvP1Uf55HfSojo1nDreld/SiMMTgCGrs+
         3/ce+U6ukbd4yNkOeliezOWVaDKNYTcqB2KEHJwqWw4Sjv170Dy5HOgGiCucHgVXeW/P
         lts98AZudUMWvnBvVCjce4Jf2S08wxvJ8P/V/0v1QHUjBXMAyVP4dnVloiEPDs86PNx3
         X7ZPEHaSfQ70g9rfvxQ3Ojbt/KoyeTF8wv+G1RnHlmhF+E6el4Co2XEuAKEaSMQfwSUm
         ZFJ2k6QFtQInvhlQwd8HKsno+ijMuoLjiteB3oJp35rYqLLvX4K7bxlD0dKx4rgNRrmr
         TIkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SbYlGevNKB62GXyU/rx67Jf4BE8GrxNTyP6+q38eEsg=;
        b=ZjR07FL4Cuo+gbQ4dNxNzRs+u38GH64iWnOtKC5sb0L4P10USwbs5nF4zdY8KRjt6d
         HD1k33cRBK0TkxlrdYPr0SR//QbJdaKVzCgV12/yLsH1/X4lkkJxm8kdzPNIil3kGxyZ
         B8ToxyxDqIY93GKWEeNOInydrqR/AMjYF5ActTY/5DuSxDXEPREmSbpR2HwE39oUOyYJ
         tje/ztEbN0HEoAuEwK8owIpmKZkwszAv44CwNYQrLBsvPQggHRgyR4erthYcgaNwKGK3
         ZyTltxqwU0545RCuUUWOhCpV+2Y1KuS+7Fdf/s1sNdK7rWQQx/wtLWQZ2m62WUX+VeZg
         69Sw==
X-Gm-Message-State: AFqh2krqqjTF8jDD1nkyE1GxysFMBtibsxTRSHLqJQ+fBuAiG4gxsAbN
	mUB+/tWswHY+bw7nCqfoOH8=
X-Google-Smtp-Source: AMrXdXtRXcyS3Ccs0fMMrCF1Gkwbqj9I3rc/hmBPNqI2KeQGWyRJ6ZFolJfLOHRQrQUZHLTRzXnbPg==
X-Received: by 2002:a05:600c:4256:b0:3da:1d51:ef9e with SMTP id r22-20020a05600c425600b003da1d51ef9emr34152984wmm.17.1674722676032;
        Thu, 26 Jan 2023 00:44:36 -0800 (PST)
Received: from ?IPV6:2a01:c23:c0e4:9a00:8920:c495:4c2e:69ca? (dynamic-2a01-0c23-c0e4-9a00-8920-c495-4c2e-69ca.c23.pool.telefonica.de. [2a01:c23:c0e4:9a00:8920:c495:4c2e:69ca])
        by smtp.googlemail.com with ESMTPSA id ip6-20020a05600ca68600b003d04e4ed873sm3996330wmb.22.2023.01.26.00.44.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 00:44:35 -0800 (PST)
Message-ID: <4f9839a9-66e7-bdde-f33d-0798bf363b17@gmail.com>
Date: Thu, 26 Jan 2023 09:44:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
To: neil.armstrong@linaro.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <d9b72573-a59f-989f-a752-1aa8517cf8dc@gmail.com>
 <6055791c-68d8-987b-0f2c-0526fde9686e@linaro.org>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v2] arm64: dts: amlogic: Fix SDIO interrupt and make it
 level-sensitive
In-Reply-To: <6055791c-68d8-987b-0f2c-0526fde9686e@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_004438_475205_7769D0D9 
X-CRM114-Status: GOOD (  19.88  )
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

T24gMjYuMDEuMjAyMyAwODo1NywgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gSGkgSGVpbmVyLAo+
IAo+IE9uIDI1LzAxLzIwMjMgMDg6MDAsIEhlaW5lciBLYWxsd2VpdCB3cm90ZToKPj4gU0RJTyBz
cGVjaWZpY2F0aW9uIGRlZmluZXMgdGhhdCB0aGUgaW50ZXJydXB0IGlzIGxldmVsLXNlbnNpdGl2
ZS4KPj4gRml4IHRoZSBpbnRlcnJ1cHQgdHJpZ2dlciB0eXBlIGZvciBlbW1jX2EgYWNjb3JkaW5n
bHkuCj4+IFNlZSBjb21tZW50IGF0IGJlZ2lubmluZyBvZiB0aGUgZmlsZSB3cnQgd2hpY2ggaXMg
dGhlIFNESU8gcG9ydC4KPj4gbW1jMiA9ICZzZF9lbW1jX2E7IC8qIFNESU8gKi8KPj4KPj4gVGhl
IHVzYWdlIG9mIGVkZ2UtdHJpZ2dlcmVkIGludGVycnVwdHMgbGVhZCB0byBsb3N0IGludGVycnVw
dHMgdW5kZXIgbG9hZCwKPj4gc2VlIFswXS4gVGhpcyB3YXMgY29uZmlybWVkIHRvIGJlIGZpeGVk
IGJ5IHVzaW5nIGxldmVsLXRyaWdnZXJlZAo+PiBpbnRlcnJ1cHRzLgo+Pgo+PiBOb3RlOgo+PiBT
RElPIGludGVycnVwdCBzdXBwb3J0IHdhcyBhZGRlZCBpbiBMaW51eCBqdXN0IHJlY2VudGx5LCBo
b3dldmVyIG90aGVyCj4+IHVzZXJzIG9mIHRoaXMgZHRzIG1heSBiZSBhZmZlY3RlZCB0b28uCj4g
Cj4gU3dpdGNoaW5nIGZyb20gZWRnZSB0byBsZXZlbCBoYXMgYWxyZWFkeSBmaXhlZCBwZXJmb3Jt
YW5jZSBpc3N1ZXMgb24gZXRoZXJuZXQsCj4gc28gSSB0aGluayB0aGlzIHdvdWxkIGJlIHRoZSBy
aWdodCBkaXJlY3Rpb24sIGJ1dCBzaW5jZSB0aGUgU0RJTywgZU1NQyBhbmQgU0QgY29udHJvbGxl
cnMKPiBhcmUgYmFzaWNhbGx5IHRoZSBzYW1lIElQLCB0aGV5IHNob3VsZCBoYXZlIHRoZSBzYW1l
IGludGVycnVwdCBzZXR1cC4KPiAKPiBJdCBtYWtlcyBubyBzZW5zZSB0byBoYXZlIGxldmVsIG9u
bHkgZm9yIFNESU8sIHNvIHBlcmhhcHMgaXQgd291bGQgYmUgcmlnaHQgdG8KPiBzd2l0Y2ggZXZl
cnkgY29udHJvbGxlcnMgdG8gTEVWRUwgKGluY2x1ZGluZyBBWEcpIGFuZCB0ZXN0IHRvIHNlZSBp
ZiB0aGVyZSdzIG5vIHJlZ3Jlc3Npb25zLgo+IApBZnRlciB0aGlua2luZyBhIG1pbnV0ZSBhYm91
dCBpdCBJIHRoaW5rIHlvdSdyZSByaWdodC4gSSB0ZXN0ZWQgb24gbXkgc3lzdGVtIGFuZApzZWUg
bm8gZGlmZmVyZW5jZSBpbiBiZWhhdmlvciBubyBtYXR0ZXIgd2hldGhlciBlbW1jIGludGVycnVw
dCBpcyBsZXZlbCBvciBlZGdlLgpEbyB5b3Ugd2FudCB0byBtYWtlIGZ1cnRoZXIgdGVzdHMgb24g
eW91ciB0ZXN0IHN5c3RlbXM/CkFuZCBJJ20gd29uZGVyaW5nIHdoZXRoZXIgdGhlcmUncyBzdHJv
bmdlciBldmlkZW5jZSB0aGFuIGp1c3QgdGVzdGluZyB3aGljaCB0cmlnZ2VyCnR5cGUgd29ya3Mg
YmV0dGVyLiBEb24ndCB0aGUgZGF0YXNoZWV0cyBnaXZlIGEgaGludD8KCj4gTmVpbAo+IAo+Pgo+
PiBbMF0gaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvbGludXgtbW1jL21zZzczOTkxLmh0
bWwKPj4KPj4gRml4ZXM6IDE0OTkyMThjODBjOSAoImFybTY0OiBkdHM6IG1vdmUgY29tbW9uIEcx
MkEgJiBHMTJCIG1vZGVzIHRvIG1lc29uLWcxMi1jb21tb24uZHRzaSIpCj4+IFJlcG9ydGVkLWJ5
OiBQZXRlciBTdXRpIDxwZXRlci5zdXRpQHN0cmVhbXVubGltaXRlZC5jb20+Cj4+IFRlc3RlZC1i
eTogUGV0ZXIgU3V0aSA8cGV0ZXIuc3V0aUBzdHJlYW11bmxpbWl0ZWQuY29tPgo+PiBDYzogc3Rh
YmxlQHZnZXIua2VybmVsLm9yZwo+PiBTaWduZWQtb2ZmLWJ5OiBIZWluZXIgS2FsbHdlaXQgPGhr
YWxsd2VpdDFAZ21haWwuY29tPgo+PiAtLS0KPj4gdjI6Cj4+IC0gcmViYXNlIGNvbnNpZGVyaW5n
IHJlY2VudCBub2RlIG5hbWUgY2hhbmdlIHNkIC0+IG1tYyBmb3Igc2RfZW1tY19hCj4+IC0tLQo+
PiDCoCBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZzEyLWNvbW1vbi5kdHNpIHwg
MiArLQo+PiDCoCBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3guZHRzacKgwqDC
oMKgwqDCoMKgwqAgfCAyICstCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9h
bWxvZ2ljL21lc29uLWcxMi1jb21tb24uZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dp
Yy9tZXNvbi1nMTItY29tbW9uLmR0c2kKPj4gaW5kZXggMWE5MzFkNWMyLi5jMDllYjlmNmYgMTAw
NjQ0Cj4+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTItY29tbW9u
LmR0c2kKPj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMi1jb21t
b24uZHRzaQo+PiBAQCAtMjMyNCw3ICsyMzI0LDcgQEAgdWFydF9BOiBzZXJpYWxAMjQwMDAgewo+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgc2RfZW1tY19hOiBtbWNAZmZlMDMwMDAgewo+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gImFtbG9naWMsbWVzb24tYXhnLW1tYyI7
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZyA9IDwweDAgMHhmZmUwMzAwMCAweDAg
MHg4MDA+Owo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbnRlcnJ1cHRzID0gPEdJQ19TUEkg
MTg5IElSUV9UWVBFX0VER0VfUklTSU5HPjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW50
ZXJydXB0cyA9IDxHSUNfU1BJIDE4OSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgc3RhdHVzID0gImRpc2FibGVkIjsKPj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgY2xvY2tzID0gPCZjbGtjIENMS0lEX1NEX0VNTUNfQT4sCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8JmNsa2MgQ0xLSURfU0RfRU1NQ19BX0NMSzA+
LAo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWd4LmR0
c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3guZHRzaQo+PiBpbmRleCBh
NzlhMzVlODQuLmFlMWE1YTU2OCAxMDA2NDQKPj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9h
bWxvZ2ljL21lc29uLWd4LmR0c2kKPj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2lj
L21lc29uLWd4LmR0c2kKPj4gQEAgLTYwMyw3ICs2MDMsNyBAQCBhcGI6IGFwYkBkMDAwMDAwMCB7
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNkX2VtbWNfYTogbW1jQDcwMDAwIHsKPj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gImFtbG9naWMs
bWVzb24tZ3gtbW1jIiwgImFtbG9naWMsbWVzb24tZ3hiYi1tbWMiOwo+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZyA9IDwweDAgMHg3MDAwMCAweDAgMHg4MDA+Owo+PiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludGVycnVwdHMgPSA8R0lDX1NQSSAyMTYg
SVJRX1RZUEVfRURHRV9SSVNJTkc+Owo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGludGVycnVwdHMgPSA8R0lDX1NQSSAyMTYgSVJRX1RZUEVfTEVWRUxfSElHSD47Cj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RhdHVzID0gImRpc2FibGVkIjsKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfTsKPj4gwqAgCj4gCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
