Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F76EC433EF
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Feb 2022 16:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TgPnP0Ix+/4DhscBsBsmZ59VYyVv5UI3MBvWmNy2cE8=; b=sDVe1mRy9iG4T0
	zKtgNOpH8OqH/K12H40OCGT6WcsYGma1obcOSGqnEddKSG0LgDKs8Nogz0pDdImXiczC34Z7R1Tex
	0InPxDqT6XRCnJl18+eiqAHNKADi8KRlrGAeNC2ZYkbx3/t4gCTvcN55YywRvy5oy/DUhJDtlHXCW
	1iwX3dW5OzwR8CL4IZ+09wZd6pv+NMqpBNvGa6w0SeoK5Ln0/Hx71tkTEv2C4RG/IPe3C0h4KLm3Z
	i3/X5R1pmimz4CRG/M99z2di6j0L/fA9zOMnn5cr7s1oVcyQEQil9C7h3wBg13yfySVEIy+2CgmqQ
	eETanmlM/0PeM2MywOoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHTTr-00EvBp-PN; Tue, 08 Feb 2022 16:36:39 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHTTp-00EvAv-9g; Tue, 08 Feb 2022 16:36:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FA6E1FB;
 Tue,  8 Feb 2022 08:36:36 -0800 (PST)
Received: from [10.57.70.89] (unknown [10.57.70.89])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C50773F70D;
 Tue,  8 Feb 2022 08:36:34 -0800 (PST)
Message-ID: <4b1d6f80-db33-b2ea-7214-34b87a7e734c@arm.com>
Date: Tue, 8 Feb 2022 16:36:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2] add pmu to amlogic meson sm1
Content-Language: en-GB
To: Benjamin Mordaunt <crawford.benjamin15@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220205234554.4403-1-crawford.benjamin15@gmail.com>
 <20220206144343.2194-1-crawford.benjamin15@gmail.com>
 <42c51f9d-d122-2d09-cdcd-f733cbc60d5b@baylibre.com>
 <65cde84a-8f8b-ac57-9b66-2b8d6378dbfa@arm.com>
 <CANtEDzSVxnUsC05Vhr5gG3KRBAX_X564ZiY2nBSoBFoy54RQ5w@mail.gmail.com>
 <a7adf12d-f949-9a95-9c6a-b73017107dc7@arm.com>
 <CANtEDzQDOiLKWW7c1VwnhjE-kjZ3tWYVKxBA4j1twOOjyEPcwQ@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <CANtEDzQDOiLKWW7c1VwnhjE-kjZ3tWYVKxBA4j1twOOjyEPcwQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_083637_453237_427BA66C 
X-CRM114-Status: GOOD (  21.66  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMjAyMi0wMi0wOCAxNjowMiwgQmVuamFtaW4gTW9yZGF1bnQgd3JvdGU6Cj4gT2theSBzbyB0
aGlzIGRvZXMgYXBwZWFyIHRvIGJlIGJlaGF2aW5nIHdpdGggc29tZSBpc3N1ZXMgKHVubGVzcyBJ
J3ZlCj4ganVzdCBnb3QgMiBvZiB0aGUgaW50ZXJydXB0IG51bWJlcnMgd3JvbmcsIGJ1dCBpdCBz
ZWVtcyB1bmxpa2VseSBhdAo+IHRoaXMgc3RhZ2UpLgo+IAo+IENQVXMgMCBhbmQgMSBzZWVtIHRv
IGJlIGJlaGF2aW5nIHNvbWV3aGF0IHNlbnNpYmx5LCB3aGlsZSBgcGVyZiBzdGF0YAo+IHJlcG9y
dHMgYDxub3Qgc3VwcG9ydGVkPmAgZm9yIGNhY2hlcyBhbmQgYnJhbmNoZXMgd2l0aCBDUFVzIDIg
YW5kIDMuCj4gV291bGQgdGhpcyBzdWdnZXN0IHRoaXMgaW1wbGVtZW50YXRpb24gaXMgaW5kZWVk
IGJyb2tlbj8KClRha2luZyBhIGNsb3NlciBsb29rLCB0aGUgaW50ZXJydXB0cyBmb3IgQ1BVcyAy
IGFuZCAzIGhlcmUgYXJlIGNsZWFybHkgCndyb25nIHNpbmNlIHRoZXkgYWxyZWFkeSBiZWxvbmcg
dG8gc29tZSBhdWRpbyBjb250cm9sbGVycyBpbiB0aGUgRFRTSS4gSSAKbG9va2VkIHVwIGRvY3Vt
ZW50YXRpb24gYW5kIGZvdW5kIGFuIFM5MDVEMyBtYW51YWwgZnJvbSBLaGFkYXMgd2hpY2ggCmRv
Y3VtZW50cyBTUEkgMTM3IChHSUMgaW50ZXJydXB0IDE2OSkgYXMgInxQTVVJUlFfYVszOjBdIiwg
d2hpY2ggSSBjYW4ndCAKcmVhZCBhcyBhbnl0aGluZyBvdGhlciB0aGFuICJsb2dpY2FsIE9SIG9m
IGFsbCA0IFBNVSBJUlFzIi4gTm90IHN1cmUgCmFib3V0IFNQSSAxMzggYnV0IEknZCBndWVzcyBp
dCdzIHNvbWV0aGluZyB0aGF0IGp1c3QgaGFwcGVucyB0byBmaXJlIGluIAphIG1hbm5lciB0aGF0
IGFwcGVhcnMgdG8gc29ydCBvZiB3b3JrIGZvciB0aGUgUE1VLgoKU2FkbHkgaXQgbG9va3MgbGlr
ZSBOZWlsJ3MgaW5zdGluY3Qgd2FzIHJpZ2h0IGFuZCB0aGlzIG9uZSBpcyBhbHNvIGluIApmYWN0
IGRlYWQsIHNvcnJ5IDooCgpSb2Jpbi4KCj4gCj4gVGhhbmtzLAo+IEJlbgo+IAo+IAo+IE9uIE1v
biwgRmViIDcsIDIwMjIgYXQgMTo0NyBQTSBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0u
Y29tPiB3cm90ZToKPj4KPj4gT24gMjAyMi0wMi0wNyAxMzozMywgQmVuamFtaW4gTW9yZGF1bnQg
d3JvdGU6Cj4+PiBUaGUgUzkwNVgz4oCZcyAoT2Ryb2lkIEM0KSBkYXRhc2hlZXQgYXBwZWFycyB0
byByZXBvcnQgNCBpbmRpdmlkdWFsIFBNVUlSUXMsCj4+PiBtdWNoIGluIHRoZSBzYW1lIHdheSBh
cyBHWC4gSWYgdGhhdCBpcyBpbmRlZWQgdGhlIGNhc2UsIEkgdGhpbmsgdGhpcyBwYXRjaAo+Pj4g
YXBwbGllcy4gT3RoZXJ3aXNlLCBpcyB0aGUgZGF0YXNoZWV0IHdyb25nIGlmIE1hcmPigJlzIGNv
bW1lbnRzIGFwcGx5Pwo+Pgo+PiBBIGZhaXJseSBzb2xpZCB0ZXN0IHdvdWxkIGJlIHRvIHJ1biBh
IHNhbXBsaW5nIGV2ZW50IChlLmcuIGBwZXJmIHN0YXRgKQo+PiB0YXNrc2V0IHRvIGEgc2luZ2xl
IENQVSBhbmQgb2JzZXJ2ZSB0aGUgY29ycmVzcG9uZGluZyBJUlEgY291bnQgaW5jcmVhc2UKPj4g
aW4gL3Byb2MvaW50ZXJydXB0cywgZm9yIGVhY2ggY29yZSBpbiB0dXJuLiBJZiB0aGF0IGJlaGF2
ZXMgYXMgZXhwZWN0ZWQKPj4gdGhlbiBjaGFuY2VzIGFyZSBldmVyeXRoaW5nIGlzIGluZGVlZCBz
YW5lLgo+Pgo+PiBDb3VwbGUgb2Ygbml0cGlja3MgZm9yIHRoZSBwYXRjaCBpdHNlbGYgLSB5b3Un
cmUgYWxtb3N0IHRoZXJlLCBidXQKPj4geW91J3ZlIGdvdCBzcHVyaW91cyB0YWJzIG9uIHRoZSBi
bGFuayBsaW5lcywgcGx1cyB5b3UgbmVlZCBhIHByb3Blcgo+PiBjb21taXQgbWVzc2FnZSBhbmQg
eW91ciBzaWduLW9mZiBhYm92ZSB0aGUgIi0tLSIgbGluZSAtIGFueXRoaW5nIHlvdSBhZGQKPj4g
YmVsb3cgdGhlcmUgaXMgdHJlYXRlZCBhcyBhZGRpdGlvbmFsIGNvbW1lbnRhcnkgZm9yIHJldmll
d2VycycgYmVuZWZpdAo+PiBhbmQgd2lsbCBiZSBkaXNjYXJkZWQgYnkgYGdpdCBhbWAuCj4+Cj4+
IENoZWVycywKPj4gUm9iaW4uCj4+Cj4+Pgo+Pj4gLyBCZW4KPj4+Cj4+PiBPbiBNb24sIDcgRmVi
IDIwMjIgYXQgMTM6MjAsIFJvYmluIE11cnBoeSA8cm9iaW4ubXVycGh5QGFybS5jb20+IHdyb3Rl
Ogo+Pj4KPj4+PiBPbiAyMDIyLTAyLTA3IDA4OjE0LCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPj4+
Pj4gSGksCj4+Pj4+Cj4+Pj4+IE9uIDA2LzAyLzIwMjIgMTU6NDMsIEJlbmphbWluIE1vcmRhdW50
IHdyb3RlOgo+Pj4+Pj4gLS0tCj4+Pj4+PiBUaGUgZHRzIGZvciBtZXNvbiBzbTEgYXBwZWFycyB0
byBvbWl0IHRoZSBTb0MncyBQTVUsCj4+Pj4+PiB3aGljaCBpcyBlc3NlbnRpYWwgZm9yIGFjY2Vz
c2luZyBwZXJmIGV2ZW50cyByZWdhcmRpbmcKPj4+Pj4+IGUuZy4gY2FjaGUgb24gZS5nLiB0aGUg
T2Ryb2lkIEM0IHBsYXRmb3JtLiBBZGQgaXQuCj4+Pj4+Pgo+Pj4+Pj4gICAgIGFyY2gvYXJtNjQv
Ym9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zbTEuZHRzaSB8IDEzICsrKysrKysrKysrKy0KPj4+Pj4+
ICAgICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4+
Pj4KPj4+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24t
c20xLmR0c2kKPj4+Pj4+IGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXNtMS5k
dHNpCj4+Pj4+PiBpbmRleCAzZDhiMWY0ZjIuLjQxNDdlZWNkMiAxMDA2NDQKPj4+Pj4+IC0tLSBh
L2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zbTEuZHRzaQo+Pj4+Pj4gKysrIGIv
YXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXNtMS5kdHNpCj4+Pj4+PiBAQCAtNiw2
ICs2LDggQEAKPj4+Pj4+ICAgICAjaW5jbHVkZSAibWVzb24tZzEyLWNvbW1vbi5kdHNpIgo+Pj4+
Pj4gICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9jay9heGctYXVkaW8tY2xrYy5oPgo+Pj4+
Pj4gKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9pcnEuaD4KPj4+
Pj4+ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLWdpYy5o
Pgo+Pj4+Pj4gICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9wb3dlci9tZXNvbi1zbTEtcG93ZXIu
aD4KPj4+Pj4+ICAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcmVzZXQvYW1sb2dpYyxtZXNvbi1h
eGctYXVkaW8tYXJiLmg+Cj4+Pj4+PiAgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3Jlc2V0L2Ft
bG9naWMsbWVzb24tZzEyYS1hdWRpby1yZXNldC5oPgo+Pj4+Pj4gQEAgLTkwLDcgKzkyLDE2IEBA
IGwyOiBsMi1jYWNoZTAgewo+Pj4+Pj4gICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiY2Fj
aGUiOwo+Pj4+Pj4gICAgICAgICAgICAgfTsKPj4+Pj4+ICAgICAgICAgfTsKPj4+Pj4+IC0KPj4+
Pj4+ICsKPj4+Pj4+ICsgICAgYXJtLXBtdSB7Cj4+Pj4+PiArICAgICAgICBjb21wYXRpYmxlID0g
ImFybSxjb3J0ZXgtYTU1LXBtdSI7Cj4+Pj4+PiArICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19T
UEkgMTM3IElSUV9UWVBFX0xFVkVMX0hJR0g+LAo+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgPEdJ
Q19TUEkgMTM4IElSUV9UWVBFX0xFVkVMX0hJR0g+LAo+Pj4+Pj4gKyAgICAgICAgICAgICAgICAg
PEdJQ19TUEkgMTUzIElSUV9UWVBFX0xFVkVMX0hJR0g+LAo+Pj4+Pj4gKyAgICAgICAgICAgICAg
ICAgPEdJQ19TUEkgMTU0IElSUV9UWVBFX0xFVkVMX0hJR0g+Owo+Pj4+Pj4gKyAgICAgICAgaW50
ZXJydXB0LWFmZmluaXR5ID0gPCZjcHUwPiwgPCZjcHUxPiwgPCZjcHUyPiwgPCZjcHUzPjsKPj4+
Pj4+ICsgICAgfTsKPj4+Pj4+ICsKPj4+Pj4+ICAgICAgICAgY3B1X29wcF90YWJsZTogb3BwLXRh
YmxlIHsKPj4+Pj4+ICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAib3BlcmF0aW5nLXBvaW50cy12
MiI7Cj4+Pj4+PiAgICAgICAgICAgICBvcHAtc2hhcmVkOwo+Pj4+Pgo+Pj4+PiBQbGVhc2Ugc2Vl
IE1hcmMncyBjb21tZW50cyBhYm91dCBQTVUgc3VwcG9ydDoKPj4+Pj4gaHR0cDovL2xvcmUua2Vy
bmVsLm9yZy9yLzg3MzVwY3E2M28ud2wtbWF6QGtlcm5lbC5vcmcKPj4+Pgo+Pj4+IElmIFNNMSBh
Y3R1YWxseSBoYXMgZGlzdGluY3QgcGVyLWNvcmUgaW50ZXJydXB0cyBhcyB0aGUgcGF0Y2ggaW1w
bGllcwo+Pj4+IHRoZW4gaXQncyBmaW5lIC0gaXQncyBvbmx5IEcxMkIgYW5kIGFueXRoaW5nIGVs
c2UgdGhhdCBjb21iaW5lcyBtdWx0aXBsZQo+Pj4+IFBNVSBJUlFzIGludG8gYSBzaW5nbGUgU1BJ
IHdoaWNoIGFyZSB1bnN1cHBvcnRhYmxlLgo+Pj4+Cj4+Pj4gUm9iaW4uCj4+Pj4KPj4+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2lj
IG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
