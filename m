Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4037AC49EA1
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Aug 2024 12:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uj4eKsW9n4X9AzZnZsi3OaMJlMhaAWL4CaULTkOi/Zk=; b=KOA94vvHDMIsoG
	p1GFMhclola9dFV1j62eSpEJ1zNZnkq/v3KiUk1GMY90lDhN/N9z/7tT4FfsBeFRXJDAmiKAMiVzS
	p2gZDqgl6yS6XrnfHiJtHFfdQ3hrLpKovRD9sfbQrlaDPg2k/zro0JjdLqUsqouzrtZHmo0YZ0fPr
	8Z7D7FEPOUB828J0Nxel97E7exxNcaReyAPWjqV260Un9G4XkDQX6lM/Axwx99By0xmY0sMN0lbgq
	UiFX7rw1IwfwvqsRsiT1Pfv9NDebYT0TMNVxkoNa457Fz+0pghJkgnDuwoH3xYtgEWYGQVyBxSoQW
	GVnc2P7er20pZsZhWFbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbJQ8-00000001WGf-0EP0;
	Tue, 06 Aug 2024 12:36:08 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbJQ3-00000001WFf-3UAL
	for linux-amlogic@lists.infradead.org;
	Tue, 06 Aug 2024 12:36:06 +0000
Date: Tue, 6 Aug 2024 14:36:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1722947761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LxRFPMssv0TbntD/eFDfQJABume4sd1MP+ymuPVXIMs=;
	b=4m0tsztsBPr+9mmrcnWxq/lZkoO8odl8CGs6qI25Z1zRNYgQoKXKr4ZaByl6dBrVhFzByu
	kzA5HK8d9DMIOtsKiVlrdcZO/8QWXdrbbKjYqqjOsCLbqdNa4KaD0fVY+45JiomSwJkueT
	z9cNVR8YYFIPCX1QATrLaeyWFJ920wDF1X1U4QwsyNd4TId6eOQmDrskXmTeAmvKoNmWid
	TY0AUs52gyd4bOmrCTMoq51FigtT2MDE9a8lE3nvlgfC/jvuMrcjP90VKpB1FGP4EiPciB
	N3LbMvHa0DE1NrFVpp5vB2n9BHncTWQsw7Vj5ajqlMt7L/jfM8dkyCyNtgwDEg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1722947761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LxRFPMssv0TbntD/eFDfQJABume4sd1MP+ymuPVXIMs=;
	b=wotMqU59S88oaztq3MncD0BL4YuXzvYzxYh4qAO3DGWbQurB/e6HrSu55TBnCKXPBZA7aM
	OlapAP5nRhxhSTDA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Arseniy Krasnov <avkrasnov@salutedevices.com>
Subject: Re: [PATCH] ASoC: meson: axg-fifo: fix irq scheduling issue with
 PREEMPT_RT
Message-ID: <20240806123600.uI5LeCdp@linutronix.de>
References: <20240806102707.3825703-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240806102707.3825703-1-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_053604_030511_7B74B71C 
X-CRM114-Status: GOOD (  14.47  )
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

T24gMjAyNC0wOC0wNiAxMjoyNzowMyBbKzAyMDBdLCBKZXJvbWUgQnJ1bmV0IHdyb3RlOgo+IFdp
dGggUFJFRU1QVF9SVCBlbmFibGVkLCBzcGlubG9ja3MgYmVjb21lIHByZWVtcHRpYmxlLgpXaXRo
IFBSRUVNUFRfUlQgZW5hYmxlZCBhIHNwaW5sb2NrX3QgYmVjb21lcyBhIHNsZWVwaW5nIGxvY2su
Cgo+IFRoaXMgaXMgdXN1YWxseSBub3QgYSBwcm9ibGVtIHdpdGggc3BpbmxvY2tzIHVzZWQgaW4g
SVJRIGNvbnRleHQgc2luY2UKPiBJUlEgaGFuZGxlcnMgZ2V0IHRocmVhZGVkLiBIb3dldmVyLCBp
ZiBJUlFGX09ORVNIT1QgaXMgc2V0LCB0aGUgdXBwZXIgaGFsZgo+IG9mIGEgdGhyZWFkZWQgaXJx
IGhhbmRsZXIgd29uJ3QgYmUgdGhyZWFkZWQgYW5kIHRoaXMgY2F1c2VzIHNjaGVkdWxpbmcKPiBw
cm9ibGVtcyBpZiBzcGlubG9ja3MgYXJlIHVzZWQgaW4gdGhlIHVwcGVyIGhhbGYsIGxpa2Ugd2l0
aCByZWdtYXAgd2hlbgo+ICcuZmFzdF9pbycgaXMgc2V0LgoK4oCmIEhvd2V2ZXIsIGlmIElSUUZf
T05FU0hPVCBpcyBzZXQsIHRoZSBwcmltYXJ5IGhhbmRsZXIgd29uJ3QgYmUKZm9yY2UtdGhyZWFk
ZWQgYW5kIHJ1bnMgYWx3YXlzIGluIGhhcmRpcnEgY29udGV4dC4gVGhpcyBpcyBhIHByb2JsZW0K
YmVjYXVzZSBzcGlubG9ja190IHJlcXVpcmVzIGEgcHJlZW1wdGlibGUgY29udGV4dCBvbiBQUkVF
TVBUX1JULiAKCj4gSW4gdGhpcyBwYXJ0aWN1bGFyIGluc3RhbmNlLCBpdCBpcyBhY3R1YWxseSBi
ZXR0ZXIgdG8gZG8gZXZlcnl0aGluZyBpbgo+IHRoZSBib3R0b20gaGFsZiBhbmQgaXQgc29sdmVz
IHRoZSBwcm9ibGVtIHdpdGggUFJFRU1QVF9SVC4KCiAgICAgIHRocmVhZGVkIGhhbmRsZXIKClRo
ZSB0ZXJtICJib3R0b20gaGFsZiIgaXMgdXN1YWxseSB1c2VkIHdpdGggc29mdGlycS4gVGhlIElS
USBwYXJ0IGhhcyBhCnByaW1hcnkgaGFuZGxlciBhbmQgYSB0aHJlYWRlZCBoYW5kbGVyLgoKPiBS
ZXBvcnRlZC1ieTogQXJzZW5peSBLcmFzbm92IDxhdmtyYXNub3ZAc2FsdXRlZGV2aWNlcy5jb20+
Cj4gQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1hbWxvZ2ljLzIwMjQwNzI5
MTMxNjUyLjMwMTIzMjctMS1hdmtyYXNub3ZAc2FsdXRlZGV2aWNlcy5jb20KPiBTdWdnZXN0ZWQt
Ynk6IFNlYmFzdGlhbiBBbmRyemVqIFNpZXdpb3IgPGJpZ2Vhc3lAbGludXRyb25peC5kZT4KPiBG
aXhlczogYjExZDI2NjYwZGZmICgiQVNvQzogbWVzb246IGF4Zy1maWZvOiB1c2UgdGhyZWFkZWQg
aXJxIHRvIGNoZWNrIHBlcmlvZHMiKQo+IFNpZ25lZC1vZmYtYnk6IEplcm9tZSBCcnVuZXQgPGpi
cnVuZXRAYmF5bGlicmUuY29tPgo+IC0tLQo+ICBzb3VuZC9zb2MvbWVzb24vYXhnLWZpZm8uYyB8
IDI2ICsrKysrKysrKystLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNl
cnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL21l
c29uL2F4Zy1maWZvLmMgYi9zb3VuZC9zb2MvbWVzb24vYXhnLWZpZm8uYwo+IGluZGV4IDdlNjA5
MGFmNzIwYi4uZDBkMDVmYTQ0ZDY2IDEwMDY0NAo+IC0tLSBhL3NvdW5kL3NvYy9tZXNvbi9heGct
Zmlmby5jCj4gKysrIGIvc291bmQvc29jL21lc29uL2F4Zy1maWZvLmMKPiBAQCAtMjUxLDggKzI0
NCw5IEBAIGludCBheGdfZmlmb19wY21fb3BlbihzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQgKmNv
bXBvbmVudCwKPiAgCWlmIChyZXQpCj4gIAkJcmV0dXJuIHJldDsKPiAgCj4gLQlyZXQgPSByZXF1
ZXN0X3RocmVhZGVkX2lycShmaWZvLT5pcnEsIGF4Z19maWZvX3BjbV9pcnFfYmxvY2ssCj4gLQkJ
CQkgICBheGdfZmlmb19wY21faXJxX2Jsb2NrX3RocmVhZCwKPiArCS8qIFVzZSB0aGUgYm90dG9t
IGhhbGYgb2YgYSB0aHJlYWRlZCBpcnEgd2l0aCBub24tYXRvbWljIGxpbmtzICovCgpUaGlzIHJl
cXVlc3RzIG9ubHkgYSB0aHJlYWRlZCBoYW5kbGVyLiBUaGVyZSBpcyBubyAiYm90dG9tIGhhbGYg
b2YgYQp0aHJlYWRlZCBJUlEiLgoKPiArCXJldCA9IHJlcXVlc3RfdGhyZWFkZWRfaXJxKGZpZm8t
PmlycSwgTlVMTCwKPiArCQkJCSAgIGF4Z19maWZvX3BjbV9pcnFfYmxvY2ssCj4gIAkJCQkgICBJ
UlFGX09ORVNIT1QsIGRldl9uYW1lKGRldiksIHNzKTsKPiAgCWlmIChyZXQpCj4gIAkJcmV0dXJu
IHJldDsKClNlYmFzdGlhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
