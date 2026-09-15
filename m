Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFE1C88E7F
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2026 15:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K8cAGVrhSN2WVPmDF/VaioB6fDX3B3ealPUHcJcQKTs=; b=bgW+Luie0eOibr
	kgLIjYa+mSwy+d01ZWSQC6qujU116Me9uAfa7a7SB4p60y8Ctt9vL2FBW3vl2sZUjdzF70nklUKSF
	TNv/MWUd6WALKhAyIbummCoyGVcq3y17JMW4Q9UVLrvm0VhgYyvNoK6TeLOJtlflF2zECusVb7/3/
	QzWZ+oiCwb8gozAvvNF/ZuOMebriIIY1NdsPoKi1OCwXmwMsP9W2wwHdsiZryT+Aun53AjxZ4vv2X
	uhvOCCpYYAapyzPFSBfx746PySGeowQgxz/kxZqDgVD9MmKLcelTbzzvebYWfk9djikNEsXTJFmpG
	cbFBOs+fudqJkdurZHew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VVF-00000007K1A-26eL;
	Tue, 15 Sep 2026 15:55:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VVE-00000007K0Z-0N27
	for linux-amlogic@bombadil.infradead.org;
	Tue, 15 Sep 2026 15:55:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wp7WIPM4acbNtx/6GioAbRHdq+dUssBIHTJbsJvHyw4=; b=YOIamUQON326hqTSps1Ljiyeco
	9lC2S4e6Rvlpf6qcxncjbffiPOUd2WhR09+B9SJAB4c2e6HmP6yx5quddDYviCbXXAxUBdJ3seUg+
	xeiYYEDCYWygVio3QjM+26TyeTxEPLGLAlRq3QXOT0CVtfPkE/ky5uMMaLChp67taAh/zLRkLa3df
	2vNUikpmAT+1fnfvw5yNd63VS3XBe8gH41UCz6m2z7+ozIFStGM5KVOpV/yek8IDVeVEzKn+1r3mi
	/GPgU8VkLrLWdb+g7NwphZLH4OGLsphJ+Qh+NX6xzzEIYHXB5rltgdCiC1L7+dbNsDnBIOp3OkAr6
	w6307AhA==;
Received: from mail-ej2-f12.google.com ([74.125.228.140])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6VVB-00000006zAP-1MJA
	for linux-amlogic@lists.infradead.org;
	Tue, 15 Sep 2026 15:55:22 +0000
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f560398so88051466b.1
        for <linux-amlogic@lists.infradead.org>; Tue, 15 Sep 2026 08:55:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789487719; x=1790092519;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wp7WIPM4acbNtx/6GioAbRHdq+dUssBIHTJbsJvHyw4=;
        b=sBqAB/YFsTTBlYJAxMX2CllrWvk3XnD1xlwlawtOQTlsOMDh7Fci+m+ULQFfCROs4p
         +hx8anPUPNSKaXkQREwUno+iNXq1Pi7s0WOmMGQ96h75c5AOLlwZb0S9tgNZuZJcK5Dc
         0HMEMMtEgwSqEAwdwM2H5nn93enf+9KqdmybirrQLZTTcRtvV9+gBbokM5ev/rydiu8y
         VtkvTEJcyg1dBXMWZ+ZhlyFj5Xf87ZihYT9GPTbFNnDta/7uGvjjo5pLnCH59D7l+7YD
         dKmDrU8ZeWjhMQdTwQu7YT1Bu01p1WVQUFpcY+NmPaiZx6s+pOFwS2ulx2JhR4lRrkaF
         FfVQ==
X-Forwarded-Encrypted: i=1; AKwUvByl6JFeJK1alC/n6ROEzIpqZ7plT5sigA+ipZpdDPjEI9cKnad+JB++SVl92G5/Dg7lNozV3hpOsgaSiDXU@lists.infradead.org
X-Gm-Message-State: AFuF++kG5PnFRO/arH6vd2WM9/TbzBhb0X+KmoNXFnVHQVwrf8nl9dFw
	RK/sEs5KWzTplBJZgA+UK+XscDuN+cpL0MgCtKJ94legGqH44xhy3uVn
X-Gm-Gg: AYBFou2MahXquool8UXA5d/0jc7EPlkUstJMf5e0Kz5Yy/AGhRXgDBLwMxz5hNS2Zpo
	tIZ86/mWL8A1cg83I2jdujxANJONRGz7Z2bnfgncem4wNzpbQ7osFegQ5YRmaDVPpPKY6nVetaJ
	uPL5z6vf9Tfh5NuReE4NQmvGwkmHHx2TD9+JSnJ50Ozcd1VGjb6EScpTOiISn7i3AozZ7h3VTXs
	5NcgsTUMTlFEWGtrbBtJFplXhxBegDm26v+COGwdYgBWmFvLR4jzpl25JhBR04OreQsLR9YytGZ
	R6j8Xfyfvy6+jCcGVs2jLZjUElj5tq81twHZtyPe1buN6XbJoXMbZNAhPWty+0ojoji8rkhFxOu
	KMBAMPLcTnSwPpjt6DnPVjA3/ywpgK0vn66g28EgWN1NtrAMGPuDHK48syQdPzYUpRM/ra4fQA5
	B6mEsLBkLeaUxrlta/bpKNPnr4Kx/KI/wP8QxOScJzFYYQEmsrkGAjymhcCPMxHNi8UdIo/o032
	e9p3RNeOI6puO/e2wYjnpocvkhLq3o=
X-Received: by 2002:a17:906:4795:b0:c26:2f09:f2d8 with SMTP id a640c23a62f3a-c29d790987bmr118615366b.36.1789487719226;
        Tue, 15 Sep 2026 08:55:19 -0700 (PDT)
Received: from [192.168.1.135] ([84.68.183.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966125543sm610972266b.55.2026.09.15.08.55.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 08:55:18 -0700 (PDT)
Message-ID: <dbf50a87-cf43-452d-8a82-6d7ee9af02a6@linux.com>
Date: Tue, 15 Sep 2026 16:55:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] amlogic: t7: give the MMC bus pipeline clock real
 consumers
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Chuan Liu <chuan.liu@amlogic.com>, Jian Hu <jian.hu@amlogic.com>,
 Ronald Claveau <linux-kernel-dev@aliel.fr>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260905153234.133217-1-tanure@linux.com>
 <CAPx+jO8oWZxgkWTv3v5odp8K2oWMY-KhJVR3U+iqY4mQ9LrG9w@mail.gmail.com>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <CAPx+jO8oWZxgkWTv3v5odp8K2oWMY-KhJVR3U+iqY4mQ9LrG9w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_165521_413873_2EBC87E9 
X-CRM114-Status: GOOD (  17.60  )
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

T24gMTEvMDkvMjAyNiAxNjo0MCwgVWxmIEhhbnNzb24gd3JvdGU6Cj4gT24gU2F0LCBTZXAgNSwg
MjAyNiBhdCA1OjMy4oCvUE0gTHVjYXMgVGFudXJlIDx0YW51cmVAbGludXguY29tPiB3cm90ZToK
Pj4KPj4gVGhlIHByZXZpb3VzIHNlcmllcyBmb3IgdGhlIGludGVybWl0dGVudCBib290IGhhbmdz
IG9uIHRoZSBWSU00Cj4+IG1hcmtlZCBzeXNfYW1waXBlX25hbmQgYXMgY3JpdGljYWwuIEJ1dCBh
cyBDaHVhbiBMaXUgZnJvbSBBbWxvZ2ljCj4+IGV4cGxhaW5lZCwgc3lzX2FtcGlwZV9uYW5kIGNs
b2NrcyBhIHBpcGVsaW5lIHN0YWdlIHRoYXQgdGhlCj4+IGhhcmR3YXJlIGRlc2lnbiBpbnNlcnRz
IGluIHRoZSBidXMgcGF0aCBiZXR3ZWVuIHRoZSBTRC9lTU1DCj4+IGNvbnRyb2xsZXJzIGFuZCB0
aGUgTklDX01BVFJJWCBmYWJyaWMgdG8gaGVscCB0aW1pbmcgY2xvc3VyZS4KPj4KPj4gU28gdGhl
IGNsb2NrIGhhcyByZWFsIGNvbnN1bWVyczogcmVmZXJlbmNlIGl0IGZyb20gdGhlIHRocmVlIE1N
Qwo+PiBjb250cm9sbGVyIG5vZGVzIGFuZCBkcm9wIENMS19JU19DUklUSUNBTCBpbnN0ZWFkLgo+
Pgo+PiBUaGUgc2VyaWVzIGNyb3NzZXMgdGhyZWUgdHJlZXM7IHBhdGNoIDQgKGNsaykgbXVzdCBv
bmx5IGxhbmQgYWZ0ZXIKPj4gcGF0Y2hlcyAxLTMsIG90aGVyd2lzZSB0aGUgRE1BIGhhbmdzIGZp
eGVkIGJ5IDQzZTE3MDVlY2FiOSBjb21lIGJhY2suCj4+Cj4+IENoYW5nZXMgc2luY2UgdjEgWzNd
Ogo+PiAgIC0gRHJvcHBlZCB0aGUgRml4ZXM6IHRhZzsgdGhpcyBzZXJpZXMgaXMgYW4gaW1wcm92
ZW1lbnQgYW5kIHNob3VsZCBub3QKPj4gICAgIGJlIHBpY2tlZCB1cCBieSBzdGFibGUgKEplcm9t
ZSBCcnVuZXQpCj4+ICAgLSBNb3ZlZCB0aGUgcGF0Y2ggNCBkZXBlbmRlbmN5IG5vdGUgYmVsb3cg
dGhlIC0tLSBzbyBpdCBpcyBub3Qga2VwdAo+PiAgICAgZm9yIHBvc3Rlcml0eSAoSmVyb21lIEJy
dW5ldCkKPj4gICAtIERyb3BwZWQgdGhlIGUtbWFpbCBhZGRyZXNzIGZyb20gdGhlIEFzc2lzdGVk
LWJ5IHRyYWlsZXIsIHNlZQo+PiAgICAgRG9jdW1lbnRhdGlvbi9wcm9jZXNzL2NvZGluZy1hc3Np
c3RhbnRzLnJzdCAoSmVyb21lIEJydW5ldCkKPj4gICAtIEZpeGVkIHRoZSBzcGFjZS1pbmRlbnRl
ZCBlcnJvciBwYXRoIGFkZGVkIHRvIG1lc29uX21tY19wcm9iZSgpIGluCj4+ICAgICBwYXRjaCAy
LCBpdCBkaWQgbm90IHBhc3MgY2hlY2twYXRjaAo+PiAgIC0gRHJvcHBlZCB0aGUgQ0xLX1BJUEVM
SU5FKCkgbWFjcm8gZnJvbSBwYXRjaCAyOyBoYXNfcGlwZWxpbmVfY2xrIGlzIGEKPj4gICAgIGNh
cGFiaWxpdHkgZmxhZywgbm90IGFuIFNEX0VNTUNfQ0xPQ0sgcmVnaXN0ZXIgZmllbGQKPj4KPj4g
VGhhbmtzLAo+PiBMdWNhcwo+Pgo+PiBMdWNhcyBUYW51cmUgKDQpOgo+PiAgICBkdC1iaW5kaW5n
czogbW1jOiBhbWxvZ2ljLG1lc29uLWd4LW1tYzogZG9jdW1lbnQgdGhlIFQ3IHBpcGVsaW5lIGNs
b2NrCj4+ICAgIG1tYzogbWVzb24tZ3g6IGVuYWJsZSB0aGUgYnVzIHBpcGVsaW5lIGNsb2NrIG9u
IFQ3Cj4+ICAgIGFybTY0OiBkdHM6IGFtbG9naWM6IHQ3OiBhZGQgdGhlIHBpcGVsaW5lIGNsb2Nr
IHRvIHRoZSBNTUMgY29udHJvbGxlcnMKPj4gICAgY2xrOiBtZXNvbjogdDc6IGRvbid0IG1hcmsg
c3lzX2FtcGlwZV9uYW5kIGFzIGNyaXRpY2FsCj4+Cj4+ICAgLi4uL2JpbmRpbmdzL21tYy9hbWxv
Z2ljLG1lc29uLWd4LW1tYy55YW1sICAgIHwgMjkgKysrKysrKysrKysrKysrKysrLQo+PiAgIGFy
Y2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9hbWxvZ2ljLXQ3LmR0c2kgICB8IDE1ICsrKysrKy0t
LS0KPj4gICBkcml2ZXJzL2Nsay9tZXNvbi90Ny1wZXJpcGhlcmFscy5jICAgICAgICAgICAgfCAx
MCArKystLS0tCj4+ICAgZHJpdmVycy9tbWMvaG9zdC9tZXNvbi1neC1tbWMuYyAgICAgICAgICAg
ICAgIHwgMjAgKysrKysrKysrKysrKwo+PiAgIDQgZmlsZXMgY2hhbmdlZCwgNjIgaW5zZXJ0aW9u
cygrKSwgMTIgZGVsZXRpb25zKC0pCj4+Cj4+IC0tCj4+IDIuNTUuMAo+Pgo+IAo+IFBhdGNoIDEg
YW5kIHBhdGNoMiBhcHBsaWVkIGZvciBuZXh0LCB0aGFua3MhCj4gCj4gS2luZCByZWdhcmRzCj4g
VWZmZQpIaSBOZWlsLAoKQW55IGNoYW5jZSB5b3UgY291bGQgcXVldWUgcGF0Y2ggMyBmb3IgdGhp
cyBjeWNsZT8gUGF0Y2ggMiBpcyBhbHJlYWR5IGluCm5leHQsIGFuZCB1bnRpbCB0aGUgRFRTIGxh
bmRzIHRoZSBNTUMgcHJvYmUgZmFpbHMgb24gVDcgd2l0aCAibWlzc2luZwpwaXBlbGluZSBjbG9j
ayIuCgpUaGFua3MKTHVjYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
