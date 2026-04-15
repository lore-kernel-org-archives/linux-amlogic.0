Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46EDCF419BA
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Apr 2026 13:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CLBDQm2VUZwmQWeghm6dE1OsB+1U/2MZTbjtbZGENSI=; b=Iu13DCyoE0h6Q/
	t9EBj2V6g8qEYV6FgwlWO9iH5825Ia+RdOY1W+aTXM1C3+mFJw/NEn36saFSAeiYv1aS76s55KYKs
	myOlIvCWjYthnBcSSzuoFF8x1JVOPLsMdw5D5+tNgk7YMtBJJtZ8VNScFozF3aMzKKNGUYUJN7XEx
	VQP2H7j9s9JepJQrMIsAhpzsmVatcGCK3S8ZEW4p4x/EokSNpMpkuncAl23i4Bg/Dj+vQEZBuRSbV
	mAWK+L0Vf8JLRSrQ/ra8KJidYX6ajUPip1fPR2HoSJkkWEN77DE6LtOxzT4FoW8/fLpDgQsmf0nDd
	lc7kLi5acmXN24ybGOtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD0YI-00000001CW3-0oLc;
	Wed, 15 Apr 2026 13:45:10 +0000
Received: from 8.mo511.mail-out.ovh.net ([46.105.79.208])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD0YD-00000001CVH-1rJc;
	Wed, 15 Apr 2026 13:45:08 +0000
Received: from ex.mail.ovh.net (unknown [10.111.174.125])
	by mo511.mail-out.ovh.net (Postfix) with SMTP id 4fwj7Y1kr5z9snQ;
	Wed, 15 Apr 2026 13:44:57 +0000 (UTC)
Message-ID: <451d2cc8-d15e-47f6-be4e-515f9be62f9b@aliel.fr>
Date: Wed, 15 Apr 2026 15:44:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH 1/3] arm64: dts: amlogic: t7: Add uart_c pinctrl pins
 group
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
References: <20260415-add-bluetooth-t7-vim4-v1-0-0ba0746cc1d6@aliel.fr>
 <20260415-add-bluetooth-t7-vim4-v1-1-0ba0746cc1d6@aliel.fr>
 <956625df-0a80-4d0e-9bb7-8071d5797748@amlogic.com>
Content-Language: en-US
In-Reply-To: <956625df-0a80-4d0e-9bb7-8071d5797748@amlogic.com>
X-Originating-IP: [92.91.227.71]
X-ClientProxiedBy: CAS12.indiv.local (172.16.1.12) To DAG11EX2.indiv.local
 (172.16.2.112)
DKIM-Signature: v=1; a=rsa-sha256; d=aliel.fr; s=ovhex24454-selector1;
 c=relaxed/relaxed; t=1776260697; h=from:to:subject:date;
 bh=nXLEFR5ld0gmkhDZoJbppfO88OloAWVZCcUgrZTTpMs=;
 b=na+26WtfbGcCpipes2h38G9UemzYZH1/SVn5Lmb6XQwN5o2uB1iJAOUX8iU1R5V23jtCoGb91ZX1JqSgsNWadzZGAllXPnO0rwDjt0Z85MUnbObnQZpEU9u+e/nDtBlXeOJz09YqNqGbvKN3Li2mVOqxfhe88O8o9Mg9FuCQmtBPI+C1f8TK7wrZzS0lcVSAg7eEd6odXrIX0FFx43UfyCfPo+ITag4keLPX49NVRvJWqr/MpOl6nQJkKRKQ0+mcxbeF4miBrL7f2g93xYkxIe9ZHuT7/n4azyhU+UleABqsH/pDSFzwKlmspzWkXKDiYz5Gyztzun8w2cCYgYvRTw==
x-ovh-tracer-id: 10833971856656240110
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTF18bDFAC26Re3D/Quk/G2rv+fn1qEiTVJFd9A+lSh7lBclNoacWW6YyCzDY45eYv9KdsbYaW5wjpUkUFKkwhYtTDxn6xhgwPBnj8brLw3zfxZQkGokQuuvRgPYIy76QikIcN4cX0Ky2Ovmw80U7tpMOqpfGAulivI09vMONPaFTUIoRFDGWDzk6JdoeKmkOru6dRFXxpxj6cov/ntGBKVkn24Vws8jLuECq0+TbR2BjsfnNHwGyV0xxcuxOn7OlJSyZhmMJvxzAzOh+pQhNShyGh9nzQcM1NZEzJC/YxHn8Itu9fLdeF5h2eM9XQWuZyVLrPIitzsmwEbSMF3V4VkKLnXRHEWlQWl3F9bE0AVfBKH8VJPFv1It67F0Gwmt3Oe4TooOEbsu8bO9WJtrHEQXNPaW6gOiIH3Dhqu81Nb8RmYtgINQacbnfyYaYNoWLUJXV8EQoSepmREUHqVobR43XWLyrCpr8cVLh4PPfoZhO01nu2LTPlOVgzJ58+57CzQmsvM+ysKMKyBvBzAJrdr03QK7eQKDJNyoTFTOJ0ouAXVm6MaMvdeP64F73otWmiS9h2+c/N7St+4QCCuIq8LONTx26ibK8xqY4gzkhbTHTBgLDIUDza1kaCanMXK3ievGYHIM3ntiMYQYyQgwNKaUT7Hsc360I6cQCXOABh8cPQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_064505_808166_C21524BA 
X-CRM114-Status: UNSURE (   7.60  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGVsbG8gWGlhbndlaSwKCk9uIDQvMTUvMjYgMToyOCBQTSwgWGlhbndlaSBaaGFvIHdyb3RlOgo+
IAo+IAo+IE9uIDIwMjYvNC8xNSAxOToxNiwgUm9uYWxkIENsYXZlYXUgd3JvdGU6Cj4+IEFkZCB0
aGUgcGluIG11bHRpcGxleGluZyBjb25maWd1cmF0aW9uIGZvciBVQVJUIEMgKFRYLCBSWCwgQ1RT
LCBSVFMpCj4+IGluIHRoZSBUNyBTb0MgcGluY3RybCBub2RlLCByZXF1aXJlZCB0byByb3V0ZSB0
aGUgVUFSVCBDIHNpZ25hbHMKPj4gdGhyb3VnaCB0aGUgY29ycmVjdCBwYWRzIGJlZm9yZSBlbmFi
bGluZyB0aGUgY29udHJvbGxlci4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUm9uYWxkIENsYXZlYXU8
bGludXgta2VybmVsLWRldkBhbGllbC5mcj4KPj4gLS0tCj4+IMKgIGFyY2gvYXJtNjQvYm9vdC9k
dHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LmR0c2kgfCAxMiArKysrKysrKysrKysKPj4gwqAgMSBmaWxl
IGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LmR0c2kgYi9hcmNoL2FybTY0Lwo+PiBib290L2R0
cy9hbWxvZ2ljL2FtbG9naWMtdDcuZHRzaQo+PiBpbmRleCA3ZmU3MmM5NGVkNjIzLi41MzE5MzFj
YzE0MzdjIDEwMDY0NAo+PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dp
Yy10Ny5kdHNpCj4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3
LmR0c2kKPj4gQEAgLTU1Myw2ICs1NTMsMTggQEAgbXV4IHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJpYXMtcHVsbC11cDsKPj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB9Owo+PiArCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdWFydF9jX3BpbnM6IHVhcnRfYyB7
Cj4gbm9kZSBuYW1lwqAgdWFydC1jCgpJIHdpbGwgY2hhbmdlIHRoaXMsIHRoYW5rIHlvdSBmb3Ig
cmVtaW5kaW5nIG1lLgoKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbXV4IHsKPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdyb3VwcyA9ICJ1YXJ0X2NfdHgiLAo+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgInVhcnRf
Y19yeCIsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAidWFydF9jX2N0cyIsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAidWFydF9jX3J0cyI7Cj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBiaWFzLXB1bGwtdXA7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBvdXRwdXQtaGlnaDsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGZ1bmN0aW9uID0gInVhcnRfYyI7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IH07Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIH07Cj4+Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBncGlvX2ludGM6IGludGVycnVwdC1jb250cm9sbGVyQDQwODAgewoKCi0tIApC
ZXN0IHJlZ2FyZHMsClJvbmFsZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=
