Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C51C5CFCF
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Aug 2026 07:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YiLr/HiKpvRm7gC+gnQr8EWiOuSKxrsVs/uVwI95rB4=; b=arG53+Uo6nf8Ay
	lVS0PmR83Km3s8qEbqaT8uNlSJesJyYc8NgMtQ80jTliMlrCLHQf62WPL6pUMnRNwB4tFFsCfMU8p
	+o01c6RittyQ72RZkrN8vwCDp5bj/XFPHhzsoZL/iHy2wMSKcja9RZozJgzzBkYvppgvcQ/5I3nJL
	+X4kWB5YXFTQNOQ8HVJzri+nhdMGub2di7Pyic9Wh2JZ9YgwfFU2Ft77aJdqY2JIacl4lUx3CLuDX
	C8yVdU0Q32QF+KQ3LP0Mb7GIoxzVbBOCRDvmOZlOJ/szejz7GTVB+tpGOnQO2EdsfpN5wEG0Pi18O
	qx9mcOige4Pbpln1xxfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumPW-00000002AMO-3H2P;
	Fri, 14 Aug 2026 07:33:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumPR-00000002AIw-2K7t
	for linux-amlogic@lists.infradead.org;
	Fri, 14 Aug 2026 07:32:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0AE4A44FD5
	for <linux-amlogic@lists.infradead.org>; Fri, 14 Aug 2026 07:32:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3B0F1F0155E
	for <linux-amlogic@lists.infradead.org>; Fri, 14 Aug 2026 07:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786692776;
	bh=bJyzgdQ/eejKj8ldMAHAI7C+V4wOFbIfNbvluVyWQJA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NVtFSGLFB4e3lMlrfiduOdvyX3norNAfzAJzEhGWjCR5OHLVfoTZwoOnPmfrgduDx
	 7bqmdRd9bRHUhCfXSol375L8ctOmD10HsnljRa5mS+3vvxvE6871RrTVo+sJMPsbNr
	 nqoM7c08tO3oo+5X5ZpaHQYWKyAJTuXzpaUu60CyC+5hVlwLK8HsC5ZhzHAuMyXzVx
	 23i/yeSjFcdNKc5VmvPZSX6xDH7YVesVenhnJDg6RfT24S0fH5bC3IUQjidm2PBOSk
	 DFmWkbvxAxgscjrcShdVIPlpvqv6e6NyewsFpbUDem4Ihf4YdfUBLNCRkyaZYNPJDw
	 i+KutZ6EJepFA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aeb59d54b1so703445e87.1
        for <linux-amlogic@lists.infradead.org>; Fri, 14 Aug 2026 00:32:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rptz5QGYZZ3kDuja2SPBlzA3JsyzaXDv7gsm0wbd2YO6hTq8c4zu5ijaRldfMvC91k2crIQJ++0KvH94zh2@lists.infradead.org
X-Gm-Message-State: AOJu0YwlSpJUEzq+NiemC5q9tXTxrex4xDTy91R5x69mm07QdB/1TI/c
	Y1Z0/wHfM3D+fq0vTWGbZ3tTa/LD2JcHU4IxWNv7ZboTnUNNO5iYddhqV7JvFMfTCyk/MJAdDe9
	+r+R9aHfxNAfPqfSnaEmdNLWW2CEBX5k=
X-Received: by 2002:a05:6512:8050:b0:5ae:bd53:70f6 with SMTP id
 2adb3069b0e04-5b45910e0c7mr386696e87.4.1786692775664; Fri, 14 Aug 2026
 00:32:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260812-input-enable-v1-1-81e5ca7772aa@amlogic.com>
In-Reply-To: <20260812-input-enable-v1-1-81e5ca7772aa@amlogic.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 14 Aug 2026 09:32:43 +0200
X-Gmail-Original-Message-ID: <CAD++jLneywcc-c01_T+gn0B8R0eS-8L-uZaQFLFAP76d-+rMag@mail.gmail.com>
X-Gm-Features: AcwNN1XU3962CxPboANgIVgJxm4fwvuwzCEPKOHSRj5tMBUhrLoOJ-3EbtHxfvg
Message-ID: <CAD++jLneywcc-c01_T+gn0B8R0eS-8L-uZaQFLFAP76d-+rMag@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: a4: Add input enable pin configuration
To: xianwei.zhao@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
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

T24gV2VkLCBBdWcgMTIsIDIwMjYgYXQgMTI6MTjigK9QTSBYaWFud2VpIFpoYW8gdmlhIEI0IFJl
bGF5CjxkZXZudWxsK3hpYW53ZWkuemhhby5hbWxvZ2ljLmNvbUBrZXJuZWwub3JnPiB3cm90ZToK
Cj4gRnJvbTogWGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+Cj4KPiBBZGQg
c3VwcG9ydCBmb3IgUElOX0NPTkZJR19JTlBVVF9FTkFCTEUgaW4gdGhlIEFtbG9naWMgQTQgcGlu
Y3RybAo+IGRyaXZlci4KPgo+IFVzZSB0aGUgZXhpc3Rpbmcgb3V0cHV0IGVuYWJsZSBjb250cm9s
IHRvIGNvbmZpZ3VyZSB0aGUgaW5wdXQgZW5hYmxlCj4gc3RhdGUsIHNpbmNlIHRoZSBoYXJkd2Fy
ZSB1c2VzIHRoZSBzYW1lIGNvbnRyb2wgd2l0aCBpbnZlcnNlIHNlbWFudGljcy4KPgo+IEFsc28g
dXBkYXRlIFBJTl9DT05GSUdfT1VUUFVUX0VOQUJMRSBoYW5kbGluZyB0byByZXR1cm4gdGhlIGFj
dHVhbAo+IG91dHB1dCBlbmFibGUgc3RhdGUgaW5zdGVhZCBvZiB0cmVhdGluZyBhbnkgbm9uLXpl
cm8gdmFsdWUgYXMgZW5hYmxlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IFhpYW53ZWkgWmhhbyA8eGlh
bndlaS56aGFvQGFtbG9naWMuY29tPgoKSSBqdXN0IGFwcGxpZWQgdGhpcyBiZWNhdXNlIHdlIGFy
ZSBjbG9zZSB0byB0aGUgbWVyZ2Ugd2luZG93IGFuZAppdCBzZWVtcyBpbXBvcnRhbnQgYW5kIGxv
b2tzIGdvb2QgdG8gbWUuCgpJIGNhbiBhbHdheXMgcHVsbCBpdCBvdXQgaWYgdGhlIG1haW50YWlu
ZXJzIG9iamVjdC4KCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
