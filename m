Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B09C5DF8C
	for <linux-amlogic@archiver.kernel.org>; Sun, 23 Aug 2026 11:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=upBrA4ZmvkZ8/jEJWwz9USq86CiRWjbGwczTUW9E6kQ=; b=r1koBZNYUXtSXu
	4JER0I8cXQ9USFjiqUESGb3iSyDXjIJ86jCbnImp1sYb7Qa6gn9RdgYqCuwV8RPaYR0YoX6V5ZC6G
	UOFQNmQmdvwOyLlwCk04dfRmu8gTidsCPmP5KY9thaLg+ckBlMu2V3LE6pjeyVr2C6VCBa4PU/yni
	yybOy9bQtlNQOuWT2onJ/dl8NAztRwYhEb+TnAfTQNR1/w3kJUyBusDHCngG5OxE/dkyuDUkKhiPg
	07EvPtSvvbn4fwNnzG8+ILHarbNJCQjnzjBd7BXcVI02hTo1QUIaZ0mj6kmJQTT9p02en+ijO3qk0
	j/nGK1kUVx9JgYJa8nCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy6OY-0000000FHWt-33KB;
	Sun, 23 Aug 2026 11:29:46 +0000
Received: from mail-wr1-f53.google.com ([209.85.221.53])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy6OV-0000000FHW8-3Ydb
	for linux-amlogic@lists.infradead.org;
	Sun, 23 Aug 2026 11:29:45 +0000
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47fd4531020so1447365f8f.3
        for <linux-amlogic@lists.infradead.org>; Sun, 23 Aug 2026 04:29:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787484581; x=1788089381;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gic4a9l1Tysqkb/KXwcHfceHx++tdNsSZ7fJK8rIj4o=;
        b=iwmMUHrJ64yQIFVv5gUhsWAGSUpIGj97do7fSO6lYYlwA1BGWBInPlLfQ9Jd9rJvur
         CfNdhXCHruQp4KuiPkZx7H179wGkNt1xzxjJ1cEbloK28fES4EPFH7StZkwnnaJf2Yny
         vHd+ugJXo4MAIy2ZZdGX0GK2cK/RnipKK3XRQu1jc7ivOcOtT1KDvEbMiMbk3ECoTF0R
         B7kHJEi+MzadxiWJnDsC7R8z5Kqx1p1Km6Zf11pBy6TmpawJdQkKNyjiaxb2Au7qgmyO
         ui/JsGRi9PIVrxuFCA9CuWf+tk6y31TV9dzBI91cOWgqGWxa3Mk7ah1JpCm5QaIxAIPr
         8QMg==
X-Forwarded-Encrypted: i=1; AHgh+RrI7BdGCviRE1SGxq2Um+9tOclTsczHUKbZZ6Ru7FF9Uwmh6uyYIptm3UGuW/+dR6Ko4waclJX1oQPt1IcK@lists.infradead.org
X-Gm-Message-State: AFuF++mN+H6YEhdO9/sfEwNLdwZcfbEf8VZeYWskIte+anQREM9aGmZh
	W+PlkLguf7ZTNd6/FzS/wRTwh4Z97zUH8RpI6/852W/XAdBqiSTRNZPC+OWOlQ==
X-Gm-Gg: AR+sD13KNmO5Z4N06F7mLhAB/WPbITNlICeOEM/umD90NoHLkddIGawb4WQHfGpkgKK
	/hSsKiktknYUF34ioDe9/XvfKQLsmJFlrPEQ79m7cJqhregDZPG2ARjfG8+WhslY/rmbc2qUVp3
	6FofC2NIn6VbPsNJaduVRsFmBpZWlcTppwWCOOsfr1vsEtbJ/ieo1YCuOLNKmgbDN8BjxHES5Ac
	PS+y8VKBHlhebA4Wi3xiIxqs0xtn7zJIxNtMXcrqPyob7CW71D/Cca3wZaXAxCeh9vFZ0n8kGy6
	8G1ytMbWe9ML6Z7OOVk+HorMGLf8d2eNAhGRlht8EzO1YR6818BVrObM2QC10UwcuOrUT3smXU3
	oU/0ACO9JfHUN13jnllCoAQXOSzxBVjnzQu9yZg1PhHqVkIB/4Jga95g9Rt+iQ0+R4iZ1yzu7t+
	vTxsp3LsbPSUsGhcgHCvAkq1ovvlL5T4SxhddK/zii7N8YSotCLJ+gkFKhcIQGyIcDjRf8Sk0ov
	IYU7942HtR9j6Q3ClLLBh5LHme4awBK
X-Received: by 2002:a05:600c:548c:b0:499:8aff:59b6 with SMTP id 5b1f17b1804b1-499c19f514emr95373715e9.14.1787484581078;
        Sun, 23 Aug 2026 04:29:41 -0700 (PDT)
Received: from [192.168.1.135] ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c3553681sm46417835e9.1.2026.08.23.04.29.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 04:29:39 -0700 (PDT)
Message-ID: <78722571-a418-4962-b1ac-216519303aa2@linux.com>
Date: Sun, 23 Aug 2026 12:29:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: amlogic: t7: use the real UART pclk
To: Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260818191159.11523-1-tanure@linux.com>
 <20260818191159.11523-2-tanure@linux.com>
 <c428305a-265c-4cc5-be01-be5b21dc22ca@amlogic.com>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <c428305a-265c-4cc5-be01-be5b21dc22ca@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_042943_907073_FFF84A93 
X-CRM114-Status: GOOD (  16.97  )
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

T24gMTkvMDgvMjAyNiAwMzozOSwgWGlhbndlaSBaaGFvIHdyb3RlOgo+IEhpIEx1Y2FzLAo+IAo+
IE9uIDIwMjYvOC8xOSAwMzoxMSwgTHVjYXMgVGFudXJlIHdyb3RlOgo+PiB1YXJ0X2EgbGlzdHMg
dGhlIDI0TUh6IGNyeXN0YWwgZm9yIGFsbCB0aHJlZSBvZiBpdHMgY2xvY2tzLCBiZWNhdXNlCj4+
IHRoZSBUNyBjbG9jayBjb250cm9sbGVyIGRyaXZlciBkaWQgbm90IGV4aXN0IHdoZW4gdGhlc2Ug
Ym9hcmRzIHdlcmUKPj4gYWRkZWQuCj4+Cj4+IFRoYXQgbGVhdmVzIHRoZSByZWFsIFVBUlQgYnVz
IGNsb2NrIHdpdGhvdXQgYSB1c2VyLCBzbyB0aGUga2VybmVsCj4+IHR1cm5zIGl0IG9mZiB3aGVu
IGl0IGRpc2FibGVzIHVudXNlZCBjbG9ja3MgYXQgdGhlIGVuZCBvZiBib290LCBhbmQKPj4gdGhl
IGJvYXJkIGhhbmdzLgo+Pgo+PiBQb2ludCB1YXJ0X2EgYXQgdGhlIHJlYWwgY2xvY2tzLCB0aGUg
d2F5IG1lc29uLXM0LmR0c2kgZG9lcywgYW5kIGRyb3AKPj4gdGhlIHBsYWNlaG9sZGVycyBmcm9t
IHRoZSB0d28gYm9hcmQgZmlsZXMuCj4+Cj4+IEZpeGVzOiA0ZmVmMDU2NTg4ZjUgKCJhcm02NDog
ZHRzOiBhbWxvZ2ljLXQ3LWEzMTFkMi1raGFkYXMtdmltNDogYWRkIAo+PiBpbml0aWFsIGRldmlj
ZS10cmVlIikKPj4gRml4ZXM6IDZmMDQ4Y2M3YTYzNSAoImFybTY0OiBkdHM6IGFkZCBib2FyZCBB
TjQwMCIpCj4+IFNpZ25lZC1vZmYtYnk6IEx1Y2FzIFRhbnVyZTx0YW51cmVAbGludXguY29tPgo+
PiBBc3Npc3RlZC1ieTogQ2xhdWRlOmNsYXVkZS1mYWJsZS01Cj4+IC0tLQo+PiDCoCBhcmNoL2Fy
bTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny1hMzExZDItYW40MDAuZHRzwqDCoMKgwqDC
oMKgIHwgMiAtLQo+PiDCoCBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny1h
MzExZDIta2hhZGFzLXZpbTQuZHRzIHwgMiAtLQo+PiDCoCBhcmNoL2FybTY0L2Jvb3QvZHRzL2Ft
bG9naWMvYW1sb2dpYy10Ny5kdHNpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHwgNCArKysrCj4+IMKgIDMgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2Ft
bG9naWMtdDctYTMxMWQyLWFuNDAwLmR0cwo+PiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dp
Yy9hbWxvZ2ljLXQ3LWEzMTFkMi1hbjQwMC5kdHMKPj4gaW5kZXggY2FiMmVlOWVhMGQzLi5kY2Jj
ZDA4YTc4YjkgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxv
Z2ljLXQ3LWEzMTFkMi1hbjQwMC5kdHMKPj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxv
Z2ljL2FtbG9naWMtdDctYTMxMWQyLWFuNDAwLmR0cwo+PiBAQCAtMzMsNyArMzMsNSBAQCB4dGFs
OiB4dGFsLWNsayB7Cj4+IMKgIH07Cj4+Cj4+IMKgICZ1YXJ0X2Egewo+PiAtwqDCoMKgwqDCoMKg
IGNsb2NrcyA9IDwmeHRhbD4sIDwmeHRhbD4sCj4+IDwmeHRhbD47Cj4+IC3CoMKgwqDCoMKgwqAg
Y2xvY2stbmFtZXMgPSAieHRhbCIsICJwY2xrIiwgImJhdWQiOwo+PiDCoMKgwqDCoMKgwqDCoMKg
IHN0YXR1cyA9ICJva2F5IjsKPj4gwqAgfTsKPj4gZGlmZiAtLWdpdAo+PiBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LWEzMTFkMi1raGFkYXMtdmltNC5kdHMKPj4gYi9h
cmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny1hMzExZDIta2hhZGFzLXZpbTQu
ZHRzCj4+IGluZGV4IGM0MTUyNWEzNGI3Mi4uNjc3MDY5ZTU4ZjMwIDEwMDY0NAo+PiAtLS0gYS9h
cmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny1hMzExZDIta2hhZGFzLXZpbTQu
ZHRzCj4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LWEzMTFk
Mi1raGFkYXMtdmltNC5kdHMKPj4gQEAgLTI2Niw2ICsyNjYsNCBAQCAmc2RfZW1tY19jIHsKPj4K
Pj4gwqAgJnVhcnRfYSB7Cj4+IMKgwqDCoMKgwqDCoMKgwqAgc3RhdHVzID0gIm9rYXkiOwo+PiAt
wqDCoMKgwqDCoMKgIGNsb2NrcyA9IDwmeHRhbD4sIDwmeHRhbD4sCj4+IDwmeHRhbD47Cj4+IC3C
oMKgwqDCoMKgwqAgY2xvY2stbmFtZXMgPSAieHRhbCIsICJwY2xrIiwgImJhdWQiOwo+PiDCoCB9
Owo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDcu
ZHRzaQo+PiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LmR0c2kKPj4g
aW5kZXggY2MzNzFmY2QxODk2Li43ODQ3NTgyZTc3ZWQgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJt
NjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LmR0c2kKPj4gKysrIGIvYXJjaC9hcm02NC9i
b290L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDcuZHRzaQo+PiBAQCAtNTg3LDYgKzU4NywxMCBAQCB1
YXJ0X2E6IHNlcmlhbEA3ODAwMCB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICJhbWxvZ2ljLHQ3
LXVhcnQiLAo+PiAiYW1sb2dpYyxtZXNvbi1zNC11YXJ0IjsKPj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MHgw
IDB4NzgwMDAgMHgwIDB4MTg+Owo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludGVycnVwdHMgPSA8R0lDX1NQSSAxNjgK
Pj4gSVJRX1RZUEVfRURHRV9SSVNJTkc+Owo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNsb2NrcyA9IDwmeHRhbD4sCj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgPCZjbGtjX3BlcmlwaHMKPj4gQ0xLSURfU1lTX1VBUlRfQT4s
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPCZ4dGFsPjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjbG9jay1uYW1lcyA9
ICJ4dGFsIiwgInBjbGsiLCAiYmF1ZCI7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RhdHVzID0gImRpc2FibGVkIjsK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH07Cj4g
Cj4gSSBhZ3JlZSB3aXRoIG1vdmluZyB0aGUgVUFSVCBjbG9jayBjb25maWd1cmF0aW9uIHRvIHRo
ZSBEVFNJIGZpbGUuIAo+IEhvd2V2ZXIsIGl0IHNlZW1zIGEgbGl0dGxlIG9kZCB0byBrZWVwIHRo
ZSBYVEFMIGNsb2NrIGRlZmluaXRpb24gaW4gdGhlIAo+IERUUywgYXMgdGhlIGFsaWFzIG1heSBu
b3QgYmUgY29uc2lzdGVudCBhY3Jvc3MgZGlmZmVyZW50IGJvYXJkcywgd2hpY2ggCj4gY291bGQg
cmVzdWx0IGluIGNvbXBpbGF0aW9uIGVycm9ycy4gQ291bGQgd2UgbW92ZSB0aGUgWFRBTCBjbG9j
ayAKPiBkZWZpbml0aW9uIHRvIHRoZSBEVFNJIGFzIHdlbGwsIHNpbWlsYXIgdG8gb3RoZXIgQW1s
b2dpYyBTb0NzPwpJIHRoaW5rIGtlZXBpbmcgaXQgaW4gdGhlIGJvYXJkIGZpbGVzIGlzIGFjdHVh
bGx5IGJldHRlciBoZXJlLCBhcyB0aGUgCmNyeXN0YWwgKHh0YWwpIHBoeXNpY2FsbHkgYmVsb25n
cyB0byB0aGUgYm9hcmQgcmF0aGVyIHRoYW4gdGhlIFNvQy4gVG8gCmtlZXAgdGhpbmdzIGNsZWFu
IHdpdGhvdXQgbW92aW5nIHh0YWwgaW50byBhbWxvZ2ljLXQ3LmR0c2ksIEkndmUgdXBkYXRlZCAK
djIgdG8gbW9kaWZ5IG9ubHkgdGhlIGJvYXJkIERUUyBmaWxlcy4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
