Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0DEC433EF
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jan 2022 08:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LsRG9m6zMhplW9YQPcuNf6Jd8FjX2YSxsaSLoGR8WWw=; b=pFParYBsmR7ZqL
	BpRwyGn1iAIRV89Mrm4UE8Nd6qWi0cWlfyia7mMw+kVcOgPhlioVUvxUNyySGfjlOMynhqlfGCH9L
	MZnU7v8ih1NeoCNpbBsLR+SM2HZsSq1wyr/TzOEjyrs5Ek0c0Xlr0vZT8xDKjdkd0A6OZ+tERL1zN
	yIkLzbkApcmHkitvtv94g/CtPPId2ZvgOLf+sPdkpzRpp+AZLlh+c8yHuumTiQzCI1Oat30lGr2Im
	wB+bMooPRA+PSo/agd6186Wny5SzstfMv527GpELgdTXTE5FamlcJFTPu+npTLPrElNdvJ6KHx0Vk
	aCzJG9ZAyIC+fJu4K1OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5OSv-00H7ZF-Rz; Thu, 06 Jan 2022 08:49:45 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5OSg-00H7Sq-OH
 for linux-amlogic@lists.infradead.org; Thu, 06 Jan 2022 08:49:32 +0000
Received: by mail-wr1-x431.google.com with SMTP id t26so3382951wrb.4
 for <linux-amlogic@lists.infradead.org>; Thu, 06 Jan 2022 00:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=nY4pcVTt6C1OfBYYq7bKgEYzMZ9c3SJrVRdzsfNxtoc=;
 b=T2EsDtKFmFLkTNp0bKgIcsr20z2haV/dtIngzpsHvMqwbEKvnEBsJUeu+IB8V/gtuX
 YcSeDGbKI93QDJ6wRfXgtXzMFa53I1g1ODEXjvQdK/FMvviStTonEH7LAbHkxzKb58LQ
 mydsxrUVU0vpEkSIw5rWcZ038ug2eSV1NOX6q83pdT4dPax3nNKDl7NOaCEFRRyNqB02
 +zbp1emsXjOhF4ffaR8rLBlI4FVJ8+agiN2zxt78Hz/pM0BGrL/sVylOk5Tn9p3Ez6Az
 xwgKz1JgHs/GoFvH+wXDgEnSiAOy13gD0YVdXMI2ElcQGiqwzeJp1S8R6o5CtHf5lsMJ
 eF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=nY4pcVTt6C1OfBYYq7bKgEYzMZ9c3SJrVRdzsfNxtoc=;
 b=Jev4TsxqnUb3vMkhg+n+gs16YfjMq2OT2QYfG/7NjYi5r01B3q24QFGDqDUfv8Caj0
 5VwesLkb6mgaRHvmkIYQ2UsvjSE+QaOHll08BGwIvWdaE245bs8/d6wnbop9i4sNv+op
 5RvloRpZFi7L2H61wTIejOTGY6fnJ7g10WeXRu7KvYi06NUZGSYJ5Vs7+nBCwR09E3kc
 Gucd3Q9kl6AhAcfenYDv4D+d4qASQ+UBLeWtdy8JnV2Njx2LBdN2QLFIXRN10JIULikI
 BENL5TOTmUtanRvdCEzVMvU8jB9dCmnTwmf0LP8Vr9eJKf3vMeQw0lyKD73m/SGYmUl7
 qNUg==
X-Gm-Message-State: AOAM532rycL8NdpHFS1oEirhHa1Tq9IHlXghheeagDOwH3imbnw4hDY3
 HBw/3BPiVdaE08BfucBmNwk6jQ==
X-Google-Smtp-Source: ABdhPJyUR3+Mk2jA/15s+4ovyFOsOB62zACYqVptdsGlpIwmjtMb1e5b2QbWGfesWg3zVOcnMkVvQw==
X-Received: by 2002:adf:c10e:: with SMTP id r14mr50609653wre.558.1641458968749; 
 Thu, 06 Jan 2022 00:49:28 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id r11sm1614797wrz.78.2022.01.06.00.49.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 00:49:28 -0800 (PST)
References: <20220106033130.37623-1-liang.yang@amlogic.com>
 <20220106091246.08ca66e0@xps13>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Liang Yang
 <liang.yang@amlogic.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, Neil Armstrong
 <narmstrong@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Victor Wan
 <victor.wan@amlogic.com>, XianWei Zhao <xianwei.zhao@amlogic.com>, Kelvin
 Zhang <kelvin.zhang@amlogic.com>, BiChao Zheng <bichao.zheng@amlogic.com>,
 YongHui Yu <yonghui.yu@amlogic.com>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: nand: meson: fix controller clock
Date: Thu, 06 Jan 2022 09:43:56 +0100
In-reply-to: <20220106091246.08ca66e0@xps13>
Message-ID: <1jbl0pz1t4.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_004930_808786_FB17157A 
X-CRM114-Status: GOOD (  15.17  )
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

Ck9uIFRodSAwNiBKYW4gMjAyMiBhdCAwOToxMiwgTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5h
bEBib290bGluLmNvbT4gd3JvdGU6Cgo+IGxpYW5nLnlhbmdAYW1sb2dpYy5jb20gd3JvdGUgb24g
VGh1LCA2IEphbiAyMDIyIDExOjMxOjMwICswODAwOgo+Cj4+IENoYW5nZS1JZDogSTE0MjViNDkx
ZDhiOTUwNjFlMWNlMzU4ZWYzMzE0MzQzM2ZjOTRkMjQKPj4gLS0tCj4+ICAuLi4vYmluZGluZ3Mv
bXRkL2FtbG9naWMsbWVzb24tbmFuZC50eHQgICAgICAgIHwgMTggKysrLS0tLS0tLS0tLS0tLS0t
Cj4KPiBJIGZvcmdvdCB0byBtZW50aW9uLCB3aGlsZSB5b3UncmUgYXQgaXQsIGFmdGVyIGZpeGlu
ZyB0aGUgYmluZGluZ3MsCj4gY291bGQgeW91IHBsZWFzZSBjb252ZXJ0IGl0IHRvIHlhbWw/Cj4K
Pj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQo+PiAK
Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvYW1s
b2dpYyxtZXNvbi1uYW5kLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
dGQvYW1sb2dpYyxtZXNvbi1uYW5kLnR4dAo+PiBpbmRleCA1Nzk0YWIxMTQ3YzEuLjM3ZjE2ZmU0
ZmU2NiAxMDA2NDQKPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210
ZC9hbWxvZ2ljLG1lc29uLW5hbmQudHh0Cj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tdGQvYW1sb2dpYyxtZXNvbi1uYW5kLnR4dAo+PiBAQCAtMTQsMTEgKzE0LDYg
QEAgUmVxdWlyZWQgcHJvcGVydGllczoKPj4gIC0gY2xvY2stbmFtZXM6IFNob3VsZCBjb250YWlu
IHRoZSBmb2xsb3dpbmc6Cj4+ICAJImNvcmUiIC0gTkZDIG1vZHVsZSBnYXRlIGNsb2NrCj4+ICAJ
ImRldmljZSIgLSBkZXZpY2UgY2xvY2sgZnJvbSBlTU1DIHN1YiBjbG9jayBjb250cm9sbGVyCgpJ
ZiBJIHJlZmVyIHRvIHRoZSByZWxhdGVkIGRyaXZlciBjaGFuZ2UsIHRoaXMgaXMgbm90IHRydWUg
YW55bW9yZSBhbmQKc2hvdWxkIGJlIHVwZGF0ZWQKCj4+IC0JInJ4IiAtIHJ4IGNsb2NrIHBoYXNl
Cj4+IC0JInR4IiAtIHR4IGNsb2NrIHBoYXNlCj4+IC0KPj4gLS0gYW1sb2dpYyxtbWMtc3lzY29u
CTogUmVxdWlyZWQgZm9yIE5BTkQgY2xvY2tzLCBpdCdzIHNoYXJlZCB3aXRoIFNEL2VNTUMKPj4g
LQkJCQljb250cm9sbGVyIHBvcnQgQwo+PiAgCj4+ICBPcHRpb25hbCBjaGlsZHJlbiBub2RlczoK
Pj4gIENoaWxkcmVuIG5vZGVzIHJlcHJlc2VudCB0aGUgYXZhaWxhYmxlIG5hbmQgY2hpcHMuCj4+
IEBAIC0yOCwxMSArMjMsNiBAQCBzZWUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L210ZC9uYW5kLWNvbnRyb2xsZXIueWFtbCBmb3IgZ2VuZXJpYyBiaW5kaQo+PiAgCj4+ICBFeGFt
cGxlIGRlbW9uc3RyYXRlIG9uIEFYRyBTb0M6Cj4+ICAKPj4gLQlzZF9lbW1jX2NfY2xrYzogbW1j
QDcwMDAgewo+PiAtCQljb21wYXRpYmxlID0gImFtbG9naWMsbWVzb24tYXhnLW1tYy1jbGtjIiwg
InN5c2NvbiI7Cj4+IC0JCXJlZyA9IDwweDAgMHg3MDAwIDB4MCAweDgwMD47Cj4+IC0JfTsKPj4g
LQo+PiAgCW5hbmQtY29udHJvbGxlckA3ODAwIHsKPj4gIAkJY29tcGF0aWJsZSA9ICJhbWxvZ2lj
LG1lc29uLWF4Zy1uZmMiOwo+PiAgCQlyZWcgPSA8MHgwIDB4NzgwMCAweDAgMHgxMDA+Owo+PiBA
QCAtNDEsMTEgKzMxLDkgQEAgRXhhbXBsZSBkZW1vbnN0cmF0ZSBvbiBBWEcgU29DOgo+PiAgCQlp
bnRlcnJ1cHRzID0gPEdJQ19TUEkgMzQgSVJRX1RZUEVfRURHRV9SSVNJTkc+Owo+PiAgCj4+ICAJ
CWNsb2NrcyA9IDwmY2xrYyBDTEtJRF9TRF9FTU1DX0M+LAo+PiAtCQkJPCZzZF9lbW1jX2NfY2xr
YyBDTEtJRF9NTUNfRElWPiwKPj4gLQkJCTwmc2RfZW1tY19jX2Nsa2MgQ0xLSURfTU1DX1BIQVNF
X1JYPiwKPj4gLQkJCTwmc2RfZW1tY19jX2Nsa2MgQ0xLSURfTU1DX1BIQVNFX1RYPjsKPj4gLQkJ
Y2xvY2stbmFtZXMgPSAiY29yZSIsICJkZXZpY2UiLCAicngiLCAidHgiOwo+PiAtCQlhbWxvZ2lj
LG1tYy1zeXNjb24gPSA8JnNkX2VtbWNfY19jbGtjPjsKPj4gKwkJCTwmY2xrYyBDTEtJRF9GQ0xL
X0RJVjI+Owo+PiArCQljbG9jay1uYW1lcyA9ICJjb3JlIiwgImRldmljZSI7CgpJZiB5b3Ugd2Fu
dCB0byByZS1pbXBsZW1lbnQgdGhlIG1tYyBjbG9jayBwYXJ0IGRpcmVjdGx5IGluIHRoZSBuYW5k
CmRyaXZlciwgeW91IHNob3VsZCBwcm92aWRlIGJvdGggY2xvY2sgaW5wdXRzLCBsaWtlIHRoZSBt
bWMgZHJpdmVyIChpbgphZGRpdGlvbiB0byB0aGUgcGNsaykgLi4uIEV2ZW4gaWYgeW91IHBsYW4g
b24gdXNpbmcgb25seSBGRElWMiBpbiB0aGUKZHJpdmVyLCB0aGlzIHdoYXQgdGhlIEhXIGlzLgoK
U29tZXRoaW5nIGxpa2U6CgpjbG9jay1uYW1lcyA9ICJjb3JlIiwgImNsa2luMCIsICJjbGtpbjEi
OwpjbG9ja3MgPSA8JmNsa2MgQ0xLSURfU0RfRU1NQ19DPiwKICAgICAgICAgPCZjbGtjIENMS0lE
X1NEX0VNTUNfQ19DTEswPiwKCSA8JmNsa2MgQ0xLSURfRkNMS19ESVYyPjsKCj4+ICsJCXNkX2Vt
bWNfY19jbGtjID0gPDB4ZmZlMDcwMDA+OwoKVGhpcyBpcyBub3QgaG93IHlvdSBwcm92aWRlIG1l
bW9yeSByZWdpb25zCgo+PiAgCj4+ICAJCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4+ICAJ
CXBpbmN0cmwtMCA9IDwmbmFuZF9waW5zPjsKPgo+Cj4gVGhhbmtzLAo+IE1pcXXDqGwKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
