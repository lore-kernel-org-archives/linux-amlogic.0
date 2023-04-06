Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2EAEC7618D
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Apr 2023 09:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Cc:From:References:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uHwEBvqfM5ybvUWRVWJKJW5zdNu0J9VEawNZjjX9j/w=; b=SywZc0usbYtS8o
	nqvHjpOrRb7AVavDqCVhnwvXiSK9OnC6cLoSnx0VtiIbStPSeDltcVHrU2Js6MEvDjlKO76i/Kb7f
	0NbE6tI5F0sKBAPZ+IA/lgDoUBtMExZfhk+EsG/zIMzFGVXzUHrTYutPJVrPYA9qYiHb5xM1XK/iL
	8T7dkM9rm3lSUy07i7sUoshVxK5PfQBRZ5X41VKJEwFymSZb5RR5WGwwdFVotCMQChQ5SLVnCrp+5
	whO4ZnEJGYT9hL/gh142R36Ngh7fnornTahDPXssiwrmoROuInF1pNcWp4HmXkiuwTEyiq6LKNDDQ
	Fo6E3a05Z1Fo/dFJMAaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkLa8-006pHw-1n;
	Thu, 06 Apr 2023 09:07:00 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkLa4-006pH3-37;
	Thu, 06 Apr 2023 09:06:58 +0000
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pkLZy-0003aV-S5; Thu, 06 Apr 2023 11:06:50 +0200
Message-ID: <71816e38-f919-11a4-1ac9-71416b54b243@leemhuis.info>
Date: Thu, 6 Apr 2023 11:06:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/3] ARM: dts: meson: Fix the UART compatible strings
Content-Language: en-US, de-DE
To: =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20211227180026.4068352-1-martin.blumenstingl@googlemail.com>
 <20211227180026.4068352-2-martin.blumenstingl@googlemail.com>
 <20230405132900.ci35xji3xbb3igar@rcn-XPS-13-9305>
 <fdffc009-47cf-e88d-5b9e-d6301f7f73f2@leemhuis.info>
 <44556911-e56e-6171-07dd-05cc0e30c732@collabora.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Greg KH <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
In-Reply-To: <44556911-e56e-6171-07dd-05cc0e30c732@collabora.com>
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1680772017;49fadd12;
X-HE-SMSGID: 1pkLZy-0003aV-S5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_020657_151639_EE48464D 
X-CRM114-Status: GOOD (  18.88  )
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

W0NDaW5nIHRoZSBzdGFibGUgbGlzdCBhcyB3ZWxsIGFzIEdyZWcgYW5kIFNhc2hhIHNvIHRoZXkg
Y2FuIGNvcnJlY3QgbWUKaWYgSSB3cml0ZSBzb21ldGhpbmcgc3R1cGlkXQoKT24gMDYuMDQuMjMg
MTA6MjcsIFJpY2FyZG8gQ2HDsXVlbG8gd3JvdGU6Cj4gCj4gT24gNS80LzIzIDE5OjE0LCBUaG9y
c3RlbiBMZWVtaHVpcyB3cm90ZToKPj4gV2FpdCwgd2hhdD8gQSBwYXRjaCAoNTIyNWUxYjg3NDMy
ICgiQVJNOiBkdHM6IG1lc29uOiBGaXggdGhlIFVBUlQKPj4gY29tcGF0aWJsZSBzdHJpbmdzIikp
IHRoYXQgd2FzIG1lcmdlZCBmb3IgdjUuMTctcmM0IGFuZCBpcyBub3QgaW4gdGhlCj4+IGxpc3Qg
b2YgcGF0Y2hlcyB0aGF0IHdlcmUgaW4gNC4xNC4zMTItcmMxCj4+IChodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9hbGwvMjAyMzA0MDMxNDAzNTEuNjM2NDcxODY3QGxpbnV4Zm91bmRhdGlvbi5vcmcv
Cj4+ICkgaXMgbWVhbnQgdG8gc3VkZGVubHkgY2F1c2UgdGhpcz8gSG93IGlzIHRoaXMgcG9zc2li
bGU/IEFtIEkgdG90YWxseSBvbgo+PiB0aGUgd3JvbmcgdHJhY2sgaGVyZSBhbmQgbWlzdW5kZXJz
dGFuZGluZyBzb21ldGhpbmcsIG9yIGlzIHRoaXMgYQo+PiBiaXNlY3Rpb24gdGhhdCB3ZW50IGhv
cnJpYmx5IHNpZGV3YXlzPwo+IAo+IEkgZGlkbid0IHNheSB0aGlzIHdhcyBpbnRyb2R1Y2VkIGlu
IDQuMTQuMzEyLXJjMSwgdGhpcyBoYXMgYmVlbiBmYWlsaW5nCj4gZm9yIGEgbG9uZyB0aW1lIGFu
ZCBpdCB3YXMgbWVyZ2VkIGZvciA0LjE0LjI2NzoKPiBodHRwczovL2x3bi5uZXQvQXJ0aWNsZXMv
ODg0OTc3Lwo+IAo+IFNvcnJ5IEkgd2Fzbid0IGNsZWFyIGJlZm9yZS4KCkFoaCwgbm8gd29ycmll
cyBhbmQgdGh4IGZvciB0aGlzLiBCdXQgd2VsbCwgaW4gdGhhdCBjYXNlIGxldCBtZSBnZXQgYmFj
awp0byBzb21ldGhpbmcgZnJvbSB5b3VyIHJlcG9ydDoKCj4+PiBLZXJuZWxDSSBkZXRlY3RlZCB0
aGF0IHRoaXMgcGF0Y2ggaW50cm9kdWNlZCBhIHJlZ3Jlc3Npb24gaW4KPj4+IHN0YWJsZS1yYy9s
aW51eC00LjE0Lnkgb24gYSBtZXNvbjhiLW9kcm9pZGMxLgo+Pj4gQWZ0ZXIgdGhpcyBwYXRjaCB3
YXMgYXBwbGllZCB0aGUgdGVzdHMgcnVubmluZyBvbiB0aGlzIHBsYXRmb3JtIGRvbid0Cj4+PiBz
aG93IGFueSBzZXJpYWwgb3V0cHV0Lgo+Pj4gCj4+PiBUaGlzIGRvZXNuJ3QgaGFwcGVuIGluIG90
aGVyIHN0YWJsZSBicmFuY2hlcyBub3IgaW4gbWFpbmxpbmUsIGJ1dCA0LjE0Cj4+PiBoYXNuJ3Qg
c3RpbGwgcmVhY2hlZCBFT0wgYW5kIGl0J2QgYmUgZ29vZCB0byBmaW5kIGEgZml4LgoKV2VsbCwg
dGhlIHN0YWJsZSBtYWludGFpbmVycyBtYXkgY29ycmVjdCBtZSBpZiBJJ20gd3JvbmcsIGJ1dCBh
cyBmYXIgYXMKSSBrbm93IGluIHRoYXQgY2FzZSBpdCdzIHRoZSBkdXR5IG9mIHRoZSBzdGFibGUg
dGVhbSAod2hpY2ggd2FzIG5vdCBldmVuCkNDZWQgb24gdGhlIHJlcG9ydCBhZmFpY3MpIHRvIGxv
b2sgaW50byB0aGlzIGZvciB0d28gcmVhc29uczoKCiogdGhlIHJlZ3Jlc3Npb24gZG9lcyBub3Qg
aGFwcGVuZWQgaW4gbWFpbmxpbmUgKGFuZCBtYXliZSBuZXZlciBoYXMpCgoqIG1haW5saW5lIGRl
dmVsb3BlcnMgbmV2ZXIgc2lnbmVkIHVwIGZvciBtYWludGFpbmluZyB0aGVpciB3b3JrIGluCmxv
bmd0ZXJtIGtlcm5lbHM7IHF1aXRlIGEgZmV3IG5ldmVydGhlbGVzcyBoZWxwIGluIHNpdHVhdGlv
biBsaWtlIHRoaXMsCmF0IGxlYXN0IGZvciByZWNlbnQgc2VyaWVzIGFuZCBpZiB0aGV5IGFza2Vk
IGZvciBhIGJhY2twb3J0IHRocm91Z2ggYQoiQ0M6IDxzdGFibGVAIiB0YWcg4oCTIGJ1dCB0aGUg
bGF0dGVyIGRvZXNuJ3Qgc2VlbSB0byBiZSB0aGUgY2FzZSBoZXJlCihub3QgdG90YWxseSBzdXJl
LCBidXQgaXQgbG9va3MgbGlrZSBBVVRPU0VMIHBpY2tlZCB0aGlzIHVwKSBhbmQgaXQncyBhCnF1
aXRlIG9sZCBzZXJpZXMuCgo+Pj4gI3JlZ3pib3QgaW50cm9kdWNlZDogNTIyNWUxYjg3NDMyZGNm
MGQwZmMzNDQwODI0YjkxZDA0YzFkNmNjMQoKVGh4IGZvciBnZXR0aW5nIHJlZ3pib3QgaW52b2x2
ZWQsIGJ1dCBkdWUgdG8geW91ciB1c2FnZSBpdCBub3cgY29uc2lkZXJzCnRoaXMgYSBtYWlubGlu
ZSByZWdyZXNzaW9uLCBhcyA1MjI1ZTFiODc0MzIgaXMgYSBtYWlubGluZSBjb21taXQuIEFzCnRo
aXMgb25seSBoYXBwZW5zIGluIGEgcGFydGljdWxhciBzdGFibGUgdHJlZSwgaXQgc2hvdWxkIHVz
ZSBhIGNvbW1pdCBpZApmcm9tIHRoZXJlIGluc3RlYWQ6CgojcmVnemJvdCBpbnRyb2R1Y2VkOiAy
M2RmYTQyYTBhMmE5MWQ2NDBlZjNmY2U1ODUxOTRiOTcwZDg2ODBjCgooYWJvdmUgbGluZSB3aWxs
IG1ha2UgcmVnemJvdCBhZGp1c3QgdGhpcykKCkNpYW8sIFRob3JzdGVuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcg
bGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
