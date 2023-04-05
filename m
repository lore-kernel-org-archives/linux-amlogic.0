Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5AE8C76188
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Apr 2023 17:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ox6grjNQFako7qC6MGf6wAj80pA+qoFz37TKFMyHTA=; b=VhKlx20d7kasmz
	NBtFl7+U7/xwwFbKv27fFbMY6eoHRiSFmVu7p2q5YjvO/bKgBBZmvusyPzto+is9CzjunKSEJ+3M8
	v/elxL9ec8qLjo1GArv02JnrLsAtuPcvsNxBeA90KVdBi7WyDX/dWd6vkgMjvF2h7fdYtk6h0MTel
	CGgHYRagfc2K7gfSaq8+lkPEnrGK3Ip4clQKKv3a9OFQc7TseTNpDnrd+U/3dx2xO9wojhNNNWiLy
	fz1YzxxQuw9m7mP971m5rpm8ljqMIs42xZYzrzQBZhG8qMJyOPhoVTD8D1HP41x/Y8+U3DCu9GKYz
	sWCaJ4N/wQRgkw7ldC6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk6iH-005EZE-0d;
	Wed, 05 Apr 2023 17:14:25 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk6iD-005EYQ-2g;
	Wed, 05 Apr 2023 17:14:23 +0000
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pk6i9-0003OV-71; Wed, 05 Apr 2023 19:14:17 +0200
Message-ID: <fdffc009-47cf-e88d-5b9e-d6301f7f73f2@leemhuis.info>
Date: Wed, 5 Apr 2023 19:14:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/3] ARM: dts: meson: Fix the UART compatible strings
Content-Language: en-US, de-DE
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>
References: <20211227180026.4068352-1-martin.blumenstingl@googlemail.com>
 <20211227180026.4068352-2-martin.blumenstingl@googlemail.com>
 <20230405132900.ci35xji3xbb3igar@rcn-XPS-13-9305>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <20230405132900.ci35xji3xbb3igar@rcn-XPS-13-9305>
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1680714861;a2fb1c42;
X-HE-SMSGID: 1pk6i9-0003OV-71
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_101422_022690_CB5F1E5A 
X-CRM114-Status: GOOD (  16.41  )
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

CgpPbiAwNS4wNC4yMyAxNToyOSwgUmljYXJkbyBDYcOxdWVsbyB3cm90ZToKPiBIaSBNYXJ0aW4s
Cj4gCj4gT24gbHVuIDI3LTEyLTIwMjEgMTk6MDA6MjQsIE1hcnRpbiBCbHVtZW5zdGluZ2wgd3Jv
dGU6Cj4+IFRoZSBkdC1iaW5kaW5ncyBmb3IgdGhlIFVBUlQgY29udHJvbGxlciBvbmx5IGFsbG93
IHRoZSBmb2xsb3dpbmcgdmFsdWVzCj4+IGZvciBNZXNvbjYgU29DczoKPj4gLSAiYW1sb2dpYyxt
ZXNvbjYtdWFydCIsICJhbWxvZ2ljLG1lc29uLWFvLXVhcnQiCj4+IC0gImFtbG9naWMsbWVzb242
LXVhcnQiCj4+Cj4+IFVzZSB0aGUgY29ycmVjdCBmYWxsYmFjayBjb21wYXRpYmxlIHN0cmluZyAi
YW1sb2dpYyxtZXNvbi1hby11YXJ0IiBmb3IKPj4gQU8gVUFSVC4gRHJvcCB0aGUgImFtbG9naWMs
bWVzb24tdWFydCIgY29tcGF0aWJsZSBzdHJpbmcgZnJvbSB0aGUgRUUKPj4gZG9tYWluIFVBUlQg
Y29udHJvbGxlcnMuCj4gCj4gS2VybmVsQ0kgZGV0ZWN0ZWQgdGhhdCB0aGlzIHBhdGNoIGludHJv
ZHVjZWQgYSByZWdyZXNzaW9uIGluCj4gc3RhYmxlLXJjL2xpbnV4LTQuMTQueSBvbiBhIG1lc29u
OGItb2Ryb2lkYzEuCj4gQWZ0ZXIgdGhpcyBwYXRjaCB3YXMgYXBwbGllZCB0aGUgdGVzdHMgcnVu
bmluZyBvbiB0aGlzIHBsYXRmb3JtIGRvbid0Cj4gc2hvdyBhbnkgc2VyaWFsIG91dHB1dC4KPiAK
PiBUaGlzIGRvZXNuJ3QgaGFwcGVuIGluIG90aGVyIHN0YWJsZSBicmFuY2hlcyBub3IgaW4gbWFp
bmxpbmUsIGJ1dCA0LjE0Cj4gaGFzbid0IHN0aWxsIHJlYWNoZWQgRU9MIGFuZCBpdCdkIGJlIGdv
b2QgdG8gZmluZCBhIGZpeC4KPiAKPiBIZXJlJ3MgdGhlIGJpc2VjdGlvbiByZXBvcnQ6Cj4gaHR0
cHM6Ly9ncm91cHMuaW8vZy9rZXJuZWxjaS1yZXN1bHRzL21lc3NhZ2UvNDAxNDcKPiAKPiBLZXJu
ZWxDSSBpbmZvOgo+IGh0dHBzOi8vbGludXgua2VybmVsY2kub3JnL3Rlc3QvY2FzZS9pZC82NDIz
NGY3NzYxMDIxYTMwYjI2MmY3NzYvCgpXYWl0LCB3aGF0PyBBIHBhdGNoICg1MjI1ZTFiODc0MzIg
KCJBUk06IGR0czogbWVzb246IEZpeCB0aGUgVUFSVApjb21wYXRpYmxlIHN0cmluZ3MiKSkgdGhh
dCB3YXMgbWVyZ2VkIGZvciB2NS4xNy1yYzQgYW5kIGlzIG5vdCBpbiB0aGUKbGlzdCBvZiBwYXRj
aGVzIHRoYXQgd2VyZSBpbiA0LjE0LjMxMi1yYzEKKGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Fs
bC8yMDIzMDQwMzE0MDM1MS42MzY0NzE4NjdAbGludXhmb3VuZGF0aW9uLm9yZy8KKSBpcyBtZWFu
dCB0byBzdWRkZW5seSBjYXVzZSB0aGlzPyBIb3cgaXMgdGhpcyBwb3NzaWJsZT8gQW0gSSB0b3Rh
bGx5IG9uCnRoZSB3cm9uZyB0cmFjayBoZXJlIGFuZCBtaXN1bmRlcnN0YW5kaW5nIHNvbWV0aGlu
Zywgb3IgaXMgdGhpcyBhCmJpc2VjdGlvbiB0aGF0IHdlbnQgaG9ycmlibHkgc2lkZXdheXM/CgpD
aWFvLCBUaG9yc3RlbgoKPiBUZXN0IGxvZzoKPiBodHRwczovL3N0b3JhZ2Uua2VybmVsY2kub3Jn
L3N0YWJsZS1yYy9saW51eC00LjE0LnkvdjQuMTQuMzExLTQzLWc4OGU0ODFkNjA0ZTkvYXJtL211
bHRpX3Y3X2RlZmNvbmZpZy9nY2MtMTAvbGFiLWJheWxpYnJlL2Jhc2VsaW5lLW1lc29uOGItb2Ry
b2lkYzEuaHRtbAo+IAo+IFRoYW5rcywKPiBSaWNhcmRvCj4gCj4gI3JlZ3pib3QgaW50cm9kdWNl
ZDogNTIyNWUxYjg3NDMyZGNmMGQwZmMzNDQwODI0YjkxZDA0YzFkNmNjMQo+ICNyZWd6Ym90IHRp
dGxlOiBubyBzZXJpYWwgb3V0cHV0IGluIEtlcm5lbENJIHRlc3RzIG9uIG1lc29uOGItb2Ryb2lk
YzEKPiBmb3Igc3RhYmxlLTQuMTQKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0Cj4gbGludXgt
YXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAps
aW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
