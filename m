Return-Path: <SRS0=z4cL=K6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URI_HEX,URI_NOVOWEL
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3279C4743D
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Jun 2021 16:46:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83182611CA
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Jun 2021 16:46:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83182611CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+eOvOGH5jhSxl7uPWZSoLqPWU/HGdoWQepg3mZI/Y3U=; b=qWBIUSUmKN0N4Y
	RdtPrRdVrJa2FoFtoWlCNeZz4qJifE4nXHEgD1+5WmSTiUljyvfNOrbhr2ivf4yi5zcmgtABlMw0a
	Rj/DlPbjP3VO7G2cUWdMGsqpWfz6w9VmoHlNKSLnJUq/250m5yoESAifESJJoCSZLU+oEhD1ylObW
	8Vkn+l2Vv0fJ6m7BzT6IWQ4Uhdgn6mdDY3FzR/TAZlBlBDpYt1LXHDOwUObEPG4YsXEfBz6iwPsMa
	/fScWZU5juO1XOQfprgECAqB/wQaURsaP0gok0mtZsUWJk3WnMOaeAas5Ia9drpt8u8ef03GxKmk6
	74ds2Bdp0O36gp6VFF2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpCxX-00EPo5-U5; Fri, 04 Jun 2021 16:46:11 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpCxS-00EPjL-9m
 for linux-amlogic@lists.infradead.org; Fri, 04 Jun 2021 16:46:10 +0000
Received: by mail-qt1-x82c.google.com with SMTP id t20so7453278qtx.8
 for <linux-amlogic@lists.infradead.org>; Fri, 04 Jun 2021 09:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=QmdH7mKnFkOZAH2JI/GCXFdUAnEZ4TREjy0wt14hYvE=;
 b=C9WM3GBnDyo1IuG8vugzF7OJuv0/qSLc2h5rlH2vs9hPAsnhLP/AiXMndOeLbpR2IM
 Ohtn8XR2SA70sT+Glx2x+oDv2XvXp4XsXKCzRp3r/+xQ35mo133BJzGzSP18qJtL2g6h
 Aj3waqvEMKM8rNoNBayZGxz6o91LWXuicSMxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=QmdH7mKnFkOZAH2JI/GCXFdUAnEZ4TREjy0wt14hYvE=;
 b=RxSAkaoKdMWCXytrjtJfTopGNy7f1dvmZ4RAtb/RIYt3C938OV7jGbh9/10vzb5ccb
 NiCSLDHcwdqnD7fRYySZQq8NeEVUDFtIbK4R47BHXCesqkHtJjwDZ0wrfYRgM1oChGQ3
 oSUf4AFlLuuNDXEsujchy8Qjd9dONrP9M3j96lJZf3bh4UfTVv0PIpBbsRhkrtWUSS+R
 DB/aAlIjT9cM0crsrzvEhp5sqhj5Ak+7xk91rgd/2jDN9fqh/X76wTPwmDsuq2eUbxkF
 2+FTdqsrrVkloFug0RQDFof58OE0ICc6KkXJ3PGkhkdvBB9YejzLyaNHbOXtg/MnzWJV
 hQaA==
X-Gm-Message-State: AOAM533/Ly5djM5CSQE6a7E80zSifKlFgvnNud1e/eX1rxmsABxHThZE
 dg91mdfgX4MfIagP9cvvenpYYw==
X-Google-Smtp-Source: ABdhPJznrW8naIl7grTb0byn0Ki8g1mPccqfo2n3/Mzyg7GeZgz4J4vGwn8uDK7aL0u3V5bKWZOOgQ==
X-Received: by 2002:ac8:544:: with SMTP id c4mr5373272qth.299.1622825163185;
 Fri, 04 Jun 2021 09:46:03 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
 by smtp.gmail.com with ESMTPSA id d1sm3969137qti.72.2021.06.04.09.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:46:02 -0700 (PDT)
Date: Fri, 4 Jun 2021 12:46:01 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>, balbi@kernel.org,
 linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3-meson-g12a: fix usb2 PHY glue init when phy0
 is disabled
Message-ID: <20210604164601.hrlgkrsghhqtho6m@nitro.local>
References: <20210601084830.260196-1-narmstrong@baylibre.com>
 <YLoHSJIOSRTyF0r1@kroah.com>
 <20210604150742.bssvnhm4gv72uw4h@nitro.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210604150742.bssvnhm4gv72uw4h@nitro.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_094606_379654_C3865164 
X-CRM114-Status: GOOD (  10.30  )
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

T24gRnJpLCBKdW4gMDQsIDIwMjEgYXQgMTE6MDc6NDJBTSAtMDQwMCwgS29uc3RhbnRpbiBSeWFi
aXRzZXYgd3JvdGU6Cj4gPiBPZGQgdGhhdCBES0lNIGRpZG4ndCB3b3JrIGZvciBiYXlsaWJyZS1j
b20sIGJ1dCBoZXksIEknbGwgdGFrZSBhIHJlYWwKPiA+IHNpZ25hdHVyZSBvdmVyIERLSU0gYW55
ZGF5IQo+IAo+IFRoYXQgbG9va3VwIGhhcHBlbmVkIHRvIGdyYWIgdGhlIHRocmVhZCBmcm9tIGxp
bnV4LWFtbG9naWMsIHdoaWNoIGlzCj4gbWFpbG1hbjItbWFuYWdlZCBhbmQgaXMga25vd24gdG8g
YnJlYWsgREtJTS4gSSdsbCB0cnkgdG8gZml4IG91ciBjb25maWd1cmF0aW9uCj4gc28gdGhhdCBr
bm93bi1ES0lNLWZyaWVuZGx5IHNvdXJjZXMgYXJlIGdpdmVuIHByaW9yaXR5LiBUaGlzIHdheSwg
d2hlbiBhIHRocmVhZAo+IGV4aXN0cyBvbiBtdWx0aXBsZSBsaXN0cywgeW91J2xsIGdldCB0aGUg
b25lIG1vcmUgbGlrZWx5IHRvIHBhc3MgREtJTSBjaGVja3MuCgpUaGlzIGlzIG5vdyBpbiBwbGFj
ZSAtLSBsb3JlIHdpbGwgbm93IHByZWZlciByZXN1bHRzIGZyb20gREtJTS1mcmllbmRseQpzb3Vy
Y2VzLiBFLmcuIGdyYWJiaW5nIHRoZSBzYW1lIG1lc3NhZ2UtaWQgd2lsbCBub3cgcmV0dXJuIHRo
ZSB0aHJlYWQgZnJvbQpsaW51eC11c2IgKHZpYSB2Z2VyKSBpbnN0ZWFkIG9mIGxpbnV4LWFtbG9n
aWMgKHZpYSBpbmZyYWRlYWQpLgoKICAgICQgYjQgYW0gLW8vdG1wIDIwMjEwNjAxMDg0ODMwLjI2
MDE5Ni0xLW5hcm1zdHJvbmdAYmF5bGlicmUuY29tCiAgICBMb29raW5nIHVwIGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL3IvMjAyMTA2MDEwODQ4MzAuMjYwMTk2LTEtbmFybXN0cm9uZyU0MGJheWxp
YnJlLmNvbQogICAgR3JhYmJpbmcgdGhyZWFkIGZyb20gbG9yZS5rZXJuZWwub3JnL2xpbnV4LXVz
Yi8yMDIxMDYwMTA4NDgzMC4yNjAxOTYtMS1uYXJtc3Ryb25nJTQwYmF5bGlicmUuY29tL3QubWJv
eC5negogICAgQW5hbHl6aW5nIDQgbWVzc2FnZXMgaW4gdGhlIHRocmVhZAogICAgQ2hlY2tpbmcg
YXR0ZXN0YXRpb24gb24gYWxsIG1lc3NhZ2VzLCBtYXkgdGFrZSBhIG1vbWVudC4uLgogICAgLS0t
CiAgICAgIOKckyBbUEFUQ0hdIHVzYjogZHdjMy1tZXNvbi1nMTJhOiBmaXggdXNiMiBQSFkgZ2x1
ZSBpbml0IHdoZW4gcGh5MCBpcyBkaXNhYmxlZAogICAgICAgICsgUmV2aWV3ZWQtYnk6IE1hcnRp
biBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+ICjinJMg
REtJTS9nb29nbGVtYWlsLmNvbSkKICAgICAgLS0tCiAgICAgIOKckyBTaWduZWQ6IG9wZW5wZ3Av
bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20KICAgICAg4pyTIFNpZ25lZDogREtJTS9iYXlsaWJyZS1j
b20uMjAxNTA2MjMuZ2FwcHNzbXRwLmNvbSAoRnJvbTogbmFybXN0cm9uZ0BiYXlsaWJyZS5jb20p
CiAgICAtLS0KICAgIFRvdGFsIHBhdGNoZXM6IDEKICAgIC0tLQogICAgIExpbms6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL3IvMjAyMTA2MDEwODQ4MzAuMjYwMTk2LTEtbmFybXN0cm9uZ0BiYXls
aWJyZS5jb20KICAgICBCYXNlOiBub3QgZm91bmQKICAgICAgICAgICBnaXQgYW0gL3RtcC8yMDIx
MDYwMV9uYXJtc3Ryb25nX3VzYl9kd2MzX21lc29uX2cxMmFfZml4X3VzYjJfcGh5X2dsdWVfaW5p
dF93aGVuX3BoeTBfaXNfZGlzYWJsZWQubWJ4CgotSwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
