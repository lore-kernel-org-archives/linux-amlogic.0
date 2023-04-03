Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D02C6C76196
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Apr 2023 20:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aCnVuy74vo4hXFAsyeYKkI20xUxiB5McJ8553/09O+s=; b=ZIzmlPIms/pAJB
	3Iu3hOJqG9RNWYxW844VkBmEZp5FuGuVE3JIyZAxE+EzWr37LGqefPD2I3E7D5r3Pgkkp3aybL1XF
	3pW0fbchHQcaf1g6oM47DM0zSEJhKkA2Qh0ga913NE3x81XLi4ea3eoF84GGWtJt8NsI4L1Jo+XDC
	zxSi+AS7q6lT9xii2Dr+81gCspxeD6Cek8SeA+GSlFMqb2iEQADstpbEoATOFFX08EuKHUaJCkSNi
	JeO5FCFD5kBBzVmv/ea/hccWS3S68qco3D49hPMP01ctnAVX2yK+PJWWxNH1V8p6iFHQyW+Qpt0AH
	aBtMNCe0H3SvmOrm1vuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjQyg-00Ggwi-1E;
	Mon, 03 Apr 2023 20:40:34 +0000
Received: from mail-ed1-f50.google.com ([209.85.208.50])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjQyd-00GgtZ-30;
	Mon, 03 Apr 2023 20:40:33 +0000
Received: by mail-ed1-f50.google.com with SMTP id er13so81350180edb.9;
        Mon, 03 Apr 2023 13:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1680554429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlKcaKh18h+QBmr9urMB1rRvxToOGdnmDwwJL+gmwVk=;
        b=IsXIM1GsDA9wnYRjhr485gupyXU0DyOlKFkT+qT8S7KijVz7vbLI9Ow6STXhwDHY5k
         QtTg+uw6CmOdcL2Dj2e8AxdMM/gpdWZbHpnruzTzX+XkwwWHZtxLPM6Y0dL2WbCjOrh8
         80vX+xm4WeRF/t2cBhUUkoEJpQZzwSwagHGCElS0/fBZc76G4XhFq6fm2o/e1RXmD67a
         s3j30YoLCDxM+/jXlWu2AcbJ3H4TnIpnVA4zbMh37/vW9hx81x02qyYiN+tnbpZ82B9j
         Wv1wLcnuv+p/kAiAMc40Xbec46U9RBBs8NuGtFk6Y8OgrJSthP9gIK6YpGWYVeMWjHzB
         W3Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680554429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZlKcaKh18h+QBmr9urMB1rRvxToOGdnmDwwJL+gmwVk=;
        b=pCfM162hIXhabCRcGVluyQpVOvQJJjcZgrggink5CS/sUDRe9WYMKDgFXdWKnZNlVE
         O0ZolCwB94oQtM75zKrGH0QmpEKh9+Nclbd6JEPWuIq1WoDIlAmL6cKRIIKbqv14IUX+
         5LhPtA6sb9+LbckPUrdB6JMVHslPQ3wfnsyQh5Wh7UrAY33AdQCbDZYVWSH0Zhc+B4Nv
         LDtsE1LreEX+laTAYBPi5H6XxDGMK3FrsYw7q8xPcsQP1UnCnTmpHbbBDVqONwO5C/+Z
         LPKuvoyxZitS2lHlHRWSauNyb/GW6QZ9NnYVZjGtfA2iQPTJcRq50xnBM+6oUjE0BeGT
         VGmQ==
X-Gm-Message-State: AAQBX9fAkrSV5QtTyj02qzjZCpK7dyOvK8S2QRelQUr+q5hXVfmrksD9
	WeMopgBZsHdczkqzBGinyQSKGbQskzv6Slm085EwtjDeahc=
X-Google-Smtp-Source: AKy350Z+IfNXRLwqJq0hdKDfoeCZcaaS62XaGg2SrsfxMV/1nFOZuoUyblX7Or0x/driV8kJIMoxyivJFVTzi7CRSUU=
X-Received: by 2002:a17:906:6a03:b0:930:90ce:a1a6 with SMTP id
 qw3-20020a1709066a0300b0093090cea1a6mr18597940ejc.6.1680554428972; Mon, 03
 Apr 2023 13:40:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de> <20230326143224.572654-109-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230326143224.572654-109-u.kleine-koenig@pengutronix.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 3 Apr 2023 22:40:18 +0200
Message-ID: <CAFBinCACdhrRiDUYycVM5m6B0dDUw=fyFdTo_QFQfqcVTpt-Uw@mail.gmail.com>
Subject: Re: [PATCH 106/117] media: meson-ir-tx: Convert to platform remove
 callback returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	kernel@pengutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_134031_969272_453FDFE8 
X-CRM114-Status: GOOD (  11.63  )
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

T24gU3VuLCBNYXIgMjYsIDIwMjMgYXQgNDozMuKAr1BNIFV3ZSBLbGVpbmUtS8O2bmlnCjx1Lmts
ZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+Cj4gVGhlIC5yZW1vdmUoKSBjYWxs
YmFjayBmb3IgYSBwbGF0Zm9ybSBkcml2ZXIgcmV0dXJucyBhbiBpbnQgd2hpY2ggbWFrZXMKPiBt
YW55IGRyaXZlciBhdXRob3JzIHdyb25nbHkgYXNzdW1lIGl0J3MgcG9zc2libGUgdG8gZG8gZXJy
b3IgaGFuZGxpbmcgYnkKPiByZXR1cm5pbmcgYW4gZXJyb3IgY29kZS4gSG93ZXZlciB0aGUgdmFs
dWUgcmV0dXJuZWQgaXMgKG1vc3RseSkgaWdub3JlZAo+IGFuZCB0aGlzIHR5cGljYWxseSByZXN1
bHRzIGluIHJlc291cmNlIGxlYWtzLiBUbyBpbXByb3ZlIGhlcmUgdGhlcmUgaXMgYQo+IHF1ZXN0
IHRvIG1ha2UgdGhlIHJlbW92ZSBjYWxsYmFjayByZXR1cm4gdm9pZC4gSW4gdGhlIGZpcnN0IHN0
ZXAgb2YgdGhpcwo+IHF1ZXN0IGFsbCBkcml2ZXJzIGFyZSBjb252ZXJ0ZWQgdG8gLnJlbW92ZV9u
ZXcoKSB3aGljaCBhbHJlYWR5IHJldHVybnMKPiB2b2lkLgo+Cj4gVHJpdmlhbGx5IGNvbnZlcnQg
dGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJlbW92ZQo+IGNh
bGxiYWNrIHRvIHRoZSB2b2lkIHJldHVybmluZyB2YXJpYW50Lgo+Cj4gU2lnbmVkLW9mZi1ieTog
VXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KUmV2aWV3
ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFp
bC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==
