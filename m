Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74417CA5FA5
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2026 21:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6JqAiB9j2XyowAaUw1ygB6D3G5QgK05FY4o5vENnFcQ=; b=TyS778MCEiTtF2
	c0TB/eNWty1Q2EtHbBmyU33cR2iYSOxKLF3bVNVVcNx7aFB0Y/VQYLTXPNZ56hQx9VfVOtSu91tFG
	dtkeaiDVH1VzbmRh4nVj+qnWG81CyvhSjy7wwTKtuce0Bw1jIHfAgrNN8PIayn891+D+xzfznv3BS
	mjXLq+J4wFMsvr6cMsjGnbk4XgCB32n+/WdnYFeiiZ+Mw3R+PycZXfCDui67YNywuxFpNsV40VxOn
	zKEXfesZCFIZsZkeEAEWX7lMhFvQhq07OW7kew2BMA2aJ2tWL5gIgdulVEowGvJ6/O7dU0umEGNbB
	5kkDoqEuIzqaxynHX+hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBfgK-00000004dRj-3kyh;
	Tue, 29 Sep 2026 21:48:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBfgJ-00000004dRd-3iZc
	for linux-amlogic@lists.infradead.org;
	Tue, 29 Sep 2026 21:48:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9FC0541917;
	Tue, 29 Sep 2026 21:48:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4383B1F000FF;
	Tue, 29 Sep 2026 21:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790718491;
	bh=b1LAPVbBRymfVxATEbU4InzhyK00lIO5KfEF6dsIsqw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GKkiu9YKkqL2hP0swxECp23rHnid3/2x/dWvfyOL3YSfi/CMeQ1cQ1leNfgW+kwzs
	 idUI6Mso4dnz6mbFqEHlH12X10Bg0OFAX0blbXF8TJAqCEjfmy8gUVVTy+iyAwmZYm
	 Tktq8Lz0eHNGtlwYJOOUJQ6oTR/3Z1QjmqIm7TaaoUQIwCdhgSQN/UeEu+ENh9sSk0
	 EFt7qcZFP+TXcG2UbdbAtvvic+UIeaWCAG2ptOlcAIVeWS4U1pZ2T/ufVe5PlYzY5W
	 SkiqpwPor4ZH9Q43nJ00l9u/yxzUcIFqOYPU1yb4SmrWrHFVdHdzkbKig5zZYvTezy
	 Ylw2blmZQWMvA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: meson: vdec: size capture planes from the
 aligned canvas
To: "Michael Freidkin" <freidkin@gmail.com>
Cc: neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, media-ci@linuxtv.org
In-Reply-To: <20260928165045.642354-1-freidkin@gmail.com>
References: <20260928165045.642354-1-freidkin@gmail.com>
Date: Tue, 29 Sep 2026 21:48:10 +0000
Message-Id: <20260929214811.4383B1F000FF@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0NyaXRpY2FsXSBtZWRpYTogbWVz
b246IHZkZWM6IGludGVnZXIgb3ZlcmZsb3cgaW4gZ2V0X291dHB1dF9zaXplKCkgY2F1c2VzIE9P
QiBETUEgd3JpdGUKLS0KCmNvbW1pdCAyOGJjZDZhOWRiNmM2MjQ3ZWNhY2U0OTE1NjY5MjU4OGRi
ODY3MDk3CkF1dGhvcjogTWljaGFlbCBGcmVpZGtpbiA8ZnJlaWRraW5AZ21haWwuY29tPgoKbWVk
aWE6IG1lc29uOiB2ZGVjOiBzaXplIGNhcHR1cmUgcGxhbmVzIGZyb20gdGhlIGFsaWduZWQgY2Fu
dmFzCgpUaGlzIGNvbW1pdCBhbGlnbnMgdGhlIHdpZHRoIGFuZCBoZWlnaHQgdG8gMzIgYmVmb3Jl
IGNhbGN1bGF0aW5nIHRoZSBvdXRwdXQKc2l6ZSBpbiBnZXRfb3V0cHV0X3NpemUoKS4gVGhpcyBm
aXhlcyBhbiBpc3N1ZSB3aGVyZSB0aGUgYWxsb2NhdGVkIGNhcHR1cmUKcGxhbmVzIHdlcmUgdG9v
IHNtYWxsIGZvciB0aGUgYWR2ZXJ0aXNlZCBzdHJpZGUgd2hlbiB0aGUgd2lkdGggaXMgbm90IGEK
bXVsdGlwbGUgb2YgMzIuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvbWVz
b24vdmRlYy92ZGVjLmMgYi9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvbWVzb24vdmRlYy92ZGVjLmMK
PiBpbmRleCBjMThiZjM1MmIxOTk2Li5iZTI5ZDVhMTFjMmU2IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvc3RhZ2luZy9tZWRpYS9tZXNvbi92ZGVjL3ZkZWMuYwo+ICsrKyBiL2RyaXZlcnMvc3RhZ2lu
Zy9tZWRpYS9tZXNvbi92ZGVjL3ZkZWMuYwo+IEBAIC0zNCw3ICszNCw3IEBAIHN0cnVjdCBkdW1t
eV9idWYgewo+ICAKPiAgc3RhdGljIHUzMiBnZXRfb3V0cHV0X3NpemUodTMyIHdpZHRoLCB1MzIg
aGVpZ2h0KQo+ICB7Cj4gLQlyZXR1cm4gQUxJR04od2lkdGggKiBoZWlnaHQsIFNaXzY0Syk7Cj4g
KwlyZXR1cm4gQUxJR04oQUxJR04od2lkdGgsIDMyKSAqIEFMSUdOKGhlaWdodCwgMzIpLCBTWl82
NEspOwoKW1NldmVyaXR5OiBDcml0aWNhbF0KRG9lcyB0aGlzIG5ldyBhbGlnbm1lbnQgY2FsY3Vs
YXRpb24gaW50cm9kdWNlIGFuIGludGVnZXIgb3ZlcmZsb3cgdGhhdApyZXN1bHRzIGluIGEgMC1i
eXRlIERNQSBidWZmZXI/CgpBIGNyYWZ0ZWQgVlA5IGJpdHN0cmVhbSBjYW4gcHJvdmlkZSB1bnRy
dXN0ZWQgZGltZW5zaW9ucyB1cCB0byA2NTUzNXg2NTUzNS4KVGhlIGZpcm13YXJlIHBhcnNlcyB0
aGVzZSBpbnRvIHBhcmFtLT5wLndpZHRoIGFuZCBwYXJhbS0+cC5oZWlnaHQgaW4KZHJpdmVycy9z
dGFnaW5nL21lZGlhL21lc29uL3ZkZWMvY29kZWNfdnA5LmM6Y29kZWNfdnA5X3Byb2Nlc3NfcnBt
KCksIHdoaWNoCnBhc3NlcyB0aGVtIGRpcmVjdGx5IHRvIGFtdmRlY19zcmNfY2hhbmdlKCkuIFRo
ZSBkaW1lbnNpb25zIGFyZSBhc3NpZ25lZAp0byBzZXNzLT53aWR0aCBhbmQgc2Vzcy0+aGVpZ2h0
IHdpdGhvdXQgY2xhbXBpbmcuCgpJZiBhIHVzZXIgaGFuZGxlcyB0aGUgcmVzdWx0aW5nIHNvdXJj
ZSBjaGFuZ2UgZXZlbnQgYnkgY2FsbGluZwpWSURJT0NfUkVRQlVGUyBkaXJlY3RseSwgc2tpcHBp
bmcgVklESU9DX1NfRk1UIHdoaWNoIHdvdWxkIG5vcm1hbGx5IGNsYW1wCnRoZSBkaW1lbnNpb25z
LCBnZXRfb3V0cHV0X3NpemUoKSBpcyBjYWxsZWQgd2l0aCA2NTUzNXg2NTUzNS4KCldoZW4gdGhl
c2UgZGltZW5zaW9ucyBhcmUgYWxpZ25lZCB0byAzMiBoZXJlLCBBTElHTig2NTUzNSwgMzIpICoK
QUxJR04oNjU1MzUsIDMyKSBldmFsdWF0ZXMgdG8gNjU1MzYgKiA2NTUzNiwgb3IgNCwyOTQsOTY3
LDI5Ni4gQmVjYXVzZQpnZXRfb3V0cHV0X3NpemUoKSB1c2VzIHUzMiwgdGhpcyBtdWx0aXBsaWNh
dGlvbiBvdmVyZmxvd3MgYW5kIHdyYXBzCmV4YWN0bHkgdG8gMC4KCnZkZWNfcXVldWVfc2V0dXAo
KSB0aGVuIGZldGNoZXMgdGhpcyBvdmVyZmxvd2VkIG91dHB1dCBzaXplICgwKSB0bwppbml0aWFs
aXplIHRoZSBETUEgcGxhbmUgc2l6ZXMsIGJ5cGFzc2luZyBzaXplIHZhbGlkYXRpb25zIGFuZCBy
ZXF1ZXN0aW5nIGEKMC1ieXRlIERNQSBidWZmZXIuIFRoZSBoYXJkd2FyZSB3b3VsZCB0aGVuIGF0
dGVtcHQgdG8gZGVjb2RlIHRoZSBmcmFtZSBpbnRvCnRoaXMgdGlueSBidWZmZXIsIHdyaXRpbmcg
Z2lnYWJ5dGVzIG9mIGRhdGEgb3V0IG9mIGJvdW5kcy4KClByaW9yIHRvIHRoaXMgcGF0Y2gsIHdp
ZHRoICogaGVpZ2h0IGZvciA2NTUzNXg2NTUzNSB3YXMgNCwyOTQsODM2LDIyNSwKd2hpY2ggZGlk
IG5vdCBvdmVyZmxvdyB1MzIgYW5kIGNvcnJlY3RseSBjYXVzZWQgYSBzYWZlIGFsbG9jYXRpb24g
ZmFpbHVyZS4KCj4gIH0KPiAgCj4gIHUzMiBhbXZkZWNfZ2V0X291dHB1dF9zaXplKHN0cnVjdCBh
bXZkZWNfc2Vzc2lvbiAqc2VzcykKCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nh
c2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA5MjgxNjUwNDUuNjQyMzU0LTEtZnJlaWRraW5AZ21h
aWwuY29tP3BhcnQ9MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
