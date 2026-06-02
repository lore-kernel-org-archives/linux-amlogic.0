Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06986CD6E5D
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Jun 2026 20:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GVDiS5GGEwRvWnvLW7XiEFyhj/H2blXSLG87G98Rjsw=; b=NEtQvbHYUNH/T2
	nvrcMU/cSw3G07F8vPJWP36fv2wGmxjr4zVL2hbcnu5c9v8F1JN/H7AgHA77ZXd8A4dkyJrEH9GrW
	7eR217LO7nw39amasCY9jnJ4hjQtmsbeBwFkFYoFa4HLYwT7KBEMBZKIEqBMrsdPrFdPnaRUi+KDR
	QO0rKcwq9eEn90mBuvq0XESSWQ+yAtSavO1s0hYKCoZXBT4WAAH0gztpUnwr/hZALeR7LDe1NIYDV
	QBBVcBc20pn6SJj0hqBzX4LJO+Yfq3JIcvf9gqpXKhXd8ZPNJyyeUK11igOhBs0PfsJ975ug73zQw
	/i+Mh7TE7t4ttjKZGbxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUW5I-0000000DmWe-2sdV;
	Tue, 02 Jun 2026 20:51:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUW5H-0000000DmW1-2k8a
	for linux-amlogic@lists.infradead.org;
	Tue, 02 Jun 2026 20:51:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EE2056014B
	for <linux-amlogic@lists.infradead.org>; Tue,  2 Jun 2026 20:51:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6D0B1F0089F
	for <linux-amlogic@lists.infradead.org>; Tue,  2 Jun 2026 20:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780433494;
	bh=G6rZ7t6/DhXfpQVj0UlyYqS4gIMH66eg2Oc1gFXbhJ0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WsQo944GDchg/wLfBxF995MDsIQlWR94qpNUGNWfmtj0cc9Cm6IAvLYK49Jz+sub+
	 cCz9hX3qvk2i7XzqttjMLfpB2FTj81X0WI8T9GOEFst61x7uetTvHoQlZHBhkw3wj+
	 pWEXAl35dtpSL5N9q+XzcWkaBdzolGpamWnG3Ut+8eiWiblT+djxuby3gRu3VBbNTW
	 b5gX5xDdjGnEk3Uf3Rhjs7eEYv4grJDMr3ZOHMMp2kabifDBAot1ZDAITd3RH9n/oV
	 ENGlOonCAxXOF1Zy8Nr8B/0OQsXqHHxsvHFgQOc4sUtBFr0j9jX5I0vS+C7g/hnM3X
	 sTT2vS+XYtAaA==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7e2f3646c10so38383027b3.0
        for <linux-amlogic@lists.infradead.org>; Tue, 02 Jun 2026 13:51:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9onVvQk2dT2AY6Tt7yjxeMXS75CbEQ20cOlvsd+wWPp4aNAGQb5FSMJp/fDR3I86vnFar4KTqZ22ltnToO@lists.infradead.org
X-Gm-Message-State: AOJu0YzBSb8iuGx58cXNOC+hKGAjgwiP513K4h9e5uxzs+MVgHgyTJXX
	5lcgItyHhXAZM5pOxXazwkOKlOfIJp3FNENOQUDf39Nt+gUKH918OWrBj2qsMACxuaUWvUcN+kp
	Roe4PrIc0+sBuRciKL4e1nEgZk3JR72U=
X-Received: by 2002:a05:690c:620f:b0:7b3:edc7:9b97 with SMTP id
 00721157ae682-7ea4400dc8fmr7795367b3.0.1780433493990; Tue, 02 Jun 2026
 13:51:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com> <20260304-gpio-of-kconfig-v1-7-d597916e79e7@oss.qualcomm.com>
In-Reply-To: <20260304-gpio-of-kconfig-v1-7-d597916e79e7@oss.qualcomm.com>
From: Timur Tabi <timur@kernel.org>
Date: Tue, 2 Jun 2026 15:50:57 -0500
X-Gmail-Original-Message-ID: <CAOZdJXXetr-FPZUSX_nzS5nZc+bbv5b1m78sCcZzrDJi7C05vw@mail.gmail.com>
X-Gm-Features: AVHnY4IltjGxIj5Fh6-JK6uSKIHTP0yZBU085pIyp8WmlCvLfmlYl2sow6Y3Jn0
Message-ID: <CAOZdJXXetr-FPZUSX_nzS5nZc+bbv5b1m78sCcZzrDJi7C05vw@mail.gmail.com>
Subject: Re: [PATCH 07/14] pinctrl: Kconfig: drop unneeded dependencies on OF_GPIO
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Alexey Brodkin <abrodkin@synopsys.com>, Vineet Gupta <vgupta@kernel.org>, Scott Wood <oss@buserror.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Dvorkin Dmitry <dvorkin@tibbo.com>, 
	Wells Lu <wellslutw@gmail.com>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sebastian Reichel <sre@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-leds@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-pm@vger.kernel.org
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

T24gV2VkLCBNYXIgNCwgMjAyNiBhdCAzOjA34oCvQU0gQmFydG9zeiBHb2xhc3pld3NraQo8YmFy
dG9zei5nb2xhc3pld3NraUBvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPgo+IEBAIC01NTcsNyAr
NTQ5LDYgQEAgY29uZmlnIFBJTkNUUkxfU1QKPiAgY29uZmlnIFBJTkNUUkxfU1RNRlgKPiAgICAg
ICAgIHRyaXN0YXRlICJTVE1pY3JvZWxlY3Ryb25pY3MgU1RNRlggR1BJTyBleHBhbmRlciBwaW5j
dHJsIGRyaXZlciIKPiAgICAgICAgIGRlcGVuZHMgb24gSTJDCj4gLSAgICAgICBkZXBlbmRzIG9u
IE9GX0dQSU8KPiAgICAgICAgIGRlcGVuZHMgb24gSEFTX0lPTUVNCj4gICAgICAgICBzZWxlY3Qg
R0VORVJJQ19QSU5DT05GCj4gICAgICAgICBzZWxlY3QgR1BJT0xJQl9JUlFDSElQCgpUaGlzIGNo
YW5nZSBjYXVzZXMgdGhlIGZvbGxvd2luZyB3YXJuaW5nIG9uIGJ1aWxkczoKCldBUk5JTkc6IHVu
bWV0IGRpcmVjdCBkZXBlbmRlbmNpZXMgZGV0ZWN0ZWQgZm9yIE1GRF9TVE1GWApEZXBlbmRzIG9u
IFtuXTogSEFTX0lPTUVNIFs9eV0gJiYgSTJDIFs9eV0gJiYgT0YgWz1uXQpTZWxlY3RlZCBieSBb
bV06Ci0gUElOQ1RSTF9TVE1GWCBbPW1dICYmIFBJTkNUUkwgWz15XSAmJiBJMkMgWz15XSAmJiBI
QVNfSU9NRU0gWz15XQoKV0FSTklORzogdW5tZXQgZGlyZWN0IGRlcGVuZGVuY2llcyBkZXRlY3Rl
ZCBmb3IgTUZEX1NUTUZYCkRlcGVuZHMgb24gW25dOiBIQVNfSU9NRU0gWz15XSAmJiBJMkMgWz15
XSAmJiBPRiBbPW5dClNlbGVjdGVkIGJ5IFttXToKLSBQSU5DVFJMX1NUTUZYIFs9bV0gJiYgUElO
Q1RSTCBbPXldICYmIEkyQyBbPXldICYmIEhBU19JT01FTSBbPXldCgpJIGJlbGlldmUgdGhlIHBy
b3BlciBmaXggaXMgdG8gaGF2ZSBQSU5DVFJMX1NUTUZYIGRlcGVuZCBvbiBDT05GSUdfT0YsCnNp
bmNlIHRoaXMgZHJpdmVyIGFjdHVhbGx5IGRvZXMgZGVwZW5kIG9uIENPTkZJR19PRi4gIFRoZSB3
YXJuaW5nCmNvbWVzIGJlY2F1c2UgaWYgQ09ORklHX09GIGlzIGRpc2FibGVkLCBQSU5DVFJMX1NU
TUZYIGNhbiBzdGlsbCBiZQplbmFibGVkLCBidXQgaW4gZG9pbmcgc28gaXQgc2VsZWN0cyBNRkRf
U1RNRlggd2hpY2ggZG9lcyBkZXBlbmQgb24KQ09ORklHX09GLgoKQWRkaW5nICJkZXBlbmRzIG9u
IE9GIiB0byAiY29uZmlnIFBJTkNUUkxfU1RNRlgiIHNlZW1zIHRvIGZpeCB0aGUKcHJvYmxlbSwg
YnV0IEknbSBub3QgZmFtaWxpYXIgd2l0aCB0aGlzIGRyaXZlciBzbyBJJ20gbm90IHN1cmUgdGhp
cyBpcwp0aGUgcmlnaHQgZml4LiAgSSdsbCBwb3N0IGEgcGF0Y2guCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
