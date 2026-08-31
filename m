Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A73C61DD3
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Aug 2026 08:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iIq1cpf2O7MR3jqaOlM4H1JhvNqeHC3Iom/sU7dcYgo=; b=ZO2k27OZYtksdr
	t6ZINU6wFLtJb1YMVJpMzTvWFGIhT7bHw/eRubJBKaLQbKtl1YK94juxv0DK9GoRFPRA7R9Q8rkfH
	2hDYhr2ifO0Nvq8hybaLj+1Jz6GupimayE7u437OTMWgeNHJgqCDQbxcu5VK2I6tH5zCmS48/vAGJ
	K/xi1Ueu0HcnS6vIh/DX1T1MqUtw+ZberPMDYmmISLmUroUgs6a/lmR4ed6xTOUWmZmzSLIMXfwtR
	5DqljR7R4Z0ToErtEEyCDKp/luaOYJqBUyheltBLG62g2GDyWjEVDctWsMNHOpkxyKkF8gdtJgXPw
	Otq18FFIIWkpPOwSzafw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xe8-00000008w6M-1IH3;
	Mon, 31 Aug 2026 08:45:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xe6-00000008w6G-3p29
	for linux-amlogic@lists.infradead.org;
	Mon, 31 Aug 2026 08:45:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5969A6013A;
	Mon, 31 Aug 2026 08:45:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AF4E1F000E9;
	Mon, 31 Aug 2026 08:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788165938;
	bh=RBaKEzy3WJAZ5/M7he4aAXq1NYfHuJ13s4feY8ly5Bw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xpe2axprfLzQD493mgU8258l1x8RoBrns+nWZJRgHKCiTA49DCmn+VhS1SJUrufkr
	 5qTy+FvrWurKJ+QbyL2MyN5xZHFKiiZVIEln0GYZGVx9Y/hXv9pzsKsFogI4QsNMjJ
	 rYQ5rtocjR/PGv4ola6iY04ZLF0Q9S9yUO931Yq7Uffg3ihSE1A57cXYxIjSERdCcD
	 cDab5x2VE1wc7HfO4VUYwqnW8fRMiue2vN3vZ72WYcHuP/L3tUe9JJBdiwaNKNjfs2
	 NULxcULX6oNafNNf7fokECIPL81FCUCpY7eaqgirbWM+VtJeULHt/p9Tlvszp6IKTn
	 TqpKrOtAn4TXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/6] firmware: meson: sm: Add video firmware loading
 SMC call
To: "Zhentao Guo" <zhentao.guo@amlogic.com>
Cc: conor+dt@kernel.org, robh@kernel.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260831-b4-s4-vdec-upstream-v8-2-830195b9bd91@amlogic.com>
References: <20260831-b4-s4-vdec-upstream-v8-0-830195b9bd91@amlogic.com>
 <20260831-b4-s4-vdec-upstream-v8-2-830195b9bd91@amlogic.com>
Date: Mon, 31 Aug 2026 08:45:37 +0000
Message-Id: <20260831084537.9AF4E1F000E9@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtIaWdoXSBtZXNvbl9zbV9jYWxsKCkgdW5jb25kaXRpb25hbGx5IHJldHVybnMgMCBvbiBzdWNj
ZXNzZnVsIGNvbW1hbmQgZGlzcGF0Y2gsIG1hc2tpbmcgU01DQ0MgZXJyb3JzIGZyb20gZnVuY3Rp
b25zIHRoYXQgcmVseSBvbiBpdHMgcmV0dXJuIHZhbHVlIGluc3RlYWQgb2YgY2hlY2tpbmcgdGhl
IG91dHB1dCBwYXJhbWV0ZXIuCi0tCgpjb21taXQgOWRkZTFjNDRkODA2NWRiZjcxZjQ1MmRlZTI2
OTRkOTMyZmEzZDZhZQpBdXRob3I6IFpoZW50YW8gR3VvIDx6aGVudGFvLmd1b0BhbWxvZ2ljLmNv
bT4KCmZpcm13YXJlOiBtZXNvbjogc206IEFkZCB2aWRlbyBmaXJtd2FyZSBsb2FkaW5nIFNNQyBj
YWxsCgpUaGlzIGNvbW1pdCBhZGRzIHRoZSBTTV9MT0FEX1ZJREVPX0ZXIGNvbW1hbmQgdG8gdGhl
IGd4YmJfY2hpcCBjb21tYW5kCnRhYmxlIHdpdGggU01DIElEIDB4YjIwMDAwMGYgZm9yIGxvYWRp
bmcgdmlkZW8gZmlybXdhcmUuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Zpcm13YXJlL21lc29u
L21lc29uX3NtLmMgYi9kcml2ZXJzL2Zpcm13YXJlL21lc29uL21lc29uX3NtLmMKPiBpbmRleCBh
Yjk3NTFhNTliNTUyLi44ODdjYWE1YzYyNWRiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZmlybXdh
cmUvbWVzb24vbWVzb25fc20uYwo+ICsrKyBiL2RyaXZlcnMvZmlybXdhcmUvbWVzb24vbWVzb25f
c20uYwo+IEBAIC00OCw2ICs0OCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWVzb25fc21fY2hp
cCBneGJiX2NoaXAgPSB7Cj4gIAkJQ01EKFNNX1RIRVJNQUxfQ0FMSUJfUkVBRCwJMHg4MjAwMDA0
NyksCj4gIAkJQ01EKFNNX0ExX1BXUkNfU0VULAkJMHg4MjAwMDA5MyksCj4gIAkJQ01EKFNNX0Ex
X1BXUkNfR0VULAkJMHg4MjAwMDA5NSksCj4gKwkJQ01EKFNNX0xPQURfVklERU9fRlcsCQkweGIy
MDAwMDBmKSwKCltTZXZlcml0eTogSGlnaF0KVGhpcyBpcyBhIHByZS1leGlzdGluZyBpc3N1ZSwg
YnV0IGRvZXMgbWVzb25fc21fY2FsbCgpIGhhbmRsZSBTTUNDQwplcnJvcnMgY29ycmVjdGx5PwoK
TG9va2luZyBhdCBtZXNvbl9zbV9jYWxsKCksIGl0IHVuY29uZGl0aW9uYWxseSByZXR1cm5zIDAg
YWZ0ZXIgZGlzcGF0Y2hpbmcKdGhlIGNvbW1hbmQ6Cgpkcml2ZXJzL2Zpcm13YXJlL21lc29uL21l
c29uX3NtLmM6bWVzb25fc21fY2FsbCgpIHsKICAgIC4uLgoJbHJldCA9IF9fbWVzb25fc21fY2Fs
bChjbWQsIGFyZzAsIGFyZzEsIGFyZzIsIGFyZzMsIGFyZzQpOwoKCWlmIChyZXQpCgkJKnJldCA9
IGxyZXQ7CgoJcmV0dXJuIDA7Cn0KClRoaXMgbWFza3MgU01DQ0MgZXJyb3JzIGZyb20gY2FsbGVy
cyB0aGF0IHJlbHkgb24gaXRzIHJldHVybiB2YWx1ZSBpbnN0ZWFkCm9mIGNoZWNraW5nIHRoZSBv
dXRwdXQgcGFyYW1ldGVyLiBGb3IgZXhhbXBsZSwgdGhlIHBvd2VyIGRvbWFpbiBkcml2ZXIKKGRy
aXZlcnMvcG1kb21haW4vYW1sb2dpYy9tZXNvbi1zZWN1cmUtcHdyYy5jKSBwYXNzZXMgYSBOVUxM
IHBvaW50ZXIgZm9yCnRoZSBvdXRwdXQgcGFyYW1ldGVyIGFuZCByZWxpZXMgb24gdGhlIHJldHVy
biB2YWx1ZSBvZiBtZXNvbl9zbV9jYWxsKCkKZm9yIGVycm9yIGNoZWNraW5nLiBUaGlzIGNhdXNl
cyBpdCB0byBhc3N1bWUgcG93ZXIgb3BlcmF0aW9ucyBhbHdheXMKc3VjY2VlZCwgd2hpY2ggY291
bGQgbGVhZCB0byBhIHN5bmNocm9ub3VzIGV4dGVybmFsIGFib3J0IChrZXJuZWwgcGFuaWMpCmlm
IGhhcmR3YXJlIHdpdGhpbiBhIGZhaWxlZCBwb3dlciBkb21haW4gaXMgYWNjZXNzZWQuCgpTaW1p
bGFybHksIG1lc29uX3NtX2dldF90aGVybWFsX2NhbGliKCkgcGFzc2VzIGEgcG9pbnRlciB0byBy
ZWNlaXZlCmNhbGlicmF0aW9uIGRhdGEsIGJ1dCBpZiBhbiBlcnJvciBvY2N1cnMsIHRoZSBTTUMg
ZXJyb3IgY29kZSBpcyBkaXJlY3RseQp3cml0dGVuIGludG8gdGhpcyBkYXRhLCBhbmQgdGhlIGZ1
bmN0aW9uIGluY29ycmVjdGx5IHJldHVybnMgMCAoc3VjY2Vzcyk6Cgpkcml2ZXJzL2Zpcm13YXJl
L21lc29uL21lc29uX3NtLmM6bWVzb25fc21fZ2V0X3RoZXJtYWxfY2FsaWIoKSB7CiAgICAuLi4K
CXJldHVybiBtZXNvbl9zbV9jYWxsKGZ3LCBTTV9USEVSTUFMX0NBTElCX1JFQUQsIHRyaW1faW5m
bywgdHNlbnNvcl9pZCwKCQkJICAgICAwLCAwLCAwLCAwKTsKfQoKU2hvdWxkIG1lc29uX3NtX2Nh
bGwoKSBwcm9wYWdhdGUgdGhlIGVycm9yIGNvZGUgaW4gbHJldCBpbnN0ZWFkIG9mIGFsd2F5cwpy
ZXR1cm5pbmcgMD8KCj4gIAkJeyAvKiBzZW50aW5lbCAqLyB9LAo+ICAJfSwKPiAgfTsKCi0tIApT
YXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA4
MzEtYjQtczQtdmRlYy11cHN0cmVhbS12OC0wLTgzMDE5NWI5YmQ5MUBhbWxvZ2ljLmNvbT9wYXJ0
PTIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
