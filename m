Return-Path: <SRS0=0Q1W=UM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B77E6C31E45
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jun 2019 09:17:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68BF62133D
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jun 2019 09:17:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RYjN3YrO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="zoB+I1qM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68BF62133D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EKDBhteLYZmIKik339+qGW1dIqwK06GJ9kOwh1BXYKc=; b=RYjN3YrO+Jd3bt
	ryntanDB54jXN7nuw95e7lPza3rM1O34IesHGCEG1uczl88e0WKxluNg4A4ktSpWJmY4WDGSEWjGX
	1UlEJo6JVZTW+A981idYJi4Xb3TtQDcO45glDxwHBxV00Ol+ePA/Ug46bnuJY89jADYIBZzvraUvN
	6TL+8VlgPKLbrTUWRl8gk2d83ZjHZIfCeQ9/PR3TuI+Q+X73u+wBoZn0XMJPQItpBse7GiPqmtPFX
	g3Lr1hpG1MUY/R1fj3jF7BOlljB8jvdwLq6tb5jP2gSdUtvGzdQlqEJ9YIIB5ql5cZdKRe+76umQD
	nk1KL8hBX4J6kPtnQhzg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hbLqy-0006OF-LQ; Thu, 13 Jun 2019 09:17:04 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbLqf-0006L0-7c
 for linux-amlogic@lists.infradead.org; Thu, 13 Jun 2019 09:17:02 +0000
Received: by mail-wm1-x343.google.com with SMTP id x15so9357839wmj.3
 for <linux-amlogic@lists.infradead.org>; Thu, 13 Jun 2019 02:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=P4N1UtPKJVcelijw7QBQ1XLSRt7ridPaKRyOBmFmp0w=;
 b=zoB+I1qMrXW5msQjRKnTgAM/Hh9auE47o+cxvqiEVcyurJ9wsx1RAYtZBDnCaKqDof
 m1Ka4fuQ842iFh57kWp7h+yZO+dKcLrZpYRtQolBfQ39M/3DG3mCMDtqhEsHLr6dNRla
 y/Uc11TrqvR08utOekpguuKCeTIWNQmbKCYf+sSd2FAqk+FEFwpdJVTvb+qSjd7GAa/s
 kBpbAdqYwmGMqkkI3YhCUFXD8oa+rDgIdLyeq5ym0FbmIKsEItDizEy0cX6vyncJePWp
 BZ7zlU7oGjUbfvuB7MiLU354VdrVer90caAiU3wh9nfbR3emhxaBGhOhkrpW/MC3+Qus
 KRYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=P4N1UtPKJVcelijw7QBQ1XLSRt7ridPaKRyOBmFmp0w=;
 b=PqeXB4mTDUFvVvsO3iX/CaXDYNTz6X87MjUUQhe/pViaSTC6OEhcBKL878Or2HWvR8
 hMgvtevnpcIQzAMiTb3xzFwKYjYrOf6dqsLVB80JnkvGj3WJkF9i+doTYuMrwFtiiR8n
 ov1LAIyNa5TgOlO9HnLG7qSTQUpXA0nR8G68cJ6V53nghB4nh6vpW+m9t8s4VWxc6KOJ
 UdWNJNdBBxQcNlfukjH5WdtSSKA0Br3Uz7+DhQIbhcZMio3Uz6Z/D2SPuQNpRehvYOi8
 gIwgb64FxQt265orMwj41pwIpId3P3t3x4B/qx37t2LPTDEH/2quvoILhTLdqXsJ678m
 5ViA==
X-Gm-Message-State: APjAAAWZyC6itVfv3XUpdThCTRAwYq/8EeQU6OOlZcSkQWuAlF/RGY4K
 INGkQiXDSK7qSZOw7gdyuuQvhshfODWApukNSHEu2u4HTiE=
X-Google-Smtp-Source: APXvYqya9k5qn89YYNprL6zry6x5KHz6UoRI9nvUtHBgDzPVPTHE/ALR4XfG2GiQ1hwNRfaH+VxDHQlRLeGVdjjdK7k=
X-Received: by 2002:a1c:700b:: with SMTP id l11mr2827093wmc.106.1560417403085; 
 Thu, 13 Jun 2019 02:16:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190612170027.13dbb84b@canb.auug.org.au>
 <c526a510-a08f-8b99-a396-4274590e904f@infradead.org>
In-Reply-To: <c526a510-a08f-8b99-a396-4274590e904f@infradead.org>
From: Maxime Jourdan <mjourdan@baylibre.com>
Date: Thu, 13 Jun 2019 11:16:31 +0200
Message-ID: <CAMO6nazLss_4cfAJZZLA+Ydrx0wPCxMYrZM2NQKDw1AmvSj_0Q@mail.gmail.com>
Subject: Re: linux-next: Tree for Jun 12 (staging/media/meson/)
To: Randy Dunlap <rdunlap@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190613_021645_748758_19D86148 
X-CRM114-Status: UNSURE (   8.41  )
X-CRM114-Notice: Please train this message.
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-amlogic@lists.infradead.org,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgUmFuZHksCk9uIFdlZCwgSnVuIDEyLCAyMDE5IGF0IDExOjUwIFBNIFJhbmR5IER1bmxhcCA8
cmR1bmxhcEBpbmZyYWRlYWQub3JnPiB3cm90ZToKPgo+IE9uIDYvMTIvMTkgMTI6MDAgQU0sIFN0
ZXBoZW4gUm90aHdlbGwgd3JvdGU6Cj4gPiBIaSBhbGwsCj4gPgo+ID4gQ2hhbmdlcyBzaW5jZSAy
MDE5MDYxMToKPiA+Cj4KPgo+IG9uIGkzODY6Cj4KPiAuLi9kcml2ZXJzL3N0YWdpbmcvbWVkaWEv
bWVzb24vdmRlYy92ZGVjLmM6IEluIGZ1bmN0aW9uIOKAmHZkZWNfcmVjeWNsZV90aHJlYWTigJk6
Cj4gLi4vZHJpdmVycy9zdGFnaW5nL21lZGlhL21lc29uL3ZkZWMvdmRlYy5jOjU5OjI6IGVycm9y
OiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhrdGhyZWFkX3Nob3VsZF9zdG9w
4oCZIFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQo+ICAgd2hpbGUgKCFr
dGhyZWFkX3Nob3VsZF9zdG9wKCkpIHsKPiAgIF4KPiAuLi9kcml2ZXJzL3N0YWdpbmcvbWVkaWEv
bWVzb24vdmRlYy92ZGVjLmM6IEluIGZ1bmN0aW9uIOKAmHZkZWNfc3RhcnRfc3RyZWFtaW5n4oCZ
Ogo+IC4uL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9tZXNvbi92ZGVjL3ZkZWMuYzozMjQ6MzogZXJy
b3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmGt0aHJlYWRfcnVu4oCZIFst
V2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQo+ICAgIHNlc3MtPnJlY3ljbGVf
dGhyZWFkID0ga3RocmVhZF9ydW4odmRlY19yZWN5Y2xlX3RocmVhZCwgc2VzcywKPiAgICBeCj4g
Li4vZHJpdmVycy9zdGFnaW5nL21lZGlhL21lc29uL3ZkZWMvdmRlYy5jOjMyNDoyNDogd2Fybmlu
ZzogYXNzaWdubWVudCBtYWtlcyBwb2ludGVyIGZyb20gaW50ZWdlciB3aXRob3V0IGEgY2FzdCBb
ZW5hYmxlZCBieSBkZWZhdWx0XQo+ICAgIHNlc3MtPnJlY3ljbGVfdGhyZWFkID0ga3RocmVhZF9y
dW4odmRlY19yZWN5Y2xlX3RocmVhZCwgc2VzcywKPiAgICAgICAgICAgICAgICAgICAgICAgICBe
Cj4gLi4vZHJpdmVycy9zdGFnaW5nL21lZGlhL21lc29uL3ZkZWMvdmRlYy5jOiBJbiBmdW5jdGlv
biDigJh2ZGVjX3N0b3Bfc3RyZWFtaW5n4oCZOgo+IC4uL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS9t
ZXNvbi92ZGVjL3ZkZWMuYzozODk6NDogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1
bmN0aW9uIOKAmGt0aHJlYWRfc3RvcOKAmSBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNs
YXJhdGlvbl0KPiAgICAga3RocmVhZF9zdG9wKHNlc3MtPnJlY3ljbGVfdGhyZWFkKTsKPiAgICAg
Xgo+Cj4gRnVsbCByYW5kY29uZmlnIGZpbGUgaXMgYXR0YWNoZWQuCj4KClRoaXMgaXMgZml4ZWQg
d2l0aCAibWVkaWE6IG1lc29uOiB2ZGVjOiBBZGQgbWlzc2luZyBrdGhyZWFkLmgiIGZyb20KWXVl
IEhhaWJpbmcgWzBdLiBUaGUgcGF0Y2ggaXMgc2l0dGluZyBpbiBtZWRpYV90cmVlL21hc3Rlci4K
ClswXSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzEwOTg5MzMzLwoKUmVnYXJk
cywKTWF4aW1lCgo+Cj4gLS0KPiB+UmFuZHkKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
