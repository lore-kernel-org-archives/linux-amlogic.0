Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9F2CEE35A
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Nov 2025 21:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0jP2qsHg8n5r4dcX2aOM6OHWvLqE+xvyvcc5j9dEJxQ=; b=j8j/GMtqCxfIzS
	s5U/YFty13qWRILx+2to4SxAjN4v7f8XPy22p6KPIvmJ8BIe/sfAcgrjRp4oiyO2sBJa0p6IkuAj1
	o3lNx6qvBFiXusOuf1V+Go9hhSjqeLWkzQiEjRecui0OJzFsJahKCgn/YSNLnzl+Yuog2N4Y6IYd/
	OAr5edrJbM1g2PKkgXt1bgEUY6e23GcMFf91H+rADDofmbiPphsnLj6iP6WI73F8PPVVFsMC6/VPQ
	uM/SCzbVB9uBpVPnA7UjRanvYf23xY5UzNiJeiHX9dNacphk2tnUR/nJQKf2u6tEDCPo5slz2jWrc
	9pGzpdUyJVzGax39bUyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLTUT-000000018mk-1fmw;
	Tue, 18 Nov 2025 21:43:57 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLTUR-000000018lJ-2PE2
	for linux-amlogic@lists.infradead.org;
	Tue, 18 Nov 2025 21:43:56 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-29586626fbeso63792085ad.0
        for <linux-amlogic@lists.infradead.org>; Tue, 18 Nov 2025 13:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1763502234; x=1764107034; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yNtoUy0Rbnu2n90Tsiyfvs/PHlZ4JRBfMndeRvKVC1I=;
        b=MVCGGOSJqPMYTVp/C7yxms+BTOWLnV3rWrWoGaebpeSKTOV3Hy2a1tT7TdPXOV1rUH
         tlke6xKoXBNlkH1Yw7PpUyVeRuUSTUVfzGPxX/MSiBwB1SaYWZkD2wSE9V7QMrmNnkbH
         tW/PrWSc+yGpGgjTvG4Px5Gundw57z5ABJoMJj62Z8YVMNgN7HGko3UzxRHgbGlU7utB
         cIMGjxFnqJQnsq29SFnxLsbFbmydsX7FZ1E8Vb9CMLoMz/Uj8oLY/oOQzayIHCgFCbqB
         YpKbe2u928qXYVmR9XL1Ri25XZHQwE7/B92tOoTYYfnH5BUU92gF6RRRTY7xKyOCX5Bx
         NkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763502234; x=1764107034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yNtoUy0Rbnu2n90Tsiyfvs/PHlZ4JRBfMndeRvKVC1I=;
        b=hCwSYLmc+LjR9jxAnDnKFJjFBPgYUT9BSXwgL5Z8+cIkSomEpmW3LrS16yu6au6jZD
         R8/2eFpqmd2paTz8pvT6BVxvQevOKT2EORYbdZxyDtBmDUVrubkfHNXSlLZT7aVI4MHz
         kM5FqQevbtGaESE4H1e+TcWCSh4WJO47fGG7ZCEtNY5OOtlESwLJ/wVVWzV1Ybll0+SP
         xNkZDBeFnM7UVvb1vOT2GUjmk29jGJNo0RUS/RolFHMkpYsuxGU2igXXxcHzpWLizghc
         ko74RyemYgxFqP/NEcpYndntOuVMVLgeGSw95DL68VCcJ2ukB88q6qwaWAM1Efpn3cky
         yoqA==
X-Forwarded-Encrypted: i=1; AJvYcCW7qT0p9qt+no/X97UmXocXPCLrx9LfLsfNPdpWZaWKUPWjsNEFqZwbTDpuTVgXqiit8BRRb61owj6sKDTI@lists.infradead.org
X-Gm-Message-State: AOJu0YwmF5DSEWa1dng3JxdARJqm3ZENa1dzPh3FIYkPAhko1UsMccGa
	/QKQKk6CekUI+XoCzbp17xxS43XlGId0kMKXjBBzli/HXMpIYwscFmS1IZAbAsvq/UM8zpTDWyB
	jJFeN1yNfq559oNP84qgAyaq9RgOd1BY=
X-Gm-Gg: ASbGncsGOyFFaOt39EqK5VM8cUI7UM4LmNTiWGthnygr0C1yQlJJBRhhg5BscfMqv2I
	fejcCA96JVLt2/qcX2ZMQLn7OgtGOqLVzh20rteziiPQpPAuJiQu3ciLyjE1lpL3hz1GKZ2PFo5
	rN7aTejPCtYxYmQD+Gj6i59DEC40h6I5cltgF3xuhZ/g5wzICPZKvWnJDNExIvzfHcoD/qbvMBE
	G9/XW1tgjxyDbrvGZWlPHXkB9iAd1z6sDosXbQqJaNJmpGYb4UB9YBtew8eAIMVUrWfRmxgxzE+
	nlq45wFuIfg7NNc5pCqeNYDw5jA3
X-Google-Smtp-Source: AGHT+IHd628lGwsZpI++GYNCgzLr60HHxUtuAdRPIXPzSVGABfGpGsyCVSZh4x9JJThN4L2osh0CY47TVhRtaDoTD2w=
X-Received: by 2002:a17:902:ebd2:b0:294:fc1d:9d0 with SMTP id
 d9443c01a7336-2986a750101mr224217285ad.40.1763502234354; Tue, 18 Nov 2025
 13:43:54 -0800 (PST)
MIME-Version: 1.0
References: <20251118-soc-info-s6-s7-s7d-v2-0-38e2b31a88d1@amlogic.com> <20251118-soc-info-s6-s7-s7d-v2-2-38e2b31a88d1@amlogic.com>
In-Reply-To: <20251118-soc-info-s6-s7-s7d-v2-2-38e2b31a88d1@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 18 Nov 2025 22:43:43 +0100
X-Gm-Features: AWmQ_bk1k_T1rSzW6trxGV0plWKt9DXsG1Z-FbbeCcRZ7OyTLOcx7IZnQX1bFXA
Message-ID: <CAFBinCBnupgH=6NQH0oPTj3ETVkLfCB6aVyMySAqAxNEAHnuew@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] soc: amlogic: meson-gx-socinfo: add new SoCs id
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_134355_611657_BE4BC62F 
X-CRM114-Status: UNSURE (   7.05  )
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

T24gVHVlLCBOb3YgMTgsIDIwMjUgYXQgNjo1OeKAr0FNIFhpYW53ZWkgWmhhbyB2aWEgQjQgUmVs
YXkKPGRldm51bGwreGlhbndlaS56aGFvLmFtbG9naWMuY29tQGtlcm5lbC5vcmc+IHdyb3RlOgo+
Cj4gRnJvbTogWGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+Cj4KPiBBZGQg
bmV3IGRlZmluaXRpb24gZm9yIEFtbG9naSBTb0NzLCBpbmNsdWRlIFM2LCBTNywgUzdELgpzL0Ft
bG9naS9BbWxvZ2ljLwoKTmVpbCwgaXMgdGhpcyBzb21ldGhpbmcgeW91IGNhbiBmaXh1cCB3aGls
ZSBhcHBseWluZyB0aGUgcGF0Y2ggb3IgZG8Kd2UgbmVlZCBhIHYzPwoKd2l0aCB0aGF0Ogo+IFNp
Z25lZC1vZmYtYnk6IFhpYW53ZWkgWmhhbyA8eGlhbndlaS56aGFvQGFtbG9naWMuY29tPgpSZXZp
ZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVt
YWlsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFt
bG9naWMK
