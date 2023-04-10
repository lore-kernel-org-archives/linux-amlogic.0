Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F78DC77B61
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Apr 2023 22:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M9w1XK0oRQKi3Gh7PccIDeiz62q+HoA8Px6A1VUJU9c=; b=3nCvCp+bZNOi5h
	I2cnqdI1+EhMUeQz8kpxXLgLFs/tqMxckU3/jQ3Spw4dZQADeIf+2a4yiN9xqTXU2z6E/I7bBLqQS
	NnqCnDUHLf1SqxR2W4L7Mzh3jSRqc9/kBomWc5WbFCppuqh/T4usXbhCPsG6pSMSGO9ziqug2dmio
	XzN5e3gaZbEpwXphdSVkXN2Xq1K6+yeu1TgMYsGeFKZxvQIFty8tnkljx97uuz66Qvw4q3P2PPGoK
	X/aitnRzNd7vYWLynTx/F+u8dPQpCn/17hUV6AkvYxJyynEjxmRh9YMv+pOpwNlRJYgFtbY58afdg
	0CdU0gxeLAIJ3qlK4eBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plznQ-00G0L9-0n;
	Mon, 10 Apr 2023 22:15:32 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1plznM-00G0Kf-0H;
	Mon, 10 Apr 2023 22:15:29 +0000
Received: by mail-ej1-x62a.google.com with SMTP id dm2so15821511ejc.8;
        Mon, 10 Apr 2023 15:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1681164925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9hfj7/mw500k5uSlkcGcb+oM3JnnDYjZ70qofUQEdXQ=;
        b=hIhZ9xj5hQb2Xh/2rQL9QRO56kRJGEia2ysvhYsVwsunfOBUTYwCP9kGDxsszzNRLO
         Ub+dY3tHKpfO6guJJr9g7DwPOYls4dzJLYrwsUZHI/zSAI0dW6sm7E8ZCt9GrvVMM0DP
         AaM6rM/WXYpBY/brImhdu0Jd84MfScnvNWm9c5HdB7rqCITwAVXyxfbbM2e0p7tCrn0p
         ct2PgpzbkdUzL6teRP6ZkMld26vjtTiXUqLmRc2nQjZ7GFHrVlPzifSeTBQS4qR1q4TF
         3V34hgeVWiBI376KZXogsyIoZg3wk7HR7+DYqmgLUUmlxzbjfKpZV1BcBaFA8r2OPjvX
         Fo3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681164925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9hfj7/mw500k5uSlkcGcb+oM3JnnDYjZ70qofUQEdXQ=;
        b=g8vfrE3RTFf4uEHJZTbEg5Ap2HztfXInDYgzWCC01Ji+B1vCINT3cUlUzZqj7Cd7I9
         v+u1YzXvlJSoh0djqdsrkX+HmIsWVKynywfysX9DWpVe4ue8jx8Ht0so2GoEVdd0taSh
         DBqMr8FJeV8mAzWDbrFGPw4Ogoii6B3lX0P5wzxGnN6pQLtpf/sUMYJIXguuJyRrfEnf
         re+C1BmpufmO26705qbq2cAgzpKfB+OAmVpVMTGTt8jNGU5kNyh+Rwm7qz2cRi4OTv88
         pc0kB0QIEFxU4tIo2FeDmSFTPXdn73k/uUDAPBwVE1uCEimY+mi9xwcf0U+tCrIDJVr8
         PW6w==
X-Gm-Message-State: AAQBX9dJ1CF8Z1nhwT9rKbpgp5FJL8zt6b6OWL789KF883KPUwdzr6xH
	KQ91499f7+WMk3hJPD3V2POK3lAtaPcOfCnOn8U=
X-Google-Smtp-Source: AKy350a5qqn/pJ4fLRWDXQqKSK2V40WfFfi/EV0aULAfXD+oNJpf7SkkA6LhPVJwCunzAJkaegEJihN+2tn1+mlz5p4=
X-Received: by 2002:a17:906:2a48:b0:920:da8c:f7b0 with SMTP id
 k8-20020a1709062a4800b00920da8cf7b0mr4364666eje.6.1681164925575; Mon, 10 Apr
 2023 15:15:25 -0700 (PDT)
MIME-Version: 1.0
References: <275c72a8-b9cb-e675-f1c0-4da658c3f98e@gmail.com>
In-Reply-To: <275c72a8-b9cb-e675-f1c0-4da658c3f98e@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 11 Apr 2023 00:15:14 +0200
Message-ID: <CAFBinCBw3KdTTAx+nm6sphOgU-vx2qFswofnwU8ZgxckE+hH2g@mail.gmail.com>
Subject: Re: [PATCH 0/2] pwm: meson: make full use of common clock framework
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, linux-pwm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_151528_159611_8FB63D5F 
X-CRM114-Status: GOOD (  10.80  )
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

SGkgSGVpbmVyLAoKT24gU2F0LCBBcHIgOCwgMjAyMyBhdCAxMDo0MOKAr1BNIEhlaW5lciBLYWxs
d2VpdCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+IHdyb3RlOgpbLi4uXQo+IEkgZG9uJ3QgaGF2ZSBo
dyB3aXRoIHRoZSBvbGQgUFdNIGJsb2NrLCB0aGVyZWZvcmUgSSBjb3VsZG4ndCB0ZXN0IHRoaXMK
PiBwYXRjaC4gV2l0aCB0aGUgbm90IHlldCBpbmNsdWRlZCBleHRlbnNpb24gZm9yIHRoZSBuZXcg
UFdNIGJsb2NrCj4gKGNoYW5uZWwtPmNsb2NrIGRpcmVjdGx5IGNvbWluZyBmcm9tIGdldF9jbGso
ZXh0ZXJuYWxfY2xrKSkgSSBkaWRuJ3QKPiBub3RpY2UgYW55IHByb2JsZW0uIE15IHN5c3RlbSB1
c2VzIFBXTSBmb3IgdGhlIENQVSB2b2x0YWdlIHJlZ3VsYXRvcgo+IGFuZCBmb3IgdGhlIFNESU8g
MzJrSHogY2xvY2suCkkgZG8gaGF2ZSBzb21lIGlzc3VlcyB3aXRoIG15IE9kcm9pZC1DMSBib2Fy
ZCAoaXQgZG9lc24ndCBkZXRlY3QgdGhlCmVNTUMgYW55bW9yZSwgd2hpbGUgdS1ib290IGRvZXMp
LgpUaGlzIHVuZm9ydHVuYXRlbHkgbWVhbnMgdGhhdCBJIGN1cnJlbnRseSBjYW5ub3QgdGVzdCAz
Mi1iaXQgU29DCnN1cHBvcnQgYXQgdGhlIG1vbWVudCBhcyBJIGFtIHJ1bm5pbmcgb3V0IG9mIHRp
bWUgZm9yIHRvZGF5LgpJJ2xsIGJpc2VjdCB0aGlzIGlzc3VlIGluIHRoZSBuZXh0IGZldyBkYXlz
IGFuZCB0aGVuIGNvbnRpbnVlIHdpdGgKdGVzdGluZy4gU28gc29ycnkgdGhhdCB0aGlzIGlzIHRh
a2luZyBsb25nZXIgdGhhbiBleHBlY3RlZC4KCgpCZXN0IHJlZ2FyZHMsCk1hcnRpbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
