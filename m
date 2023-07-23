Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 266A5C001B0
	for <linux-amlogic@archiver.kernel.org>; Sun, 23 Jul 2023 19:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2vhzjSgtH4ix75CPJA/UGObDXlFFNY9USixmG7u/dgE=; b=nuGgdM9zU4yTy9
	SWKigCQ32yhRviNNawBg9Ufh9gO5kXHDdocged+XAaB7PGgkvNh9JYKR44qalOBEi2SH+0woVG7Ls
	qNknyqyb5m4qm6FEhZKyGRzTSJe5rQydX63BSh1y1nbSuWudhua3aeLZyf+cYIDZTeS/ie4t2g5H7
	X9zeOl52b4oqrRmHbp03HuprMPYkFp4HbE3lu3JLbVPbIVuL0v1wl5beuSDZIJCgbDB0Syo2u92ZW
	fiMaBSai+NK3S9z8uddUb6cagpqwkiiItB+oGyzuqpE54OTm4DK/YEFR97UmbqaM6uLGWDinebDxQ
	xuJSrw2blGqfGvei0Adw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNej2-001hMw-2L;
	Sun, 23 Jul 2023 19:26:40 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNeiz-001hLz-1M
	for linux-amlogic@lists.infradead.org;
	Sun, 23 Jul 2023 19:26:38 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-583f036d50bso4985107b3.3
        for <linux-amlogic@lists.infradead.org>; Sun, 23 Jul 2023 12:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690140396; x=1690745196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rx4Cx9kXF3kLeSuUq0IkgM0eQf8d+Mb1ipAOzpYwQXQ=;
        b=EoiN8KHmJW9n/4AbSJSsCypgYoFAk5VpBw1Yzrrwcuo8BPUwtmrTKXfFIuDmZY1R+1
         bjZwDCh6zoAVnEtZGzaDl7A57xbYE4ut7ZgSuGDIUzx+5RzA+5M9DrxC81DGvgL4Xbrw
         xzcSepcC1IuQ4FbSXsDGLahNQ1mfyy03Yb1Nzn4/V0T5OYQ1o8LtYtrWCu8Enzo5SxDm
         axUDgAGyJF419yLpwyWBGujg+bX+obSJqRa8axs/C0FOKRtSOZCUtzuQEMNvLPrs8lrq
         dHFTULbpmdZz6Nb6V8qrSSUCwhSaTJ7tP999T5tK+RZmNLM+UhTdhsQyoWDCuN+33R4J
         OkXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690140396; x=1690745196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rx4Cx9kXF3kLeSuUq0IkgM0eQf8d+Mb1ipAOzpYwQXQ=;
        b=TVIJAGvHtCH4bBASjcaMdL7vYt//x2nHIp5zGDjIh0LyBoGT5Z9UEcYXoVRAisLsqR
         YqtCAeEK6kNe0Fzi6t81KuSZdFTzkgKhxjh0tz0N4yX6e9xmbnTIkjIcd/M8tY8qy/mF
         KxtN7SYPMUbnJl2rcEj40tdz9M/pH4MKhJaeCHEgmsykJsDc17JaeCFkDz6nYTKwtoJd
         onXCDpHybR6V2zfGuC3mHrDwxFnBHi5Vv9VY347WmVFsvmJO2jAqmMy+GPzHuGSY9Eui
         ctycyPOUPPzjdhcVWE3cQ+I4RaXnCd2I8kQsTufKmh9BOvf/Pkz+X6fqQlsAZvL3cIMc
         5T9Q==
X-Gm-Message-State: ABy/qLasxKqWmYoP1p0lpI3GofY/wBLB33+e+gjXY3yQ96h6JMT+Y/fY
	dmfJBMnFwT0BAx/4ffZ//BmiEPyWN/qcQKWNq+V5gw==
X-Google-Smtp-Source: APBJJlHZcs6nr5ibsR4qxHafZKtxDvVDDW+tGHfnEwvqgzgxY2faqK29OV4ASTlnKdVR9d8Wj1GpM93jrnwGLU7oPnU=
X-Received: by 2002:a81:6c43:0:b0:57a:8de8:344b with SMTP id
 h64-20020a816c43000000b0057a8de8344bmr6987487ywc.4.1690140396707; Sun, 23 Jul
 2023 12:26:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230721073214.1876417-1-huqiang.qin@amlogic.com> <20230721073214.1876417-3-huqiang.qin@amlogic.com>
In-Reply-To: <20230721073214.1876417-3-huqiang.qin@amlogic.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 23 Jul 2023 21:26:25 +0200
Message-ID: <CACRpkdY4qQqt9mAo8rBGk8ZC4hH_ext_qZCyenEDs2HLVzXXYw@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: Replace the IRQ number in the driver with
 the IRQID macro definition
To: Huqiang Qin <huqiang.qin@amlogic.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230723_122637_465277_7D111263 
X-CRM114-Status: UNSURE (   7.21  )
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

T24gRnJpLCBKdWwgMjEsIDIwMjMgYXQgOTozNOKAr0FNIEh1cWlhbmcgUWluIDxodXFpYW5nLnFp
bkBhbWxvZ2ljLmNvbT4gd3JvdGU6Cgo+IFJlcGxhY2luZyBJUlEgbnVtYmVycyB3aXRoIElSUUlE
IG1hY3JvIGRlZmluaXRpb25zIG1ha2VzIGRyaXZlciBjb2RlCj4gZWFzaWVyIHRvIHVuZGVyc3Rh
bmQuCj4KPiBBc3NvY2lhdGVkIHBsYXRmb3JtczoKPiAtIEFtbG9naWMgTWVzb24tRzEyQQo+IC0g
QW1sb2dpYyBNZXNvbi1HMTJCCj4gLSBBbWxvZ2ljIE1lc29uLVNNMQo+Cj4gU2lnbmVkLW9mZi1i
eTogSHVxaWFuZyBRaW4gPGh1cWlhbmcucWluQGFtbG9naWMuY29tPgoKQWNrZWQtYnk6IExpbnVz
IFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCkZlZWwgZnJlZSB0byBhcHBseSB0
aGlzIHRvIHRoZSBpcnFjaGlwIHRyZWUuCgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWls
aW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
