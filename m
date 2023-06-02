Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E6FC7EE33
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Jun 2023 13:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RBAwhlbSJI7g8uRrfNS7C3gN7TpMD3oZjqnSU6U/mHM=; b=bTVRQzfI6gPZ2k
	zbyc0ZidDOzVfae6sk5Y/y8LDzS0waeXO9R1znRJsS2Fa0DEtSvEpOjXp7oXtnZoKI1W188KJpH1S
	FQqReZtX06IkmcgOEorPCbjb3KHpcEv/dUBAfeeSpp4H0f4k0tm9vbUCBZ7EqDoFhJDC3iJMO8Vk7
	O2S/0+j+Y0qjo/tyRQNN3yhX2yikA7b/UdrvCtvLjT/IyBjPmHE/hJB/eGCMXmKHznbfPrzLqh++p
	65xfE/Iykq9I2gVd/zBFbMKbMi3DS/Pz8oZooSfzCYazoE4QTYIjL/5N0gxbFhFrjWLGIb7sVnk+f
	UKuIScvQLL2jKP4Pzt7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q54ei-006ypw-2e;
	Fri, 02 Jun 2023 13:17:24 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q54eg-006yor-0r
	for linux-amlogic@lists.infradead.org;
	Fri, 02 Jun 2023 13:17:23 +0000
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1q54eb-00024q-AR; Fri, 02 Jun 2023 15:17:17 +0200
Message-ID: <5eb7694f-8c45-bab8-4d4c-2852f125f0eb@leemhuis.info>
Date: Fri, 2 Jun 2023 15:17:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Odroid-C1 regression with commit 4bc31edebde5 ("mmc: core: Set HS
 clock speed before sending HS CMD13")
Content-Language: en-US, de-DE
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org,
 Brian Norris <briannorris@chromium.org>, Shawn Lin
 <shawn.lin@rock-chips.com>, Luca Weiss <luca@z3ntu.xyz>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <CAFBinCD0RT0p-jk86W0JuMT3ufohRh1RqWCcM35DKZJpuc10HQ@mail.gmail.com>
 <CAPDyKFqgYnBfm-NespEZF8AJ5Ou4Bya8jLfVEnfyZvfAZ05Q7Q@mail.gmail.com>
 <CAFBinCDjPJHEhN-Jx3DhhhHJ3yi8oEoW7u4-Ld6Rd1+W826ttA@mail.gmail.com>
 <CAPDyKFqKSWJkJwgCO89jgKQ6AB==P9BWkuX6XtKj=ASOH15y9g@mail.gmail.com>
 <CAFBinCDwgYw3v31hP4AtV3+Z1o+esDqMKugRwMMMLqSX0Acjzw@mail.gmail.com>
 <CAPDyKFr+hQo+N31r=3f58taf9sYW0UF0ApCJhwz9vRsyNizcvg@mail.gmail.com>
 <CAFBinCDSv_vdu5887vveotvaOGFrZvaSX4jM+7Q3QvDhTdazzw@mail.gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <CAFBinCDSv_vdu5887vveotvaOGFrZvaSX4jM+7Q3QvDhTdazzw@mail.gmail.com>
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1685711842;5802dd77;
X-HE-SMSGID: 1q54eb-00024q-AR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_061722_447385_E9C352F5 
X-CRM114-Status: GOOD (  19.52  )
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGksIFRob3JzdGVuIGhlcmUsIHRoZSBMaW51eCBrZXJuZWwncyByZWdyZXNzaW9uIHRyYWNrZXIu
IFRvcC1wb3N0aW5nCmZvciBvbmNlLCB0byBtYWtlIHRoaXMgZWFzaWx5IGFjY2Vzc2libGUgdG8g
ZXZlcnlvbmUuCgpVbGYsIE1hcnRpbiwgd2hhdCBoYXBwZW5lZCB0byB0aGlzPyBJdCBsb29rcyBs
aWtlIHdlIGRpZG4ndCBnZXQgYW55CmNsb3NlciB0byBmaXhpbmcgdGhpcyByZWdyZXNzaW9uIGlu
IHRoZSBsYXN0IHR3byB3ZWVrcy4gRGlkIGl0IGZhbGwKdGhyb3VnaCB0aGUgY3JhY2tzPyBPciB3
YXMgcHJvZ3Jlc3MgbWFkZSBhbmQgSSBqdXN0IG1pc3NlZCBpdD8KCkNpYW8sIFRob3JzdGVuICh3
ZWFyaW5nIGhpcyAndGhlIExpbnV4IGtlcm5lbCdzIHJlZ3Jlc3Npb24gdHJhY2tlcicgaGF0KQot
LQpFdmVyeXRoaW5nIHlvdSB3YW5uYSBrbm93IGFib3V0IExpbnV4IGtlcm5lbCByZWdyZXNzaW9u
IHRyYWNraW5nOgpodHRwczovL2xpbnV4LXJlZ3RyYWNraW5nLmxlZW1odWlzLmluZm8vYWJvdXQv
I3RsZHIKSWYgSSBkaWQgc29tZXRoaW5nIHN0dXBpZCwgcGxlYXNlIHRlbGwgbWUsIGFzIGV4cGxh
aW5lZCBvbiB0aGF0IHBhZ2UuCgojcmVnemJvdCBwb2tlCgpPbiAxNi4wNS4yMyAyMjo0NSwgTWFy
dGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBPbiBNb24sIE1heSAxNSwgMjAyMyBhdCAxMTo0NOKA
r0FNIFVsZiBIYW5zc29uIDx1bGYuaGFuc3NvbkBsaW5hcm8ub3JnPiB3cm90ZToKPiBbLi4uXQo+
Pj4+IDMpIElmIDIpIHNlZW1zIHRvIHdvcmsgYWJvdmUsIHdlIG5lZWQgdG8gZmlndXJlIG91dCB3
aHkKPj4+PiBtbWNfc3dpdGNoX3N0YXR1cygpIGlzIGhhbmdpbmcuIElmIHRoZXJlIGlzIGEgcHJv
YmxlbSB3aXRoIHRoZSBlTU1DCj4+Pj4gY2FyZCByZXNwb25kaW5nIGluLWNvcnJlY3RseSwgdGhl
IGhvc3QgZHJpdmVyIHNob3VsZCByZXR1cm4gd2l0aCBhbgo+Pj4+IGVycm9yIGNvZGUsIHJpZ2h0
Pwo+Pj4gWW91J3JlIHJpZ2h0OiBpdCdzIGluZGVlZCBoYW5naW5nIGluIG1tY19zd2l0Y2hfc3Rh
dHVzKCkKPj4+IEkgZG9uJ3QgZ2V0IGFueSBpbnRlcnJ1cHRzICh0aW1lb3V0LCBDUkMgZXJyb3Is
IC4uLikgZm9yIGl0Lgo+Pj4gRG8geW91IGhhdmUgYW55IHN1Z2dlc3Rpb25zIHdoYXQgdG8gY2hl
Y2sgbmV4dD8KPj4KPj4gU28gdGhlIG1tY19zd2l0Y2hfc3RhdHVzKCkgaXMgc2VuZGluZyBhIENN
RDEzLiBFdmVuIGlmIHRoZSBjYXJkCj4+IGRvZXNuJ3QgcmVwbHksIEkgd291bGQgZXhwZWN0IHRo
YXQgdGhlIG1lc29uIG1tYyBjb250cm9sbGVyIHdvdWxkCj4+IHJhaXNlIHNvbWUga2luZCBvZiBl
cnJvciBjb25kaXRpb24sIHByb2JhYmx5IHZpYSBhIHRpbWVvdXQtaXJxLgo+Pgo+PiBEaWQgeW91
IHZlcmlmeSB0aGF0IHRoZSBkcml2ZXIgaXMgYWN0dWFsbHkgd2FpdGluZyBmb3IgYW4gSVJRIHRv
Cj4+IGhhcHBlbiwgd2hpY2ggYWxzbyBtZWFucyB3YWl0aW5nIGZvciBhIENNRDEzIHJlc3BvbnNl
Pwo+IHJlZ2lzdGVyIDB4MjQgaXMgSUNUTCAoaW50ZXJydXB0IGNvbnRyb2wpIGFuZCAweDI4IGlz
IElTVEFUIChpbnRlcnJ1cHQgc3RhdHVzKQo+IElTVEFUIGlzIGFsbCB6ZXJvcyBhbmQgSUNUTCBp
cyAweDMwNjcgd2hpY2ggdHJhbnNsYXRlcyBzbzoKPiAtIEJJVCgwKTogUkVTUF9PSwo+IC0gQklU
KDEpOiBSRVNQX1RJTUVPVVQKPiAtIEJJVCgyKTogUkVTUF9FUlJfQ1JDCj4gLSBCSVQoNSk6IERB
VEFfVElNRU9VVAo+IC0gQklUKDYpOiBEQVRBX0VSUl9DUkMKPiAtIEJJVCgxMik6IFJYRklGT19G
VUxMCj4gLSBCSVQoMTMpOiBUWEZJRk9fRU1QVFkKPiAKPiBJIGd1ZXNzIGluIHRoaXMgY2FzZSBC
SVQoMSkgUkVTUF9USU1FT1VUIGlzIHRoZSByZWxldmFudCBvbmUuCj4gCj4gcmVnaXN0ZXIgMHgw
NCBpcyBTRU5EIGFuZCByZWFkcyAweDRkIHdoaWNoIHRyYW5zbGF0ZXMgdG86Cj4gLSBDTUQxMwo+
IC0gTU1DX1JTUF9QUkVTRU5UIChIQVNfUkVTUCwgQklUKDYpKQo+IC0gbm8gb3RoZXIgZmxhZ3Mg
KFNUT1AsIFIxQiwgLi4uKSBhcmUgc2V0Cj4gCj4gRnVsbCByZWdpc3RlciBkdW1wOgo+ICMgY2F0
IC9zeXMva2VybmVsL2RlYnVnL3JlZ21hcC9jMTEwOGUwMC5tbWMvcmVnaXN0ZXJzCj4gMDA6IDAw
MDAwOTAwCj4gMDQ6IDAwMDAwMDRkCj4gMDg6IGU3ZmZlMDAyCj4gMGM6IDAyZjAwMDNmCj4gMTA6
IDAwMDNmMDA5Cj4gMTQ6IDAzYjgxYzAwCj4gMTg6IDJjNDNiY2YwCj4gMWM6IGUwMDAwMTUwCj4g
MjA6IDAwMDAwMDAwCj4gMjQ6IDAwMDAzMDY3Cj4gMjg6IDAwMDAwMDAwCj4gMmM6IDAwMDAwMDAw
Cj4gMzA6IDAwMDAwMDAwCj4gMzQ6IDAwZmUwY2ZmCj4gMzg6IDAwMDAxMDBiCj4gCj4gSW4gY2Fz
ZSB5b3UgYXJlIGN1cmlvdXMsIHRoZSBkcml2ZXIgaXM6IGRyaXZlcnMvbW1jL2hvc3QvbWVzb24t
bXgtc2RoYy1tbWMuYwo+IAo+IAo+IEJlc3QgcmVnYXJkcywKPiBNYXJ0aW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
