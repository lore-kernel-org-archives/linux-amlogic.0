Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC639CA0EDC
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Aug 2025 07:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2nV48jviNT48Lywgy7wS+qN635+Q9tNCgkyP1CgYeAg=; b=oQ1tekyfGALBts
	l2EVHLieWuZBKgntXbtSXmbXqvoVq8+zOFrdpIdcqCqKH03O2VgA7EdU3tVNyn6+weiqX30hoM6e4
	Fx0kZrVWp+h+Gl8UqgK8VztOSS9rUyoXtd43Uy7vNOcDFwM9ZCECh4q8TLcVd1t8Oce1KKMaZwtAr
	Gmy+bCzMHZa/cea3xNN417MQDk4hBLcNXXuWyBjNHEFM4baGaVvAPyYm5RaxRmTQWnnAhHJSF7ySg
	9ISgoCJtKQeVuUVVT0J0k1ebuZlyIarVapa/OFGNZz2SvEvk/+pZvIM37hgrekB1Zggj1GQbcZ/iM
	ONFIFBlqpqItpDghhVUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unXiF-00000005RR0-0SWu;
	Sun, 17 Aug 2025 07:21:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unXhM-00000005RNc-2Jk3
	for linux-amlogic@lists.infradead.org;
	Sun, 17 Aug 2025 07:21:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 470935C44CD;
	Sun, 17 Aug 2025 07:20:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A674C4CEEB;
	Sun, 17 Aug 2025 07:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755415258;
	bh=JQ9I2ZA6NpxuMGRw8pMBYPM7Uq05lyYD7RorcnDzmE4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lSI8vqTNzeBPDxdLTp2i2cQaiaCWOq9avtgUBF0WanE+AzYS2kW+QiH+9XEVOKbzK
	 K1YxBet3nf1oZjkwZoL7StOOhAIu8cAuu08zGQAM/E7lN/SdhUJYQ6XPQmUHa95Rl+
	 sW+VLqEH2Pcbqp05UuFgokqjlcUXCwkYZbbqKpBnr1fo2p/XI5J0da5FgEqPcvIUKa
	 5BLd4OYX/ZIyNCNe1HtY/EKvNBenMCVE4Go1iSDMOJ2+pwqZKIqyHi7k9yI96RUg2M
	 EwPgBZ9mY/XFDV8qQON3sBWLfV/XhMREB5uxpAicYALqVxuuOZQG3nrVimz+H3Yb25
	 3C0eJ7Rezd3AA==
Message-ID: <d8248069-c12e-4f72-a625-c4f68aa42f1f@kernel.org>
Date: Sun, 17 Aug 2025 09:20:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] spi: dt-bindings: add doc for Amlogic A113L2 SFC
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liang Yang <liang.yang@amlogic.com>,
 Feng Chen <feng.chen@amlogic.com>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
References: <20250808-spifc-v1-0-ff4e30e26a6b@amlogic.com>
 <20250808-spifc-v1-1-ff4e30e26a6b@amlogic.com>
 <20250808-adamant-fat-raven-38c8b3@kuoka>
 <7fab19de-8ed1-4fe5-b2a4-a7e9c13d8424@amlogic.com>
 <5cc336bc-f071-41d2-b59a-af0df23af00b@kernel.org>
 <d872a711-7442-4e2e-bc59-0d6f4f656fde@amlogic.com>
 <017a4d15-286d-4e0a-89ff-f658009a6de6@kernel.org>
 <cf825229-7294-4fc5-b7dd-09dc1198db74@amlogic.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <cf825229-7294-4fc5-b7dd-09dc1198db74@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_002100_675454_B1FB7342 
X-CRM114-Status: GOOD (  14.85  )
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

T24gMTQvMDgvMjAyNSAwODozOCwgWGlhbndlaSBaaGFvIHdyb3RlOgo+IEhpIEtyenlzenRvZiwK
PiAgICAgVGhhbmtzIGZvciB5b3VyIHJlcGx5Lgo+IAo+IE9uIDIwMjUvOC8xNCAwMDoxOSwgS3J6
eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+Cj4+IE9uIDEz
LzA4LzIwMjUgMTE6MzQsIFhpYW53ZWkgWmhhbyB3cm90ZToKPj4+IEhpIEtyenlzenRvZiwKPj4+
ICAgICAgVGhhbmtzICBmb3IgeW91ciByZXBseS4KPj4+Cj4+PiBPbiAyMDI1LzgvMTMgMTU6MzYs
IEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4+Pj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+Pj4K
Pj4+PiBPbiAxMy8wOC8yMDI1IDA4OjEzLCBYaWFud2VpIFpoYW8gd3JvdGU6Cj4+Pj4+Pj4gK2Fs
bE9mOgo+Pj4+Pj4+ICsgIC0gJHJlZjogL3NjaGVtYXMvc3BpL3NwaS1jb250cm9sbGVyLnlhbWwj
Cj4+Pj4+Pj4gKwo+Pj4+Pj4+ICtwcm9wZXJ0aWVzOgo+Pj4+Pj4+ICsgIGNvbXBhdGlibGU6Cj4+
Pj4+Pj4gKyAgICBjb25zdDogYW1sb2dpYyxhNC1zcGlmYwo+Pj4+Pj4+ICsKPj4+Pj4+PiArICBy
ZWc6Cj4+Pj4+Pj4gKyAgICBpdGVtczoKPj4+Pj4+PiArICAgICAgLSBkZXNjcmlwdGlvbjogY29y
ZSByZWdpc3RlcnMKPj4+Pj4+PiArICAgICAgLSBkZXNjcmlwdGlvbjogcGFyZW50IGNsayBjb250
cm9sIHJlZ2lzdGVycwo+Pj4+Pj4KPj4+Pj4+IFdoeSBhcmUgeW91IHBva2luZyB0byBwYXJlbnQg
bm9kZSBvciB0byBjbG9jayByZWdpc3RlcnM/IFRoaXMgbG9va3MgbGlrZQo+Pj4+Pj4gbWl4aW5n
IHVwIGRldmljZSBhZGRyZXNzIHNwYWNlcy4KPj4+Pj4+Cj4+Pj4+Cj4+Pj4+IFRoZSBTUElGQyBi
dXMgY2xvY2sgbXVsdGlwbGV4ZXMgRU1NQyBtb2R1bGVzLCBzbyB0aGUgY29ycmVzcG9uZGluZwo+
Pj4+PiBmcmVxdWVuY3kgZGl2aXNpb24gcmVnaXN0ZXIgaXMgYWxzbyBpbiBFTU1DIG1vZHVsZS4g
VGhlIFNQSUZDIGFuZCB0aGUKPj4+Pj4gRU1NQyBtb2R1bGVzIGNhbm5vdCBiZSB1c2VkIHNpbXVs
dGFuZW91c2x5Lgo+Pj4+Cj4+Pj4gVGhlbiBvYnZpb3VzbHkgeW91IGNhbm5vdCBwdXQgaGVyZSBF
TU1DIG9yIHBhcmVudCByZWdpc3RlcnMuCj4+Pj4KPj4+PiBJdCBsb29rcyByZWFsbHkgbGlrZSB5
b3UgbWlzcyBwcm9wZXIgaGFyZHdhcmUgcmVwcmVzZW50YXRpb24uCj4+Pj4KPj4+Cj4+PiBJdCBk
b2VzIHNlZW0gYSBiaXQgdW51c3VhbC4gSG93ZXZlciwgaW4gb3VyIGhhcmR3YXJlIGRlc2lnbiwg
RU1NQyBhbmQKPj4+IFNGQyBtb2R1bGVzIGFyZSBpbnRlZ3JhdGVkLCBhbmQgdGhleSBzaGFyZSBj
b21tb24gcmVzb3VyY2VzIHN1Y2ggYXMgdGhlCj4+PiBjbG9jayBhbmQgSS9PIHBpbnMgLlRoZXkg
YXJlIG11dHVhbGx5IGV4Y2x1c2l2ZS4KPj4+Cj4+Cj4+IEhvdyBkaWQgeW91IGV4cHJlc3MgaXQg
aW4gRFQ/IFRoaXMgbG9va3Mgc2ltaWxhciB0byBzZXJpYWwgZW5naW5lcyBhbmQKPj4gc3VjaCBh
cmUgbm90IGltcGxlbWVudGVkIGluZGVwZW5kZW50bHkuCj4+Cj4gCj4gVGhlIGhhcmR3YXJlIGRl
c2lnbiBwcm92aWRlcyB0aGlzIGNsb2NrIGZvciBib3RoIG1vZHVsZXMg4oCUIEVNTUMgYW5kIAo+
IFNQSUZDLiBBIGNvbnRyb2wgYml0IChiaXQgMzE6IENmZ19OQU5ELCB3aGVyZSAwID0gUG9ydCBD
IG9ubHksIDEgPSBOQU5EKSAKPiBpcyB1c2VkIHRvIGRldGVybWluZSB3aGljaCBtb2R1bGUgdXNl
cyB0aGUgY2xvY2suCj4gCj4gSXQncyBub3QgdGhhdCBOQU5EIGlzIHVzaW5nIEVNTUPigJlzIHJl
c291cmNlczsgcmF0aGVyLCB0aGUgY29uZmlndXJhdGlvbiAKPiByZWdpc3RlciBjb250cm9sbGlu
ZyB0aGlzIHNlbGVjdGlvbiBpcyBsb2NhdGVkIHdpdGhpbiB0aGUgRU1NQyBtb2R1bGUsIAo+IHdo
aWNoIG1ha2VzIHRoZSBzZXR1cCBhcHBlYXIgc29tZXdoYXQgdW51c3VhbC4KCk5vLCBob3cgZGlk
IHlvdSBleHByZXNzIGluIERUIHRoYXQgdGhleSBhcmUgbXV0dWFsbHkgZXhjbHVzaXZlPwoKPiAK
PiBJbiB0aGUgZGV2aWNlIHRyZWUgKERUKSwgSSdsbCBqdXN0IHJlZmVyIGRpcmVjdGx5IHRvIHRo
ZSBjbG9jayBmcmVxdWVuY3kgCj4gZGl2aXNpb24gY29udHJvbCByZWdpc3Rlci4KClRoaXMgZG9l
cyBub3Qgc29sdmUgdGhlIGV4Y2x1c2l2ZSB1c2FnZS4uLgoKCkJlc3QgcmVnYXJkcywKS3J6eXN6
dG9mCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2lj
Cg==
