Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AD0CCF9EE
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 Oct 2025 09:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5l8Kt5lGuFZUrpxS8EBmSEQi7WGXnj4WyX4G6uPVz2g=; b=HYh+IqSPUXMtBG
	xffdMh7FLfDdPocrEhrqU045ilp047X73DX+NJ892yi/Dewjm7PXxuJYZS/ktr8QfksJhm764RjO8
	Mmpi3AGFmOLNVE2iQrMA3OocZFzVgkoeIs0G28+c3WR1WWSpiUvLZDNZu0IR+z0kv+HQe4iMPKJyM
	ETj2zC9gvJS8WzIji/rUYO/CwjM06X6PSxWjy9aBs8ycO+L6tluE+lffZRLiMDUnUz6hFKHgMU7d/
	7SVbSXkeX8SX5A8GX2ZGMpcJERUMS5nQNma3CLbt255LdZlQ7j6+3uH9ZDillJiqC54eHJTICpMM3
	KgqRrL+H8LAs3ilf/Kcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgNb-0000000Fg2j-2Hls;
	Tue, 28 Oct 2025 09:52:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDgNY-0000000Ffzn-2Vh0;
	Tue, 28 Oct 2025 09:52:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 788C943A56;
	Tue, 28 Oct 2025 09:52:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 52D41C4CEE7;
	Tue, 28 Oct 2025 09:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761645155;
	bh=ioK5ZOkw4s9KW/LEkvm0WElrqFYWX7BayiBP0MdRiGo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=cnPdGatQY7oNXrgJarKlBFwdDpB51nLLwuQnJwUQdP13EKXfX49BtT6TMx4qZlc1s
	 PypORfEoWDv3VpYJ4uKBTX8cEIeuTgKXdqyJuGGEFisylEksEhMqYp4QFcxcpcQNEO
	 2UhkOKfCnUaTvU/ABFm5QTUcIG+SF1cTQiRluz05XNDT6SKqJQjAD+3QlntB3AJDgf
	 C9XGBYzZktAD5esBpKyKlXJYSJQ6bWo4j/tHOLseFvcpSBTmqqq2G1Mer/cvuRoh/S
	 X72aS2Ih86/UzDBpsiKUFzAMRIMtU9P4jyDm2MGRNRGXON/4JLx/ff0Q71e6mGfoI6
	 S/Y/fieVndVCQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D42CCF9E0;
	Tue, 28 Oct 2025 09:52:35 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Subject: [PATCH v4 0/8] clk: amlogic: Add A5 SoC PLLs and Peripheral clock
Date: Tue, 28 Oct 2025 17:52:26 +0800
Message-Id: <20251028-a5-clk-v4-0-e62ca0aae243@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFqSAGkC/1WMQQqDMBBFryJZNyUTo2hXvUfpIo5THaqmJCW0i
 HdvFBS6fJ//3iwCeaYgLtksPEUO7KYE5pQJ7O3UkeQ2sdBKG1UDSFtIHJ4yL9DUFpvcEIh0fnl
 68GcL3e6Jew5v579bN8K67gmzJyJIJQsijeYBjarwasfBdYxndKNYI1EfIoBWh6iTmLgqNVBdQ
 vsvLsvyA9CB407XAAAA
To: Chuan Liu <chuan.liu@amlogic.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761645153; l=3354;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=ioK5ZOkw4s9KW/LEkvm0WElrqFYWX7BayiBP0MdRiGo=;
 b=cRSuEim5T63EspU1g2+LpOzydALrYZiEHD7YePKx/x6fZFEcKe8Kxz7OB6JV43dZgm+0QTOxt
 pji4lf70lpKCA2UMsg8tEWBYOW8c9TzZ3g2vh6j60OAlgOc9XkvKkIk
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_025236_746157_D86219F3 
X-CRM114-Status: GOOD (  10.34  )
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
Reply-To: chuan.liu@amlogic.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhlIHBhdGNoc2V0IGFkZHMgc3VwcG9ydCBmb3IgdGhlIHBlcmlwaGVyYWwgYW5kIFBMTCBjbG9j
ayBjb250cm9sbGVyCm9uIHRoZSBBbWxvZ2ljIEE1IFNvQyBmYW1pbHksIHN1Y2ggYXMgQTExM1gy
LgoKRHVlIHRvIHdvcmsgYXJyYW5nZW1lbnRzLCBJIHdpbGwgdGFrZSBvdmVyIHRoaXMgcGF0Y2hz
ZXQgYW5kIGJlCnJlc3BvbnNpYmxlIGZvciBzdWJtaXR0aW5nIGFuZCBtYWludGFpbmluZyBpdHMg
c3Vic2VxdWVudCByZXZpc2lvbnMuCgpJIHByZXZpb3VzbHkgcmVzdWJtaXR0ZWQgdGhlc2UgcGF0
Y2hlcyBpbiBhbm90aGVyIHBhdGNoc2V0IFsxXSwKSmVyb21lIHBvaW50ZWQgb3V0IHRoYXQgaXQg
bWFkZSB0cmFja2luZyBtb3JlIGRpZmZpY3VsdC4gVGhlcmVmb3JlLApJ4oCZbSBjb250aW51aW5n
IHRoZSBzdWJtaXNzaW9uIGhlcmUgYmFzZWQgb24gWGlhbndlaeKAmXMgdjMgdmVyc2lvbi4KU29y
cnkgZm9yIHRoaXMgY2F1c2VzIGFueSBpbmNvbnZlbmllbmNlIHRvIGFueW9uZS4KClsxXSBodHRw
czovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA5MzAtYTRfYTVfYWRkX2Nsb2NrX2RyaXZlci12
MS0wLWE5YWNmNzk1MTU4OUBhbWxvZ2ljLmNvbS8KClNpZ25lZC1vZmYtYnk6IFhpYW53ZWkgWmhh
byA8eGlhbndlaS56aGFvQGFtbG9naWMuY29tPgpTaWduZWQtb2ZmLWJ5OiBDaHVhbiBMaXUgPGNo
dWFuLmxpdUBhbWxvZ2ljLmNvbT4KCi0tLQpDaGFuZ2VzIGluIHY0OgotIGR0LWJpbmRpbmcgZm9y
IHBlcmlwaGVyYWwgY2xvY2tzIChrZXB0IFJvYuKAmXMgJ1Jldmlld2VkLWJ5JyBoZXJlKToKICAt
IEFkZGVkIG9wdGlvbmFsIGNsb2NrIHNvdXJjZSBydGMgcGxsLgogIC0gUmVuYW1lZCBydGNfY2xr
4oCZcyBjbGtpZCB0byBiZXR0ZXIgcmVmbGVjdCBpdHMgZnVuY3Rpb24uCi0gUExML0Nsb2NrIGRy
aXZlcjoKICAtIEFkYXB0ZWQgdG8gSmVyb21l4oCZcyByZWZhY3RvcmVkIGRyaXZlciBpbnRlcmZh
Y2UsIG5hbWluZwpjb252ZW50aW9ucywgYW5kIG1hY3Jvcy4KICAtIFVwZGF0ZWQgcmVsYXRlZCBD
T05GSUcgZW50cmllcyBpbiBLY29uZmlnLgotIEFkZGVkIGR0cyBwYXRjaCBvZiBQTEwvQ2xvY2su
Ci0gTGluayB0byB2MzogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI1MDEwMy1hNS1jbGst
djMtMC1hMjA3Y2U4M2I5ZTlAYW1sb2dpYy5jb20KCkNoYW5nZXMgaW4gdjM6Ci0gUmVuYW1lIHh0
YWxfMjRtIHRvIHh0YWwsIGFuZCBtb2RpZnkgc29tZSBkZXNjcmlwdGlvbiBvZiBLY29uZmlnLgot
IERyb3Agc29tZSBjb21tZW50IG9mIFBMTCBzb3VyY2UgY29kZS4KLSBNb3ZlIGRlZmluaXRpb24g
b2YgQTVfQ0xLX0dBVEVfRlcgZnJvbWUgY29tbW9uIGNvZGUgaW50byBBNSBwZXJpcGhlcmFsIHNv
dXJjZSBjb2RlLgotIFVzZSBodyBpbnN0ZWFkIG9mIG5hbWUgdG8gZGVzY3JpYmUgcGFyZW50X2Rh
dGEuCi0gTWFraW5nIFNDTUkgYmluZGluZyB0aGUgZmlyc3QgdG8gc3VibWl0LgotIExpbmsgdG8g
djI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDExMjAtYTUtY2xrLXYyLTAtMTIwODYy
MWU5NjFkQGFtbG9naWMuY29tCgpDaGFuZ2VzIGluIHYyOgotIE1vdmUgc29tZSBzeXMgY2xvY2sg
YW5kIGF4aSBjbG9jayBmcm9tIHBlcmlwaGVyYWwgdG8gc2NtaSBpbXBsZXRlbWVudC4KLSBSZW1v
dmUgIEFSTV9TQ01JX1BST1RPQ09MIGluIEtjb25maWcgYW5kIGNvcnJlY3QgbmFtZSBBNSBidXQg
bm90IEE0LgotIEFkZCB0d28gb3B0aW9uYWwgY2xvY2sgaW5wdXRzIGZvciB0aGUgcGVyaXBoZXJh
bChkZHIgcGxsIGFuZCBjbGstbWVhc3VyZSkKLSBNYWtlIHNvbWUgY2hhbmdlcyBhbmQgYWRqdXN0
bWVudHMgYWNjb3JkaW5nIHRvIHN1Z2dlc3Rpb25zLgotIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL3IvMjAyNDA5MTQtYTUtY2xrLXYxLTAtNWVlMmM0ZjFiMDhjQGFtbG9naWMu
Y29tCgotLS0KQ2h1YW4gTGl1ICg4KToKICAgICAgZHQtYmluZGluZ3M6IGNsb2NrOiBBZGQgQW1s
b2dpYyBBNSBTQ01JIGNsb2NrIGNvbnRyb2xsZXIgc3VwcG9ydAogICAgICBkdC1iaW5kaW5nczog
Y2xvY2s6IEFkZCBBbWxvZ2ljIEE1IFBMTCBjbG9jayBjb250cm9sbGVyCiAgICAgIGR0LWJpbmRp
bmdzOiBjbG9jazogQWRkIEFtbG9naWMgQTUgcGVyaXBoZXJhbHMgY2xvY2sgY29udHJvbGxlcgog
ICAgICBjbGs6IGFtbG9naWM6IEFkZCBBNSBQTEwgY2xvY2sgY29udHJvbGxlciBkcml2ZXIKICAg
ICAgY2xrOiBhbWxvZ2ljOiBBZGQgQTUgY2xvY2sgcGVyaXBoZXJhbHMgY29udHJvbGxlciBkcml2
ZXIKICAgICAgYXJtNjQ6IGR0czogYW1sb2dpYzogQTU6IEFkZCBzY21pLWNsayBub2RlCiAgICAg
IGFybTY0OiBkdHM6IGFtbG9naWM6IEE1OiBBZGQgUExMIGNvbnRyb2xsZXIgbm9kZQogICAgICBh
cm02NDogZHRzOiBhbWxvZ2ljOiBBNTogQWRkIHBlcmlwaGVyYWwgY2xvY2sgY29udHJvbGxlciBu
b2RlCgogLi4uL2Nsb2NrL2FtbG9naWMsYTUtcGVyaXBoZXJhbHMtY2xrYy55YW1sICAgICAgICAg
fCAxMzQgKysrKwogLi4uL2JpbmRpbmdzL2Nsb2NrL2FtbG9naWMsYTUtcGxsLWNsa2MueWFtbCAg
ICAgICAgfCAgNjMgKysKIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLWE1LmR0
c2kgICAgICAgIHwgIDg2ICsrCiBkcml2ZXJzL2Nsay9tZXNvbi9LY29uZmlnICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAyNyArCiBkcml2ZXJzL2Nsay9tZXNvbi9NYWtlZmlsZSAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgMiArCiBkcml2ZXJzL2Nsay9tZXNvbi9hNS1wZXJpcGhlcmFs
cy5jICAgICAgICAgICAgICAgICB8IDg4MyArKysrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMv
Y2xrL21lc29uL2E1LXBsbC5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgNDc2ICsrKysrKysr
KysrCiAuLi4vY2xvY2svYW1sb2dpYyxhNS1wZXJpcGhlcmFscy1jbGtjLmggICAgICAgICAgICB8
IDEzMiArKysKIGluY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svYW1sb2dpYyxhNS1wbGwtY2xrYy5o
ICAgIHwgIDI0ICsKIGluY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svYW1sb2dpYyxhNS1zY21pLWNs
a2MuaCAgIHwgIDQ0ICsKIDEwIGZpbGVzIGNoYW5nZWQsIDE4NzEgaW5zZXJ0aW9ucygrKQotLS0K
YmFzZS1jb21taXQ6IGY3ZDIzODhlZWVjMjQ5NjZmYzRkNWNmMzJkNzA2ZjA1MTRmMjlhYzUKY2hh
bmdlLWlkOiAyMDI0MDkxMS1hNS1jbGstMzVjNDlhY2IzNGUxCgpCZXN0IHJlZ2FyZHMsCi0tIApD
aHVhbiBMaXUgPGNodWFuLmxpdUBhbWxvZ2ljLmNvbT4KCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
