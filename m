Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F4BC531FA
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Jul 2026 07:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SVJaIpIP6hI0KDCjA0TgFP6kKTz+ziAYIr4SOqxA54E=; b=UeqiqmW/5DYP0x
	QJKxK4rnqejTvWxz9C8Aa++jCXEaA6f5JG8Sf8kfKFHbQQF3L+Sw88e85QMYn8LYacEHN5QILZpPM
	8EGjRbFbmKsD3HCbBrxBuKOmXyHXh7I50UuTVCQodSulkitLIPKqSV4frqQmxeWlrAY5gnH98V4zl
	D1dQeaz3Jr2NdcIHSRNRiq49Vkwl1c5TZW+6jDTWH/roFChTS2w7AnTKcHPxlbn6HuVF3nD3K/lcq
	3gTi4+kmt8RFikYtwGsa3vb1/sE+zNAIYE5xHvZNhG1Cs2+IhV0uwJrK4hl1PDTd3W5XPjc3KFRWR
	F7OSUP+TtOTn9+AmJmMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnA6T-0000000FfVj-20Ve;
	Fri, 24 Jul 2026 07:13:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnA6S-0000000FfVX-0VyD
	for linux-amlogic@lists.infradead.org;
	Fri, 24 Jul 2026 07:13:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CE4BA40F0E;
	Fri, 24 Jul 2026 07:13:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EF411F000E9;
	Fri, 24 Jul 2026 07:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784877231;
	bh=Eu0D8k7gCIluWZCHDKO6pkMJ4BT1HYY8LQCwUpUWD/E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E8XfNRRTtAgRvwpamx1uWRbzfCPfdj8b/X6qfATtPXwjgNLdQF3kxXUhti/vJa3jc
	 vVjO2lnpxBOrMwvQ1mBvrgGebZWEJRgAJvJ2zCpFtJj05YSgplDOgEc4aGyR5r7enn
	 HMU1P+/JvQT7ohIsAyDwrFx1dS64MJ0vuBDw/Bimc7/H81IkcrBuTKm1ST+zudjQbS
	 oP9KDiE2YpntvKu+vpjbpdfhti6HVrW1w4h5fYDxaBK+16tEuIgYaJHMhn0eVeW0bz
	 og3vfSdaj5vyoHOz9SGzGX51s6abkBwVZOYgn/7Lk/nH/vRGFJKEwk5D0G40LKhok9
	 xqJt7hOoOxujw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/6] media: dt-bindings: Add Amlogic V4L2 video
 decoder
To: "Zhentao Guo" <zhentao.guo@amlogic.com>
Cc: robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, media-ci@linuxtv.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260724-b4-s4-vdec-upstream-v6-3-6072a7ee7428@amlogic.com>
References: <20260724-b4-s4-vdec-upstream-v6-0-6072a7ee7428@amlogic.com>
 <20260724-b4-s4-vdec-upstream-v6-3-6072a7ee7428@amlogic.com>
Date: Fri, 24 Jul 2026 07:13:50 +0000
Message-Id: <20260724071351.3EF411F000E9@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gVGhlIGBpbnRlcnJ1
cHRzYCBwcm9wZXJ0eSBhbGxvd3MgdXAgdG8gMyBpdGVtcyBidXQgbGFja3MgZGVzY3JpcHRpb25z
IChgaXRlbXM6YCkgYW5kIG9taXRzIGFuIGBpbnRlcnJ1cHQtbmFtZXNgIGRlZmluaXRpb24uCi0g
W01lZGl1bV0gVGhlIGByZXNldHNgIHByb3BlcnR5IGlzIGRlZmluZWQgYW5kIHVzZWQgaW4gdGhl
IGV4YW1wbGUgYnV0IGlzIG1pc3NpbmcgZnJvbSB0aGUgYHJlcXVpcmVkYCBsaXN0LgotLQoKLS0t
IFBhdGNoIFszXTogW1BBVENIIHY2IDMvNl0gbWVkaWE6IGR0LWJpbmRpbmdzOiBBZGQgQW1sb2dp
YyBWNEwyIHZpZGVvIGRlY29kZXIgLS0tCmNvbW1pdCAyODlhNzNmNjY3ZmNhNGVhZjMwMzhjZWNm
NWM1NWJlNjA4MmY1ODAxCkF1dGhvcjogWmhlbnRhbyBHdW8gPHpoZW50YW8uZ3VvQGFtbG9naWMu
Y29tPgoKbWVkaWE6IGR0LWJpbmRpbmdzOiBBZGQgQW1sb2dpYyBWNEwyIHZpZGVvIGRlY29kZXIK
ClRoaXMgY29tbWl0IGRlc2NyaWJlcyB0aGUgaW5pdGlhbCBzdXBwb3J0IGZvciB0aGUgVjRMMiBz
dGF0ZWxlc3MgdmlkZW8gZGVjb2Rlcgpkcml2ZXIgdXNlZCB3aXRoIHRoZSBBbWxvZ2ljIFM0IChT
ODA1WDIpIHBsYXRmb3JtLgoKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL21lZGlhL2FtbG9naWMsczQtdmRlYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21lZGlhL2FtbG9naWMsczQtdmRlYy55YW1sCj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL21lZGlhL2FtbG9naWMsczQtdmRlYy55YW1sCj4gQEAgLTAsMCArMSwxMDMgQEAK
PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1
c2UpCgpbIC4uLiBdCgo+ICsgIHJlZy1uYW1lczoKPiArICAgIGl0ZW1zOgo+ICsgICAgICAtIGNv
bnN0OiBkb3MKPiArICAgICAgLSBjb25zdDogZG1jCj4gKwo+ICsgIGludGVycnVwdHM6Cj4gKyAg
ICBtYXhJdGVtczogMwoKW1NldmVyaXR5OiBNZWRpdW1dCklzIGl0IHBvc3NpYmxlIHRvIGFkZCBk
ZXNjcmlwdGlvbnMgb3IgYW4gaW50ZXJydXB0LW5hbWVzIGFycmF5IGhlcmU/CgpXaXRob3V0IGRl
c2NyaXB0aW9ucyBmb3IgZWFjaCBhcnJheSBpdGVtIG9yIGFuIGludGVycnVwdC1uYW1lcyBwcm9w
ZXJ0eSwKZGV2aWNlIHRyZWUgYXV0aG9ycyBkbyBub3QgaGF2ZSBkb2N1bWVudGF0aW9uIG9uIHRo
ZSByZXF1aXJlZCBvcmRlciBhbmQKcHVycG9zZSBvZiB0aGUgMyBpbnRlcnJ1cHRzLgoKQWRkaXRp
b25hbGx5LCBkdF9iaW5kaW5nX2NoZWNrIGNhbm5vdCBlbmZvcmNlIHRoZSBleGFjdCBudW1iZXIg
b2YgaW50ZXJydXB0cwpvciB0aGVpciBvcmRlciB3aXRob3V0IGFuIGl0ZW1zIGxpc3QsIG1lYW5p
bmcgYSBkZXZpY2UgdHJlZSBub2RlIHdpdGggb25seQoxIG9yIDIgaW50ZXJydXB0cyBjb3VsZCBz
aWxlbnRseSBwYXNzIHZhbGlkYXRpb24uCgo+ICsKPiArICBjbG9ja3M6Cj4gKyAgICBtYXhJdGVt
czogMwoKWyAuLi4gXQoKPiArICBhbWxvZ2ljLGNhbnZhczoKPiArICAgIGRlc2NyaXB0aW9uOiBz
aG91bGQgcG9pbnQgdG8gYSBjYW52YXMgcHJvdmlkZXIgbm9kZQo+ICsgICAgJHJlZjogL3NjaGVt
YXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZQo+ICsKPiArICBzZWN1cmUtbW9uaXRv
cjoKPiArICAgIGRlc2NyaXB0aW9uOiBwaGFuZGxlIHRvIHRoZSBzZWN1cmUtbW9uaXRvciBub2Rl
Cj4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlCj4g
Kwo+ICtyZXF1aXJlZDoKPiArICAtIGNvbXBhdGlibGUKPiArICAtIHJlZwo+ICsgIC0gcmVnLW5h
bWVzCj4gKyAgLSBpbnRlcnJ1cHRzCj4gKyAgLSBjbG9ja3MKPiArICAtIGNsb2NrLW5hbWVzCj4g
KyAgLSBwb3dlci1kb21haW5zCj4gKyAgLSBwb3dlci1kb21haW4tbmFtZXMKPiArICAtIGFtbG9n
aWMsY2FudmFzCj4gKyAgLSBzZWN1cmUtbW9uaXRvcgoKW1NldmVyaXR5OiBNZWRpdW1dClNob3Vs
ZCByZXNldHMgYmUgaW5jbHVkZWQgaW4gdGhpcyByZXF1aXJlZCBwcm9wZXJ0aWVzIGxpc3Q/CgpU
aGUgcmVzZXRzIHByb3BlcnR5IGlzIGRlZmluZWQgYWJvdmUgaW4gdGhlIHNjaGVtYSBhbmQgdXNl
ZCBpbiB0aGUgZXhhbXBsZS4KClNpbmNlIEFtbG9naWMgdmlkZW8gZGVjb2RlciBoYXJkd2FyZSBi
bG9ja3MgdHlwaWNhbGx5IHJlcXVpcmUgYSBoYXJkd2FyZQpyZXNldCBsaW5lIChlLmcuLCB0aGUg
RE9TIHJlc2V0KSBmb3IgcHJvcGVyIGluaXRpYWxpemF0aW9uLCBvbWl0dGluZyByZXNldHMKZnJv
bSB0aGUgcmVxdWlyZWQgbGlzdCBtaWdodCBhbGxvdyBhbiBpbmNvbXBsZXRlIGRldmljZSB0cmVl
IG5vZGUgdG8Kc2lsZW50bHkgcGFzcyBzY2hlbWEgdmFsaWRhdGlvbiBidXQgZmFpbCBhdCBydW50
aW1lLgoKPiArCj4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQoKWyAuLi4gXQoKLS0gClNh
c2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDcy
NC1iNC1zNC12ZGVjLXVwc3RyZWFtLXY2LTAtNjA3MmE3ZWU3NDI4QGFtbG9naWMuY29tP3BhcnQ9
MwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
