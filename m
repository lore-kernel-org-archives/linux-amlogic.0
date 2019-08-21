Return-Path: <SRS0=UIdE=WR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E352AC3A59E
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 21:19:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1D17206DD
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 21:19:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JAhsolpR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="M41c94fB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1D17206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d2vjnEHLFH0KyWTwJc+G8gJ18eGWYR8qC8Cf6qcCfdM=; b=JAhsolpRwUKeyK
	bwrR9IziqkqxiXA1mRdayWpOHIu4p+02OA6TvcVwwNOhkeWg6S1d47x/euesPB+cdQcOITm+5OiP+
	ZDMCSOfCvGwVbiIsaJwAxnBvDtWGJCAbKMuz7TcLgi/RPsS/VinCko01g9uu5b9ZCPIIF+29IwKET
	TBv0i25jVudQAXjg5NYdmK+Q7Wy3QKfHRSk94BqLbzJ5OICwiMxRlSfB9faSy2bJ9MpeT2VmqrKMz
	Fag8k+8mAre7r7HMxjANKUqF1Fub8ESqDWhW/NOKcy2tBKJSwEGjTGgK8tGrSIBpgms2PtKVJhzw6
	9joWJ+DXbdtEw2wZm8gw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0Y1F-0000xx-LB; Wed, 21 Aug 2019 21:19:49 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0Y16-0000p6-Tk
 for linux-amlogic@lists.infradead.org; Wed, 21 Aug 2019 21:19:42 +0000
Received: by mail-wm1-x344.google.com with SMTP id c5so3375204wmb.5
 for <linux-amlogic@lists.infradead.org>; Wed, 21 Aug 2019 14:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=dbzkg0dehYA9XxXBy/tRWEwtyB89ujck03vcqauhtxk=;
 b=M41c94fBiRx04YN/D9LqPjJsO6altoSy7hmpL7ol/za2grZjkRDhSLO5v0GE4oqFcr
 sB1NADhpZQEX8bu+8z3ngPuXvDNMCnvmraEJ3pjT7pO4D7RFtsLKvpACV3d+wRTcbYS3
 kXiyqcUDbRVLfqAFOu1aQWi9KhSGOs/D7bXZH5FbeWTIBEsiE3Gq6Uasu8AoiGFjkegK
 gGauvlV6DC3y9og3jEJhbnL9tuYDdQ6Cj/qw58OVHgjo81rXZQTbiI8lu/htArVrxzmf
 go8bSDnidovR7Jy0DAm4NoDj/6PEdoI+wObbt2hwoh0VjwVbN95CdgNGGKyfL19/k8sP
 KHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=dbzkg0dehYA9XxXBy/tRWEwtyB89ujck03vcqauhtxk=;
 b=s/vr44hEYAHjQDM0smeoKMJ3VXjpSWYKJOteHqZYO+VYqnCpBaOthxeyp2VLGhRoVb
 Z928G63vhw1/e0pL+Ydo2wjePbGeKqWZ/fXlHIP6LKS3Tq8PeaDgbbX3B2niW34uVuIM
 cU9sYHoPk/HiBp9HRHRn2V0xg8xD92YJ3NFiUEqoFkkftH++IkkWgcOJFVwRL1P1uM/7
 K/+7AhGdtxzGmha69kswE/PQmu9+N+VBfOmyO1RIwXDNh3RPzP9XcmHlNldUNVpS566V
 MYV2h1U9lEpg9AXvW36sIikphNibesxenE6CMxO91DvTOy4mm1EGyyaeqvdW/9U6smgG
 ls6w==
X-Gm-Message-State: APjAAAUZD7j20TeV5utYwHq8Ok0Xxb5KYEm5/kEvVHPXyQeE3pQF+eQB
 whIQrToXgZbDpzkULt9Mr/jqxsBAFsk=
X-Google-Smtp-Source: APXvYqz8RJbRsGB3Mt8HsUVbL8cKiur8eRibcotSAhwTRu5jFrKEfBVKTcGp7K5dPJ2MRLuU5YWVug==
X-Received: by 2002:a7b:c649:: with SMTP id q9mr2156413wmk.108.1566422379282; 
 Wed, 21 Aug 2019 14:19:39 -0700 (PDT)
Received: from ?IPv6:2a01:cb1d:6e7:d500:82a9:347a:43f3:d2ca?
 ([2a01:cb1d:6e7:d500:82a9:347a:43f3:d2ca])
 by smtp.gmail.com with ESMTPSA id c11sm19183554wrs.86.2019.08.21.14.19.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 21 Aug 2019 14:19:38 -0700 (PDT)
Subject: Re: [PATCH v3 0/6] Add support of New Amlogic temperature sensor for
 G12 SoCs
To: Christian Hewitt <christianshewitt@gmail.com>
References: <20190806130506.8753-1-glaroque@baylibre.com>
 <357FACA6-6EAC-4E9D-B6F7-4D8D0D59A20A@gmail.com>
From: guillaume La Roque <glaroque@baylibre.com>
Message-ID: <9a63d585-69b1-c9b2-8092-51361ff41991@baylibre.com>
Date: Wed, 21 Aug 2019 23:19:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <357FACA6-6EAC-4E9D-B6F7-4D8D0D59A20A@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190821_141941_006101_18F1DE7F 
X-CRM114-Status: GOOD (  14.32  )
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org, khilman@baylibre.com,
 daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgQ2hyaXN0aWFuLAoKCnRoYW5rcyBmb3IgdGVzdGluZyBvbiB0aGlzIDMgYm9hcmRzLgoKCmd1
aWxsYXVtZQoKT24gOC8xNC8xOSAyOjI0IFBNLCBDaHJpc3RpYW4gSGV3aXR0IHdyb3RlOgo+IE9u
IDYgQXVnIDIwMTksIGF0IDU6MDUgcG0sIEd1aWxsYXVtZSBMYSBSb3F1ZSA8Z2xhcm9xdWVAYmF5
bGlicmUuY29tPiB3cm90ZToKPj4gVGhpcyBwYXRjaHMgc2VyaWVzIGFkZCBzdXBwb3J0IG9mIE5l
dyBBbWxvZ2ljIHRlbXBlcmF0dXJlIHNlbnNvciBhbmQgbWluaW1hbAo+PiB0aGVybWFsIHpvbmUg
Zm9yIFNFSTUxMCBhbmQgT0RST0lELU4yIGJvYXJkcy4KPj4KPj4gRmlyc3QgaW1wbGVtZW50YXRp
b24gd2FzIGRvaW5nIG9uIElJT1sxXSBidXQgYWZ0ZXIgY29tbWVudHMgaSBtb3ZlIG9uIHRoZXJt
YWwgZnJhbWV3b3JrLgo+PiBGb3JtdWxhcyBhbmQgY2FsaWJyYXRpb24gdmFsdWVzIGNvbWUgZnJv
bSBhbWxvZ2ljLgo+Pgo+PiBDaGFuZ2VzIHNpbmNlIHYyOgo+PiAgLSBmaXggeWFtbCBkb2N1bWVu
dGlvbiAKPj4gIC0gcmVtb3ZlIHVubmVlZGVkIHN0YXR1cyB2YXJpYWJsZSBmb3IgdGVtcGVyYXR1
cmUtc2Vuc29yIG5vZGUKPj4gIC0gcmV3b3JrIGRyaXZlciBhZnRlciBNYXJ0aW4gcmV2aWV3Cj4+
ICAtIGFkZCBzb21lIGluZm9ybWF0aW9uIGluIGNvbW1pdCBtZXNzYWdlCj4+Cj4+IENoYW5nZXMg
c2luY2UgdjE6Cj4+ICAtIGZpeCBlbnVtIHZzIGNvbnN0IGluIGRvY3VtZW50YXRpb24KPj4gIC0g
Zml4IGVycm9yIHdpdGggdGhlcm1hbC1zZW5zb3ItY2VsbHMgdmFsdWUgc2V0IHRvIDEgaW5zdGVh
ZCBvZiAwCj4+ICAtIGFkZCBzb21lIGRlcGVuZGVuY2llcyBuZWVkZWQgdG8gYWRkIGNvb2xpbmct
bWFwcwo+Pgo+PiBEZXBlbmRlbmNpZXMgOgo+PiAtIHBhdGNoIDMsNCAmIDU6IGRlcGVuZHMgb24g
TmVpbCdzIHBhdGNoIGFuZCBzZXJpZXMgOgo+PiAgICAgICAgICAgICAgLSBtaXNzaW5nIGR3YzIg
cGh5LW5hbWVzWzJdCj4+ICAgICAgICAgICAgICAtIHBhdGNoc2V0cyB0byBhZGQgRFZGUyBvbiBH
MTJhWzNdIHdoaWNoIGhhdmUgZGVwcyBvbiBbNF0gYW5kIFs1XQo+Pgo+PiBbMV0gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGludXgtYW1sb2dpYy8yMDE5MDYwNDE0NDcxNC4yMDA5LTEtZ2xhcm9x
dWVAYmF5bGlicmUuY29tLwo+PiBbMl0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYW1s
b2dpYy8yMDE5MDYyNTEyMzY0Ny4yNjExNy0xLW5hcm1zdHJvbmdAYmF5bGlicmUuY29tLwo+PiBb
M10gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYW1sb2dpYy8yMDE5MDcyOTEzMjYyMi43
NTY2LTEtbmFybXN0cm9uZ0BiYXlsaWJyZS5jb20vCj4+IFs0XSBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9saW51eC1hbWxvZ2ljLzIwMTkwNzMxMDg0MDE5Ljg0NTEtNS1uYXJtc3Ryb25nQGJheWxp
YnJlLmNvbS8KPj4gWzVdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFtbG9naWMvMjAx
OTA3MjkxMzI2MjIuNzU2Ni0zLW5hcm1zdHJvbmdAYmF5bGlicmUuY29tLwo+Pgo+PiBHdWlsbGF1
bWUgTGEgUm9xdWUgKDYpOgo+PiAgZHQtYmluZGluZ3M6IHRoZXJtYWw6IEFkZCBEVCBiaW5kaW5n
cyBkb2N1bWVudGF0aW9uIGZvciBBbWxvZ2ljCj4+ICAgIFRoZXJtYWwKPj4gIHRoZXJtYWw6IGFt
bG9naWM6IEFkZCB0aGVybWFsIGRyaXZlciB0byBzdXBwb3J0IEcxMiBTb0NzCj4+ICBhcm02NDog
ZHRzOiBhbWxvZ2ljOiBnMTI6IGFkZCB0ZW1wZXJhdHVyZSBzZW5zb3IKPj4gIGFybTY0OiBkdHM6
IG1lc29uOiBzZWk1MTA6IEFkZCBtaW5pbWFsIHRoZXJtYWwgem9uZQo+PiAgYXJtNjQ6IGR0czog
YW1sb2dpYzogb2Ryb2lkLW4yOiBhZGQgbWluaW1hbCB0aGVybWFsIHpvbmUKPj4gIE1BSU5UQUlO
RVJTOiBhZGQgZW50cnkgZm9yIEFtbG9naWMgVGhlcm1hbCBkcml2ZXIKPiBUZXN0ZWQtYnk6IENo
cmlzdGlhbiBIZXdpdHQgPGNocmlzdGlhbnNoZXdpdHRAZ21haWwuY29tPgo+Cj4gSeKAmXZlIHRl
c3RlZCB0aGlzIHNlcmllcyB3aXRoIE9kcm9pZCBOMiBhbmQgS2hhZGFzIFZJTTMsIFg5Ni1NYXgu
IFBhdGNoZXMgdG8gYWRkCj4gc3VwcG9ydCBmb3IgVklNMy9YOTYtbWF4IHdpbGwgYmUgc3VibWl0
dGVkIG9uY2UgdGhlIGRyaXZlciBpcyBtZXJnZWQuCj4KPiBWSU0zOn4gIyBkbWVzZyB8IGdyZXAg
dGhlcm1hbAo+IFsgICAgMC4wNDYzNzVdIHRoZXJtYWxfc3lzOiBSZWdpc3RlcmVkIHRoZXJtYWwg
Z292ZXJub3IgJ3N0ZXBfd2lzZScKPgo+IFZJTTM6fiAjIGNhdCAvc3lzL2RldmljZXMvdmlydHVh
bC90aGVybWFsL3RoZXJtYWxfem9uZTAvdGVtcAo+IDUxMzAwCj4KPiBWSU0zOn4gIyBjYXQgL3N5
cy9kZXZpY2VzL3ZpcnR1YWwvdGhlcm1hbC90aGVybWFsX3pvbmUxL3RlbXAKPiA1MjgwMAo+Cj4g
Q2hyaXN0aWFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
