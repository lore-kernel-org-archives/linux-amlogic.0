Return-Path: <SRS0=/xor=DD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02068C2D0A8
	for <linux-amlogic@archiver.kernel.org>; Sat, 26 Sep 2020 12:28:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66909238E6
	for <linux-amlogic@archiver.kernel.org>; Sat, 26 Sep 2020 12:28:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ItNpAaG+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WUrlYIh3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66909238E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:References:Message-Id:Date:In-Reply-To:From:
	Subject:Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y7dMlhHG6lYCe3gIn6LyAVae/XKsPhrqzWEA9WMdfok=; b=ItNpAaG+1qxtfnYcAFcWp6qD6
	2Bv3UXi9MKDPj7MzUouxFvHQbH1dw7a/P8Sb+54Z3NkfXl2eKCzUGrh++pBdLxs0reWCce7lTsS2d
	qh3sLDL2t4fvwuN6c/Z6tpNLUOmSKDmGJMEVpg+6Ea8t18IUjV1/Eq0J/ckPSMxsmpIwOjOEO92mu
	ReuBtsHKijTIDo35hzoh2v17xa7SIytLlFdJGwRHHtQ48yzF+lHQcT8Qa8AgtqAX6sw0gHsHyXx0y
	xE3bjM4sbiwf1VX42z7dp+z/GFYQTKfmUNtaDyry2STQUnix1fY++nUn01Un6ufzINNTwWyDuMtmd
	2d/e30u/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kM9JL-0006S6-B1; Sat, 26 Sep 2020 12:28:19 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kM9JJ-0006Rm-Hm
 for linux-amlogic@lists.infradead.org; Sat, 26 Sep 2020 12:28:18 +0000
Received: by mail-wr1-x441.google.com with SMTP id c18so6786168wrm.9
 for <linux-amlogic@lists.infradead.org>; Sat, 26 Sep 2020 05:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=ukPC7rmXAjITkh9QvzaxHnIgCpBroSSJwAuRpnTjvZg=;
 b=WUrlYIh3JOLuEoy7v8KquU6Q1ZT803y9AKF6VPpxKLeAu5HEDINHpG8qlHEaCcTs8T
 890tjsbXr41PERshgKXEDk4eGgv+XL5IwBiOgp/UVWufxwNqVZLhibrDmS0Udd7QCQTF
 Y+H1DmcPC4Yl0VPy6Ay8FkswHozo2sRpVhELkgBxk9Z3IkAXJNX2vju5ASWCu3KPLvXS
 QhWqUyxGMRDgz7x8QKA3C78JB/gbciwgfM2S2KFs3cwt0cN6zfkmYjQdw9Gb1ggst3Gy
 ZiuH3LkAkoNiiQFAOaHrmLLeAeVdCTOzUcwNMXMEtdVGk7QN1B6/CP2HSy+fhSwvxRFf
 ZEOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=ukPC7rmXAjITkh9QvzaxHnIgCpBroSSJwAuRpnTjvZg=;
 b=Rkd38vpfkAHu/T/NzzmewgMn/lNkY+bZFUNRRpr7NZd3Ykmog8My7k3n8MQVwIlOFS
 iUqGuC+X99ansVRM1LdphQMW6qsq84bQFxLJHphyqi0uEHvWduH4BRzc3t2pR3ubz8uP
 0ugSz4F7c1BbRna/Jp/9tM0ez2hSvR66cFyJX80MiAr/6D1dtMMCaEox2pgFygTgOSZq
 y99QEZs/XtVMrsqQx1dDd9HIaAVjqThu0a9fYkg3yUZY/5jY237qB+3fvjx9tVHe7dba
 AgrJw4gBMNvoDYK1ms6rOyJD6pr7/VrWRA1CYrFJbklgbUm5iK/Sv8A3zih8ABUnItcF
 5rxg==
X-Gm-Message-State: AOAM530Wvr3foynThUPYFEcVNPHzcYtGsWB6gU27vGoxqpf0CL6D0iO9
 MZHHbufGie1vWIel6Z5gpaDD+1vuoJ8=
X-Google-Smtp-Source: ABdhPJxb18/TB7iewoxegAd2aldWgy/HfRi2qoBw4JHBsn8Ss7p91Nblu+L5GnrG0np6nvk6AbnehQ==
X-Received: by 2002:adf:ef0a:: with SMTP id e10mr9221106wro.362.1601123296596; 
 Sat, 26 Sep 2020 05:28:16 -0700 (PDT)
Received: from [172.16.20.20] ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id y68sm2521686wmd.39.2020.09.26.05.28.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 26 Sep 2020 05:28:16 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.15\))
Subject: Re: Deadlock under load with Linux 5.9 and other recent kernels
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <c431ae48-6913-acc0-dc0a-b52065e9eaed@kernel.dk>
Date: Sat, 26 Sep 2020 16:28:13 +0400
Message-Id: <91886A80-8164-4699-8662-E7D3444A4F12@gmail.com>
References: <5878AC01-8A1B-4F39-B4BD-BDDEFAECFAA2@gmail.com>
 <4a51f6d8-486b-73ee-0585-f2154aa90a83@kernel.dk>
 <EE8C801E-0AD8-43E2-9C65-92CD512904BE@gmail.com>
 <c431ae48-6913-acc0-dc0a-b52065e9eaed@kernel.dk>
To: Jens Axboe <axboe@kernel.dk>
X-Mailer: Apple Mail (2.3445.104.15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200926_082817_619645_D329DF09 
X-CRM114-Status: GOOD (  15.49  )
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
Cc: linux-block@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-usb@vger.kernel.org, furkan@fkardame.com,
 Brad Harper <bjharper@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Cj4gT24gMjYgU2VwIDIwMjAsIGF0IDQ6MTMgcG0sIEplbnMgQXhib2UgPGF4Ym9lQGtlcm5lbC5k
az4gd3JvdGU6Cj4gCj4gT24gOS8yNi8yMCA1OjU1IEFNLCBDaHJpc3RpYW4gSGV3aXR0IHdyb3Rl
Ogo+Pj4gCj4+PiBPbiAyNiBTZXAgMjAyMCwgYXQgMjo1MSBwbSwgSmVucyBBeGJvZSA8YXhib2VA
a2VybmVsLmRrPiB3cm90ZToKPj4+IAo+Pj4gT24gOS8yNi8yMCAxOjU1IEFNLCBDaHJpc3RpYW4g
SGV3aXR0IHdyb3RlOgo+Pj4+IEkgYW0gdXNpbmcgYW4gQVJNIFNCQyBkZXZpY2Ugd2l0aCBBbWxv
Z2ljIFM5MjJYIGNoaXAgKEJlZWxpbmsKPj4+PiBHUy1LaW5nLVgsIGFuIEFuZHJvaWQgU1RCKSB0
byBib290IHRoZSBLb2RpIG1lZGlhY2VudHJlIGRpc3Rybwo+Pj4+IExpYnJlRUxFQyAod2hpY2gg
SSB3b3JrIG9uKSBhbHRob3VnaCB0aGUgaXNzdWUgaXMgYWxzbyByZXByb2R1Y2libGUKPj4+PiB3
aXRoIE1hbmphcm8gYW5kIEFybWJpYW4gb24gdGhlIHNhbWUgaGFyZHdhcmUsIGFuZCB3aXRoIHRo
ZSBHVC1LaW5nCj4+Pj4gYW5kIEdULUtpbmcgUHJvIGRldmljZXMgZnJvbSB0aGUgc2FtZSB2ZW5k
b3IgLSBhbGwgdGhyZWUgZGV2aWNlcyBhcmUKPj4+PiB1c2luZyBhIGNvbW1vbiBkdHNpOgo+Pj4+
IAo+Pj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9jaGV3aXR0L2xpbnV4L2Jsb2IvYW1sb2dpYy01Ljkt
aW50ZWcvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMmItZ3NraW5nLXguZHRz
Cj4+Pj4gaHR0cHM6Ly9naXRodWIuY29tL2NoZXdpdHQvbGludXgvYmxvYi9hbWxvZ2ljLTUuOS1p
bnRlZy9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZzEyYi1ndGtpbmctcHJvLmR0
cwo+Pj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9jaGV3aXR0L2xpbnV4L2Jsb2IvYW1sb2dpYy01Ljkt
aW50ZWcvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMmItZ3RraW5nLmR0cwo+
Pj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9jaGV3aXR0L2xpbnV4L2Jsb2IvYW1sb2dpYy01LjktaW50
ZWcvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWcxMmItdzQwMC5kdHNpCj4+Pj4g
Cj4+Pj4gSSBoYXZlIHNjaGVtYXRpY3MgZm9yIHRoZSBkZXZpY2VzLCBidXQgY2FuIG9ubHkgc2hh
cmUgdGhvc2UgcHJpdmF0ZWx5Cj4+Pj4gb24gcmVxdWVzdC4KPj4+PiAKPj4+PiBGb3IgdGVzdGlu
ZyBJIGFtIGJvb3RpbmcgTGlicmVFTEVDIGZyb20gU0QgY2FyZC4gVGhlIGJveCBoYXMgYSA0VEIK
Pj4+PiBTQVRBIGRyaXZlIGludGVybmFsbHkgY29ubmVjdGVkIHdpdGggYSBVU0IgPiBTQVRBIGJy
aWRnZSwgc2VlIGRtZXNnOgo+Pj4+IGh0dHA6Ly9peC5pby8yeUxoIGFuZCBJIGNvbm5lY3QgYSBV
U0Igc3RpY2sgd2l0aCBhIDRHQiBJU08gZmlsZSB0aGF0IEkKPj4+PiBjb3B5IHRvIHRoZSBpbnRl
cm5hbCBTQVRBIGRyaXZlLiBXaXRoaW4gMTAtMjAgc2Vjb25kcyBvZiBzdGFydGluZyB0aGUKPj4+
PiBjb3B5IHRoZSBib3ggZGVhZGxvY2tzIG5lZWRpbmcgYSBoYXJkIHBvd2VyIGN5Y2xlIHRvIHJl
Y292ZXIuIFRoZQo+Pj4+IHRpbWluZyBvZiB0aGUgZGVhZGxvY2sgaXMgdmFyaWFibGUgYnV0IHRo
ZSBkZXZpY2UgX2Fsd2F5c18gZGVhZGxvY2tzLgo+Pj4+IEFsdGhvdWdoIEkgYW0gdXNpbmcgYSBz
aW1wbGUgY29weSB1c2UtY2FzZSwgdGhlcmUgYXJlIHNpbWlsYXIgcmVwb3J0cwo+Pj4+IGluIEFy
bWJpYW4gZm9ydW1zIHBlcmZvcm1pbmcgdGFza3MgbGlrZSBpbnN0YWxscy91cGRhdGVzIHRoYXQg
aW52b2x2ZQo+Pj4+IEkvTyBsb2Fkcy4KPj4+PiAKPj4+PiBGb2xsb3dpbmcgYWR2aWNlIGluIHRo
ZSAjbGludXgtYW1sb2dpYyBJUkMgY2hhbm5lbCBJIGFkZGVkCj4+Pj4gQ09ORklHX1NPRlRMT0NL
VVBfREVURUNUT1IgYW5kIENPTkZJR19ERVRFQ1RfSFVOR19UQVNLIGFuZCB3YXMgYWJsZSB0bwo+
Pj4+IGdldCBvdXRwdXQgb24gdGhlIEhETUkgc2NyZWVuIChpdCBpcyBub3QgcG9zc2libGUgdG8g
Y29ubmVjdCB0byBVQVJUCj4+Pj4gcGlucyB3aXRob3V0IGRlc3Ryb3lpbmcgdGhlIGJveCBjYXNl
KS4gSWYgeW91IGFkdmFuY2UgdGhlIGZvbGxvd2luZwo+Pj4+IHZpZGVvIGZyYW1lIGJ5IGZyYW1l
IGluIFZMQyB5b3UgY2FuIHNlZSB0aGUgb3V0cHV0Ogo+Pj4+IAo+Pj4+IGh0dHBzOi8vd3d3LmRy
b3Bib3guY29tL3Mva2x2Y2l6aW04Y3M1bHplL2xvY2t1cF9jbGlwLm1vdj9kbD0wCj4+PiAKPj4+
IFRyeSB3aXRoIHRoaXMgcGF0Y2g6Cj4+PiAKPj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xp
bnV4LWJsb2NrLzIwMjAwOTI1MTkxOTAyLjU0Mzk1My0xLXNoYWtlZWxiQGdvb2dsZS5jb20vCj4+
IAo+PiBJdCBzdGlsbCBsb2NrcyB1cCBhcHByb3guIDI1IHNlY29uZHMgaW50byB0aGUgY29weSBv
cGVyYXRpb24uIEhlcmXigJlzIHRoZSBvdXRwdXQgaW4gdmlkZW8gYWdhaW4gKGEgbGl0dGxlIGJs
dXJyeSk6Cj4+IAo+PiBodHRwczovL3d3dy5kcm9wYm94LmNvbS9zLzNqMmN6YXE1MDlhcmc2Zy9s
b2NrdXBfY2xpcDIubW92P2RsPTAKPiAKPiBDYW4geW91IHRyeSBhbmQgc2V0IENPTkZJR19TTFVC
IGluIHlvdXIgLmNvbmZpZyBpbnN0ZWFkIG9mIENPTkZJR19TTEFCPwoKQ09ORklHX1NMVUIgaXMg
YWxyZWFkeSBzZXQsIGhlcmXigJlzIHRoZSBmdWxsIGRlZmNvbmZpZyBodHRwOi8vcGFzdGUudWJ1
bnR1LmNvbS9wLzVCTmRadjZKM2MvCgojIGRtZXNnIHwgZ3JlcCAtaSBzbHViClsgICAgMC4wMDAw
MDBdIFNMVUI6IEhXYWxpZ249NjQsIE9yZGVyPTAtMywgTWluT2JqZWN0cz0wLCBDUFVzPTYsIE5v
ZGVzPTEKCj4gQWxzbywganVzdCB0YWtlIGEgcGljdHVyZSwgc2hvdWxkIGJlIGVhc2llciB0byBn
ZXQgcmVhZGFibGUgdGhhbiBhIHZpZGVvLgo+IEFuZCB0aGUgc3RhdGljIHRyYWNlIGlzIGFsbCB0
aGF0IGlzIG5lZWRlZC4KClRoaXMgaXMgZnJvbSBhIEdULUtpbmcgUHJvIHdoaWNoIHNvbWVvbmUg
cmVtaW5kZWQgbWUgaGFzIGEgbGFyZ2UgUlMyMzIgcG9ydCBvbiB0aGUgcmVhcjoKCmh0dHBzOi8v
cGFzdGViaW4uY29tL3Jhdy9zR3R6Z3JlTgoKQ2hyaXN0aWFuCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
