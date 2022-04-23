Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E1FC433F5
	for <linux-amlogic@archiver.kernel.org>; Sat, 23 Apr 2022 20:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=giOZtgW3YcAvmc8IOqCEXCEQWyzJukWavBrNde79+dg=; b=OPY78NyCMczmIT
	xiOXTwso6EyXbP7sSztXbhakHJqSAKdLnG3eTWuTq83NcFMglIRxD6VNdwRxxnjqPGnWBSkgMfP8M
	OlWFt/l10I6kMWMgyxGDigYgfPcv2Gv9B22DQaiOM2A/YsZigRM9VVpNYUkG9iKFMdK4ReeSnhben
	pjYXnHFF3X3QntQMCiF34FROtlDWYk1PzKwExlmyHPThvmQlV8BE8cvB7QY62cCZx+NON8uqu554T
	ZH3gx/+Vk/smTiVCIEGvLkpnU1fBjlUxMbZEFtsUp3LndZK2oEDJYQxxOLQtPtDpAya0GQ0HxVtRi
	EVBMPy78Ny5i2qNlupmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niMpW-005AAe-2V; Sat, 23 Apr 2022 20:58:10 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niMpK-005A9n-Lj; Sat, 23 Apr 2022 20:57:59 +0000
Received: by mail-io1-xd36.google.com with SMTP id r12so12044605iod.6;
 Sat, 23 Apr 2022 13:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KrTlP84sZ2q5qV0OF1MH+Ufo+yrPdkF+OvI5ZSe0jgE=;
 b=Zdr8iQjYCBDIUgbJctwOL/1gZqD3DUi9DyZ0WpMPJQxQb/H8ZwjlSFDAyVp2naGgJb
 Wgr6z6OlYj1NAsZq/0fKyM9CzjAx3EUou2Ulfw+S6Y7XFj4uTmPhx3orCs/fqBI8OZ7C
 UBRw8E4df8fAAdp+P9eAljYoBch/+3yuX/eSaTfM3A1iAyE76G6x4BudVQ4dm+IrRmfq
 iMUt66zfh9L24q/WkPmW3qh1BOaIwm/cEzjkuTUBa9XZYnJ99TWxp1FArB0fpwxS+x0H
 toF66mheGEck/AqwBXaXpOnuC23HzXKja44wIs+fTWjDF7XH1GMb4JpOpkiAXu8tOr0E
 Q6uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KrTlP84sZ2q5qV0OF1MH+Ufo+yrPdkF+OvI5ZSe0jgE=;
 b=qSKWMCXgIN7NBKprj05Xafd8qijMmCP5nLoFIn3/g29CpFkSYF0Eq/g2nm33JcS7NX
 YYZR58iagRhKeSkTk6MCTi4z0Rl2A+hy2cB9HGaV6ZIK1w4Z2A0IQUyVjpI7GYJQbM6U
 N+tHIRVkLmRb2g5wsA13intySQT3IKevuGxaEbQhQMgQQbsUzOs1nZG0V9Vnxm2tDinw
 ABSK37OrdoxvCeKiIGC0U/Nia7kXsYEmkAc1W2htet8qV6xCZtavFuNSXyK+dqU2Bncq
 bkpwP5WzvNkZkFR8aIMkiZHcllIA7Rwvbg5ImNA6mJ7u/NnUxQAPSUeVwOVwM+PHCDZy
 +yvg==
X-Gm-Message-State: AOAM533sUAn3MzvUV01RgbQy+qa364Sc+o0dzUT3buB3Rvgoi0+5kA52
 fktZp1+euslLQN+iYKGm1PnbDsSmINAFGCZXsVk=
X-Google-Smtp-Source: ABdhPJyitWaqU5hnYOdQGXm3PyDxpC5KNGGEV8H09M4KIHkejT5Z88ThOAHu/OoRWLEyeUmbiPGCZ/22Kj3HZkt2abM=
X-Received: by 2002:a05:6602:15c6:b0:611:591d:1d9a with SMTP id
 f6-20020a05660215c600b00611591d1d9amr4315448iow.177.1650747476966; Sat, 23
 Apr 2022 13:57:56 -0700 (PDT)
MIME-Version: 1.0
References: <90668779-b53d-b3e7-5327-af11ff4a1d18@gmail.com>
In-Reply-To: <90668779-b53d-b3e7-5327-af11ff4a1d18@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 23 Apr 2022 22:57:46 +0200
Message-ID: <CANiq72m+OVcX1gPit94D1hjzkduyVFoCWXKSXTxpUDFtKs8z6g@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] auxdisplay: Add support for the Titanmec TM1628 7
 segment display controller
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Miguel Ojeda <ojeda@kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, 
 Neil Armstrong <narmstrong@baylibre.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220423_135758_765160_1DD20986 
X-CRM114-Status: UNSURE (   8.16  )
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

T24gRnJpLCBGZWIgMjUsIDIwMjIgYXQgMTA6MDkgUE0gSGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdl
aXQxQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIHRo
ZSBUaXRhbm1lYyBUTTE2MjggNyBzZWdtZW50IGRpc3BsYXkKPiBjb250cm9sbGVyLiBJdCdzIGJh
c2VkIG9uIHByZXZpb3VzIFJGQyB3b3JrIGZyb20gQW5kcmVhcyBGw6RyYmVyLgoKQUZBSVUgdGhl
IGRpc2N1c3Npb24gaGFzIGNvbnZlcmdlZCBhdCB0aGlzIHBvaW50LCBjb3JyZWN0PyBJcyB0aGVy
ZQphbnkgZmVlZGJhY2sgbGVmdCB0byBhZGRyZXNzPwoKQ2hlZXJzLApNaWd1ZWwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
