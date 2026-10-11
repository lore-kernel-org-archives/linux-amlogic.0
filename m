Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E54A4CA9EBD
	for <linux-amlogic@archiver.kernel.org>; Sun, 11 Oct 2026 14:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2JHkqLVmnctbTYpWw8qk3cM5aYX3LNEOTkrDlmLsX2I=; b=ijJKbohikbM+UL
	mpR3ot+NpO0Fo6S5XWi/5SDZ3aM/E+q4ZEaaRrpQAfpnu/zlSHVVRf8VncAS41izfHtDbR4t5VJfO
	tXaHQk6XISBZzks9lfv0HaTx+/CkLAX5ac2J9uY0ZsRCjc9W3keK3z2Sy7iT02YT2k+ce5yHVposQ
	tteqxG77ctoi6sBRHAUpxOzLkSKnVeuoWnuRFp6FucJO3/niKQJfOPUVROFmDz+V8V0N4Chkyf8mb
	W9YtwriRrVCtqHRW0+p4OBzypoOCn6LIwmxCgGNxTLcjebQpLKHUffOOJof1MlEzBd5pWYHEvnGoB
	1yhcLY5l+4yxf1lcVJ8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFuQw-00000009743-2zaN;
	Sun, 11 Oct 2026 14:21:50 +0000
Received: from mail-yw1-f182.google.com ([209.85.128.182])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFuQs-0000000972u-33Al
	for linux-amlogic@lists.infradead.org;
	Sun, 11 Oct 2026 14:21:49 +0000
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8565d77c277so5473127b3.0
        for <linux-amlogic@lists.infradead.org>; Sun, 11 Oct 2026 07:21:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791728505; x=1792333305;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KzyYwwdi+Gw4Br7ibuX1uhAgZ649p+E+2HalXmhinyI=;
        b=Z5qt0qPW7iJrxDNSE9k7GoS6NKfB0rm8Ro5weve8z7g/d772pDAD6cm1akSKtL/81j
         nAXrcPSI13+ITCs60xIadiKZrQHIG4DM7dNjJP8kniuNfd4n+tpCHc+vVV/CkroEkUIL
         Fyq+Y+F+U85Gr2HGuW2ZoyvlfhL+BLbYOGTydc88GMBFcM2RQTY2uDYdpwx5yrzwZV51
         TyLK/fMlvRp7rTKUTnlqsbC5RUo2oq6Jpx0ogLihD0IutqovQ6ahZqHr0vrTE10gBotG
         J5PW1UqMpCJ2Jgpv1+kHLUJMkCyC2HImQXbPF31VriSQhnzpQf5QNtrX+iOpSvRuMOFC
         paBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrC4dBYtWB1crSTHbewy47Bi9JDt98rUGePX1SnqybVAWwRrMAo7ShOiI2CAbZjIA7gc9B7RBxln5c8VEK@lists.infradead.org
X-Gm-Message-State: AFq9FYLQYZvVc1YTBQxzjG0W1oZmD9M4Op8m4e0FDKccwZgCxBKuTBwg
	u3cd0NtnUmkecOCnQpojbycY76mchwO/9ZDkir481Re/+M92ysf0mqWFKF4PU3eHOeQ=
X-Gm-Gg: AYBFou2QOikfTAo9sUYIpL3Hhq8hcwlGAV0Cp9zb8HkjmD/iHeKE70u7BHVuKTeg77m
	j+usR8oJZjFqf4a3nslzogjHAuQauppPMvxU2UrCPnkifT+hv+XNb5z6rHJ/AhGjvFDyjPBloOe
	glnn58Oh1VJGk2hxdlOjJR1O8IJSzJyHlJI3ln3A6RJil/iT1X+a3FVME+RlBBPHu3adOudCyfx
	LkHJHna3+rtOXElTi6K7ryvxmR0TrmnxdMTZOQ0minstYxsJ8JrKqzIhzhn3qLwtSEl1Np0+XdJ
	KNgXd/W2CcM0OxhiERLPHrMppeiZfzflc0+nwYCymxuQuzHRZ97KdsYlvO5qb7HdW06L0w5+7Q7
	ArmdNB37HAGGoNwzbaoIDf4nZqul8xMKP/dxXwdSGxFVLpcSHkVrs4N2CZ/G6RqxwekooIaPWo+
	hvvx7gfsIpMZ7EzNKXWtmPsaLduUXQaADkE+O3UuPajhzlGvvHQGZBI9qoQxhTwlnf41hqLSMAL
	uoxuxp1QP3tK/oe1AcHLWrMcjQ7JG1Nn4cugvO7IwuYiIohm0DnzNNteEkZvHI8kSE=
X-Received: by 2002:a05:690c:e3ea:b0:8b0:702f:320c with SMTP id 00721157ae682-8b07ed9081bmr23399267b3.12.1791728505490;
        Sun, 11 Oct 2026 07:21:45 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07ed0b54asm25634967b3.0.2026.10.11.07.21.44
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 07:21:44 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b05bf699easo6358187b3.2
        for <linux-amlogic@lists.infradead.org>; Sun, 11 Oct 2026 07:21:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy+t0O0dXS0i20ts8lpEpMNZj1XMRxqZg+nBz6YZpR5P3KRXUM+SUigFSJUgpT55NVw/CPAJ38jW4OeX5Ad@lists.infradead.org
X-Received: by 2002:a05:690c:309:b0:8b0:9e1c:3148 with SMTP id
 00721157ae682-8b09e1c33cfmr4413327b3.34.1791728503965; Sun, 11 Oct 2026
 07:21:43 -0700 (PDT)
MIME-Version: 1.0
References: <20261010105900.247342-1-tanure@linux.com> <20261010105900.247342-3-tanure@linux.com>
 <CAFBinCA7rPu0obv+2aadxqkzMYKmd1+DLJgRe6y418v0QrwSSg@mail.gmail.com>
In-Reply-To: <CAFBinCA7rPu0obv+2aadxqkzMYKmd1+DLJgRe6y418v0QrwSSg@mail.gmail.com>
From: Lucas Tanure <tanure@linux.com>
Date: Sun, 11 Oct 2026 15:21:32 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+2tBUh=xP9kzPBB0CauXFJukipnLf6D0jLMapvZOst_UQ@mail.gmail.com>
X-Gm-Features: AclHuK90wt6EVCYdNEmq2Fhuw7FDmVki8iPk3nLcnG5vHPlk0pxu17yKPiCVT8U
Message-ID: <CAJX_Q+2tBUh=xP9kzPBB0CauXFJukipnLf6D0jLMapvZOst_UQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_072148_152900_A741A236 
X-CRM114-Status: GOOD (  12.88  )
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
Reply-To: tanure@linux.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gU2F0LCBPY3QgMTAsIDIwMjYgYXQgMTE6MTTigK9QTSBNYXJ0aW4gQmx1bWVuc3RpbmdsCjxt
YXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPiB3cm90ZToKPgo+IEhpIEx1Y2FzLAo+
Cj4gT24gU2F0LCBPY3QgMTAsIDIwMjYgYXQgMTI6NTnigK9QTSBMdWNhcyBUYW51cmUgPHRhbnVy
ZUBsaW51eC5jb20+IHdyb3RlOgo+IFsuLi5dCj4gPiArICAgICAgICAjIFRoZSBUWCBkZWxheSBp
cyBhIHF1YXJ0ZXIgb2YgdGhlIFJHTUlJIGNsb2NrIHBlcmlvZCBwZXIgc3RlcCwKPiA+ICsgICAg
ICAgICMgd2hpY2ggaXMgMm5zIGF0IDFHYml0L3MuCj4gPiArICAgICAgICB0eC1pbnRlcm5hbC1k
ZWxheS1wczoKPiA+ICsgICAgICAgICAgZW51bTogWzAsIDIwMDAsIDQwMDAsIDYwMDBdCj4gPiAr
ICAgICAgICAgIGRlZmF1bHQ6IDAKPiBJcyAwIGEgdmFsaWQgdmFsdWU/IExldCdzIHNheSB3ZSBo
YXZlOgo+ICAgICBwaHktbW9kZSA9ICJyZ21paS1pZCI7Cj4gICAgIHR4LWludGVybmFsLWRlbGF5
LXBzID0gPDA+Cj4gICAgIHJ4LWludGVybmFsLWRlbGF5LXBzID0gPDA+Owo+IEFjY29yZGluZyB0
byBwYXRjaCA4IHRoaXMgbWVhbnM6IE1BQyBpcyByZXNwb25zaWJsZSBmb3IgYWRkaW5nIHRoZQo+
IGRlbGF5cyAtIGJ1dCBpdCBkb2Vzbid0IGFkZCBhbnkgZGVsYXlzLgo+IEknbSBub3Qgc3VyZSBp
ZiB0aGlzIHBhdGNoIChyZW1vdmluZyAwIGZyb20gdGhlIGVudW0pIG9yIHBhdGNoIDggbmVlZCB1
cGRhdGluZy4KWWVzLCB5b3UgYXJlIHJpZ2h0LiBJIHdpbGwgcmVtb3ZlIDAgYXMgYSB2YWxpZCB2
YWx1ZSBpbiB2NC4KClRoYW5rcwpMdWNhcwo+Cj4KPiBCZXN0IHJlZ2FyZHMsCj4gTWFydGluCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
