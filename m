Return-Path: <SRS0=06Fz=QH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5980BC169C4
	for <linux-amlogic@archiver.kernel.org>; Thu, 31 Jan 2019 16:48:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28C532086C
	for <linux-amlogic@archiver.kernel.org>; Thu, 31 Jan 2019 16:48:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uMTr8OYW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="yjuOVFpu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28C532086C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0rZhOZiW20oCk55rc89HBF6XiOva1zQdAWciArIhwi8=; b=uMTr8OYW6x7a8j
	HYt8ZhyjNU9SKauVF9KyjSzeDzyDtr52pGMV6Z1JPtXahG+TAecrkjZUXIuhyYCfHJiO2BiL8Sdvv
	AbAc7c8dUZmlXZrHQ6a0JRuPMggRbpZy22D4JSK7jAAwG0gL4AKflq+BPygHKKGGfyC7r49JDdW2u
	sj/8qEtBT6bCuvmItrwmL1kaKymKU5vyjhK+7eInh61jDAIf0To5D/Q4WoEw6g7ZBf6js8YjwTBzT
	a76l3Xd6lIN/aDyLvX4mocZWymwmZKKSfUXA0+j+b8bgUjkrTmDjjZmY+WgpIgqSWbQzwb2/lfX2V
	I7c3vdeB1enS1nQOmFfg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gpFVi-0005hQ-Lk; Thu, 31 Jan 2019 16:48:18 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpFVf-0005gQ-Nz
 for linux-amlogic@lists.infradead.org; Thu, 31 Jan 2019 16:48:17 +0000
Received: by mail-wm1-x344.google.com with SMTP id f188so3275066wmf.5
 for <linux-amlogic@lists.infradead.org>; Thu, 31 Jan 2019 08:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version:content-transfer-encoding;
 bh=St8zuU//Y2lTz8gY3eS0j/qeO26x6PaiuwoJ8bnTe7s=;
 b=yjuOVFpuad+EqiI4rLPRACfvPCLiOyTUa+o4Q6LE5VQMCrsPf4cAY9TUJ2VTYia8wY
 dLStEZ5O7Dsc6KKvdf9sTbRZTIn/+EqL9f/HHn3+2MN41eu57ZIdUMWEqDBtzfz9a5P+
 5BXanAUVXv7zsLhvir983UzLETrCaAKUHbf42MDE+301thn/oWVmavRoQ+bkLJOftSHD
 jS057pT/zF6VHmWtlVqXu5BHUe2jV0pbz8MeNZeoEQSlHqO/ng6XmqX73NK/qOB3RdlM
 2kvr5EBY7yUdtZF02gLAhnDcFb6FjobUtd3cmC8lF4IJ9r0drVV9aEnl95Siw8bp5zdl
 ZL/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=St8zuU//Y2lTz8gY3eS0j/qeO26x6PaiuwoJ8bnTe7s=;
 b=nY5k7H9NlzKfk6IVvwy/LWlRC42uoZYbUrHEO/PzUrXHuHwnNTQW/QpUjEvEZOu5D/
 nanmitoP+GoMsitGJNvbhZs39Oatj9sutIrTbT64aVIN+YIIUgm+DccIw7zXvSDH+qb7
 JI4xLZjDGdWd3BFmNxskVYThoEasSUiwMCSJB1/HR8LG2imyqUv3XG28kZXn6Kah+eS1
 8S5GFvALnFbdgEepyV5pGyb/P4xFJyrZfVqJeoz4MtGsHLP/Su3BJSIhgE5ARBupCVjS
 zW6VvEYk2fPF0dZ2OE3+JsL/oA51UHX5I6R82WrfQc+5t26sZa1JTZCocxsm46Ki6QOy
 GmDg==
X-Gm-Message-State: AJcUukdGboQalHf18hn3oWfhCj3cz4xOpht0pUBYHJ+4DdYVF3X/JzFP
 MIlceqcyqPPvnBGTTDUUsyNyFg==
X-Google-Smtp-Source: ALg8bN4Q4OebNS0Sso2hbFOC2m2ao1xWqTMbEabDKefeslcpRy6Hrgx1DlawdcYfdnQfLU4eP9rbdg==
X-Received: by 2002:a1c:8484:: with SMTP id
 g126mr31634075wmd.117.1548953293352; 
 Thu, 31 Jan 2019 08:48:13 -0800 (PST)
Received: from localhost (aputeaux-684-1-8-223.w90-86.abo.wanadoo.fr.
 [90.86.125.223])
 by smtp.googlemail.com with ESMTPSA id g67sm12654800wmd.38.2019.01.31.08.48.12
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 31 Jan 2019 08:48:12 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Chris Moore <moore@free.fr>, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: amlogic: add amediatech x96-max
 bindings
In-Reply-To: <dc14926f-4433-fa7b-311f-cb275a7e7aee@free.fr>
References: <20181219233519.35287-1-khilman@baylibre.com>
 <dc14926f-4433-fa7b-311f-cb275a7e7aee@free.fr>
Date: Thu, 31 Jan 2019 17:48:11 +0100
Message-ID: <7h8sz0hiyc.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190131_084815_776844_88F913F9 
X-CRM114-Status: GOOD (  10.04  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Q2hyaXMgTW9vcmUgPG1vb3JlQGZyZWUuZnI+IHdyaXRlczoKCj4gSGksCj4KPiBTb3JyeSBmb3Ig
dGhlIHJlcGVhdCA6IEkgcmVwbGllZCBwcmV2aW91c2x5IHRvIHYxIGFzIEkgaGFkbid0IG5vdGlj
ZWQgCj4gdGhhdCB0aGVyZSB3YXMgYWxyZWFkeSBhIHYyLgo+Cj4gTGUgMjAvMTIvMjAxOCDDoCAw
MDozNSwgS2V2aW4gSGlsbWFuIGEgw6ljcml0wqA6Cj4+IEFkZCBuZXcgdmVuZG9yIGZvciBhbWVk
aWF0ZWNoLCBhbmQgaW5pdGlhbCBib2FyZDogeDk2LW1heAo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBL
ZXZpbiBIaWxtYW4gPGtoaWxtYW5AYmF5bGlicmUuY29tPgo+PiAtLS0KPj4gICBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9naWMudHh0ICAgICB8IDEgKwo+PiAgIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMudHh0IHwgMSAr
Cj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYW1sb2dpYy50eHQgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9naWMudHh0Cj4+IGluZGV4IDhk
YmMyNTkwODFlNC4uYzUwYjA4NGI2YzU5IDEwMDY0NAo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9naWMudHh0Cj4+ICsrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYW1sb2dpYy50eHQKPj4gQEAgLTk5LDYgKzk5LDcgQEAg
Qm9hcmQgY29tcGF0aWJsZSB2YWx1ZXMgKGFscGhhYmV0aWNhbGx5LCBncm91cGVkIGJ5IFNvQyk6
Cj4+ICAgICAtICJhbWxvZ2ljLHAyODEiIChNZXNvbiBneGwgczkwNXcpCj4+ICAgICAtICJvcmFu
dGgsdHgzLW1pbmkiIChNZXNvbiBneGwgczkwNXcpCj4+ICAgCj4+ICsgIC0gImFtZWRpYXRlY2gs
eDk2LW1heCIgKE1lc29uIGd4bSBzOTEyKQo+Cj4gU2hvdWxkbid0IHRoYXQgYmUgTWVzb24gZzEy
YSBzOTA1eDIgPwoKWWVzIGluZGVlZC4KCktldmluCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
