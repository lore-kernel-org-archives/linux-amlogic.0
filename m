Return-Path: <SRS0=CgZo=FS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62532C4361B
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Dec 2020 19:34:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA6F8224B1
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Dec 2020 19:34:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA6F8224B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hQPSXSJ8ThUbjhaQlzjHWgB1+WF8N/aPHKrMbOV80xc=; b=Hvy5qiytJbgGeNVsrALT+8vKf
	wIs9MplnOFRr/5YquzYqh5fahrT5CZMRGQ6nRo4hqRwoUloJUptbR55uJXywP4e/bb5w6N7FHHWBb
	oPrNSbh0Cndg92bF6IBg+HbpzdiC0/hj3t123m8eEMLDDimfSCXJGyhqLVyok1BjOR+1mKRyX6hR9
	2pg5loyoQqtF+6vkMPkDqLUB51+rG3X/81VNXifiTRgdL0M0fQbNwp0KgTEE63FPCKj4ydvY2zOM3
	KM/pxkVdp/YC49XQ5NOc8y9G1y8HoPwmMfrEzW/opldznz0e4pc/Ux3MKk3/6aifRA+bNjewo10WM
	NjGBNASzA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kotbl-0005bc-68; Mon, 14 Dec 2020 19:34:09 +0000
Received: from dd10532.kasserver.com ([85.13.133.80])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kotbh-0005b0-Gt
 for linux-amlogic@lists.infradead.org; Mon, 14 Dec 2020 19:34:06 +0000
Received: from odsus.home.arpa
 (dslb-002-205-253-229.002.205.pools.vodafone-ip.de [2.205.253.229])
 by dd10532.kasserver.com (Postfix) with ESMTPSA id B70551F40B67;
 Mon, 14 Dec 2020 20:34:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by odsus.home.arpa (Postfix) with ESMTP id D45873D671;
 Mon, 14 Dec 2020 20:33:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at home.arpa
Received: from odsus.home.arpa ([127.0.0.1])
 by localhost (odsus.home.arpa [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LiUSKrfEgRYI; Mon, 14 Dec 2020 20:33:56 +0100 (CET)
Received: from [192.168.20.240] (r64.home.arpa [192.168.20.240])
 by odsus.home.arpa (Postfix) with ESMTP id E0CE43D66F;
 Mon, 14 Dec 2020 20:33:56 +0100 (CET)
Subject: Re: [BUG]odroid-c2 does not hotplug usb-devices
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <c2dc3507-67a7-3c18-374f-050295bc1d59@gmx.net>
 <CAFBinCDrMj4GP2cy4dBSt_isGXf4CuhmDz=uAs+gZwUGQc=o6A@mail.gmail.com>
 <8afb2adb-4581-a847-e7e0-db1e915e9247@gmx.net>
 <CAFBinCD6aqna6YYvXgO5iKWa9N3yvqehhB+SAirLaUu3xScy2Q@mail.gmail.com>
 <bd9d96d2-8b66-db93-a855-5e179adca8c9@gmx.net>
 <0d05671d-b5f4-55e4-f5bd-58410cc92d08@baylibre.com>
 <dd160e55-55e9-1c41-afcb-22990a05a86b@gmx.net>
 <CAFBinCDv+TgEgf1g7xBTknr-aJMhC3K1wOW87-06YG4sQ9wUAg@mail.gmail.com>
From: Otto Meier <gf435@gmx.net>
Message-ID: <531138bc-d343-1081-d208-ab6c98c1ddd8@gmx.net>
Date: Mon, 14 Dec 2020 20:33:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CAFBinCDv+TgEgf1g7xBTknr-aJMhC3K1wOW87-06YG4sQ9wUAg@mail.gmail.com>
Content-Language: de-DE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201214_143405_814832_1922FF90 
X-CRM114-Status: GOOD (  15.78  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 linux-amlogic@lists.infradead.org, u-boot-amlogic@groups.io,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgTWFydGluLAoKQW0gMTMuMTIuMjAgdW0gMTk6NDYgc2NocmllYiBNYXJ0aW4gQmx1bWVuc3Rp
bmdsOgo+IEhpIE90dG8sCj4KPiBPbiBNb24sIERlYyA3LCAyMDIwIGF0IDE6NDMgUE0gT3R0byBN
ZWllciA8Z2Y0MzVAZ214Lm5ldD4gd3JvdGU6Cj4gWy4uLl0KPj4+PiBTbyB3aXRoIHRoZSBsYXRl
c3QgdS1ib290IGFuZCB0aGUga2VybmVsIGZyb20gaHR0cHM6Ly9naXRodWIuY29tL2NoZXdpdHQv
bGludXgvdHJlZS9hbWxvZ2ljLTUuMTAueQo+Pj4+IGNvbW1pdCA3MjVmYzhkZjc4OTgxMDJmOTAz
MWJhMjA3NWY3NjM4ODRmZmEzZWU4IGV2ZXJ5dGhpbmcgaXMgd29ya2luZyBhZ2Fpbi4KPj4+PiBV
U0IgZG9lcyBob3RwbHVnZ2luZyBhcyBleHBlY3RlZC4KPj4+IFNvLCB0aGlzIGZpeGVzIFVTQiB1
bmRlciBMaW51eCA/PyBJdCdzIG5vdCBjbGVhcgo+IGlmIHlvdSBoYXZlIHRpbWUgaXQgd291bGQg
YmUgZ3JlYXQgaWYgeW91IGNvdWxkIGZpZ3VyZSBvdXQgd2hpY2ggb2YKPiB0aGUgcGF0Y2hlcyBm
cm9tIENocmlzdGlhbidzIHRyZWUgZml4ZXMgVVNCIGhvdHBsdWdnaW5nIGZvciB5b3UuCj4gT3Ig
aXMgaXQgZml4ZWQgaW4gTGludXggNS4xMC1yY1ggZXZlbiB3aXRob3V0IGFueSBwYXRjaGVzPwo+
ClRoZSBuZXcgbWFpbmxpbmUga2VybmVsIDUuMTAuMCBmcm9tIExpbnVzLCB3aXRob3V0IGFueSBv
dGhlciBwYXRjaGVzIApkb2VzIGRldGVjdCBVU0IgaG90cGx1Z2luZywKd2hlbiB1c2luZyB1LWJv
b3QgRE1JOiBIYXJka2VybmVsIENvLiwgTHRkLiBPRFJPSUQtQzIvT0RST0lELUMyLCBCSU9TIAoy
MDIxLjAxLXJjMy0wMDAzOS1nZWM3OWY1Y2UyMi1kaXJ0eSAxMi8wOC8yMDIwCmFuZCB0aGUgZm9s
bG93aW5nIHUtYm9vdCBwYXRjaDoKCi0tLSB1LWJvb3QuZ2l0L2FyY2gvYXJtL2R0cy9tZXNvbi1n
eGJiLmR0c2kub3JpZ8KgwqDCoMKgwqDCoMKgIDIwMjAtMTEtMjcgCjE3OjIwOjA0LjYyNDE5MzU2
MSArMDEwMAorKysgdS1ib290LmdpdC9hcmNoL2FybS9kdHMvbWVzb24tZ3hiYi5kdHNpwqDCoMKg
wqAgMjAyMC0xMS0yNyAKMTc6MjM6MTguNDcyMDg4OTM0ICswMTAwCkBAIC00MDMsMzYgKzQwMywz
MyBAQAogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBncGlv
LXJhbmdlcyA9IDwmcGluY3RybF9wZXJpcGhzIDAgMCAxMTk+OwogwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIH07CgotwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbW1jX3BpbnM6
IGVtbWMgewotwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbXV4
LTAgewotwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGdyb3VwcyA9ICJlbW1jX25hbmRfZDA3IiwKLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJl
bW1jX2NtZCI7Ci3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZnVuY3Rpb24gPSAiZW1tYyI7Ci3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYmlhcy1wdWxsLXVwOwotwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfTsKCi3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtdXgtMSB7Ci3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ3JvdXBzID0g
ImVtbWNfY2xrIjsKLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBmdW5jdGlvbiA9ICJlbW1jIjsKLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBiaWFzLWRpc2FibGU7Ci3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9OwotwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB9OworwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVt
bWNfcGluczogZW1tYyB7CivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIG11eCB7CivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBncm91cHMgPSAiZW1tY19uYW5kX2QwNyIsCivCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICJlbW1jX2NtZCIsCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJlbW1jX2NsayI7CivC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBmdW5jdGlvbiA9ICJlbW1jIjsKK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfTsKK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9OwoKLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZW1tY19kc19waW5zOiBlbW1jLWRzIHsKLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG11eCB7Ci3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ3JvdXBz
ID0gImVtbWNfZHMiOwotwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGZ1bmN0aW9uID0gImVtbWMiOwotwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJpYXMtcHVsbC1kb3du
OwotwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfTsKLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfTsKK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBlbW1jX2RzX3BpbnM6IGVtbWMtZHMgeworwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBtdXggeworwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ3JvdXBzID0gImVtbWNfZHMiOworwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
ZnVuY3Rpb24gPSAiZW1tYyI7CivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIH07CivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfTsKCi3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVtbWNfY2xrX2dhdGVfcGluczogZW1tY19jbGtfZ2F0ZSB7
Ci3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtdXggewotwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGdyb3VwcyA9ICJCT09UXzgiOwotwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZ1bmN0aW9uID0gImdwaW9fcGVyaXBocyI7Ci3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Ymlhcy1wdWxsLWRvd247Ci3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB9OwotwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9OworwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGVtbWNfY2xrX2dhdGVfcGluczogZW1tY19jbGtfZ2F0ZSB7CivCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG11eCB7CivCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBn
cm91cHMgPSAiQk9PVF84IjsKK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZ1bmN0aW9uID0gImdwaW9fcGVyaXBocyI7CivCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH07CivCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNmZy1wdWxsLWRvd24geworwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcGlucyA9ICJCT09UXzgiOworwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYmlhcy1wdWxsLWRvd247CivCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH07CivCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfTsKCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbm9yX3BpbnM6
IG5vciB7CiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG11
eCB7CgpXaGVuIGkgdXNlIHRoZSBsYXN0IHVucGF0Y2hlZCBlbW1jIGJvb3RhYmxlIHUtYm9vdCAy
MDIwLjA0IHRoZSBrZXJuZWwgCmJvb3RzLCBidXQgdXNiIGhvdHBsdWdnaW5nCmRvZXMgbm90IHdv
cmsuCgpIb3BlIHRoaXMgZGVzY3JpYmVzIG15IGZpbmRpbmdzLiBJZiBpIGNhbiBoZWxwIGZ1cnRo
ZXIsIHBsZWFzZSBnaXZlIG1lIGEgCm5vdGUuCgo+IEJlc3QgcmVnYXJkcywKPiBNYXJ0aW4KPgpC
ZXN0IHJlZ2FyZHMKT3R0bwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
