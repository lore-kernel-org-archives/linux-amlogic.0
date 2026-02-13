Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5DB7EDF151
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Feb 2026 11:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iOg1d+51jMMOQhDBGE4ChoF2e9ZfEuaY63Z/bH1gFAY=; b=JT+iR2cHnan65V
	DWGD0kaGk4yJaHKcMKZwH2vacfroVikqp4S+zukZ4sMP4UYjpTckMP5KFJC2/Q1LpSJsH6SpQ0wfg
	UUSEX/PYlD0NIDn/QvUumaTItyp7AM4zuhMPezedJVhSA1Fad6Ls9GQfEzO+Lmzeor/N7hQg1pvk8
	TfFHyW+vU0h28B6Ljj2FIwyb6TdSOTlCVDdoYTunMu1ymTIccQK/Hd2dJ0tBxYgQoARrvc+tLWC9i
	BwRhbGACGILdYJdDBPZfQNEzK85rRkaEJKU3TGmKMs8FyfJ5KhdQ47SqFEBjGHzMZYE9rAxke8gqi
	T0MdXQerO9mZah60jGcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqqup-00000003M6i-0Zk7;
	Fri, 13 Feb 2026 11:00:51 +0000
Received: from mx4.sberdevices.ru ([152.89.196.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqqum-00000003M5Q-29u1;
	Fri, 13 Feb 2026 11:00:50 +0000
Received: from p-antispam-ksmg-sc-msk02.sberdevices.ru (localhost [127.0.0.1])
	by mx4.sberdevices.ru (Postfix) with ESMTP id 2EF7E40009;
	Fri, 13 Feb 2026 14:00:40 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx4.sberdevices.ru 2EF7E40009
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=post; t=1770980440;
	bh=OvdxfPMq3ENALtKqXmHnW0FdBU4wQRCJOdA+xd6oOJc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type:From;
	b=dLLLg44w+OAQ/ccLAlyfl/P7XUStUPbA9n3K82PnBeAGM6dDr6V53BW7wlGxLcQTo
	 59myc5PEimyglNz0111X3fZ5twPDqWbapNALFNCttwm/QbILl4vsXI10C412ktHNaw
	 UEn13emDFv/s6MZKZiDR2s5i+M/9BG2V9zah2Z92EgC7dsaqU4fnlqek+yEib42hbj
	 Ze1Mhbw8DD5YMdGuYyljFwsJ+dLPNyALERFCQeAU0vnNkznx5U5vKMeGMgv1hlVfRp
	 t5XWnwvkIQAQkx42BO4hTLkXfMUwHJeVlGjd0sEXQOqYai/kp83tHDAMOxjH4btww3
	 dcvc78z1j4ZbA==
Received: from smtp.sberdevices.ru (p-exch-cas-s-m1.sberdevices.ru [172.16.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "sberdevices.ru", Issuer "R12" (verified OK))
	by mx4.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 13 Feb 2026 14:00:39 +0300 (MSK)
Message-ID: <c1ec5f03-2fc5-4c63-91df-747f0bfd86c2@salutedevices.com>
Date: Fri, 13 Feb 2026 14:00:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: George Stark <gnstark@salutedevices.com>
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogW0RNQVJDIGVycm9yXSBbUEFUQ0ggdjMgMy8zXSBh?=
 =?UTF-8?Q?rm64=3A_dts=3A_meson-s4-s905y4-khadas-vim1s=3A_add_initial_device?=
 =?UTF-8?Q?_tree?=
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: Nick Xie <nick@khadas.com>, "robh@kernel.org" <robh@kernel.org>,
	"khilman@baylibre.com" <khilman@baylibre.com>, "jbrunet@baylibre.com"
	<jbrunet@baylibre.com>, "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-amlogic@lists.infradead.org"
	<linux-amlogic@lists.infradead.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "kernel@salutedevices.com" <kernel@salutedevices.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "xianwei.zhao@amlogic.com" <xianwei.zhao@amlogic.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260115030015.1334517-1-nick@khadas.com>
 <20260115030015.1334517-4-nick@khadas.com>
 <09df45e1-90b5-4618-9197-c724142bd83a@salutedevices.com>
 <PS1PPF62EEA9B1D287E26DFE619BB840508AE93A@PS1PPF62EEA9B1D.apcprd03.prod.outlook.com>
 <88a0395b-1ab3-4ef0-96c4-440b3a5c96f4@salutedevices.com>
 <CAFBinCDcDy4M79+mM+axsqXLfoQ56Ucd1C-OHkGLxwNkpfZ-zQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAFBinCDcDy4M79+mM+axsqXLfoQ56Ucd1C-OHkGLxwNkpfZ-zQ@mail.gmail.com>
X-Originating-IP: [172.28.2.68]
X-ClientProxiedBy: p-exch-cas-a-m1.sberdevices.ru (172.24.201.216) To
 p-exch-cas-s-m1.sberdevices.ru (172.16.210.2)
X-KSMG-AntiPhishing: NotDetected, bases: 2026/02/13 10:48:00
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Info: LuaCore: 87 0.3.87 7430d8ffafccd8879e1d8370e5b501352446c2ba, {Tracking_uf_ne_domains}, {Tracking_bl_eng_cat}, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;elixir.bootlin.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;lkml.iu.edu:7.1.1, {Track_Chinese_Simplified}, FromAlignment: s
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 200473 [Feb 13 2026]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.20
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2026/02/13 08:57:00 #28203847
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-KATA-Status: Not Scanned
X-KSMG-LinksScanning: NotDetected, bases: 2026/02/13 10:48:00
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_030049_062120_053CC36A 
X-CRM114-Status: GOOD (  20.55  )
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

CgpPbiAyLzEwLzI2IDAxOjMxLCBNYXJ0aW4gQmx1bWVuc3RpbmdsIHdyb3RlOgo+IEhpIEdlb3Jn
ZSwKPiAKPiBzb3JyeSBmb3IgdGhlIGxhdGUgcmVwbHkuCj4gCj4gT24gVGh1LCBKYW4gMjksIDIw
MjYgYXQgMzo0OOKAr1BNIEdlb3JnZSBTdGFyayA8Z25zdGFya0BzYWx1dGVkZXZpY2VzLmNvbT4g
d3JvdGU6CgpIZWxsbyBNYXJ0aW4uIEl0J3MgZ3JlYXQgdG8gaGVhciBmcm9tIHlvdSBhZ2Fpbi4K
Pj4KPj4KPj4gT24gMS8yNi8yNiAxMjozNSwgTmljayBYaWUgd3JvdGU6Cj4+Pj4gVGhhbmtzIGZv
ciB0aGUgcGF0Y2guIFNpbmNlIHlvdSBoYXZlIGtoYWRhcyBtYWlsIEknbSBwcmV0dHkgc3VyZSB5
b3UndmUKPj4+PiBoYWQgdGhlIHBvc3NpYmlsaXR5IHRvIHRlc3QgaXQgb24gdGhlIHJlYWwgdmlt
IGJvYXJkIGFuZCBJIGp1c3QgZG9uJ3QKPj4+PiBnZXQgaXQgaG93IGl0IHdvcmtzIHdpdGggdGhl
IHZvbHRhZ2UgdGFibGUgYWJvdmUuIFRoZSBwcm9ibGVtIGlzIHRoYXQKPj4+PiBwd20gaXMgY2Fs
Y3VsYXRlZCBpbmNvcnJlY3RseSBpbiB0aGUgdXBzdHJlYW0gcHdtLW1lc29uIGRyaXZlci4gVGhh
dAo+Pj4+IHZvbHRhZ2UgdGFibGUgYXBwZWFyZWQgdG8gYmUgdXNlZCBpbiBlYXJseSBhbWxvZ2lj
IGJsIGxvYWRlciBhbmQKPj4+PiBhcHByb3ByaWF0ZSBwd20gaXMgaW5pdGlhbGl6ZWQgZnJvbSBh
IHRhYmxlJ3MgcmVjb3JkLiBEdXR5IGN5Y2xlIHZhbHVlCj4+Pj4gaXMgdHJhbnNsYXRlZCB0byBw
d20gcmVncyBjb3JyZWN0bHkuIExhdGVyIHdoZW4ga2VybmVsIHN0YXJ0IHJ1bm5pbmcKPj4+PiBw
d20tcmVndWxhdG9yIGRyaXZlciBpcyBwcm9iZWQuIEl0IHJlYWRzIHRoZSBwd20gcmVncywgY2Fs
Y3VsYXRlcyBiYWNrCj4+Pj4gZHV0eS1jeWxlIGFuZCBzZWFyY2ggaXQgaW4gdGhlIHRhYmxlLiBT
aW5jZSBjYWxjdWxhdGlvbiBhbGdvcyBhcmUgbm90Cj4+Pj4gbWF0Y2ggYW5kIHRoZSB0YWJsZSBk
b2Vzbid0IGNvbnRhaW4gZnVsbCByYW5nZSBvZiAwLTEwMCUgdmFsdWVzCj4+Pj4gcmVndWxhdG9y
IGRyaXZlciBkb2Vzbid0IGZpbmQgY3VycmVudCB2b2x0YWdlLiBJbiBzdWNoIGNhc2UgcmVndWxh
dG9yCj4+Pj4gY29yZSBzZXRzIHRoZSBtaW5pbXVtIHZvbHRhZ2UgZnJvbSB0aGUgdGFibGUgWzFd
IGFuZCB0aGUgU29DIG1heSBoYW5nCj4+Pj4gKGRlcGVuZGluZyBvbiBib2FyZCkgZHVlIHRvIG1p
bmltdW0gdm9sdGFnZSBtYXkgYmUgdG9vIGxvdyBmb3IgdGhlCj4+Pj4gY3VycmVudCBmcmVxdWVu
Y3kgU29DIHVzZXMuCj4gTmljayBsaWtlbHkgZGlkbid0IHNwb3QgYW55IGlzc3VlcyBvbiBTNCBz
aW5jZSBDUFUgZnJlcXVlbmN5IHNjYWxpbmcKPiBpcyBub3QgdXBzdHJlYW1lZCB5ZXQgKGFzIHRo
ZXJlJ3Mgbm8gd2F5IHRvIGNvbnRyb2wgdGhlIENQVSBjbG9jawo+IHlldCkuCj4gVGhlIGxhY2sg
b2YgYSBPUFAgdGFibGUgbWVhbnM6IHRoZSBQV00gYW5kIENQVSBjbG9jayB3aWxsIGp1c3Qgc3Rh
eSBhdAo+IHdoYXRldmVyIHRoZSBib290bG9hZGVyIHByb3ZpZGVzCgpJdCBtYWtlcyBzZW5zZS4g
SSBzaG91bGQgZXhwZXJpbWVudCBvbiB0aGUgbGF0ZXN0IGtlcm5lbC4KCj4+Pj4gT3IgSSdtIG1p
c3Npbmcgc29tZXRoaW5nPwo+Pj4KPj4+Cj4+Pj4gVGhlcmUncyBub3QteWV0LXJldmlld2VkIHBh
dGNoIHRoYXQgZml4ZXMgcHdtIGFsZ28gWzJdLiBUaGVyZSdzCj4+Pj4gY2FsY3VsYXRpb24gZXhh
bXBsZSBpbiB0aGUgY292ZXIgbGV0dGVyLgo+Pj4+IFsxXSBodHRwczovL2VsaXhpci5ib290bGlu
LmNvbS9saW51eC92Ni4xOS1yYzUvc291cmNlL2RyaXZlcnMvcmVndWxhdG9yL2NvcmUuYyNMMTIy
Nwo+Pj4+IFsyXSBodHRwczovL2xrbWwuaXUuZWR1LzI0MTIuMy8wMDgyNi5odG1sCj4+Pgo+Pj4g
V2hhdCdzIHRoZSBzdGF0dXMgb2Ygc3VjaCBwYXRjaGVzPwo+Pgo+PiB0aGUgcGF0Y2ggaXMgcmVh
ZHkgZm9yIHJldmlldy4gSXQncyBzZWVtcyBsaWtlIG5vYm9keSBpcyBpbnRlcmVzdGVkCj4gSSdt
IHNvcnJ5IHRvIHNlZSB0aGF0IHRoZSBwYXRjaCBoYWQgaXQncyBmaXJzdCBhbm5pdmVyc2FyeS4K
PiBJJ2xsIG5lZWQgdG8gYnJpbmcgb3V0IG15IGxvZ2ljIGFuYWx5emVyIGFuZCB0ZXN0IHlvdXIg
cGF0Y2ggKEkgaG9wZQo+IGl0J3MgcHJlY2lzZSBlbm91Z2ggdG8gc2hvdyB0aGUgaW1wYWN0IG9m
IHlvdXIgY2hhbmdlcykuCj4gQXJlIHlvdXIgcGxhbnMgdGhlbiB0byByZS1zZW5kIHRoZSBwYXRj
aGVzIG9yIGhhdmUgeW91IG1vdmVkIG9uIGFuZAo+IG5lZWQgc29tZW9uZSBlbHNlIHRvIHRha2Ug
Y2FyZSBvZiBpdD8KCkl0J3MgYSBtYWpvciBzdGVwIGFueXdheSBpZiB5b3UgY29uZmlybSB0aGUg
aXNzdWUgeW91cnNlbGYgd2l0aCBhbiAKYW5hbHl6ZXIuIEluIHRoYXQgY2FzZSBkaXNjdXNzaW9u
IHdvbid0IGJlIGRlbGF5ZWQgZm9yIG9uZSBtb3JlIHllYXIKSSB0aGluay4gVGhhbmtzLgoKU3Vy
ZSBJJ20gcmVhZHkgdG8gZGlzY3Vzcy9maXgvcmVzZW5kIHRoaXMgcGF0Y2guCgotLSAKQmVzdCBy
ZWdhcmRzCkdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
