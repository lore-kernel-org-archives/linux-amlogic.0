Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6BCCF557F0
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Apr 2026 09:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qzpxEzqvl9P0OkVD2o6maUTYsSV79E4saV7DURzgsdw=; b=L0bMRW3+wJ6KuD
	7GuFWx9f9oYkoZxzaZSfTPEGUJoBao3UnKJTcjvbFHsDxIaL1io04Ctp8nXHPqcNfu3MQKnj2whBX
	Akw4f2jpWrqg9uvbQmr3bByamIIc1jySDMK+WyAB/Wlytsx/C6Fvd3041Dp1MoQ++ZH9rjm/oefR4
	0vHTNFaYPBXCXs64VUvNQElZH7PkQB5HP9GMXGnUfqpUwSKH4Agqv+gkpCHn7anolk0kYoacmbxNP
	14yHTCF4WTB6rPgo4D2dwoidOBrkclegloBOYKEoKibH8wiGU2FY6ok3AJwyUU5YJ7DMocTcMmfY5
	ALALfsPb8MAkA9Cyp7Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkkd-00000006fAg-2SZz;
	Mon, 20 Apr 2026 09:17:07 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkka-00000006f9m-1tiO;
	Mon, 20 Apr 2026 09:17:06 +0000
Message-ID: <bb5ebce0-a59a-420c-a860-3cdb6b027372@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1776676617;
	bh=dl5DcX6axaQB08bVzkfm0qYlVYMXHjs5k1QLohyagTg=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=TE8Fjf2KOVteTx9eiWJnuAJfefHqh30xeZHbwNfBd50KHHgITZ3wfIzcGFIlBB34B
	 KjKIiwxjFIPuGPWRHxggr5RrF1GbszM69AIijwMJ/j5TIzW+PMZlnvsHwy2Z4LI5kU
	 lqH9tkKhRdCzf2znN0ctIx6VB6ql9/MhiJCkCZJU=
Date: Mon, 20 Apr 2026 11:16:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v2 4/4] arm64: dts: amlogic: t7: Add clk measure support
To: Jian Hu <jian.hu@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20260415-clkmsr_a1_t7-v2-0-02b6314427e6@amlogic.com>
 <20260415-clkmsr_a1_t7-v2-4-02b6314427e6@amlogic.com>
 <ae61c52d-814c-40fa-b02a-833377d840a8@aliel.fr>
 <64cde9f6-4f28-4ba7-8362-aac28887ff22@amlogic.com>
Content-Language: en-US
In-Reply-To: <64cde9f6-4f28-4ba7-8362-aac28887ff22@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_021704_933940_0F8BDA0B 
X-CRM114-Status: GOOD (  15.38  )
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

SGkgSmlhbiwKCk9uIDQvMjAvMjYgNToyNSBBTSwgSmlhbiBIdSB3cm90ZToKPiBIaSBSb25hbGQs
Cj4gCj4gCj4gVGhhbmtzIGZvciB5b3VyIHJldmlldy4KPiAKPiBPbiA0LzE3LzIwMjYgNTo0OCBQ
TSwgUm9uYWxkIENsYXZlYXUgd3JvdGU6Cj4+IFsgRVhURVJOQUwgRU1BSUwgXQo+Pgo+PiBIZWxs
byBKaWFuLAo+Pgo+PiBPbiA0LzE1LzI2IDEwOjMzIEFNLCBKaWFuIEh1IHZpYSBCNCBSZWxheSB3
cm90ZToKPj4+IEZyb206IEppYW4gSHUgPGppYW4uaHVAYW1sb2dpYy5jb20+Cj4+Pgo+Pj4gQWRk
IHRoZSBjbG9jayBtZWFzdXJlIGRldmljZSB0byB0aGUgVDcgU29DIGZhbWlseS4KPj4+Cj4+PiBT
aWduZWQtb2ZmLWJ5OiBKaWFuIEh1IDxqaWFuLmh1QGFtbG9naWMuY29tPgo+Pj4gLS0tCj4+PiDC
oCBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny5kdHNpIHwgNSArKysrKwo+
Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+Pj4KPj4+IGRpZmYgLS1naXQg
YS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny5kdHNpIGIvYXJjaC8KPj4+
IGFybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny5kdHNpCj4+PiBpbmRleCA3ZmU3MmM5
NGVkNjIuLmNlYzJlYTc0ODUwZCAxMDA2NDQKPj4+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMv
YW1sb2dpYy9hbWxvZ2ljLXQ3LmR0c2kKPj4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1s
b2dpYy9hbWxvZ2ljLXQ3LmR0c2kKPj4+IEBAIC03MDEsNiArNzAxLDExIEBAIHB3bV9hb19jZDog
cHdtQDYwMDAwIHsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBzdGF0dXMgPSAiZGlzYWJsZWQiOwo+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfTsKPj4+Cj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjbG9jay1tZWFzdXJlckA0ODAwMCB7Cj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Y29tcGF0aWJsZSA9ICJhbWxvZ2ljLHQ3LWNsay1tZWFzdXJlIjsKPj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MHgwIDB4
NDgwMDAgMHgwIDB4MWM+Owo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfTsKPj4+ICsKPj4gQ2FuIHlvdSBwbGVhc2Ugb3JkZXIgYnkgcmVnLCBpdCBzaG91bGQg
YmUgYmV0d2VlbiBwd21fYW9fZ2ggYW5kIHB3bV9hYi4KPj4gVGhhbmsgeW91Lgo+IAo+IAo+IEFj
Y29yZGluZyB0byB0aGUgIk9yZGVyIG9mIE5vZGVzIiBjaGFwdGVyIGluIERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS8KPiBiaW5kaW5ncy9kdHMtY29kaW5nLXN0eWxlLnJzdCwKPiAKPiBub2RlcyBv
ZiB0aGUgc2FtZSB0eXBlIHNob3VsZCBiZSBncm91cGVkIHRvZ2V0aGVyLCBhbmQgdGhpcyB0YWtl
cyBoaWdoZXIKPiBwcmlvcml0eS4KPiAKPiBTbyBJIGhhdmUgcGxhY2VkIHRoZSBjbG9jay1tZWFz
dXJlIG5vZGUgYWZ0ZXIgYWxsIFBXTSBub2RlcyB0byBhdm9pZAo+IHNwbGl0dGluZyB0aGUgUFdN
IGdyb3VwLgo+IAoKVGhhbmtzIGZvciB5b3VyIGFuc3dlci4KClRoZSBkb2N1bWVudGF0aW9uIHNh
eXMgbm9kZXMgInNoYWxsIGJlIG9yZGVyZWQgYnkgdW5pdCBhZGRyZXNzIiBhcyB0aGUKcHJpbWFy
eSBydWxlLgpUaGUgZ3JvdXBpbmcgYnkgdHlwZSBpcyBkZXNjcmliZWQgYXMgYW4gYWx0ZXJuYXRp
dmUgKCJBbHRlcm5hdGl2ZWx5IiksCmFwcGxpY2FibGUgdG8gc29tZSBzdWJhcmNoaXRlY3R1cmVz
LCBub3QgYXMgYSBydWxlIHRoYXQgdGFrZXMgaGlnaGVyCnByaW9yaXR5LgoKU28gdG8gbWUsIEkg
dW5kZXJzdGFuZCBpdCBhcywgdW5sZXNzIHlvdXIgc3ViYXJjaGl0ZWN0dXJlIGhhcyBhbgplc3Rh
Ymxpc2hlZCBjb252ZW50aW9uIG9mIGdyb3VwaW5nIFBXTSBub2RlcyB0b2dldGhlciwgb3JkZXJp
bmcgYnkgcmVnCnJlbWFpbnMgdGhlIGNvcnJlY3QgZGVmYXVsdCBoZXJlLiBBbmQsIGluIG15IG9w
aW5pb24sIHN0aWNraW5nIHRvIGEKc2luZ2xlIHNvcnRpbmcgbWV0aG9kIGltcHJvdmVzIHJlYWRh
YmlsaXR5LgoKCi0tIApCZXN0IHJlZ2FyZHMsClJvbmFsZAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
