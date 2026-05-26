Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85733CD5BC8
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 May 2026 09:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ry91ZG/lVqRqnZkmr8SzXhtbvxh2DGmAFqtyknFBDSg=; b=hgI4ekB2w2MlMP
	QvBOyuwoNosWQrTHi7Yby+UNIKkMfaeH77R+fCTh+EZEvIFb/rQbTpPhRRhNjbRtIHpc/oKXd9uXZ
	xtrd6PJN0vgGJUX6g0ojvlvce1LsGkSWi0s9kn8XiV4HbrfFFVfG5cIny1U+GZOUeeS5eGpcjjMFi
	Oiga+tT9/pmHfZp2oI/oqtG7hWdCYdWaAypvCvwNPaSRz16fHjWjZpR3zLPROLks4FRE10r+HmuuT
	OsplJ0dQoMeaX9CHpzLg7V37xmPZ/QQR0iiy74mi9PWBCgoH8CBhmyVn3a6KwuUiVgNOwJLUs3aZF
	l9KOLCvvj+qTyYJAxjcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRo67-00000001W6l-1c53;
	Tue, 26 May 2026 09:29:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRo66-00000001W6O-3fbv
	for linux-amlogic@lists.infradead.org;
	Tue, 26 May 2026 09:29:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2D1A160018;
	Tue, 26 May 2026 09:29:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 858E81F000E9;
	Tue, 26 May 2026 09:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779787753;
	bh=n8fkKHhz/HW32VzX1LcY7Rmbt6g8AE4UXvPei11LoGY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l3xhQbNA9HzqXwbYVftI/XlZR1mwLk5krmOq3TCk7Lo0Q6dJxQecW8dy4xMDUiTXG
	 NK2bqVw/nHOdbg1s3xnCXtco/aZB8YVXl5pm0EUapMZgszZ3AKAOetmzyirh8jntSK
	 2Z8YWKTWmg+2WbBosBxvRZL+Wq1sHyeydj/kPJQtAjJkbleQj0+WvvLw//1ebiYOoN
	 AF98qWkYstbvS7JNvU9KUkbEOGKU8eQuuRA6odlF/A4GLagQEL2QKYq2M9yvYWtspn
	 B9tHUjiXuJnnLq5PRC0PUgJRBX9QSDO1FeyOSIFacI82G8XZy/gKLZ0d5M4ctfx/1x
	 ARsWxGSVzU4nw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC RESEND v5 3/6] media: dt-bindings: Add Amlogic V4L2
 video decoder
To: "Zhentao Guo via B4 Relay" <devnull+zhentao.guo.amlogic.com@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org, neil.armstrong@linaro.org, conor+dt@kernel.org
In-Reply-To: <20260526-b4-s4-vdec-upstream-v5-3-33bc817f93f4@amlogic.com>
References: <20260526-b4-s4-vdec-upstream-v5-3-33bc817f93f4@amlogic.com>
Date: Tue, 26 May 2026 09:29:12 +0000
Message-Id: <20260526092913.858E81F000E9@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gVGhlIGByZXNldHNg
IHByb3BlcnR5IGlzIGZ1bmN0aW9uYWxseSBuZWNlc3NhcnkgYW5kIHByZXNlbnQgaW4gdGhlIGV4
YW1wbGUsIGJ1dCBpdCBpcyBvbWl0dGVkIGZyb20gdGhlIGByZXF1aXJlZGAgbGlzdC4KLSBbTG93
XSBUaGUgc2NoZW1hIGFsbG93cyBtdWx0aXBsZSBpbnRlcnJ1cHRzIGJ1dCBsYWNrcyBgaW50ZXJy
dXB0LW5hbWVzYCwgYGl0ZW1zYCBkZXNjcmlwdGlvbnMsIGFuZCBhIGBtaW5JdGVtc2AgY29uc3Ry
YWludC4KLS0KCmNvbW1pdCA0ZWMwZjVjN2U5ODJhMGYyMjk2M2FmMDU5M2IxOGUyZTA5MzczYzdl
CkF1dGhvcjogWmhlbnRhbyBHdW8gPHpoZW50YW8uZ3VvQGFtbG9naWMuY29tPgoKbWVkaWE6IGR0
LWJpbmRpbmdzOiBBZGQgQW1sb2dpYyBWNEwyIHZpZGVvIGRlY29kZXIKClRoaXMgY29tbWl0IGRl
c2NyaWJlcyB0aGUgaW5pdGlhbCBzdXBwb3J0IGZvciB0aGUgVjRMMiBzdGF0ZWxlc3MgdmlkZW8g
ZGVjb2Rlcgpkcml2ZXIgdXNlZCB3aXRoIHRoZSBBbWxvZ2ljIFM0IChTODA1WDIpIHBsYXRmb3Jt
LgoKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlh
L2FtbG9naWMsczQtdmRlYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L21lZGlhL2FtbG9naWMsczQtdmRlYy55YW1sCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRl
eCAwMDAwMDAwMDAwMDAwLi5hMGYzM2Y2YzM1YTE3Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9hbWxvZ2ljLHM0LXZkZWMueWFt
bApbIC4uLiBdCj4gK3Byb3BlcnRpZXM6Cj4gKyAgY29tcGF0aWJsZToKPiArICAgIGNvbnN0OiBh
bWxvZ2ljLHM0LXZkZWMKPiArCj4gKyAgcmVnOgo+ICsgICAgbWF4SXRlbXM6IDIKPiArCj4gKyAg
cmVnLW5hbWVzOgo+ICsgICAgaXRlbXM6Cj4gKyAgICAgIC0gY29uc3Q6IGRvcwo+ICsgICAgICAt
IGNvbnN0OiBkbWMKPiArCj4gKyAgaW50ZXJydXB0czoKPiArICAgIG1heEl0ZW1zOiAzCgpbU2V2
ZXJpdHk6IExvd10KU2hvdWxkIHRoaXMgcHJvcGVydHkgaW5jbHVkZSBhbiBpdGVtcyBsaXN0IHdp
dGggZGVzY3JpcHRpb25zIG9yIGEKY29ycmVzcG9uZGluZyBpbnRlcnJ1cHQtbmFtZXMgcHJvcGVy
dHk/IFdpdGhvdXQgdGhlc2UsIHRoZXJlIGlzIG5vCmRvY3VtZW50YXRpb24gb24gd2hhdCBlYWNo
IG9mIHRoZSB0aHJlZSBpbnRlcnJ1cHRzIHJlcHJlc2VudHMgb3IgdGhlCnJlcXVpcmVkIG9yZGVy
LiAKCklzIGEgbWluSXRlbXMgY29uc3RyYWludCBhbHNvIG5lZWRlZCBoZXJlIHNvIHRoYXQgZGV2
aWNlIHRyZWVzIHdpdGggZmV3ZXIKdGhhbiAzIGludGVycnVwdHMgZG8gbm90IHNpbGVudGx5IHBh
c3Mgc2NoZW1hIHZhbGlkYXRpb24/Cgo+ICsKPiArICBjbG9ja3M6Cj4gKyAgICBtYXhJdGVtczog
MwpbIC4uLiBdCj4gKyAgc2VjdXJlLW1vbml0b3I6Cj4gKyAgICBkZXNjcmlwdGlvbjogcGhhbmRs
ZSB0byB0aGUgc2VjdXJlLW1vbml0b3Igbm9kZQo+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMu
eWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZQo+ICsKPiArcmVxdWlyZWQ6Cj4gKyAgLSBjb21wYXRp
YmxlCj4gKyAgLSByZWcKPiArICAtIHJlZy1uYW1lcwo+ICsgIC0gaW50ZXJydXB0cwo+ICsgIC0g
Y2xvY2tzCj4gKyAgLSBjbG9jay1uYW1lcwo+ICsgIC0gcG93ZXItZG9tYWlucwo+ICsgIC0gcG93
ZXItZG9tYWluLW5hbWVzCj4gKyAgLSBhbWxvZ2ljLGNhbnZhcwo+ICsgIC0gc2VjdXJlLW1vbml0
b3IKCltTZXZlcml0eTogTWVkaXVtXQpTaG91bGQgcmVzZXRzIGJlIGluY2x1ZGVkIGluIHRoaXMg
cmVxdWlyZWQgbGlzdD8gSXQgaXMgZGVmaW5lZCBpbiB0aGUKcHJvcGVydGllcyBibG9jayBhbmQg
ZXhwbGljaXRseSB1c2VkIGluIHRoZSBkZXZpY2UgdHJlZSBleGFtcGxlIGJlbG93LgoKT21pdHRp
bmcgaXQgaGVyZSBtaWdodCBhbGxvdyBpbmNvbXBsZXRlbHkgY29uZmlndXJlZCBkZXZpY2UgdHJl
ZSBub2RlcyBtaXNzaW5nCnRoZSByZXNldCBsaW5lIHRvIHNpbGVudGx5IHBhc3Mgc2NoZW1hIHZh
bGlkYXRpb24sIHdoaWNoIGNvdWxkIGxlYWQgdG8gZHJpdmVyCmluaXRpYWxpemF0aW9uIGZhaWx1
cmVzIG9yIHVuZGVmaW5lZCBoYXJkd2FyZSBzdGF0ZXMgYXQgcnVudGltZS4KCj4gKwo+ICthZGRp
dGlvbmFsUHJvcGVydGllczogZmFsc2UKWyAuLi4gXQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3
IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDUyNi1iNC1zNC12ZGVjLXVwc3Ry
ZWFtLXY1LTAtMzNiYzgxN2Y5M2Y0QGFtbG9naWMuY29tP3BhcnQ9MwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
