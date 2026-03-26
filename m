Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA767106F311
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2026 09:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QCNyJ0TgKhOJnUiei7h/Zmr3GVa9pIMOAUicuoSosAs=; b=QnQpxUcA/50HyN
	MqLcxFXaCECAi84YVzijfMkyMlwcYVjTw8EmjZ7JgjYuv72wlG4buTDZ/tTstxBWXt4bnmV8XOZlc
	fDslQU3w30aS4RZV1EM7az6PJPjfoKMafw61gxyFQSibW72xWwk7JC3AUB/eqb+rwvE99n2jBbcSa
	H/xfRCv2h4rFvoJPKCDuBPrU8IekzJNi055NZYJ3AaGZ6vluvDTObz7Nu361JV3LG9Sg71fxXGNP+
	bQp/w+K3NuB1Xj3/+zsT+/7t6ozxDc68abqlkdxLJHL3CyedZ0kaURXUFpLa9u2PGqG4RA1n4ANRW
	QnBgDjRcVbhP+nDcqW0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5h0W-000000059VP-3MIb;
	Thu, 26 Mar 2026 09:28:04 +0000
Received: from pouet.aliel.fr ([65.21.61.41] helo=courrier.aliel.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5h0S-000000059TM-3U2T;
	Thu, 26 Mar 2026 09:28:03 +0000
Message-ID: <802bc778-9e18-4273-9757-c0d663e8b14a@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1774517276;
	bh=hCffSrytymkZsTF+g18yVFG0ugDdfGbOo15ZfjxCRlA=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=eQ3/7Ykj9LCvsbKYSiqPnT9GfUx9Eyibc77/pFGLIy68mfwchsIIBIA4mt1YpPzMX
	 qzJhnNCu+i0VUh5RXafyaHWePHRsm3BCaZsY6YTN8ZRBwHqCqzovwcig9uJMe0TfqI
	 xvgmxbihm57B90MJpQ3wb+JUn+BMn80mc8QgNLa4=
Date: Thu, 26 Mar 2026 10:27:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v4 9/9] arm64: dts: amlogic: t7: khadas-vim4: Add MMC
 nodes
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>
References: <20260325-add-emmc-t7-vim4-v4-0-44c7b4a5e459@aliel.fr>
 <20260325-add-emmc-t7-vim4-v4-9-44c7b4a5e459@aliel.fr>
 <512d95b5-5348-4c7c-961c-b6ca1431cee4@linaro.org>
Content-Language: en-US
In-Reply-To: <512d95b5-5348-4c7c-961c-b6ca1431cee4@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_022801_189686_4ABAF57E 
X-CRM114-Status: GOOD (  12.35  )
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

T24gMy8yNi8yNiA5OjU0IEFNLCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPiBPbiAzLzI1LzI2IDEw
OjE1LCBSb25hbGQgQ2xhdmVhdSB3cm90ZToKPj4gRW5hYmxlIGFuZCBjb25maWd1cmUgdGhlIHRo
cmVlIE1NQyBjb250cm9sbGVycyBmb3IgdGhlIEtoYWRhcyBWSU00IGJvYXJkOgo+PiAtIHNkX2Vt
bWNfYTogU0RJTyBpbnRlcmZhY2UgZm9yIHRoZSBCQ000Mzc1MiBXaS1GaSBtb2R1bGUKPj4gLSBz
ZF9lbW1jX2I6IFNEIGNhcmQgc2xvdAo+PiAtIHNkX2VtbWNfYzogZU1NQyBzdG9yYWdlCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IFJvbmFsZCBDbGF2ZWF1IDxsaW51eC1rZXJuZWwtZGV2QGFsaWVsLmZy
Pgo+PiAtLS0KPj4gwqAgLi4uL2R0cy9hbWxvZ2ljL2FtbG9naWMtdDctYTMxMWQyLWtoYWRhcy12
aW00LmR0c8KgIHwgOTAgKysrKysrKysrKysrCj4+ICsrKysrKysrKy0KPj4gwqAgMSBmaWxlIGNo
YW5nZWQsIDg5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBh
L2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LWEzMTFkMi1raGFkYXMtCj4+
IHZpbTQuZHRzIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDctYTMxMWQy
LWtoYWRhcy12aW00LmR0cwo+PiBpbmRleCA3NzBmMDZiMGIxNmM3Li41YTczYWUwODEwMzZjIDEw
MDY0NAo+PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny1hMzEx
ZDIta2hhZGFzLXZpbTQuZHRzCj4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9h
bWxvZ2ljLXQ3LWEzMTFkMi1raGFkYXMtdmltNC5kdHMKPj4gQEAgLTE0LDcgKzE0LDEwIEBAIC8g
ewo+PiDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAia2hhZGFzLHZpbTQiLCAiYW1sb2dpYyxhMzEx
ZDIiLCAiYW1sb2dpYyx0NyI7Cj4+IMKgIMKgwqDCoMKgwqAgYWxpYXNlcyB7Cj4+IC3CoMKgwqDC
oMKgwqDCoCBzZXJpYWwwID0gJnVhcnRfYTsKPj4gK8KgwqDCoMKgwqDCoMKgIHNlcmlhbDDCoMKg
wqAgPSAmdWFydF9hOwo+IAo+IFNwdXJpb3VzIGNoYW5nZQo+IAoKVGhhbmtzIEkgd2lsbCBrZWVw
IHNwYWNlIGluc3RlYWQgb2YgdGFiIGhlcmUuCgo+PiArwqDCoMKgwqDCoMKgwqAgbW1jMMKgwqDC
oCA9ICZzZF9lbW1jX2M7Cj4+ICvCoMKgwqDCoMKgwqDCoCBtbWMxwqDCoMKgID0gJnNkX2VtbWNf
YjsKPj4gK8KgwqDCoMKgwqDCoMKgIG1tYzLCoMKgwqAgPSAmc2RfZW1tY19hOwo+PiDCoMKgwqDC
oMKgIH07Cj4+IMKgIMKgwqDCoMKgwqAgbWVtb3J5QDAgewo+PiBAQCAtMTU5LDYgKzE2Miw5MSBA
QCAmcHdtX2FiIHsKPj4gwqDCoMKgwqDCoCBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwo+PiDC
oCB9Owo+PiDCoCArLyogU0RJTyAqLwo+PiArJnNkX2VtbWNfYSB7Cj4+ICvCoMKgwqAgc3RhdHVz
ID0gIm9rYXkiOwo+PiArwqDCoMKgIHBpbmN0cmwtMCA9IDwmc2Rpb19waW5zPjsKPj4gK8KgwqDC
oCBwaW5jdHJsLTEgPSA8JnNkaW9fY2xrX2dhdGVfcGlucz47Cj4+ICvCoMKgwqAgcGluY3RybC1u
YW1lcyA9ICJkZWZhdWx0IiwgImNsay1nYXRlIjsKPj4gK8KgwqDCoCAjYWRkcmVzcy1jZWxscyA9
IDwxPjsKPj4gK8KgwqDCoCAjc2l6ZS1jZWxscyA9IDwwPjsKPj4gKwo+PiArwqDCoMKgIGJ1cy13
aWR0aCA9IDw0PjsKPj4gK8KgwqDCoCBjYXAtc2QtaGlnaHNwZWVkOwo+PiArwqDCoMKgIHNkLXVo
cy1zZHIxMjsKPj4gK8KgwqDCoCBzZC11aHMtc2RyMjU7Cj4+ICvCoMKgwqAgc2QtdWhzLXNkcjUw
Owo+PiArwqDCoMKgIHNkLXVocy1zZHIxMDQ7Cj4+ICvCoMKgwqAgY2FwLXNkaW8taXJxOwo+PiAr
wqDCoMKgIG1heC1mcmVxdWVuY3kgPSA8MjAwMDAwMDAwPjsKPj4gK8KgwqDCoCBub24tcmVtb3Zh
YmxlOwo+PiArwqDCoMKgIGRpc2FibGUtd3A7Cj4+ICvCoMKgwqAgbm8tbW1jOwo+PiArwqDCoMKg
IG5vLXNkOwo+PiArCj4+ICvCoMKgwqAgcG93ZXItZG9tYWlucyA9IDwmcHdyYyBQV1JDX1Q3X1NE
SU9fQV9JRD47Cj4+ICsKPj4gK8KgwqDCoCBrZWVwLXBvd2VyLWluLXN1c3BlbmQ7Cj4+ICsKPj4g
K8KgwqDCoCBtbWMtcHdyc2VxID0gPCZzZGlvX3B3cnNlcT47Cj4+ICsKPj4gK8KgwqDCoCB2bW1j
LXN1cHBseSA9IDwmdmRkYW9fM3YzPjsKPj4gK8KgwqDCoCB2cW1tYy1zdXBwbHkgPSA8JnZkZGFv
XzF2OD47Cj4+ICsKPj4gK8KgwqDCoCBicmNtZjogd2lmaUAxIHsKPj4gK8KgwqDCoMKgwqDCoMKg
IHJlZyA9IDwxPjsKPj4gK8KgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAiYnJjbSxiY200Mzc1
Mi1mbWFjIiwgImJyY20sYmNtNDMyOS1mbWFjIjsKPj4gK8KgwqDCoCB9Owo+PiArfTsKPj4gKwo+
PiArLyogU0QgY2FyZCAqLwo+PiArJnNkX2VtbWNfYiB7Cj4+ICvCoMKgwqAgc3RhdHVzID0gIm9r
YXkiOwo+PiArwqDCoMKgIHBpbmN0cmwtMCA9IDwmc2RjYXJkX3BpbnM+Owo+PiArwqDCoMKgIHBp
bmN0cmwtMSA9IDwmc2RjYXJkX2Nsa19nYXRlX3BpbnM+Owo+PiArwqDCoMKgIHBpbmN0cmwtbmFt
ZXMgPSAiZGVmYXVsdCIsICJjbGstZ2F0ZSI7Cj4+ICsKPj4gK8KgwqDCoCBidXMtd2lkdGggPSA8
ND47Cj4+ICvCoMKgwqAgY2FwLXNkLWhpZ2hzcGVlZDsKPj4gK8KgwqDCoCBzZC11aHMtc2RyMTI7
Cj4+ICvCoMKgwqAgc2QtdWhzLXNkcjI1Owo+PiArwqDCoMKgIHNkLXVocy1zZHI1MDsKPj4gK8Kg
wqDCoCBzZC11aHMtc2RyMTA0Owo+PiArwqDCoMKgIG1heC1mcmVxdWVuY3kgPSA8MjAwMDAwMDAw
PjsKPj4gK8KgwqDCoCBkaXNhYmxlLXdwOwo+PiArwqDCoMKgIG5vLXNkaW87Cj4+ICvCoMKgwqAg
bm8tbW1jOwo+PiArCj4+ICvCoMKgwqAgcG93ZXItZG9tYWlucyA9IDwmcHdyYyBQV1JDX1Q3X1NE
SU9fQl9JRD47Cj4+ICsKPj4gK8KgwqDCoCBjZC1ncGlvcyA9IDwmZ3BpbyBHUElPQ182IEdQSU9f
QUNUSVZFX0xPVz47Cj4+ICvCoMKgwqAgdm1tYy1zdXBwbHkgPSA8JnNkXzN2Mz47Cj4+ICvCoMKg
wqAgdnFtbWMtc3VwcGx5ID0gPCZ2ZGRpb19jPjsKPj4gK307Cj4+ICsKPj4gKy8qIGVNTUMgKi8K
Pj4gKyZzZF9lbW1jX2Mgewo+PiArwqDCoMKgIHN0YXR1cyA9ICJva2F5IjsKPj4gK8KgwqDCoCBw
aW5jdHJsLTAgPSA8JmVtbWNfY3RybF9waW5zPiwgPCZlbW1jX2RhdGFfOGJfcGlucz4sCj4+IDwm
ZW1tY19kc19waW5zPjsKPj4gK8KgwqDCoCBwaW5jdHJsLTEgPSA8JmVtbWNfY2xrX2dhdGVfcGlu
cz47Cj4+ICvCoMKgwqAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IiwgImNsay1nYXRlIjsKPj4g
Kwo+PiArwqDCoMKgIGJ1cy13aWR0aCA9IDw4PjsKPj4gK8KgwqDCoCBjYXAtbW1jLWhpZ2hzcGVl
ZDsKPj4gK8KgwqDCoCBtbWMtZGRyLTFfOHY7Cj4+ICvCoMKgwqAgbW1jLWhzMjAwLTFfOHY7Cj4+
ICvCoMKgwqAgbWF4LWZyZXF1ZW5jeSA9IDwyMDAwMDAwMDA+Owo+PiArwqDCoMKgIGRpc2FibGUt
d3A7Cj4+ICvCoMKgwqAgbm9uLXJlbW92YWJsZTsKPj4gK8KgwqDCoCBuby1zZGlvOwo+PiArwqDC
oMKgIG5vLXNkOwo+PiArCj4+ICvCoMKgwqAgcG93ZXItZG9tYWlucyA9IDwmcHdyYyBQV1JDX1Q3
X0VNTUNfSUQ+Owo+PiArCj4+ICvCoMKgwqAgdm1tYy1zdXBwbHkgPSA8JnZkZGlvXzN2Mz47Cj4+
ICvCoMKgwqAgdnFtbWMtc3VwcGx5ID0gPCZ2ZGRpb18xdjg+Owo+PiArfTsKPj4gKwo+PiDCoCAm
dWFydF9hIHsKPj4gwqDCoMKgwqDCoCBzdGF0dXMgPSAib2theSI7Cj4+IMKgwqDCoMKgwqAgY2xv
Y2tzID0gPCZ4dGFsPiwgPCZ4dGFsPiwgPCZ4dGFsPjsKPj4KPiAKPiBXaXRoIHRoYXQ6Cj4gCj4g
UmV2aWV3ZWQtYnk6IE5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPgo+
IAo+IFRoYW5rcywKPiBOZWlsCgoKLS0gCkJlc3QgcmVnYXJkcywKUm9uYWxkCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
