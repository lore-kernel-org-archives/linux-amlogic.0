Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506F1C61DD3
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Aug 2026 08:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iM6Np2db9iLL29y316qSFxGDYWMLhe3xi/l4vz5DQTY=; b=fwR4hvOk1mFoKc
	49wHGdf4tGGOydW2lmdHBBL9UyLTEo0zB2gkzT7XpPnCO5JWnlbFpX6aBOjyz1A3cV8nzsKzJBIGE
	kGO41d8DTB1FPUWhBP4V0KIC3mHMYYmIUwBouxANWJMbSYykvJCCfkeX/OhjB9eXnYURN1vzgB3Om
	KssqvACNRZ00sXk/QkFS9/I2lFkWNlc5U6pufb+gwWs7KzqFrtio2sa33KC7rzgz3IAFvsHi28Zxh
	hmivrnqavDCzWpSBP6eRdww/3xcrGSfrUKEXOZabPowj61SC7g/kI2ycX+vFJuLFG6GbX/RuPBqwt
	D1nUGf3hDOH1qY9olJzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xbM-00000008vga-2PCT;
	Mon, 31 Aug 2026 08:42:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xbL-00000008vgU-0Ck4
	for linux-amlogic@lists.infradead.org;
	Mon, 31 Aug 2026 08:42:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2D1EE601FB;
	Mon, 31 Aug 2026 08:42:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7960A1F00A3D;
	Mon, 31 Aug 2026 08:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788165765;
	bh=Vvg3sfOFpv/DBqo2re/qrS5jT9iJB0JgddHp+qkdo2w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R4ajlRmbQIuQCKq+DaeMqjNYNaz9vupn/ez8Uzir58RSY/3HkG2Wd45qbyw5sNKqE
	 3O1gZKO+0Qu3zRhTWLe3Aw55KLhPcTQ54n6WfyYgODU6svpExvwU4KMMjH7j8Ap6Dt
	 gSVp8RGrLIqgLlhR70gzZhAEjv2Dn1f0hDwFNjAHcqYpbyIn6lVHq8LBGmu3U7Bb00
	 dPNwRVnbw4pskbY1nWhZ2n67Ae6OELIotdM+vmU+uEH82E5crPe5YABCkzB6laljd4
	 g/wHzk6pqRvlT1HhDVu0dkZ86tLGw009TifmhL8qVkyfqA7zArMdPQjOMqaKrRq5Ki
	 EHJxoJneeFGIg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 3/6] media: dt-bindings: Add Amlogic V4L2 video
 decoder
To: "Zhentao Guo" <zhentao.guo@amlogic.com>
Cc: media-ci@linuxtv.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260831-b4-s4-vdec-upstream-v8-3-830195b9bd91@amlogic.com>
References: <20260831-b4-s4-vdec-upstream-v8-0-830195b9bd91@amlogic.com>
 <20260831-b4-s4-vdec-upstream-v8-3-830195b9bd91@amlogic.com>
Date: Mon, 31 Aug 2026 08:42:44 +0000
Message-Id: <20260831084245.7960A1F00A3D@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gVGhlIGJpbmRpbmcgc3Bl
Y2lmaWVzIHVwIHRvIDIgaW50ZXJydXB0cyBidXQgbGFja3MgYW4gJ2l0ZW1zJyBsaXN0IHdpdGgg
ZGVzY3JpcHRpb25zIG9yIGFuICdpbnRlcnJ1cHQtbmFtZXMnIHByb3BlcnR5IHRvIGlkZW50aWZ5
IHRoZW0uCi0tCgpjb21taXQgOTZjOGE3ZjNkMTJmYTUwNTk1NjRhNTZmZGVkZDZhNzdjNzZkNjhj
YgpBdXRob3I6IFpoZW50YW8gR3VvIDx6aGVudGFvLmd1b0BhbWxvZ2ljLmNvbT4KCm1lZGlhOiBk
dC1iaW5kaW5nczogQWRkIEFtbG9naWMgVjRMMiB2aWRlbyBkZWNvZGVyCgpEZXNjcmliZSB0aGUg
aW5pdGlhbCBzdXBwb3J0IGZvciB0aGUgVjRMMiBzdGF0ZWxlc3MgdmlkZW8gZGVjb2RlciBkcml2
ZXIgdXNlZAp3aXRoIHRoZSBBbWxvZ2ljIFM0IChTODA1WDIpIHBsYXRmb3JtLgoKPiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2FtbG9naWMsczQt
dmRlYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2FtbG9n
aWMsczQtdmRlYy55YW1sCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAw
MDAwLi5hOTNhMjE0MDgwMWI5Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9hbWxvZ2ljLHM0LXZkZWMueWFtbApbIC4uLiBdCj4g
KyAgcmVnLW5hbWVzOgo+ICsgICAgaXRlbXM6Cj4gKyAgICAgIC0gY29uc3Q6IGRvcwo+ICsgICAg
ICAtIGNvbnN0OiBkbWMKPiArCj4gKyAgaW50ZXJydXB0czoKPiArICAgIG1heEl0ZW1zOiAyCgpb
U2V2ZXJpdHk6IExvd10KRG9lcyB0aGlzIHByb3BlcnRpZXMuaW50ZXJydXB0cyBiaW5kaW5nIGFs
bG93IHVwIHRvIDIgaW50ZXJydXB0cyB3aXRob3V0CnByb3ZpZGluZyBhbiAnaXRlbXMnIGxpc3Qg
d2l0aCBkZXNjcmlwdGlvbnMgb3IgYW4gJ2ludGVycnVwdC1uYW1lcycgcHJvcGVydHkgdG8KaWRl
bnRpZnkgdGhlbT8KClNpbmNlIHRoZSBkcml2ZXIgdXNlcyBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYs
IElSUV9WREVDKSAod2hlcmUgSVJRX1ZERUMgaXMgMSksCml0IHJlbGllcyBzdHJpY3RseSBvbiB0
aGUgaW5kZXggb3JkZXIuIENvdWxkIHRoaXMgbWFrZSB0aGUgYmluZGluZ3MgaGFyZGVyIHRvCnVz
ZSBjb3JyZWN0bHkgYW5kIGxlYWQgdG8gYnJva2VuIGludGVycnVwdHMgaWYgYSBkZXZpY2UgdHJl
ZSBhdXRob3IgZ3Vlc3NlcyB0aGUKd3Jvbmcgb3JkZXIgd2hlbiBjb25zdHJ1Y3RpbmcgYSBuZXcg
Ym9hcmQ/CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3Bh
dGNoc2V0LzIwMjYwODMxLWI0LXM0LXZkZWMtdXBzdHJlYW0tdjgtMC04MzAxOTViOWJkOTFAYW1s
b2dpYy5jb20/cGFydD0zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hbWxvZ2ljCg==
