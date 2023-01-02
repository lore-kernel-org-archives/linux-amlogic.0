Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C740EC46467
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Jan 2023 10:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KJxh5jjBlzIGhQzjVh3xdkY5Jqi3cBdZCo+B05Cxrng=; b=RCxjPXVw0MNIh9
	AwJAiCN9pl+fpX96ghEpgefOy21MsDWJK0L8FWHO3j1Jl+SZkeoUeZXK4Ypm9Gq/XcMpLurXRhpCG
	tZgBLBfV5IXrRzv6w1AXvdjFZGPICUt09+EcIJ3KdJbnMEGq2S+3F5s5RON5pBqiJ70PH7Y/rABuL
	E9vO4YLqi3vYbzN+bMz5HEPKB2IfUR94B7jtQFR119MH5rbYWDB0ZXMo113nYchVGg2MS/97PdlmU
	u44Zex/nYwK7NITNJCAyePQRsbUv019FInssFvCHhzT5uOZeJt4RpyvV5B/nx/PxuXWQHHeiMN6CT
	cs8g2ysYR25Zq699jtDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCHsc-00AIXS-QL; Mon, 02 Jan 2023 10:17:19 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCHsV-00AIUg-63; Mon, 02 Jan 2023 10:17:16 +0000
Received: from [192.168.1.22] (cst-prg-44-69.cust.vodafone.cz [46.135.44.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: tomeu)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 297726602CC1;
	Mon,  2 Jan 2023 10:17:05 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1672654625;
	bh=UKxDeH1K51ACF0O8y96Cck/rYbvF8NIxVYbACECak6Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LrlZI2puL6mGNOLF2of8embHNkndRivYQ6iU07VV5uWc+WZuX3EZ350ZQ+Ber/rz3
	 QRIzJkH5rG++FIZ3VQj8XP45T5G3xNjIoxoM9pntjKF+OpPb91iDof1q4JGJGNrXlF
	 mOqYHM/67IPG5udaxMu3BuwRax17mB6/jkNqa2ubBc5c5CgjNfHWVk+cfb4fS2j64j
	 Pv1NDmi9aEnYZK4Zr+EifkExxbeLzpMA6ucN9LtMvT+vTO1vnidDta4hrd1UNXVono
	 VmSfu26P4q4xdEGInSZZZiUOyLweaBZHZ6tlzJsgedCk/OhcE9vEzFJaCaur1YgmKB
	 2ewvgJQyfZUNw==
Message-ID: <8cfe8595-79de-5980-d503-36847069940f@collabora.com>
Date: Mon, 2 Jan 2023 11:17:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v6 4/8] arm64: dts: Add DT node for the VIPNano-QI on the
 A311D
To: neil.armstrong@linaro.org
Cc: italonicola@collabora.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/Amlogic Meson SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson SoC support"
 <linux-amlogic@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
References: <20221202115223.39051-1-tomeu.vizoso@collabora.com>
 <20221202115223.39051-5-tomeu.vizoso@collabora.com>
 <5e5babae-224d-51cf-4eac-6272df87a8e7@linaro.org>
Content-Language: en-US
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
In-Reply-To: <5e5babae-224d-51cf-4eac-6272df87a8e7@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_021711_623258_39F19583 
X-CRM114-Status: GOOD (  17.32  )
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

T24gMS8yLzIzIDEwOjUzLCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPiBPbiAwMi8xMi8yMDIyIDEy
OjUyLCBUb21ldSBWaXpvc28gd3JvdGU6Cj4+IFRoaXMgIk5QVSIgaXMgdmVyeSBzaW1pbGFyIHRv
IHRoZSBWaXZhbnRlIEdQVXMgYW5kIEV0bmF2aXYgd29ya3Mgd2VsbAo+PiB3aXRoIGl0IHdpdGgg
anVzdCBhIGZldyBzbWFsbCBjaGFuZ2VzLgo+Pgo+PiB2MjogQWRkIHJlZmVyZW5jZSB0byBSRVNF
VF9OTkEgKE5laWwpCj4+IHYzOiBGaXggaW5kZW50YXRpb24gKE5laWwpCj4+Cj4+IFNpZ25lZC1v
ZmYtYnk6IFRvbWV1IFZpem9zbyA8dG9tZXUudml6b3NvQGNvbGxhYm9yYS5jb20+Cj4+IFJldmll
d2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4KPj4gLS0t
Cj4+IMKgIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTItY29tbW9uLmR0c2nC
oMKgwqDCoCB8IDExICsrKysrKysrKysrCj4+IMKgIC4uLi9ib290L2R0cy9hbWxvZ2ljL21lc29u
LWcxMmItYTMxMWQta2hhZGFzLXZpbTMuZHRzIHzCoCA0ICsrKysKPj4gwqAgMiBmaWxlcyBjaGFu
Z2VkLCAxNSBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL2FtbG9naWMvbWVzb24tZzEyLWNvbW1vbi5kdHNpIAo+PiBiL2FyY2gvYXJtNjQvYm9vdC9k
dHMvYW1sb2dpYy9tZXNvbi1nMTItY29tbW9uLmR0c2kKPj4gaW5kZXggNDU5NDdjMTAzMWM0Li42
MWM4NDYxZGY2MTQgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9t
ZXNvbi1nMTItY29tbW9uLmR0c2kKPj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2lj
L21lc29uLWcxMi1jb21tb24uZHRzaQo+PiBAQCAtMTEsNiArMTEsNyBAQAo+PiDCoCAjaW5jbHVk
ZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5oPgo+PiDCoCAjaW5j
bHVkZSA8ZHQtYmluZGluZ3MvcmVzZXQvYW1sb2dpYyxtZXNvbi1nMTJhLXJlc2V0Lmg+Cj4+IMKg
ICNpbmNsdWRlIDxkdC1iaW5kaW5ncy90aGVybWFsL3RoZXJtYWwuaD4KPj4gKyNpbmNsdWRlIDxk
dC1iaW5kaW5ncy9wb3dlci9tZXNvbi1nMTJhLXBvd2VyLmg+Cj4+IMKgIC8gewo+PiDCoMKgwqDC
oMKgIGludGVycnVwdC1wYXJlbnQgPSA8JmdpYz47Cj4+IEBAIC0yNDg0LDQgKzI0ODUsMTQgQEAg
eHRhbDogeHRhbC1jbGsgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgI2Nsb2NrLWNlbGxzID0gPDA+
Owo+PiDCoMKgwqDCoMKgIH07Cj4+ICvCoMKgwqAgbnB1OiBucHVAZmYxMDAwMDAgewo+PiArwqDC
oMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICJ2aXZhbnRlLGdjIjsKPj4gK8KgwqDCoMKgwqDCoMKg
IHJlZyA9IDwweDAgMHhmZjEwMDAwMCAweDAgMHgyMDAwMD47Cj4+ICvCoMKgwqDCoMKgwqDCoCBp
bnRlcnJ1cHRzID0gPDAgMTQ3IDQ+Owo+PiArwqDCoMKgwqDCoMKgwqAgY2xvY2tzID0gPCZjbGtj
IENMS0lEX05OQV9DT1JFX0NMSz4sCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPCZjbGtj
IENMS0lEX05OQV9BWElfQ0xLPjsKPj4gK8KgwqDCoMKgwqDCoMKgIGNsb2NrLW5hbWVzID0gImNv
cmUiLCAiYnVzIjsKPj4gK8KgwqDCoMKgwqDCoMKgIHJlc2V0cyA9IDwmcmVzZXQgUkVTRVRfTk5B
PjsKPj4gK8KgwqDCoMKgwqDCoMKgIHBvd2VyLWRvbWFpbnMgPSA8JnB3cmMgUFdSQ19HMTJBX05O
QV9JRD47Cj4gCj4gQSBzdGF0dXMgPSAiZGlzYWJsZSIgaXMgbWlzc2luZyBoZXJlLgo+IAo+PiAr
wqDCoMKgIH07Cj4+IMKgIH07Cj4+IGRpZmYgLS1naXQgCj4+IGEvYXJjaC9hcm02NC9ib290L2R0
cy9hbWxvZ2ljL21lc29uLWcxMmItYTMxMWQta2hhZGFzLXZpbTMuZHRzIAo+PiBiL2FyY2gvYXJt
NjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTJiLWEzMTFkLWtoYWRhcy12aW0zLmR0cwo+PiBp
bmRleCAxMjRhODA5MDEwODQuLjczZjNkODdkY2VmZCAxMDA2NDQKPj4gLS0tIGEvYXJjaC9hcm02
NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMmItYTMxMWQta2hhZGFzLXZpbTMuZHRzCj4+ICsr
KyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1nMTJiLWEzMTFkLWtoYWRhcy12
aW0zLmR0cwo+PiBAQCAtMTUsNiArMTUsMTAgQEAgLyB7Cj4+IMKgwqDCoMKgwqAgY29tcGF0aWJs
ZSA9ICJraGFkYXMsdmltMyIsICJhbWxvZ2ljLGEzMTFkIiwgImFtbG9naWMsZzEyYiI7Cj4+IMKg
IH07Cj4+ICsmbnB1IHsKPj4gK8KgwqDCoCBzdGF0dXMgPSAib2theSI7Cj4gCj4gVG9tZXUsIEkg
dGhpbmsgdW50aWwgdGhlIHVzZXItc3BhY2Ugc3RhY2sgaXMgY2xlYW4gdGhpcyBzaG91bGQgYmUg
cmVtb3ZlZAo+IGFuZCBsZWZ0IGRpc2FibGVkLgoKU291bmRzIGdvb2QgdG8gbWUsIHdlIGNhbiBl
YXNpbHkgY2FycnkgYSBwYXRjaCBpbiBNZXNhIENJIGluIHRoZSBtZWFudGltZS4KCj4gSSBjYW4g
Zml4IHRoaXMgd2hpbGUgYXBwbHlpbmcgaWYgeW91IHdhbnQsCgpJIHdvdWxkIGFwcHJlY2lhdGUg
aXQsIHRoYW5rcyEKClRvbWV1Cgo+IE5laWwKPiAKPj4gK307Cj4+ICsKPj4gwqAgLyoKPj4gwqDC
oCAqIFRoZSBWSU0zIG9uLWJvYXJkwqAgTUNVIGNhbiBtdXggdGhlIFBDSWUvVVNCMy4wIHNoYXJl
ZCBkaWZmZXJlbnRpYWwKPj4gwqDCoCAqIGxpbmVzIHVzaW5nIGEgRlVTQjM0MFRNWCBVU0IgMy4x
IFN1cGVyU3BlZWQgRGF0YSBTd2l0Y2ggYmV0d2Vlbgo+IAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
