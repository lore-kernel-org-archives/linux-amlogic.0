Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFF5C001DC
	for <linux-amlogic@archiver.kernel.org>; Sun, 23 Jul 2023 19:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Zhw5AaN3+OHXEztqQkgP1eQuzIe6GVyyKctDKMWY6U=; b=dlJOp930+s/RC2
	Racd5FyqUwDoH9qw1DoUq1LRoDmvMtDr36vdAPjXV3wq6QxgmmWajIkG61VuIOyqxZMzFDBPIhhN0
	mtM1mu7M14Z6sZ51JVG6rbrXAhTm50khLxVSOfbLC3nNBi/fn0hSRLcCBxyUgcN4+1wpwpBU+U1KL
	yqx8Rvj4AMKb9Wcyz11DtBnfsf4QAx4uN7omerjkQbFO4Q/+ltxsAw5ZpqYOUyflC1T5fPn5yW7Zo
	px72pxSnB/ntN4x9sBeqm8SMUqt978f7+8D31Y7gJ9RBFSfJMID4CW4iYzPj4I3ysMAtpsd/NS4Qw
	34VfsuDHuBV81v1EpGvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNegr-001h3W-29;
	Sun, 23 Jul 2023 19:24:25 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNegp-001h1m-19
	for linux-amlogic@lists.infradead.org;
	Sun, 23 Jul 2023 19:24:24 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-cf284f4d7afso4053477276.3
        for <linux-amlogic@lists.infradead.org>; Sun, 23 Jul 2023 12:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690140258; x=1690745058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eAG8curcXxIe67r63NSNDmtyHfYk/6+uaC4W2xqV//M=;
        b=Ev7xVYwHjSWdhn6rRSoGo5howvOJoeNhnE2KY48cG8mA8cA+wbVU0GBX4StOoGAgrA
         vXW88fZAYMKewV6edX0hIek5idMGKqXJUW8TuF+SOUMYwrsCwaRHe17q0EcltNSZ2seR
         glPNFGlED48MoHPkaAiVVLFIXBo6zNozT8dD14JDtIjvn75q6i/HUoXrqz47RFk5+Xlx
         m8AMJv7xIqBBDAiuHEVuielX8WqhBk3R53hwjjCr+LYqumXWS/4Yi8ZALHuDOVt5BAJK
         9BUGda2VF72dZ4Aqz3Qlc0sD2Lf0p1LZRUHbryD4xxFWopmjoV3XJpOeJHKOAtHcUznI
         pGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690140258; x=1690745058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eAG8curcXxIe67r63NSNDmtyHfYk/6+uaC4W2xqV//M=;
        b=Slk15YLtbPP7A4Mrbcc2HfRgz4itP2Jj5HEHmqSALGnnzYvWBOGkZl9QEgZnOIsDPU
         hFa1hlwJ8VgSE9vBgcF1DmYGxn7le5lJRIXh3ZGXDJbfbAFrUuSL6NQTIzM0d+Hx2oPa
         7uNckB4m+xGgQxI2bpeKic4Qp1Ta5hafjBJIDM3yD2n+7KDeCiC9fsWLmpuXbnWZ9xfw
         nO5XMKjZWprFUcayrbQHlJARPtjFWp8jlrddsbVNQZfk0K3gyIXfW4h3BFJFCZ43bVto
         tSLPHML1lN811kElmv8X328oVEp0p9hgIULPsDlBpvJZaKoMajHqMrqQl2lcM+UUmUMp
         nUJw==
X-Gm-Message-State: ABy/qLb8hrPoU7wWmWguWjb0Q+4f1OshP5NrNEmjIMrisJUP9vtQOH6G
	GceM/c819WUIYbKawf0MUD+FgRE7iKMieNpvELrhPQ==
X-Google-Smtp-Source: APBJJlGoasXGfe5hFr70DcARWayE4fKQCzefyqvO314rjOOL1v2XYXRNlYBTZsNWTDPa9JwN5dqmukHiXsaEhGyz3+4=
X-Received: by 2002:a25:2106:0:b0:ced:497e:df3d with SMTP id
 h6-20020a252106000000b00ced497edf3dmr5257589ybh.37.1690140258456; Sun, 23 Jul
 2023 12:24:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230714122441.3098337-1-huqiang.qin@amlogic.com> <20230714122441.3098337-2-huqiang.qin@amlogic.com>
In-Reply-To: <20230714122441.3098337-2-huqiang.qin@amlogic.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 23 Jul 2023 21:24:07 +0200
Message-ID: <CACRpkdap8057An+wcieB0UR9V5AicvGnPgnjLE_fhQonQmvDDg@mail.gmail.com>
Subject: Re: [PATCH V3 1/2] dt-bindings: pinctrl: Add compatibles for Amlogic
 C3 SoCs
To: Huqiang Qin <huqiang.qin@amlogic.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, brgl@bgdev.pl, andy@kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230723_122423_392732_E828B203 
X-CRM114-Status: UNSURE (   6.94  )
X-CRM114-Notice: Please train this message.
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

T24gRnJpLCBKdWwgMTQsIDIwMjMgYXQgMjoyNeKAr1BNIEh1cWlhbmcgUWluIDxodXFpYW5nLnFp
bkBhbWxvZ2ljLmNvbT4gd3JvdGU6Cgo+IEFkZCBhIG5ldyBjb21wYXRpYmxlIG5hbWUgZm9yIEFt
bG9naWMgQzMgcGluIGNvbnRyb2xsZXIsIGFuZCBhZGQKPiBhIG5ldyBkdC1iaW5kaW5nIGhlYWRl
ciBmaWxlIHdoaWNoIGRvY3VtZW50IHRoZSBkZXRhaWwgcGluIG5hbWVzLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogSHVxaWFuZyBRaW4gPGh1cWlhbmcucWluQGFtbG9naWMuY29tPgoKUGF0Y2ggYXBwbGll
ZCEKCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCg==
