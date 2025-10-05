Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E816ECAC5B8
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Oct 2025 12:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pvkORkhrHryBms3aH9RnGgzYgwQDAO1Rt4xiCv2Pknk=; b=fjhW9ji6Ie42TN
	vCYUT+C+kqJppK/CmlelGf34yPNoNzU7Ma3RU9i2YaQvHE/39vm6rD+caBMBsSFWh2QRdjw5TpucJ
	h0p1kxJUzUqhyxBtwKUE//RRVlsz/IhkRNOrOVYFwZfYw9B3MohDasK7pYYVc6WwCRfA8xazG7jnk
	1Q+kzGjikqdM0WJ2VwbFq/l4glXRUIMR16c66mduNpy+YLM0eEC+Odw9UbV7Fi7BUBy8jThlcxx5W
	iEb3R+51RxVmGuCCp4yP87XeHVZZUFzkMp59pbSxbkzlmtcFfq+bTC2tUpak+d8t38JaKUVWHLHil
	1G31a5Yiq2WmKx5V47ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5Nye-0000000F5RO-3Cas;
	Sun, 05 Oct 2025 12:36:36 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5Nyb-0000000F5QM-2IYY
	for linux-amlogic@lists.infradead.org;
	Sun, 05 Oct 2025 12:36:35 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-374d1db213cso20959801fa.0
        for <linux-amlogic@lists.infradead.org>; Sun, 05 Oct 2025 05:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759667791; x=1760272591; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTBVd/nClqrF+np3hp6dXMEbrmomobOJty4TYQ6vLHM=;
        b=hWoqSHUMdlyUMKdqDak00kHoelstcfBWA4kOKstUUp6a2CvyCc6Q8y4Exr/osm01Gu
         wLK2KY4B7eq5Eu9mHWCHtNzz3IwSuQWRRASkQ6OLzYSbrspy0N+iWuB8TLQ+nMAEvqFl
         eX/7ZbmfTbbXMqLkib2pEt2oXzt+8YLAFxpPekNx1cOdsmtczfAFONIEnYpmkBoC8zqg
         EB0Yyvm2/w/dutGAuiqtD+hmPGlFev2M46Xtf0UYW/hws0FBc/ALJqYoOko9W8eJcctF
         cZTDNNcU43eQrAeLmAg9tHennMObM9sBXxXUllJn8hzbr/dH+Fp1jzbbYerQABysMs56
         feUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759667791; x=1760272591;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UTBVd/nClqrF+np3hp6dXMEbrmomobOJty4TYQ6vLHM=;
        b=AAU80IbfiL5qiO1YpGsreRah2nASmXnweNuvIRpHu09W3UnjCIeKnML8R5NiI9FmRq
         YQ9MONoQYHzuMWPWoWTzVPl5Uv1xLoUF37AwDTRgwiSTNkMEwml2gplAHnncrwBNrNFI
         THrKom8LS/WYEH1a9YcuSaX/b1x08rvgR1vS2Jy98b3Qh7wPS0wTlP1nGCek2RC2hDxI
         Ya2dz+L3dWgKu+ujcNJyRXX0OXEDN6VG0ZBauLoaCGOsbToW2s4k6WpuP4mIgOAlwP7h
         /egkVy/ohHI7r0bEVj3jzsxkdD8Fj+bTVzMifl/GoGJ7HZdq/QVyEiIlUaECcKn3u8xO
         XxTA==
X-Forwarded-Encrypted: i=1; AJvYcCX1rMu9gjignFJ1p19gvYMk160EEZCVGfTtKbHQzhFjN3Y+z7M2kf6VS/0MDt5Rrlvl+cwZIs1qwvxZ6sFc@lists.infradead.org
X-Gm-Message-State: AOJu0YwT7lsJ12hYFjrbVYAlWYKSg8T9qTWN/KF5Ut491V2G+MnVhJFJ
	HL9ALLp0Yv7AAu4rmiuyQlEdxA3K7eS9EuvavjwDf0kc3rD71/gw1WTK
X-Gm-Gg: ASbGnctWRSSgckKuhar4u2OUJonQB2Ai2QqvXussYL/OFh1Zson+x8wxz7De+t2ja8s
	TgDtBr1UIIsqFbBtNljAShju2sR262ubxJNNzeALVqWnl9hsS8X/maAjlFJGPIzrwkBmf7iuAmr
	yNG4524AhmNqo5mIjv6xTb3IBEDlIpUdi6urUk0SnOq1f4aao8Lgj9zIpB2QBE0+TRnaXuBmdXK
	fWO5UHA2z9OGmKrC9HGhNaofKUH21sWHezL/Uk9vIjilJsux5LraKNR8sS2xBDB+8NVryW+HQn3
	qTGr6tzjODggH7+8zoExSKrSgQsLh2HlJ5OxNH9pBVDwwjCz9yqpASgLZIholOaF9F62Be5PU/O
	5yC7z5u4wJ71A5tbsiz9VYwCJQU3KXtoYVNyx6TVtNWLBMIG/k+1GIBXuzyXEYFtFqXQMb/9FEM
	QSRQ3ABWEsoSZuYkOm
X-Google-Smtp-Source: AGHT+IGEqErpl4/yZCkCUF1+3SE3UIJICO6kK51WxwIZOJed0A6X31dHGb4CXR4L8Vz9X90HOvSsMw==
X-Received: by 2002:a05:651c:1b05:b0:356:839:56a with SMTP id 38308e7fff4ca-374c37ef44emr27261701fa.25.1759667790693;
        Sun, 05 Oct 2025 05:36:30 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-373ba2736c4sm33396251fa.7.2025.10.05.05.36.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 05 Oct 2025 05:36:29 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] drm/meson: add support for 2560x1440 resolution output
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <CAFBinCB9hxgJt_rqdy_1bM0FjnnCt1K=Au77yxeuWox1wSvdDw@mail.gmail.com>
Date: Sun, 5 Oct 2025 16:36:15 +0400
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Dongjin Kim <tobetter@gmail.com>
Message-Id: <ABDCFF3D-D3EF-4EF0-B51A-AD6B25D78895@gmail.com>
References: <20250927130239.825060-1-christianshewitt@gmail.com>
 <CAFBinCCsTqsn06A5oVXGTW6PgmSQH0bHE+8PSftyWNRAbYUTcA@mail.gmail.com>
 <C8A273D4-5F5F-4BD8-911A-67EC9C3FF1F4@gmail.com>
 <CAFBinCB9hxgJt_rqdy_1bM0FjnnCt1K=Au77yxeuWox1wSvdDw@mail.gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251005_053633_595199_0794C1F3 
X-CRM114-Status: GOOD (  26.91  )
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

PiBPbiA1IE9jdCAyMDI1LCBhdCAxMjoyMuKAr2FtLCBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0
aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPiB3cm90ZToKPiAKPiBIaSBDaHJpc3RpYW4s
Cj4gCj4gT24gTW9uLCBTZXAgMjksIDIwMjUgYXQgMTo1OOKAr0FNIENocmlzdGlhbiBIZXdpdHQK
PiA8Y2hyaXN0aWFuc2hld2l0dEBnbWFpbC5jb20+IHdyb3RlOgo+PiAKPj4+IE9uIDI5IFNlcCAy
MDI1LCBhdCAxOjI04oCvYW0sIE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGlu
Z2xAZ29vZ2xlbWFpbC5jb20+IHdyb3RlOgo+Pj4gCj4+PiBIaSBDaHJpc3RpYW4sCj4+PiAKPj4+
IE9uIFNhdCwgU2VwIDI3LCAyMDI1IGF0IDM6MDLigK9QTSBDaHJpc3RpYW4gSGV3aXR0Cj4+PiA8
Y2hyaXN0aWFuc2hld2l0dEBnbWFpbC5jb20+IHdyb3RlOgo+Pj4gWy4uLl0KPj4+PiBAQCAtODk0
LDYgKzkwOCwxMCBAQCBzdGF0aWMgdm9pZCBtZXNvbl92Y2xrX3NldChzdHJ1Y3QgbWVzb25fZHJt
ICpwcml2LAo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICBtID0gMHhmNzsKPj4+PiAgICAgICAg
ICAgICAgICAgICAgICAgZnJhYyA9IHZpY19hbHRlcm5hdGVfY2xvY2sgPyAweDgxNDggOiAweDEw
MDAwOwo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPj4+PiArICAgICAgICAgICAg
ICAgY2FzZSA0ODMwMDAwOgo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgIG0gPSAweGM5Owo+
Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGZyYWMgPSAweGQ1NjA7Cj4+Pj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgYnJlYWs7Cj4+PiBJbml0aWFsbHkgSSB0aG91Z2h0IHRoaXMgd2FzIHdy
b25nIGJlY2F1c2UgaXQncyBvbmx5IGFkZGVkIGZvciB0aGUKPj4+IEcxMkEgKHdoaWNoIGlzIGFs
c28gdXNlZCBvbiBHMTJCIGFuZCBTTTEpIGNvZGUtcGF0aCwgbGVhdmluZyBvdXQgdGhlCj4+PiBH
WCBTb0NzLgo+Pj4gCj4+PiBXYXMgdGhlIDI1NjB4MTQ0MCBtb2RlIHRlc3RlZCBvbiBhIGNvbXB1
dGVyIG1vbml0b3Igb3IgYSBUVj8KPj4+IEkgc3VzcGVjdCBpdCdzIHRoZSBmb3JtZXIsIHNvIEkg
dGhpbmsgaXQgZXhwZWN0ZWQgdGhlIGNvZGUgdG8gdGFrZSB0aGUKPj4+IE1FU09OX1ZDTEtfVEFS
R0VUX0RNVCBwYXRoLCB3aGljaCBhdXRvbWF0aWNhbGx5IGNhbGN1bGF0ZXMgbSBhbmQgZnJhYy4K
Pj4+IAo+Pj4gSSdsbCBnaXZlIGl0IGEgdHJ5IG9uIEZyaWRheSBhcyBJIGRvIGhhdmUgYSBjb21w
dXRlciBtb25pdG9yIHdpdGggdGhhdAo+Pj4gcmVzb2x1dGlvbiAtIHNvIGFueSBoaW50cyBmb3Ig
dGVzdGluZyBhcmUgd2VsY29tZSEKPj4gCj4+IFRoZSBvcmlnaW5hbCBwYXRjaCBpcyBmcm9tIEhh
cmRrZXJuZWwgc291cmNlcyAtIEnigJl2ZSBwaWNrZWQgaXQgc2V2ZXJhbAo+PiB5ZWFycyBhZ28g
YW5kIHRoZW4gdXBkYXRlZCB2YWx1ZXMgc2VtaS1yZWNlbnRseSBhZnRlciAxMDAwVUxMIGNoYW5n
ZXMuCj4+IFRoZSB1c2VyIHdobyBvcmlnaW5hbGx5IHJlcXVlc3RlZCB0aGF0IEkgY2hlcnJ5LXBp
Y2sgaXQgKGFuZCB0ZXN0ZWQgaXQpCj4+IHdhcyB1c2luZyBhbiBPZHJvaWQgTjIrIGJvYXJkIChH
MTJCKSB3aXRoIGEgRGVsbCBtb25pdG9yIElJUkMuIEl04oCZcyBub3QKPj4gdGVzdGVkIGJ5IG15
c2VsZiBhcyBJIG9ubHkgaGF2ZSBUVuKAmXMgbm90IG1vbml0b3JzLCBzbyBpdCB3aWxsIGJlIGdv
b2QKPj4gdG8gaGF2ZSB5b3VyIGNvbmZpcm1hdGlvbiAoZWl0aGVyIHdheSkuIElmIGl04oCZcyB3
cm9uZyBJ4oCZbGwgYmUgaGFwcHkgdG8KPj4gZHJvcCBpdCAtIEnigJltIGp1c3QgdHJ5aW5nIHRv
IHVwc3RyZWFtIGFuZCBvZmZsb2FkIHNvbWUgbG9uZ2VyLXJ1bm5pbmcKPj4gYW5kIGFsbGVnZWRs
eSBnb29kIHBhdGNoZXMgaW4gdGhlIExpYnJlRUxFQyBrZXJuZWwgcGF0Y2hzZXQuCj4gU28gSSd2
ZSB0cmllZCBpdCBvbiBhIExlIFBvdGF0byAoUzkwNVggU29DKSBib2FyZC4gVGhpcyBwYXRjaCBk
b2Vzbid0Cj4gZG8gYW55dGhpbmcgaGVyZSAoYXMgZXhwZWN0ZWQsIHNpbmNlIGl0IG9ubHkgdGFy
Z2V0cyB0aGUgRzEyQSBhbmQKPiBsYXRlciBjb2RlLXBhdGgpLgoKVGhhbmtzIGZvciB0ZXN0aW5n
LiBMZXTigJlzIGlnbm9yZSB0aGlzIHBhdGNoIHRoZW4gOikKCj4gRG9pbmcgc29tZSBtb3JlIGFu
YWx5c2lzLCBpdCBzZWVtcyB0aGF0Cj4gbWVzb25fdmVuY19oZG1pX3N1cHBvcnRlZF9tb2RlKCkg
c2ltcGx5IHByZXZlbnRzIHVzaW5nIGFueSBtb2RlIHdpdGgKPiBtb3JlIHRoYW4gMTkyMCBwaXhl
bHMuCj4gSSBhdHRhY2hlZCBhIHNpbXBsZSBwYXRjaCB0byBvdmVyY29tZSB0aGlzIChkaXNjYXJk
aW5nIGFueQo+IG1lc29uX3ZjbGsuYyBjaGFuZ2VzKToKPiAkIGNhdCAvc3lzL2NsYXNzL2RybS9j
YXJkMS1IRE1JLUEtMS9tb2Rlcwo+IDI1NjB4MTQ0MAo+IDIwNDh4MTE1Mgo+IDE5MjB4MTIwMAo+
IDE5MjB4MTA4MAo+IC4uLgo+IAo+IE15IG1vbml0b3IncyBPU0QgdGVsbHMgbWUgdGhhdCBJJ20g
cnVubmluZyBhdCAyNTYweDE0NDBANjBIei4KCknigJlsbCBwaWNrIHRoYXQgZm9yIHdpZGVyIHRl
c3RpbmcsIGJ1dCBpdCBsb29rcyBzZW5zaWJsZS4gVGhhbmtzLgoKQ0guCgo+IEBOZWlsLCBzaG91
bGQgd2UgYnVtcCB0aGUgbGltaXRzIGluIG1lc29uX3ZlbmMuYyB0byAiNEt4MktANjAiICh0aGF0
J3MKPiBhIHF1b3RlIGZyb20gYm90aCwgUzkwNS9HWEJCIGFuZCBTOTA1RDMvU00xIGRhdGFzaGVl
dHMpLCBtb3N0IGxpa2VseQo+IG1lYW5pbmc6IDQwOTZ4MjE2MD8KPiAKPiAKPiBCZXN0IHJlZ2Fy
ZHMsCj4gTWFydGluCj4gPG1lc29uX3ZlbmMtaGRtaS1zdXBwb3J0LTE0NDBwLXNjcmVlbi5kaWZm
PgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
