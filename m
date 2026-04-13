Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C33FFEBFD0A
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Apr 2026 07:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rJ5GlvJbTA8REPU7fALL65Sc73utQKmBNUm2j+2uz/Y=; b=XaJ/2KcxODuH/g
	TQi30X+ZGdsK0zM0Bw8SoOaSazhVVz4uDULvvjY/xzS1e1OcvYWuxrTeVhHG7OzqPBgH1gMcwb3UU
	R/QAcfGdXNbDBIsukWaHUxl0yin0PotsLzc79FfO3AlpHVZHFeP00D0jlQkrt0awctoF7sShoDnqK
	vESRSfaiOISOZJc/lNf89FM1qUqZNUeJH7FcPMi3XScQ+g1LwILkdb6+3okf2BKxxj2KlMBVJRw7l
	SRWJh6ETMdZ2isQaQ1DnkSdqXv+KLPKcvUHWkPSMmxQl9V4gawrMF6e3wGEo7YM47xJkerbFYB7cf
	1ZAZG/WZoRBGkwOkjY6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBY0-0000000F7oj-0FGx;
	Mon, 13 Apr 2026 07:17:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBXx-0000000F7nu-28k7;
	Mon, 13 Apr 2026 07:17:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B812C4392A;
	Mon, 13 Apr 2026 07:17:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C306C116C6;
	Mon, 13 Apr 2026 07:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776064644;
	bh=4fd6tDvsRYjjdcxxC6Idc17uxdSEo42IQ6eLONxGb9I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XJGuPgalqgtyWLKHcp3R3oOlIQjkzcl9BkQ5Y4SUKgrPSDtPslX0CKS3bNIgfzUiO
	 XOi8ocCqA6ogSe79cVj6egILkyiubKV8m0H81Tw+Zv84KW2Hn+1JDSlp1TxxaKkUVK
	 i2uDjz9yIK1qOT2N/bRq23Sfmxu6yjfEdmSb3HB/G551r8E+vgn3LLRfrCtYOZA7Tv
	 azemWLKpf2I97hCqpwarKDQ+ad5sJMpjUgmLHhdwRCRhnDhizuYwYNXfhoHFO5ntzl
	 oH2ecdiD667o3oYq+igBsfER0Wbn5fFKxNAf0Ndb2jEClMnTG7aqXwHY9iw1v9VXTb
	 1iWmRfSRinBlA==
Message-ID: <fe782180-99ec-404f-96c5-8949a8732186@kernel.org>
Date: Mon, 13 Apr 2026 09:17:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v7.1
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: soc@kernel.org, arm@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <2fde1b11-d2a4-4aa2-8c28-d20fbbb54f7f@linaro.org>
 <20260411-spicy-apricot-newt-afa8a7@quoll>
 <5af5dfdb-001a-4b63-8a43-5cfcf28d821c@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <5af5dfdb-001a-4b63-8a43-5cfcf28d821c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_001725_597892_97644CFB 
X-CRM114-Status: GOOD (  16.81  )
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

T24gMTMvMDQvMjAyNiAwOToxMCwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gT24gNC8xMS8yNiAx
MTozMiwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4gT24gRnJpLCBBcHIgMTAsIDIwMjYg
YXQgMTA6NTA6NThBTSArMDIwMCwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4+PiBIaSwKPj4+Cj4+
PiBIZXJlJ3MgdGhlIEFtbG9naWMgQVJNNjQgRFQgY2hhbmdlcyBmb3IgdjcuMSwgaW5jbHVkaW5n
IGEgYnVuY2ggb2YgZml4ZXMKPj4+IGFuZCBpbXByb3ZlbWVudHMgZm9yIHRoZSBLaGFkYXMgVklN
NCBhbmQgVklNMXMgU0JDcywgcGx1cyBzb21lIGFkZGl0aW9ucwo+Pj4gZm9yIHRoZSBQaGljb21t
IE4xIGFuZCBhIGNvdXBsZSBvZiBsb3cgcHJpb3JpdHkgZml4ZXMuCj4+Pgo+Pj4gVGhhbmtzLAo+
Pj4gTmVpbAo+Pj4KPj4+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgNmRlMjNm
ODFhNWUwOGJlOGZiZjVlOGQ3ZTlmZWJjNzJhNWI1ZjI3ZjoKPj4+Cj4+PiAgICBMaW51eCA3LjAt
cmMxICgyMDI2LTAyLTIyIDEzOjE4OjU5IC0wODAwKQo+Pj4KPj4+IGFyZSBhdmFpbGFibGUgaW4g
dGhlIEdpdCByZXBvc2l0b3J5IGF0Ogo+Pj4KPj4+ICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2FtbG9naWMvbGludXguZ2l0IHRhZ3MvYW1sb2dpYy1h
cm02NC1kdC1mb3ItdjcuMQo+Pj4KPj4+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA0
MDFlNWM3M2VlZGRlODIyNWU4N2JkMTFjNzk0Yjg0MDkyNDhmZjQxOgo+Pj4KPj4+ICAgIGFybTY0
OiBkdHM6IG1lc29uLWd4bC1wMjMwOiBmaXggZXRoZXJuZXQgUEhZIGludGVycnVwdCBudW1iZXIg
KDIwMjYtMDQtMDggMTQ6Mjc6MjAgKzAyMDApCj4+Cj4+IERheXMgaW4gbGludXgtbmV4dDoKPj4g
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiAgIDEgfCArKysrKysr
KyAoOCkKPj4gICAuLi4KPj4KPj4gU28gYSBmZXcgdGhpbmdzIHdlcmUganVzdCBhcHBsaWVkLCB1
bmxlc3MgdGhpcyB3YXMgcmViYXNlZD8KPiAKPiBUaGlzIG9uZSBoYXMgYmVlbiBhcHBsaWVkIGxh
dGVseSwgYnV0IHRoaXMgaXMgbmV3cyBmb3IgbWUsIEkgYWx3YXlzIHRvb2sKPiBpbiBhY2NvdW50
IHRoZSB0aW1lIHNwZW50IGluIHRoZSBsaXN0cywgbm90IGluIGxpbnV4LW5leHQuCj4gSSBtYWRl
IHN1cmUgdGhpcyBvbmUgbGFuZGVkIGF0IGxlYXN0IG9uY2UgaW4gLW5leHQgdG8gdHJpZ2dlciBD
SXMuCj4gCj4gU28gaWYgdGhlcmXigJlzIG5ldyBydWxlcywgd2Ugc2hvdWxkIGJlIG1hZGUgYXdh
cmUgb2YgdGhvc2UuCgpIb3cgaXMgaXQgYSBuZXcgcnVsZT8gTGludXMgcG9zdGluZyBmcm9tIDIw
MjM6CgpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvQ0FIay09d2dYRFRmV0Zibi00ODE9aXQ2
V19CMEtUUXNPaGRnWEw2bXdlVm02ZXd0U3ZBQG1haWwuZ21haWwuY29tLwoKUGx1cyB0aGlzIGlz
IHNpbXBseSBsb2dpYyAtIHdoeSBzb2MgdHJlZSBzaG91bGQgYmUgdGhlIGZpcnN0IHRyZWUKZXhw
b3NlZCB0byBpbnRlZ3JhdGlvbiBpc3N1ZXMgYW5kIHJvYm90IHJlcG9ydHM/IElmIHNvYyB0cmVl
IG1lcmdlcwpzdHVmZiB3aGljaCB3YXMgbm90IG9uIG5leHQsIGFsbCBzdWNoIHJlcG9ydHMgd2ls
bCBiZSBhcHBsaWNhYmxlIHRvIHNvYwp0cmVlIGFzIHdlbGwuIFRoYXQncyBub3RoaW5nIG5ldyBh
Ym91dCB0aGlzLgoKPiAKPj4KPj4gSSB3aWxsIHdhaXQgd2l0aCB0aGlzLiBJdCBtaWdodCBtaXNz
IHRoZSBtZXJnZSB3aW5kb3cgaWYgdjcuMCBpcwo+PiByZWxlYXNlZCB0aGlzIHdlZWtlbmQuCj4g
Cj4gT2sgd293LCBqdXN0IGxpa2UgdGhhdC4uLiBJIG1lYW4gdGhlIGFtbG9naWMgRFQgaXMgc3Rh
YmxlLCBhbGwgcGF0Y2hlcwo+IHBhdGNoZXMgYmluZGluZ3MgY2hlY2tzIGFuZCBub25lIGlzIGNy
aXRpY2FsIHNpbmNlIGl0IG1haW5seSB0b3VjaGVzCgpZb3Ugc2VudCB5b3VyIHB1bGwgdmVyeSBs
YXRlLCBqdXN0IGJlZm9yZSB2Ny4xLCBhbmQgc2tpcHBpbmcgbGF0ZQpwb3N0aW5nIGlzIG5vdCBh
IG5ldyBydWxlLiBJdCB3YXMgYWx3YXlzIGdvaW5nIGxhdGUgcHVsbHMsIHdoaWNoIG1pZ2h0Cm1h
a2UgaXQgb3IgbWlnaHQgbm90IG1ha2UgaXQuCgo+IG5ldyBwbGF0Zm9ybXMgYW5kIHRoZSBpbmNy
aW1pbmF0ZWQgY29tbWl0IGlzIGEgbG93IHByaW9yaXR5IGZpeCBmb3IKPiAxMHkgb2xkIGRldmVs
b3BtZW50IGJvYXJkcy4uLgoKSSBkaWQgbm90IGNoZWNrIHdoaWNoIGNvbW1pdCB3YXMgbm90IGlu
IG5leHQuIFlvdSBjYW4gcHJvdmlkZSBmZWVkYmFjawp0byBteSByZXBseSB3aXRoIGFjdHVhbCBh
cmd1bWVudCwgYmVjYXVzZSBzdWNoIGV4cGxhbmF0aW9uIHdhcyBtaXNzaW5nCmluIHRhZy4gSW5z
dGVhZCB5b3UgZGVjaWRlZCB0byBiZSBzdXJwcmlzZWQgdGhhdCBwYXRjaGVzIG5lZWRzIHRvIGJl
IGluCm5leHQuLi4KCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
