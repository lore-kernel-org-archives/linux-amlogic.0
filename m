Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5937ACCA470
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Sep 2025 09:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x2wPwAVQRd2SO7evinjGARnFMC7hs4NZ/AiEBhKn+yU=; b=YIysBkco6/tgV0
	AJ9D2C6KUh3oSE3uUD5k6AnHzFZQpt4UrjqdU6QasoUtdGHLNrMOhtFCjU1JTrpeJCjwWg3JyLcI6
	hDagbGzW3LOQqusuYVL9CRVWec76u16FjV45cNNAiiXrkhQcwQbol7SUKz5Dq4RYNIlH/M44uYcOn
	hfo8gkDcVDwUJfPPZ8miesGqE5gIwmBcuif5Jiz7HW+1UEZWdUAW2qqFwNT9Kko9NtQGfPuk64naL
	2A2JJugOstCD4OWw/WKWP3rpNnJ3ON82fTVph3aiv6nhG4+XbFVvyTUJEtDs5e8oB6yfAnMsvt3yo
	UEui2i1RS0+mA9yleY6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Wnh-00000004q6f-0apK;
	Tue, 30 Sep 2025 09:37:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Wnd-00000004q1T-2uOp;
	Tue, 30 Sep 2025 09:37:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9BCFF60452;
	Tue, 30 Sep 2025 09:37:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44A39C4CEF0;
	Tue, 30 Sep 2025 09:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759225051;
	bh=5o+htP+rM/HKQyGn1eH3S7+MzThwQ+uX1Hq8VqONr8g=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=n9xxRbBBX96T9ogcvhLUVw8I8DhLBCLfbpk2dfxWWXyJ/khtsq8oqFcT7gGdJqit/
	 tWd6EgzlvC+0o6Bt7lHLfzDo/6yH7naAjRWQ7xfHiml1BS1hpIL3N9vAdcUGR7SpT3
	 Z0LNwuF6TBLCCfkRPe13i8SnOwGpuzl7LzdYjnvutHXqCzQ7mwHuxzuXC2EYyof6jH
	 edpVAsXoS8kubU08pHR5U9LT4zwEzvQQw1N81UnIzStZ03XlSFJL/og3k0UuUxff7b
	 zF4jiPEE3lZ5q0AOmAQgCMDSl+xXF5V2LJneUtv9+igBFiWrDje3RdijMcN/HiabZW
	 yZbBf/QEdRPfw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FAB2CAC5BC;
	Tue, 30 Sep 2025 09:37:31 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Subject: [PATCH 00/19] clk: amlogic: Add PLLs and peripheral clocks for A4
 and A5 SoCs
Date: Tue, 30 Sep 2025 17:37:13 +0800
Message-Id: <20250930-a4_a5_add_clock_driver-v1-0-a9acf7951589@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMmk22gC/x3M0QoCIRBA0V9Z5jnBNC37lSXEnKmGYl1GkED89
 6TH83Bvh0rCVOG6dBBqXLlsE8fDAvmVticpxmkw2jgdzEWlU0wuJsSYPyW/Iwo3EmXu5xzQB+e
 thRnvQg/+/sfrbYwfl8Id9GgAAAA=
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759225047; l=4218;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=5o+htP+rM/HKQyGn1eH3S7+MzThwQ+uX1Hq8VqONr8g=;
 b=9UB/pSh4Qx25JQAEirqjDzvZLuzERi70Cm6gW7FIEkZawGXnWeEHArseYuIOn4cVV4sEtZAa/
 JbTQPGuAcNjD5619B0r6CFtJhOhE2icgF32q6i9IBU4mc7tmLmTgXXe
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
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

VGhpcyBwYXRjaCBzZXJpZXMgaW5jbHVkZXMgY2hhbmdlcyByZWxhdGVkIHRvIHRoZSBQTEwgYW5k
IHBlcmlwaGVyYWwKY2xvY2tzIGZvciBib3RoIHRoZSBBNCBhbmQgQTUgU29Dcy4KClRoZSBwYXRj
aGVzIGZvciBBNSB3ZXJlIHByZXZpb3VzbHkgc3VibWl0dGVkIHVwIHRvIFYzIGJ5IFhpYW53ZWku
Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MDEwMy1hNS1jbGstdjMtMC1hMjA3Y2U4
M2I5ZTlAYW1sb2dpYy5jb20vCkFmdGVyIGZyaWVuZGx5IGNvb3JkaW5hdGlvbiwgSeKAmXZlIHRh
a2VuIG92ZXIgYW5kIGNvbnRpbnVlZCB0aGUKc3VibWlzc2lvbiBhcyBwYXJ0IG9mIHRoaXMgc2Vy
aWVzLiBUaGUgZHQtYmluZGluZ3MgcGF0Y2ggcmV0YWlucyBSb2IncwpvcmlnaW5hbCAiUmV2aWV3
ZWQtYnkiIHRhZywgYW5kIEkgaG9wZSB0aGlzIGhhc27igJl0IGNhdXNlZCBhbnkKYWRkaXRpb25h
bCBjb25mdXNpb24uCgpCb3RoIEE0IGFuZCBBNSBiZWxvbmcgdG8gdGhlIEF1ZGlvIHNlcmllcy4g
SnVkZ2luZyBieSB0aGVpciBuYW1lcywgb25lCm1pZ2h0IGFzc3VtZSB0aGF0IEE1IGlzIGFuIHVw
Z3JhZGUgdG8gQTQsIGJ1dCBpbiBmYWN0LCBBNSB3YXMgcmVsZWFzZWQKYSB5ZWFyIGVhcmxpZXIg
dGhhbiBBNC4KClNpbmNlIHRoZXJlIGFyZSBkaWZmZXJlbmNlcyBpbiB0aGUgUExMcyBhbmQgcGVy
aXBoZXJhbCBjbG9ja3MgYmV0d2Vlbgp0aGUgQTQgYW5kIEE1IFNvQ3MgKGVzcGVjaWFsbHkgdGhl
IFBMTCksIGFuZCB0YWtpbmcgaW50byBhY2NvdW50IGZhY3RvcnMKc3VjaCBhcyBtZW1vcnkgZm9v
dHByaW50IGFuZCBtYWludGFpbmFiaWxpdHksIHRoaXMgc2VyaWVzIGRvZXMgbm90CmF0dGVtcHQg
dG8gbWVyZ2UgdGhlIHR3byBpbnRvIGEgc2hhcmVkIGRyaXZlciBhcyB3YXMgZG9uZSBmb3IKRzEy
QS9HMTJCL1NNMS4KClRoaXMgcGF0Y2ggc2VyaWVzIGluY2x1ZGVzIGFsbCByZWxhdGVkIGR0LWJp
bmRpbmdzLCBkcml2ZXIsIGFuZCBkdHMKY2hhbmdlcyBmb3IgdGhlIFBMTHMgYW5kIHBlcmlwaGVy
YWwgY2xvY2tzLiBGb2xsb3dpbmcgb3VyIHBhc3QgY29udmVudGlvbgpmb3IgY2xvY2stcmVsYXRl
ZCBzdWJtaXNzaW9ucywgdGhlIGR0cyBjaGFuZ2VzIGFyZSBwbGFjZWQgYXQgdGhlIGVuZAphbmQg
c3VibWl0dGVkIHNlcGFyYXRlbHkuIElmIHRoaXMgb3JkZXJpbmcgbWFrZXMgaXQgaGFyZGVyIGZv
cgptYWludGFpbmVycyB0byByZXZpZXcgb3IgcGljayBwYXRjaGVzLCBwbGVhc2UgZmVlbCBmcmVl
IHRvIHBvaW50IGl0IG91dC4KCkNvLWRldmVsb3BlZC1ieTogWGlhbndlaSBaaGFvIDx4aWFud2Vp
LnpoYW9AYW1sb2dpYy5jb20+ClNpZ25lZC1vZmYtYnk6IFhpYW53ZWkgWmhhbyA8eGlhbndlaS56
aGFvQGFtbG9naWMuY29tPgpTaWduZWQtb2ZmLWJ5OiBDaHVhbiBMaXUgPGNodWFuLmxpdUBhbWxv
Z2ljLmNvbT4KLS0tCkNodWFuIExpdSAoMTkpOgogICAgICBkdC1iaW5kaW5nczogY2xvY2s6IEFk
ZCBBbWxvZ2ljIEE0IFNDTUkgY2xvY2sgY29udHJvbGxlcgogICAgICBkdC1iaW5kaW5nczogY2xv
Y2s6IEFkZCBBbWxvZ2ljIEE0IFBMTCBjbG9jayBjb250cm9sbGVyCiAgICAgIGR0LWJpbmRpbmdz
OiBjbG9jazogQWRkIEFtbG9naWMgQTQgcGVyaXBoZXJhbHMgY2xvY2sgY29udHJvbGxlcgogICAg
ICBjbGs6IGFtbG9naWM6IE9wdGltaXplIFBMTCBlbmFibGUgdGltaW5nCiAgICAgIGNsazogYW1s
b2dpYzogQ29ycmVjdCBsX2RldGVjdCBiaXQgY29udHJvbAogICAgICBjbGs6IGFtbG9naWM6IEZp
eCBvdXQtb2YtcmFuZ2UgUExMIGZyZXF1ZW5jeSBzZXR0aW5nCiAgICAgIGNsazogYW1sb2dpYzog
QWRkIEE0IFBMTCBjbG9jayBjb250cm9sbGVyIGRyaXZlcgogICAgICBjbGs6IGFtbG9naWM6IEFk
ZCBBNCBjbG9jayBwZXJpcGhlcmFscyBjb250cm9sbGVyIGRyaXZlcgogICAgICBhcm02NDogZHRz
OiBhbWxvZ2ljOiBBNDogQWRkIHNjbWktY2xrIG5vZGUKICAgICAgYXJtNjQ6IGR0czogYW1sb2dp
YzogQTQ6IEFkZCBQTEwgY29udHJvbGxlciBub2RlCiAgICAgIGFybTY0OiBkdHM6IGFtbG9naWM6
IEE0OiBBZGQgcGVyaXBoZXJhbHMgY2xvY2sgY29udHJvbGxlciBub2RlCiAgICAgIGR0LWJpbmRp
bmdzOiBjbG9jazogQWRkIEFtbG9naWMgQTUgU0NNSSBjbG9jayBjb250cm9sbGVyIHN1cHBvcnQK
ICAgICAgZHQtYmluZGluZ3M6IGNsb2NrOiBBZGQgQW1sb2dpYyBBNSBQTEwgY2xvY2sgY29udHJv
bGxlcgogICAgICBkdC1iaW5kaW5nczogY2xvY2s6IEFkZCBBbWxvZ2ljIEE1IHBlcmlwaGVyYWxz
IGNsb2NrIGNvbnRyb2xsZXIKICAgICAgY2xrOiBhbWxvZ2ljOiBBZGQgQTUgUExMIGNsb2NrIGNv
bnRyb2xsZXIgZHJpdmVyCiAgICAgIGNsazogYW1sb2dpYzogQWRkIEE1IGNsb2NrIHBlcmlwaGVy
YWxzIGNvbnRyb2xsZXIgZHJpdmVyCiAgICAgIGFybTY0OiBkdHM6IGFtbG9naWM6IEE1OiBBZGQg
c2NtaS1jbGsgbm9kZQogICAgICBhcm02NDogZHRzOiBhbWxvZ2ljOiBBNTogQWRkIFBMTCBjb250
cm9sbGVyIG5vZGUKICAgICAgYXJtNjQ6IGR0czogYW1sb2dpYzogQTU6IEFkZCBwZXJpcGhlcmFs
IGNsb2NrIGNvbnRyb2xsZXIgbm9kZQoKIC4uLi9jbG9jay9hbWxvZ2ljLGE0LXBlcmlwaGVyYWxz
LWNsa2MueWFtbCAgICAgICAgIHwgMTIyICsrKwogLi4uL2JpbmRpbmdzL2Nsb2NrL2FtbG9naWMs
YTQtcGxsLWNsa2MueWFtbCAgICAgICAgfCAgNjEgKysKIC4uLi9jbG9jay9hbWxvZ2ljLGE1LXBl
cmlwaGVyYWxzLWNsa2MueWFtbCAgICAgICAgIHwgMTM0ICsrKysKIC4uLi9iaW5kaW5ncy9jbG9j
ay9hbWxvZ2ljLGE1LXBsbC1jbGtjLnlhbWwgICAgICAgIHwgIDYzICsrCiBhcmNoL2FybTY0L2Jv
b3QvZHRzL2FtbG9naWMvYW1sb2dpYy1hNC5kdHNpICAgICAgICB8ICA4MCArKwogYXJjaC9hcm02
NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtYTUuZHRzaSAgICAgICAgfCAgODcgKysKIGRyaXZl
cnMvY2xrL21lc29uL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDUzICsrCiBk
cml2ZXJzL2Nsay9tZXNvbi9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNCAr
CiBkcml2ZXJzL2Nsay9tZXNvbi9hMS1wbGwuYyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAg
MSArCiBkcml2ZXJzL2Nsay9tZXNvbi9hNC1wZXJpcGhlcmFscy5jICAgICAgICAgICAgICAgICB8
IDc2NCArKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvY2xrL21lc29uL2E0LXBsbC5jICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgMjQyICsrKysrKwogZHJpdmVycy9jbGsvbWVzb24vYTUtcGVy
aXBoZXJhbHMuYyAgICAgICAgICAgICAgICAgfCA4ODMgKysrKysrKysrKysrKysrKysrKysrCiBk
cml2ZXJzL2Nsay9tZXNvbi9hNS1wbGwuYyAgICAgICAgICAgICAgICAgICAgICAgICB8IDQ3NiAr
KysrKysrKysrKwogZHJpdmVycy9jbGsvbWVzb24vY2xrLXBsbC5jICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgNzYgKy0KIGRyaXZlcnMvY2xrL21lc29uL2Nsay1wbGwuaCAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICAyICsKIC4uLi9jbG9jay9hbWxvZ2ljLGE0LXBlcmlwaGVyYWxzLWNsa2Mu
aCAgICAgICAgICAgIHwgMTI5ICsrKwogaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9hbWxvZ2lj
LGE0LXBsbC1jbGtjLmggICAgfCAgMTUgKwogaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9hbWxv
Z2ljLGE0LXNjbWktY2xrYy5oICAgfCAgNDIgKwogLi4uL2Nsb2NrL2FtbG9naWMsYTUtcGVyaXBo
ZXJhbHMtY2xrYy5oICAgICAgICAgICAgfCAxMzIgKysrCiBpbmNsdWRlL2R0LWJpbmRpbmdzL2Ns
b2NrL2FtbG9naWMsYTUtcGxsLWNsa2MuaCAgICB8ICAyNCArCiBpbmNsdWRlL2R0LWJpbmRpbmdz
L2Nsb2NrL2FtbG9naWMsYTUtc2NtaS1jbGtjLmggICB8ICA0NCArCiAyMSBmaWxlcyBjaGFuZ2Vk
LCAzNDA2IGluc2VydGlvbnMoKyksIDI4IGRlbGV0aW9ucygtKQotLS0KYmFzZS1jb21taXQ6IDAx
ZjNhNmQxZDU5YjhlMjVhNmRlMjQzYjBkNzMwNzVjZjA0MTVlYWYKY2hhbmdlLWlkOiAyMDI1MDky
OC1hNF9hNV9hZGRfY2xvY2tfZHJpdmVyLTJiN2M5ZDY5NTYzMwoKQmVzdCByZWdhcmRzLAotLSAK
Q2h1YW4gTGl1IDxjaHVhbi5saXVAYW1sb2dpYy5jb20+CgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
