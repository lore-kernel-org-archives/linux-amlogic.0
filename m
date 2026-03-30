Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F4E0FB3CF8
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Mar 2026 10:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Sv8rrfYXvulcl4EnNN07vFLLXMzO7Y7kTqYOwTcjEs=; b=lRAqeoCzCq6Yhl
	dfh2UGLvbnO1vAP1NUtQu0K8+NbPdvCGoW7BmgIUQMz/f6mISw5YPLje5DYxsCUnIIxU9eBVIQMRh
	K5GnMAZCR4K/YMi61Kay3VgzfFzN7NkxMbzlvn+vVOflp71q7ABcgVkiLSQLNQe5HeENsfAO16dJn
	a3zth6D7eLERI7RDCgwGQumnL/6K0IGZA/heMb5KGyrhqdtr4B3oNnWmGMhEU8kP8yWMzSkyG8HFD
	4ZBysYj7BRp5xdraKVcaDcAVlwfA5tzp+hiDI31aiyJuaQYQNQF54GNOqJXeA/5aiD64NO5GRjcQN
	FFgrgTemb/rhG/erNJnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79hW-0000000B2fj-1u6s;
	Mon, 30 Mar 2026 10:18:30 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w79hU-0000000B2fB-1rCo;
	Mon, 30 Mar 2026 10:18:29 +0000
Message-ID: <44c0a75e-6e72-49e8-9b15-cb504a494feb@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1774865896;
	bh=+C/m07xrnjqPCMatJ2aXNKiqXleyo1ulSGuLaHUMa18=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=BMYiAxLUiIGumw6RyS1KKt0wBhxLSX1O3Csb/1uoGMCYsItSebXTqRhbwuss2xqiY
	 Lf6zuLY+ynwlncarwYnDhywMDyJJsTUKBIUz5TQ2owsrsf9ss1z+R1pH6FkZKrAOKf
	 SJnRJqZ6RA+vHV/OsAAqhEKUQUhJmXJeRi+EqyPQ=
Date: Mon, 30 Mar 2026 12:18:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v5 6/9] arm64: dts: amlogic: t7: khadas-vim4: Add power
 regulators
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>
References: <20260326-add-emmc-t7-vim4-v5-0-d3f182b48e9d@aliel.fr>
 <20260326-add-emmc-t7-vim4-v5-6-d3f182b48e9d@aliel.fr>
 <416d42a6-8d99-421c-91aa-e705f23576e2@linaro.org>
Content-Language: en-US
In-Reply-To: <416d42a6-8d99-421c-91aa-e705f23576e2@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_031828_625360_CFE3ACC3 
X-CRM114-Status: GOOD (  10.68  )
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

T24gMy8zMC8yNiA5OjU1IEFNLCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPiBPbiAzLzI2LzI2IDEw
OjU5LCBSb25hbGQgQ2xhdmVhdSB3cm90ZToKPj4gQWRkIHZvbHRhZ2UgcmVndWxhdG9yIG5vZGVz
IGRlc2NyaWJpbmcgdGhlIFZJTTQgcG93ZXIgdHJlZSwKPj4gcmVxdWlyZWQgYnkgcGVyaXBoZXJh
bCBub2RlcyBzdWNoIGFzIHRoZSBTRCBjYXJkIGNvbnRyb2xsZXIuCj4+Cj4+IFJldmlld2VkLWJ5
OiBOZWlsIEFybXN0cm9uZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4KPj4gU2lnbmVkLW9m
Zi1ieTogUm9uYWxkIENsYXZlYXUgPGxpbnV4LWtlcm5lbC1kZXZAYWxpZWwuZnI+Cj4+IC0tLQo+
PiDCoCAuLi4vZHRzL2FtbG9naWMvYW1sb2dpYy10Ny1hMzExZDIta2hhZGFzLXZpbTQuZHRzwqAg
fCA5MCArKysrKysrKysrKysKPj4gKysrKysrKysrKwo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgOTAg
aW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxv
Z2ljL2FtbG9naWMtdDctYTMxMWQyLWtoYWRhcy0KPj4gdmltNC5kdHMgYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny1hMzExZDIta2hhZGFzLXZpbTQuZHRzCj4+IGluZGV4
IGZmZmRhYjk2YjEyZWIuLjI0NTAwODRkMzc2NDIgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LWEzMTFkMi1raGFkYXMtdmltNC5kdHMKPj4gKysr
IGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDctYTMxMWQyLWtoYWRhcy12
aW00LmR0cwo+PiBAQCAtNiw2ICs2LDggQEAKPj4gwqAgL2R0cy12MS87Cj4+IMKgIMKgICNpbmNs
dWRlICJhbWxvZ2ljLXQ3LmR0c2kiCj4+ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvZ3Bpby9hbWxv
Z2ljLHQ3LXBlcmlwaHMtcGluY3RybC5oPgo+PiArI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2dwaW8v
Z3Bpby5oPgo+PiDCoCDCoCAvIHsKPj4gwqDCoMKgwqDCoCBtb2RlbCA9ICJLaGFkYXMgdmltNCI7
Cj4+IEBAIC00NSw2ICs0Nyw5NCBAQCB4dGFsOiB4dGFsLWNsayB7Cj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCAjY2xvY2stY2VsbHMgPSA8MD47Cj4+IMKgwqDCoMKgwqAgfTsKPj4gwqAgK8KgwqDCoCBk
Y19pbjogcmVndWxhdG9yLWRjLWluIHsKPj4gK8KgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAi
cmVndWxhdG9yLWZpeGVkIjsKPj4gK8KgwqDCoMKgwqDCoMKgIHJlZ3VsYXRvci1uYW1lID0gIkRD
X0lOIjsKPj4gK8KgwqDCoMKgwqDCoMKgIHJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gPDUwMDAw
MDA+Owo+PiArwqDCoMKgwqDCoMKgwqAgcmVndWxhdG9yLW1heC1taWNyb3ZvbHQgPSA8NTAwMDAw
MD47Cj4+ICvCoMKgwqDCoMKgwqDCoCByZWd1bGF0b3ItYWx3YXlzLW9uOwo+PiArwqDCoMKgIH07
Cj4+ICsKPj4gK8KgwqDCoCBzZF8zdjM6IHJlZ3VsYXRvci1zZGNhcmQtM3YzIHsKPj4gK8KgwqDC
oMKgwqDCoMKgIGNvbXBhdGlibGUgPSAicmVndWxhdG9yLWZpeGVkIjsKPj4gK8KgwqDCoMKgwqDC
oMKgIHJlZ3VsYXRvci1uYW1lID0gIlNEXzNWMyI7Cj4+ICvCoMKgwqDCoMKgwqDCoCByZWd1bGF0
b3ItbWluLW1pY3Jvdm9sdCA9IDwzMzAwMDAwPjsKPj4gK8KgwqDCoMKgwqDCoMKgIHJlZ3VsYXRv
ci1tYXgtbWljcm92b2x0ID0gPDMzMDAwMDA+Owo+PiArwqDCoMKgwqDCoMKgwqAgdmluLXN1cHBs
eSA9IDwmdmRkYW9fM3YzPjsKPj4gK8KgwqDCoMKgwqDCoMKgIGdwaW8gPSA8JmdwaW8gR1BJT0Rf
MTEgR1BJT19BQ1RJVkVfTE9XPjsKPj4gK8KgwqDCoMKgwqDCoMKgIHJlZ3VsYXRvci1ib290LW9u
Owo+IAo+PiArwqDCoMKgwqDCoMKgwqAgZW5hYmxlLWFjdGl2ZS1sb3c7Cj4gCj4gVGhpcyBwcm9w
ZXJseSBpcyBpbnZhbGlkLCBwbGVhc2Ugc2VuZCBmb2xsb3cgdXAgcGF0Y2ggcmVtb3ZpbmcgdGhp
cywKPiAKPiBUaGFua3MsCj4gTmVpbAo+IAo+IDxzbmlwPgoKU3VyZS4gSSBhbSBvbiBpdC4KClRo
YW5rcywKLS0gCkJlc3QgcmVnYXJkcywKUm9uYWxkCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
