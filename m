Return-Path: <SRS0=+19+=RT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96255C43381
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Mar 2019 22:07:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F04B218AC
	for <linux-amlogic@archiver.kernel.org>; Sat, 16 Mar 2019 22:07:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LfTzrSgw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="jmrYFc2t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F04B218AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DsudfznqetVgC5uOA3YbtnVPYIJR2Pz2wQM805zZ7cs=; b=LfTzrSgwlZlyEP
	qEaApuMj/MsjJ2n8/y1X2zDLXve1C23ERWTYhp62Rjsb9AOqz1/yLUMMkdd4H/yXAv8Fi3XfTwA2Y
	2qy6vK72VH29t86pXtWVHRqy6236Aho3+KueT0k1sf+vof48mRWD4l3wxjdmmEHX3tx2FewoRs6hd
	1FCyXspx5bh6OoAITMlo6HD3Co8hfcYKQhdvDq5ZWg38kDF5YtoGkYB8k+UEJAj5tUuRZbeTpiqaK
	x6Mpydi0GQcJsZZ5UJkrIHBioNohWCvBXQSEtl5sKXtPP10o8y4RxIzev6mkkHtyTxOtGIAEz/+mk
	qrhoiTnss67xalnGzZpw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5HSY-00020O-0h; Sat, 16 Mar 2019 22:07:18 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5HSU-000201-R8; Sat, 16 Mar 2019 22:07:16 +0000
Received: by mail-oi1-x241.google.com with SMTP id i21so6785218oib.11;
 Sat, 16 Mar 2019 15:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tXsxzgOzwviiw4AI4/JgeuPKkrzL6ZPUgu2mPVy+R+0=;
 b=jmrYFc2twfhtugmBZiBKqT2lnFEZhHB6hAxGf9HZBAtXvOE/0dcuspf2Xovr6LEda5
 a76kDDUts2lrmXdGKNqd9QibMUx+ctmGlGkS8QWYyfPq5IuORLoT839vHT08tvt1Xld+
 LdmF9udyXSJX1PNAc/h9ePp3ULfbSNqjnMl5gX391Lwhtug7nNXmfb3awucXS5g7HITQ
 USH34NmV3KA/d0oJJjAwQv8Qo0wiYan/PmQf/KADOD+kww8vHN+JaeLXtTl+ZcCAx8ZZ
 CUjdw6FT2XHgwztRgRYyGuxm1Bsq/lEsvrS9pg4gPR+IrPe3z+FNaqkU9oqAuz2UO9C+
 JaWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tXsxzgOzwviiw4AI4/JgeuPKkrzL6ZPUgu2mPVy+R+0=;
 b=e1qD+0J9MGofyUcLNf6+qMGErl9Iuit3FirXLECpL8Xgxe5n2qKv5DROGcmsZ+A3M1
 5y1QNz+4bbQzUbbA/2vtIEKzAZGMG1fvitI6059kvUNS6rCUfMEjXcpRGhqGw/rIia1/
 9BIEBpLwozgvLlVGNXg6QrDNo0O+u0sMvTgZ5szj23XjgvLvSECVl8odPu8EroRRrfdQ
 bamreSepmObjF5BiCTmufNh9u53qzG2rt1rpm3K4cZ5pQ6SBP/ZoZ+0RZE0YIC3u/Le/
 Bfvy9DZn1PU8fsrDW59a50L/JOdb/CkeT4FswgCQL4PJczqT+vjrZYolgEKr4Dv9aRTj
 NhJw==
X-Gm-Message-State: APjAAAXOfafawCeEgP0x90UCBXV4Akghye91e/5beXr+30qDCY+DdBmS
 RSCovOzigxHGwCzGJrTPPUVUjg7hsLBEZp7D8GE=
X-Google-Smtp-Source: APXvYqz2qdKtizHFrUWgbw9SI74hQFePNHOcYi7eqSq+Mb1r10fY1LjN2DiRVxT7kSLzXrz9oJuFfnuXEiGsB4EQAtM=
X-Received: by 2002:aca:4205:: with SMTP id p5mr5798922oia.15.1552774032538;
 Sat, 16 Mar 2019 15:07:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190311095613.11371-1-narmstrong@baylibre.com>
 <20190311095613.11371-12-narmstrong@baylibre.com>
 <CAFBinCDU_6JEJJS8yZkq0rjbqKcy2eBKFaYqgX3txGMiO5U9Fg@mail.gmail.com>
 <5C8D0C2B.2010605@baylibre.com>
In-Reply-To: <5C8D0C2B.2010605@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 16 Mar 2019 23:07:01 +0100
Message-ID: <CAFBinCDyTPLr+fNptpHa664pMqvp4X3Tv6166h_C+b0gHBJ-ZA@mail.gmail.com>
Subject: Re: [PATCH 11/11] arm64: dts: meson-g12a-x96-max: Enable USB
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190316_150714_906652_0194517E 
X-CRM114-Status: GOOD (  14.58  )
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgTmVpbCwKCk9uIFNhdCwgTWFyIDE2LCAyMDE5IGF0IDM6NDYgUE0gTmVpbCBBcm1zdHJvbmcg
PG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPiB3cm90ZToKPgo+Cj4KPiBMZSAxNS8wMy8yMDE5IDIy
OjUwLCBNYXJ0aW4gQmx1bWVuc3RpbmdsIGEgw6ljcml0IDoKPiA+IEhpIE5laWwsCj4gPgo+ID4g
T24gTW9uLCBNYXIgMTEsIDIwMTkgYXQgMTA6NTggQU0gTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJv
bmdAYmF5bGlicmUuY29tPiB3cm90ZToKPiA+IFsuLi5dCj4gPj4gKyZkd2MyIHsKPiA+PiArICAg
ICAgIHN0YXR1cyA9ICJva2F5IjsKPiA+PiArfTsKPiA+IHlvdXIgcGF0Y2ggZGVzY3JpcHRpb24g
c3RhdGVzIHRoYXQgdGhpcyBlbmFibGVzIHRoZSAiVVNCIGhvc3QgcG9ydHMiCj4gPiBidXQgZHdj
MiBpcyBvbmx5IHVzZWQgZm9yIHBlcmlwaGVyYWwgbW9kZSAobWVhbmluZzogZHJfbW9kZSA9Cj4g
PiAicGVyaXBoZXJhbCIgb3IgZHJfbW9kZSA9ICJvdGciKS4KPiA+IGRvIHdlIHN0aWxsIG5lZWQg
dG8gZW5hYmxlIGR3YzIgaW4gYSBob3N0LW9ubHkgY29uZmlndXJhdGlvbj8KPgo+IERXQzIgaXMg
cGVyaXBoZXJhbC1vbmx5LCBidXQgd2UgY2FuIHN0aWxsIG1hbnVhbGx5IHN3aXRjaCBvbmUgb2Yg
dGhlCj4gcG9ydHMgYW5kIHVzZSBpdCBhcyBwZXJpcGhlcmFsIHdpdGggYSBUeXBlLUEgdG8gVHlw
ZS1BIGNhYmxlLCB0aHVzCj4gZW5hYmxpbmcgZHdjMi4KdGhhbmsgeW91IGZvciB0aGUgZXhwbGFu
YXRpb24hCgo+IElmIHRoZSBPVEcgY2FwYWJsZSBQSFlzIHdhcyBiZWhpbmQgYW4gVVNCIEh1YiBv
ciBkaXJlY3RseSBjb25uZWN0ZWQgdG8KPiBhIGRldmljZSwgd2UgY291bGQgZGlzYWJsZSBkd2My
LCBidXQgZm9yIG5vdyB0aGlzIHBvcnQgaXMgYWx3YXlzIHRpZWQKPiB0byBhIHBoeXNpY2FsIFR5
cGUtQSBvciBtaWNyby1VU0IgY29ubmVjdG9yLgo+Cj4gTWF5YmUgaXQgd291bGQgYmUgc2FuZSB0
byBhbHdheXMgZW5hYmxlIGR3YzIsIGFuZCBkaXNhYmxlIGl0IGZvciBzcGVjaWZpYwo+IGJvYXJk
cyBvbmx5LgpJbiBjYXNlIHRoZSBwb3J0IGlzIGNvbm5lY3RlZCB0byBhbiBVU0IgaHViIHdlIGNh
biBhZGQgYSBjb21tZW50IHRvCnRoZSAuZHRzIHRvIGV4cGxhaW4gd2h5IGR3YzIgaXMgYmVpbmcg
ZGlzYWJsZWQuIHRoYXQgd2F5IHdlIGRvbid0IG5lZWQKYSBjb21tZW50IGluIGVhY2ggYm9hcmQu
ZHRzIHRoYXQgaXQncyBlbmFibGVkIHRvIHN1cHBvcnQgZm9yY2VkIG1vZGUKc3dpdGNoaW5nLgpp
biBvdGhlciB3b3JkczogSSBsaWtlIHRoaXMgaWRlYSEKCgpSZWdhcmRzCk1hcnRpbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
