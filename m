Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C46106F30F
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2026 09:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HA/UMCAzouCAg8iNEBlb7Y+TwZSzDb4iJ+XpQ8wu+jk=; b=FaHz52At0Z7wN5
	lkCTArrDehzsUb5Bhlftl3uPVC8IqZJzCPKBZ4Q72ic4A/jYl0pDF7zLY4byQ0s66RYwVVaZPft3g
	TAehshpJOp79cNz7NX3oul+2Vkd7bUgUqMVKpn7JDlZNGZqF9PjOc7gSTBVLcuCde0Xw6AcmR1v+K
	L7DJqyDzaFbNGffI8qMeuJOC3ZNXtO5p09H0L3ZV+gz24zwl+W944Lab6kN3FWSrVWqb7PNyhG8K9
	qSI2E4kaTL8IkvsjfP2ZQePSt5PUZHzk6RXQll12PY0CYYyLUNpdKrEj38P2MJnInowSSoe5t4LgN
	7W+7N39bxgv9opOm3fdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gvE-000000058bC-3fNp;
	Thu, 26 Mar 2026 09:22:36 +0000
Received: from pouet.aliel.fr ([65.21.61.41] helo=courrier.aliel.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gvC-000000058Zi-1LHZ;
	Thu, 26 Mar 2026 09:22:35 +0000
Message-ID: <8e722981-db67-4529-abdc-ea7dec02e5ba@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1774516950;
	bh=T5Gnu4yLDY6S9iBMZo1e1nUZtHu8V8m/kPrwHC6rWMQ=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=pGEt6BspYwu2UBwjNusLubOi0aBAOaebCYF1iZEVI2/fKnASLYTxiNuRzwLV56N+P
	 CIH3Iw2pgoIiGo/WnTcUavi4C1vJ6ip4/FlOHTQmawnRM1d2z/uzY9JYURnjCzmhlj
	 2hLxwsSOpfSQ2PQZ8xlR2w+XICSS2T/jT+wqc714=
Date: Thu, 26 Mar 2026 10:22:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v4 3/9] arm64: dts: amlogic: t7: Add MMC controller nodes
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
 <20260325-add-emmc-t7-vim4-v4-3-44c7b4a5e459@aliel.fr>
 <4b2ba22d-7d0b-4c71-ad83-46d198718fec@linaro.org>
Content-Language: en-US
In-Reply-To: <4b2ba22d-7d0b-4c71-ad83-46d198718fec@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_022234_651270_0CC1AB98 
X-CRM114-Status: GOOD (  12.00  )
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

T24gMy8yNi8yNiA5OjUyIEFNLCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPiBPbiAzLzI1LzI2IDEw
OjE1LCBSb25hbGQgQ2xhdmVhdSB3cm90ZToKPj4gQWRkIGRldmljZSB0cmVlIG5vZGVzIGZvciB0
aGUgdGhyZWUgTU1DIGNvbnRyb2xsZXJzIGF2YWlsYWJsZQo+PiBvbiB0aGUgQW1sb2dpYyBUNyBT
b0MsIHVzaW5nIGFtbG9naWMsbWVzb24tYXhnLW1tYyBhcyBmYWxsYmFjawo+PiBjb21wYXRpYmxl
Lgo+PiBBbGwgbm9kZXMgYXJlIGRpc2FibGVkIGJ5IGRlZmF1bHQgYW5kIHNob3VsZCBiZQo+PiBl
bmFibGVkIGluIHRoZSBib2FyZC1zcGVjaWZpYyBEVFMgZmlsZS4KPj4KPj4gU2lnbmVkLW9mZi1i
eTogUm9uYWxkIENsYXZlYXUgPGxpbnV4LWtlcm5lbC1kZXZAYWxpZWwuZnI+Cj4+IC0tLQo+PiDC
oCBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny5kdHNpIHwgMzkgKysrKysr
KysrKysrKysrKysrKwo+PiArKysrKysrKysrCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAzOSBpbnNl
cnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMv
YW1sb2dpYy10Ny5kdHNpIGIvYXJjaC9hcm02NC8KPj4gYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2lj
LXQ3LmR0c2kKPj4gaW5kZXggMDE2YjU0MjljOGQxYi4uNjJjODdkMGVmNzA2NSAxMDA2NDQKPj4g
LS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDcuZHRzaQo+PiArKysg
Yi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny5kdHNpCj4+IEBAIC0zNzQs
NiArMzc0LDQ1IEBAIHNlY19hbzogYW8tc2VjdXJlQDEwMjIwIHsKPj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MHgwIDB4MTAyMjAgMHgwIDB4MTQwPjsKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhbWxvZ2ljLGhhcy1jaGlwLWlkOwo+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Owo+PiArCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHNkX2VtbWNfYTogbW1jQDg4MDAwIHsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBjb21wYXRpYmxlID0gImFtbG9naWMsdDctbW1jIiwgImFtbG9naWMsbWVzb24tYXhnLW1t
YyI7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDB4MCAweDg4MDAw
IDB4MCAweDgwMD47Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW50ZXJydXB0
cyA9IDxHSUNfU1BJIDE3NiBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBzdGF0dXMgPSAiZGlzYWJsZWQiOwo+IAo+IG1vdmUgZGlzYWJsZWQg
YXQgdGhlIGVuZCBvZiB0aGUgcHJvcGVydGllcwo+IAoKVGhhbmtzIEkgd2lsbCBkby4KCj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2xvY2tzID0gPCZjbGtjX3BlcmlwaHMgQ0xL
SURfU1lTX1NEX0VNTUNfQT4sCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIDwmY2xrY19wZXJpcGhzIENMS0lEX1NEX0VNTUNfQT4sCj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDwmc2NtaV9jbGsgQ0xLSURfRkNMS19ESVYyPjsK
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjbG9jay1uYW1lcyA9ICJjb3JlIiwg
ImNsa2luMCIsICJjbGtpbjEiOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFz
c2lnbmVkLWNsb2NrcyA9IDwmY2xrY19wZXJpcGhzIENMS0lEX1NEX0VNTUNfQV9TRUw+Owo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFzc2lnbmVkLWNsb2NrLXBhcmVudHMgPSA8
Jnh0YWw+Owo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Owo+PiArCj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHNkX2VtbWNfYjogbW1jQDhhMDAwIHsKPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gImFtbG9naWMsdDctbW1jIiwgImFtbG9naWMsbWVz
b24tYXhnLW1tYyI7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDB4
MCAweDhhMDAwIDB4MCAweDgwMD47Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
aW50ZXJydXB0cyA9IDxHSUNfU1BJIDE3NyBJUlFfVFlQRV9FREdFX1JJU0lORz47Cj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RhdHVzID0gImRpc2FibGVkIjsKPiBEaXR0bwo+
IAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNsb2NrcyA9IDwmY2xrY19wZXJp
cGhzIENMS0lEX1NZU19TRF9FTU1DX0I+LAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCA8JmNsa2NfcGVyaXBocyBDTEtJRF9TRF9FTU1DX0I+LAo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8JnNjbWlfY2xrIENMS0lEX0ZDTEtf
RElWMj47Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2xvY2stbmFtZXMgPSAi
Y29yZSIsICJjbGtpbjAiLCAiY2xraW4xIjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBhc3NpZ25lZC1jbG9ja3MgPSA8JmNsa2NfcGVyaXBocyBDTEtJRF9TRF9FTU1DX0JfU0VM
PjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhc3NpZ25lZC1jbG9jay1wYXJl
bnRzID0gPCZ4dGFsPjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfTsKPj4gKwo+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBzZF9lbW1jX2M6IG1tY0A4YzAwMCB7Cj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICJhbWxvZ2ljLHQ3LW1tYyIsICJhbWxv
Z2ljLG1lc29uLWF4Zy1tbWMiOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJl
ZyA9IDwweDAgMHg4YzAwMCAweDAgMHg4MDA+Owo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGludGVycnVwdHMgPSA8R0lDX1NQSSAxNzggSVJRX1RZUEVfRURHRV9SSVNJTkc+Owo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4g
RGl0dG8KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjbG9ja3MgPSA8JmNsa2Nf
cGVyaXBocyBDTEtJRF9TWVNfU0RfRU1NQ19DPiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgPCZjbGtjX3BlcmlwaHMgQ0xLSURfU0RfRU1NQ19DPiwKPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPCZzY21pX2NsayBDTEtJRF9G
Q0xLX0RJVjI+Owo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNsb2NrLW5hbWVz
ID0gImNvcmUiLCAiY2xraW4wIiwgImNsa2luMSI7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgYXNzaWduZWQtY2xvY2tzID0gPCZjbGtjX3BlcmlwaHMgQ0xLSURfU0RfRU1NQ19D
X1NFTD47Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYXNzaWduZWQtY2xvY2st
cGFyZW50cyA9IDwmeHRhbD47Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH07Cj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCB9Owo+PiDCoCDCoMKgwqDCoMKgIH07Cj4+Cj4gCgoKLS0gCkJlc3QgcmVn
YXJkcywKUm9uYWxkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
