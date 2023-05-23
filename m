Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5873BC7EE23
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 May 2023 20:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IlkLG/iF9CG4gH7ILZ9g0kEonx0xXjRajYzxvr1GGqM=; b=qOxd1V6RYAZBxr
	uaK9LLohHPDgFiGUgB9rgdPU9Y6U54oqJvB/HeM/2GaqReYC2LqsQMZk8DLruKNBtwYsAeiv2zYSd
	RWxdqLX7OW0R5EqNcGHePxKRif3jne3BV+ETxBvh4WOk+f2r2qJGVpV63ud9o5Puv80eFe2dVpR52
	MQubGmJNAMITxkYQZbBF45CilR/78xZhkj7CGs/zbQls3VF96pnwKm4FLSQD1E6A1+aZiUVL9CqJ0
	MzI1doCzRynz0NWDLlL1xCFXFFbwPHk6eONFiJrgomcvN6Eu+1kcLs3p1LRWG/FdGMfM0WhIEJUHJ
	2CFo63NXUADD0orao4NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Yyw-00BQB7-0T;
	Tue, 23 May 2023 20:51:46 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Yyr-00BQ9d-0m;
	Tue, 23 May 2023 20:51:42 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-969f90d71d4so7676566b.3;
        Tue, 23 May 2023 13:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1684875095; x=1687467095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yZundmrewKh0bipWQd+lfQPNPSXZ9mgJNRAPtylqIpw=;
        b=Q3pRVYpapK/e7nkypEKxw7JxlSQP3eSbJ445xrlrZJGJ3w9bRAq3t1exfcZ5OR6YPZ
         0ulvHLDuA2zQN3j5NET5X2a6ZsPORlKw2KCvHcNSAlV9OKKlrvBld2EkfgZvb1Mzwge7
         fBx7DQcXayW2SJf3ckI8mZ2Jd7+TIKnR/iCmlKR2aNbQUNpyc0PnYgfirqyAYT6sbtPo
         dCcLbe40SGEsfyEBjvwhZzBISyonGHDy4zSv6cSZ9lpm/dd325Fm1r8JNWgE6kFh0dek
         ZeMCZB0ZCXlbTEsCiNR+DdLdZi7DtXKB0pDaUhHYUGNrZF/m/Dmuain7jaUBRLR024z1
         jimw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684875095; x=1687467095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yZundmrewKh0bipWQd+lfQPNPSXZ9mgJNRAPtylqIpw=;
        b=ifZ+8MondZ96Xn19p3jq7wDvM5z6L9SDs3fgY8PyEraxxmNOKTBEbkJusgLizVQsyw
         X6y/V2WXfs3nj3MBEYP4p/lEv2l5ZUWARb5uemGXIv9UWDuuB9O3BvhqVuZAlYq5htmK
         ARvJzOISSN/tGtyDZbirIXahziRCLvt3V8oITVHCWN3Ao+UDYtjBFkN3hdFra520XnPb
         HK9wnzxNq4Vq5xdyFJV8ZrFWGry01fBiwcC8w1G2Edud8FWA6zyRzBcnPMEC9a6uxcLg
         swkmyl7ju9o3LrvCtMpFr10199X0c22j7DJcp+Xk1WLCV79/Jcl5sJzPFM0rX4oXPHKx
         SmjQ==
X-Gm-Message-State: AC+VfDwXfuryXlPhiZ8eIMpkpQfov1JWgHWZv7bPkvYL9mIBuYiVg5XW
	Euq+DgoZqijoq0E3hsMo769ibqruMObAiZ7L7xQ=
X-Google-Smtp-Source: ACHHUZ7MG7hcNaLhcgRMHzstW10kI2Qf9okU+o4Y5CQ8cOzkKjjiuZsIfJnrE0pqRbZjOE/7UMDBvJEQ4SeZfGeFzVc=
X-Received: by 2002:a17:907:6288:b0:969:b2e2:4f3b with SMTP id
 nd8-20020a170907628800b00969b2e24f3bmr14435843ejc.51.1684875095098; Tue, 23
 May 2023 13:51:35 -0700 (PDT)
MIME-Version: 1.0
References: <1d1a8ede-e789-bc4d-2dcd-9d06d2df4061@gmail.com>
 <CAFBinCCeh1eUo1=pfqmp4F7UsuKZ--cja-16mCqBhV-cgodzqw@mail.gmail.com> <f6b93fcc-ca5a-43ae-729d-38338ba411bc@gmail.com>
In-Reply-To: <f6b93fcc-ca5a-43ae-729d-38338ba411bc@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 23 May 2023 22:51:24 +0200
Message-ID: <CAFBinCDdDcFaekrdC33_cO_TngRhMTgqgpFR2ELjEcavd-8SyA@mail.gmail.com>
Subject: Re: [PATCH] pwm: pwm-meson: fix handling of period/duty if greater
 than UINT_MAX
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, linux-pwm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_135141_282797_EC96B33E 
X-CRM114-Status: GOOD (  15.90  )
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

T24gTW9uLCBNYXkgMTUsIDIwMjMgYXQgMTA6MzLigK9QTSBIZWluZXIgS2FsbHdlaXQgPGhrYWxs
d2VpdDFAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIDA4LjA1LjIwMjMgMjE6NDYsIE1hcnRpbiBC
bHVtZW5zdGluZ2wgd3JvdGU6Cj4gPiBPbiBXZWQsIE1heSAzLCAyMDIzIGF0IDk6NTjigK9QTSBI
ZWluZXIgS2FsbHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPiB3cm90ZToKPiA+Pgo+ID4+IHN0
YXRlLT5wZXJpb2QvZHV0eSBhcmUgb2YgdHlwZSB1NjQsIGFuZCBpZiB0aGVpciB2YWx1ZSBpcyBn
cmVhdGVyIHRoYW4KPiA+PiBVSU5UX01BWCwgdGhlbiB0aGUgY2FzdCB0byB1aW50IHdpbGwgY2F1
c2UgcHJvYmxlbXMuIEZpeCB0aGlzIGJ5Cj4gPj4gY2hhbmdpbmcgdGhlIHR5cGUgb2YgdGhlIHJl
c3BlY3RpdmUgbG9jYWwgdmFyaWFibGVzIHRvIHU2NC4KPiA+Pgo+ID4+IEZpeGVzOiBiNzljMzY3
MGUxMjAgKCJwd206IG1lc29uOiBEb24ndCBkdXBsaWNhdGUgdGhlIHBvbGFyaXR5IGludGVybmFs
bHkiKQo+ID4+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gPj4gU3VnZ2VzdGVkLWJ5OiBV
d2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgo+ID4+IFNp
Z25lZC1vZmYtYnk6IEhlaW5lciBLYWxsd2VpdCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+Cj4gPiBS
ZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29n
bGVtYWlsLmNvbT4KPgo+IE5vdCBzdXJlIGFib3V0IHRoZSBwcm9jZXNzIGluIHB3bSBzdWJzeXN0
ZW06IFdoZW4gd2lsbCB0aGVzZSBwYXRjaGVzIG1ha2UKPiBpdCB0byBsaW51eC1uZXh0PyBCZWNh
dXNlIEknZCBsaWtlIHRvIHN1Ym1pdCBmb2xsb3ctdXBzIHdpdGggYSBkZXBlbmRlbmN5Cj4gb25s
eSBhZnRlciBwZW5kaW5nIHBhdGNoZXMgaGF2ZSBiZWVuIGFwcGxpZWQuCkknbSBhbHNvIG5vdCBz
dXJlLiBQZXJzb25hbGx5IEkgd291bGQgdGFrZSBhbGwgcGF0Y2hlcyB0aGF0IGZpeCB0aGUKZXhp
c3RpbmcgZHJpdmVyIGNvZGUsIGJ1bmRsZSB0aGVtIGludG8gYSBzZXJpZXMgYW5kIHJlLXNlbmQg
dGhhdAooY29sbGVjdGluZyBhbGwgUmV2aWV3ZWQtYnksIGV0Yy4gYWxvbmcgdGhlIHdheSkuIFRo
ZSBpZGVhIGlzIHRvIG1ha2UKVGhpZXJyeSdzIGxpZmUgZWFzaWVyIGFzIGhlIGp1c3QgaGFzIHRv
IGFwcGx5IHRoZSBzZXJpZXMgKG5vIG5lZWQgdG8Kd29ycnkgYWJvdXQgdGhlIHBhdGNoIG9yZGVy
LCAuLi4pLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1s
b2dpYwo=
