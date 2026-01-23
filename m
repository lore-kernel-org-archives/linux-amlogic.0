Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 435F3D6CFDA
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Jan 2026 05:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e3vPGS/CheiSe/V3nQ+QAQN5/PCuPg8mLd8vBIiS6q4=; b=K7SuGmLLXpEpqw
	JWIhM1p/bhyL68QoEmfEZuXVOmsC/LCBs3HmMPpb+LSOuVJBmA9M8BSu/lgBBqbSJzM691/1BdvPD
	eF+bz9r21RYYoum6rRhPcN8NLk87Cz5bGnVRIft25BtdwARFYb2Ymjx9G+MzUJVqCzy3TBn1ltbfw
	N9PJ2QI20Doj4HoD+HC3ZFS+icZug3s1y0N/B9JhJAXg6jmmmmqejxmrkDJO12QKx3WjAsrQS+br2
	/fL0/un2XG9/0uWre9Rqpt61VQLM9qPR1z9jqCLY1bNBxYldnL7jqtrHSepxk3uUqn9XjvBJ57tgJ
	hHuzTdRmZARiDl2uTrNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjA8R-00000008FKB-47mD;
	Fri, 23 Jan 2026 05:55:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjA8R-00000008FJE-0eaY;
	Fri, 23 Jan 2026 05:55:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2AB04600BB;
	Fri, 23 Jan 2026 05:55:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC7DBC19422;
	Fri, 23 Jan 2026 05:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769147705;
	bh=zHQ4wCU8bGYwasn2b503Clo2bqnsQewMVrK57mvYXGM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=YjKoG/WCa9QqRsjcCOyjCOBIKYLaYaRZPAR1b+Z8suyQZktMU17LeTj9ed7QK6nGI
	 diNr/1960EhDV37KaeefTtG0YJq706242mgLQQzQwDsHJ9rGRcIdxuValSkGLLJ2Fc
	 BlrvtpP8n/V+uCzokJdqXbD9O26/xrwdgjqMznvhSPnFFCypEz0mH5I9APuJKxKPwZ
	 A6UDQJGIxTwqedEy68PtRvQ9DoYxv8bCpFNRkcVRM3yhSgkiHDZemjhY+iCU52PrNA
	 HHnCo8DXbf7GiTJRJDcNN0xAIAaaiZJ+4PwBNfxFVSuQBl4ugkf0/zPs9BrcFGaNrU
	 MQnfKQrSRQ5Bw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C08CCD6CFBD;
	Fri, 23 Jan 2026 05:55:05 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Subject: [PATCH v6 0/5] clk: amlogic: Add A5 SoC PLLs and Peripheral clock
Date: Fri, 23 Jan 2026 13:54:54 +0800
Message-Id: <20260123-a5-clk-v6-0-6d3bbf0ec1ea@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAC4Nc2kC/2XM3QrCMAyG4VuRHltJsrasHnkf4kHMsln8mWwyF
 Nm9W4VNxMMv5HmfptcuaW/Wi6fpdEh9ai95hOXCyIEvjdpU5W0IyEFEtOytnI628OIiy75wiiY
 /Xzut0/0T2u7yPqT+1naPT3fA93VKuCkxoAXrVUlcjXsoZcPnU9skWUl7Nu/IQDNEJJghZZh3G
 Qg1Bqz+oZugR6Byhi5DDSQMzEqu+Id+ggEQvtBnGDnEWlBrAP6F4zi+AMeM3k1JAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769147703; l=3892;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=zHQ4wCU8bGYwasn2b503Clo2bqnsQewMVrK57mvYXGM=;
 b=rLw2OixInyvP6GpRqMjLEO0pWPScYdXXlias5U6jFnZ0M8x6/3iQvZ6SGzvJJKfZeloPaBhtB
 UYtpJtH9qK7D4DyOypRNPByMZoAmm6ithjyi14DvXVS9RqRLfCY5Zse
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

VGhlIHBhdGNoc2V0IGFkZHMgc3VwcG9ydCBmb3IgdGhlIHBlcmlwaGVyYWwgYW5kIFBMTCBjbG9j
ayBjb250cm9sbGVyCm9uIHRoZSBBbWxvZ2ljIEE1IFNvQyBmYW1pbHksIHN1Y2ggYXMgQTExM1gy
LgoKVG8gbWFrZSBpdCBlYXNpZXIgZm9yIHRoZSBtYWludGFpbmVyIHRvIG1hbmFnZSB0aGUgcGF0
Y2hlcywgdGhlCkRUUy1yZWxhdGVkIGNvbW1pdHMgaGF2ZSBiZWVuIHJlbW92ZWQgZnJvbSB0aGlz
IHZlcnNpb24gb2YgdGhlCnBhdGNoc2V0LgoKRm9yIHRoZSBjb252ZW5pZW5jZSBvZiB0aGUgbWFp
bnRhaW5lciBhbmQgcmV2aWV3ZXJzLCB0aGUgRFRTIHBhdGNoZXMKaGF2ZSBiZWVuIHB1c2hlZCB0
byBnaXRodWIgc2VwYXJhdGVseSBmb3IgcmVmZXJlbmNlIFsxXSwgWzJdLCBbM10sIGFuZAp0aGV5
IHdpbGwgYmUgc3VibWl0dGVkIHVwc3RyZWFtIHNlcGFyYXRlbHkgYWZ0ZXIgdGhpcyBwYXRjaHNl
dCBpcwptZXJnZWQuIEkgaG9wZSB0aGlzIGRvZXMgbm90IGNhdXNlIGFueSBhZGRpdGlvbmFsIGlu
Y29udmVuaWVuY2UuCgpbMV0gaHR0cHM6Ly9naXRodWIuY29tL2NodWFuLWFtbC9saW51eC9jb21t
aXQvZWRiOGZhNWUxM2NhMzViMzczNjNmZTA4ZDgwNjc1MTE2MTM5NjhjZApbMl0gaHR0cHM6Ly9n
aXRodWIuY29tL2NodWFuLWFtbC9saW51eC9jb21taXQvYzYwMGRhZGI0NWY1ODFlMjAwOTkxZGQw
YmVhY2YzNTc1ZmY5NzFmMQpbM10gaHR0cHM6Ly9naXRodWIuY29tL2NodWFuLWFtbC9saW51eC9j
b21taXQvN2QzNzNjZjc4ZTIyZWU3NjdhNTIzMjAxMGQwYTA1NjhlNzIyODA4NgoKQ28tZGV2ZWxv
cGVkLWJ5OiBYaWFud2VpIFpoYW8gPHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNvbT4KU2lnbmVkLW9m
Zi1ieTogWGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+ClNpZ25lZC1vZmYt
Ynk6IENodWFuIExpdSA8Y2h1YW4ubGl1QGFtbG9naWMuY29tPgoKLS0tCkNoYW5nZXMgaW4gdjY6
Ci0gVXNlIHVuaWZpZWQgbWFjcm9zIGZvciBzeXNfY2xrL2F4aV9jbGsuCi0gUmVtb3ZlIERUUyBj
aGFuZ2VzIHRvIGVhc2UgbWFpbnRhaW5lciBwYXRjaCBtYW5hZ2VtZW50LgotIExpbmsgdG8gdjU6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjAxMDgtYTUtY2xrLXY1LTAtOWE2OWZjMWVm
MDBhQGFtbG9naWMuY29tCgpDaGFuZ2VzIGluIHY1OgotIEFkZCDigJxDby1kZXZlbG9wZWQtYnni
gJ0gdGFnIGZvciBYaWFud2VpLgotIENoYW5nZSBydGNfY2xrIGZsYWdzIHRvIENMS19TRVRfUkFU
RV9OT19SRVBBUkVOVC4KLSBPcHRpbWl6ZSB0aGUgbWFjcm8gZGVmaW5pdGlvbnMgZm9yIGNsb2Nr
IGNvbmZpZ3VyYXRpb24uCi0gVW5pZmllZCBuYW1pbmcgb2YgY2xvY2sgcGFyZW50IHJlbGF0ZWQg
dmFyaWFibGVzLgotIExpbmsgdG8gdjQ6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTEw
MjgtYTUtY2xrLXY0LTAtZTYyY2EwYWFlMjQzQGFtbG9naWMuY29tCgpDaGFuZ2VzIGluIHY0Ogot
IGR0LWJpbmRpbmcgZm9yIHBlcmlwaGVyYWwgY2xvY2tzIChrZXB0IFJvYuKAmXMgJ1Jldmlld2Vk
LWJ5JyBoZXJlKToKICAtIEFkZGVkIG9wdGlvbmFsIGNsb2NrIHNvdXJjZSBydGMgcGxsLgogIC0g
UmVuYW1lZCBydGNfY2xr4oCZcyBjbGtpZCB0byBiZXR0ZXIgcmVmbGVjdCBpdHMgZnVuY3Rpb24u
Ci0gUExML0Nsb2NrIGRyaXZlcjoKICAtIEFkYXB0ZWQgdG8gSmVyb21l4oCZcyByZWZhY3RvcmVk
IGRyaXZlciBpbnRlcmZhY2UsIG5hbWluZwpjb252ZW50aW9ucywgYW5kIG1hY3Jvcy4KICAtIFVw
ZGF0ZWQgcmVsYXRlZCBDT05GSUcgZW50cmllcyBpbiBLY29uZmlnLgotIEFkZGVkIGR0cyBwYXRj
aCBvZiBQTEwvQ2xvY2suCi0gTGluayB0byB2MzogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8y
MDI1MDEwMy1hNS1jbGstdjMtMC1hMjA3Y2U4M2I5ZTlAYW1sb2dpYy5jb20KCkNoYW5nZXMgaW4g
djM6Ci0gUmVuYW1lIHh0YWxfMjRtIHRvIHh0YWwsIGFuZCBtb2RpZnkgc29tZSBkZXNjcmlwdGlv
biBvZiBLY29uZmlnLgotIERyb3Agc29tZSBjb21tZW50IG9mIFBMTCBzb3VyY2UgY29kZS4KLSBN
b3ZlIGRlZmluaXRpb24gb2YgQTVfQ0xLX0dBVEVfRlcgZnJvbWUgY29tbW9uIGNvZGUgaW50byBB
NSBwZXJpcGhlcmFsIHNvdXJjZSBjb2RlLgotIFVzZSBodyBpbnN0ZWFkIG9mIG5hbWUgdG8gZGVz
Y3JpYmUgcGFyZW50X2RhdGEuCi0gTWFraW5nIFNDTUkgYmluZGluZyB0aGUgZmlyc3QgdG8gc3Vi
bWl0LgotIExpbmsgdG8gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDExMjAtYTUt
Y2xrLXYyLTAtMTIwODYyMWU5NjFkQGFtbG9naWMuY29tCgpDaGFuZ2VzIGluIHYyOgotIE1vdmUg
c29tZSBzeXMgY2xvY2sgYW5kIGF4aSBjbG9jayBmcm9tIHBlcmlwaGVyYWwgdG8gc2NtaSBpbXBs
ZXRlbWVudC4KLSBSZW1vdmUgIEFSTV9TQ01JX1BST1RPQ09MIGluIEtjb25maWcgYW5kIGNvcnJl
Y3QgbmFtZSBBNSBidXQgbm90IEE0LgotIEFkZCB0d28gb3B0aW9uYWwgY2xvY2sgaW5wdXRzIGZv
ciB0aGUgcGVyaXBoZXJhbChkZHIgcGxsIGFuZCBjbGstbWVhc3VyZSkKLSBNYWtlIHNvbWUgY2hh
bmdlcyBhbmQgYWRqdXN0bWVudHMgYWNjb3JkaW5nIHRvIHN1Z2dlc3Rpb25zLgotIExpbmsgdG8g
djE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDA5MTQtYTUtY2xrLXYxLTAtNWVlMmM0
ZjFiMDhjQGFtbG9naWMuY29tCgotLS0KQ2h1YW4gTGl1ICg1KToKICAgICAgZHQtYmluZGluZ3M6
IGNsb2NrOiBBZGQgQW1sb2dpYyBBNSBTQ01JIGNsb2NrIGNvbnRyb2xsZXIgc3VwcG9ydAogICAg
ICBkdC1iaW5kaW5nczogY2xvY2s6IEFkZCBBbWxvZ2ljIEE1IFBMTCBjbG9jayBjb250cm9sbGVy
CiAgICAgIGR0LWJpbmRpbmdzOiBjbG9jazogQWRkIEFtbG9naWMgQTUgcGVyaXBoZXJhbHMgY2xv
Y2sgY29udHJvbGxlcgogICAgICBjbGs6IGFtbG9naWM6IEFkZCBBNSBQTEwgY2xvY2sgY29udHJv
bGxlciBkcml2ZXIKICAgICAgY2xrOiBhbWxvZ2ljOiBBZGQgQTUgY2xvY2sgcGVyaXBoZXJhbHMg
Y29udHJvbGxlciBkcml2ZXIKCiAuLi4vY2xvY2svYW1sb2dpYyxhNS1wZXJpcGhlcmFscy1jbGtj
LnlhbWwgICAgICAgICB8IDEzNCArKysrCiAuLi4vYmluZGluZ3MvY2xvY2svYW1sb2dpYyxhNS1w
bGwtY2xrYy55YW1sICAgICAgICB8ICA2MyArKwogZHJpdmVycy9jbGsvbWVzb24vS2NvbmZpZyAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgMjcgKwogZHJpdmVycy9jbGsvbWVzb24vTWFrZWZp
bGUgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKwogZHJpdmVycy9jbGsvbWVzb24vYTUt
cGVyaXBoZXJhbHMuYyAgICAgICAgICAgICAgICAgfCA3ODEgKysrKysrKysrKysrKysrKysrKysr
CiBkcml2ZXJzL2Nsay9tZXNvbi9hNS1wbGwuYyAgICAgICAgICAgICAgICAgICAgICAgICB8IDQ3
OCArKysrKysrKysrKysrCiAuLi4vY2xvY2svYW1sb2dpYyxhNS1wZXJpcGhlcmFscy1jbGtjLmgg
ICAgICAgICAgICB8IDEzMiArKysrCiBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL2FtbG9naWMs
YTUtcGxsLWNsa2MuaCAgICB8ICAyNCArCiBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL2FtbG9n
aWMsYTUtc2NtaS1jbGtjLmggICB8ICA0NCArKwogOSBmaWxlcyBjaGFuZ2VkLCAxNjg1IGluc2Vy
dGlvbnMoKykKLS0tCmJhc2UtY29tbWl0OiBmMGI5ZDhlYjk4ZGZlZThkMDA0MTlhYTA3NTQzYmRj
MmMxYTQ0ZmIxCmNoYW5nZS1pZDogMjAyNDA5MTEtYTUtY2xrLTM1YzQ5YWNiMzRlMQoKQmVzdCBy
ZWdhcmRzLAotLSAKQ2h1YW4gTGl1IDxjaHVhbi5saXVAYW1sb2dpYy5jb20+CgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
