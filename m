Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6EFC48BC4
	for <linux-amlogic@archiver.kernel.org>; Sat, 17 Feb 2024 22:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lu74226QquGJtMDFl+C+N0fIjyfFsUgzxGDtpAQiYCU=; b=D/X4gvhx114KMe
	f+VZuclMQzLpRrSpB6SaJ7lV4B1uEB3DuU5AxfS1qPOAsjT9wvzxjYq9PM4OC6v0t4BY1MaefH+Qq
	pSZQTXVY5cng/uvNyhMp8JrwMe8f83GeLzGWjrTHFjBYlI+h8jaoAXbRsb+XquZLRWWbx2WkAmOsk
	byB+awNS1161kANAmknZPrlMMEJFEhL8xuQA/P3VTPgSacGXJ4EqELxSLitvdLiv1DKR786a+XTJA
	4BTmVNOhPofZ2Va3Usj7O8lkVL8iyer411uSlK7Wa+5ULl9vgyqH/q16sfuy5j9W5IY8GOwz6HZM+
	eyp3CqdXsjIP/nZwS/Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbTJm-00000006XcK-16V0;
	Sat, 17 Feb 2024 22:37:58 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbTJi-00000006Xak-2Y9b
	for linux-amlogic@lists.infradead.org;
	Sat, 17 Feb 2024 22:37:56 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-dc238cb1b17so3010590276.0
        for <linux-amlogic@lists.infradead.org>; Sat, 17 Feb 2024 14:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1708209471; x=1708814271; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Si25AaPYYhYTOkmgXRWHuRBAH3Xq06xq/4sUPyQ+50s=;
        b=J6HTW+/JmcLFLuJmyRBL9r5bGAE/MIm7KYSLphuW1K954jnoJ3JR5fhzDlkP+hIycV
         fF1suAPID85QehYK74xOdsWw58I0QMsJLTPnNTO3dM0q9OBD3irwcBXP5Pq+jxPpkMI/
         afIKgVbwbOvD4fptTmKm6nu6zGxxqUc+xgSpJBRzmzvS6ZwnPguNragaJa59uCFejQ+I
         uiLR5yr+TYtGDdrk5qNx0cihf8WBpDLQ2b9ZSeI9uT+QGslMW2gYyvyrSSGxujyw8ziQ
         N0tZcL+OvGMm4fKb9+U4jrBz592bq2iRkgICTm9zobnAlm3dY4ci4A6d9Xmvyp6W3jKW
         jCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708209471; x=1708814271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Si25AaPYYhYTOkmgXRWHuRBAH3Xq06xq/4sUPyQ+50s=;
        b=lF4smTsSwaMO8Au1I2mrNclTwdsOHxUb4T9TPTrvaIb3FroB0oPsUmnbIC5803EQn3
         qd/ugc1Kmx0e6c+v+6XcTAqfpOZQALp3cb+WCUepCz79tQdXZdYIYUh4U6eKwila1YW3
         njYgA0pehfVY7eqtL9BzIZ9S61QibJ+xLY4qnZ7uOyaNL17jR2U5Jwre0MBYgV1L5ZO8
         KVhGRhc+yRAL16vYnvtPrunEvBj4fkEbon8qvPLJWXsI2fyYlTP9gil9wlrHdOHLMjWt
         eLbwyd1+0PcYh8wmwxWQ09eUbxVKLNc00pO2Cf8XG0t3obLjpOyhj4JVHlktL3e06QfM
         IBXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSB9eSKwsLlu1weYmeHbG0VfJGTZqe48X8pAurIU128KPZq5oHLK3TST28N+qORDVaVntcEQzufJ0y/2/WM8G27HpYYCw01xN1Czu2AObyvoc=
X-Gm-Message-State: AOJu0Yx9IukFqyeOnGbmRHBH1wh16Om+YfKHFuHRE3+NPTslIxecNc6m
	vnICu+QNiD9OYRM4YmcanY8r4Y0IFh8dHO6zN4whjDbrQsEzMgGlmkUUd6AY6wfRMAhKbvXxcu8
	6qKlGYCl9xyjFs0BXoeRe7TEmHbz1Y9W0x6P98g==
X-Google-Smtp-Source: AGHT+IETMFjsYK3d6///nf/q6zU3UY5udQD41mjum77p14dyrbBbJatI8RG3wLWwYuGYzjxvZjlhJjf+lR1NXXadsAE=
X-Received: by 2002:a25:a027:0:b0:dcd:2f2d:7a05 with SMTP id
 x36-20020a25a027000000b00dcd2f2d7a05mr8428908ybh.35.1708209470967; Sat, 17
 Feb 2024 14:37:50 -0800 (PST)
MIME-Version: 1.0
References: <20240217194116.8565-1-ansuelsmth@gmail.com>
In-Reply-To: <20240217194116.8565-1-ansuelsmth@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Sat, 17 Feb 2024 17:37:39 -0500
Message-ID: <CALNs47szQu9RB8stBkdn+q3ejKrQgUFCDzhS8Wzy+WENeL=xAw@mail.gmail.com>
Subject: Re: [net-next RFC PATCH 0/3] net: phy: detach PHY driver OPs from
 phy_driver struct
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Richard Cochran <richardcochran@gmail.com>, 
	=?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>, 
	SkyLake Huang <SkyLake.Huang@mediatek.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Arun Ramadoss <arun.ramadoss@microchip.com>, UNGLinuxDriver@microchip.com, 
	Peter Geis <pgwipeout@gmail.com>, Frank <Frank.Sae@motor-comm.com>, 
	Xu Liang <lxu@maxlinear.com>, Piergiorgio Beruto <piergiorgio.beruto@gmail.com>, 
	Andrei Botila <andrei.botila@oss.nxp.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Michal Simek <michal.simek@amd.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Robert Marko <robimarko@gmail.com>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, 
	David Epping <david.epping@missinglinkelectronics.com>, 
	Harini Katakam <harini.katakam@amd.com>, Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, rust-for-linux@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_143754_797204_9AC7D6A7 
X-CRM114-Status: GOOD (  12.36  )
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

T24gU2F0LCBGZWIgMTcsIDIwMjQgYXQgMjo0MeKAr1BNIENocmlzdGlhbiBNYXJhbmdpIDxhbnN1
ZWxzbXRoQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBJIHRvb2sgY2FyZSB0byBjb21waWxlLXRlc3Qg
YWxsIHRoZSBQSFksIG9ubHkgZXhjZXB0aW9uIGlzIHRoZSB1bmlxdWUKPiBSVVNUIGRyaXZlciwg
d2hlcmUgSSBzdGlsbCBoYXZlIHRvIGxlYXJuIHRoYXQgZnVubnkgbGFuZ3VhZ2UgYW5kCj4gSSBk
aWRuJ3QgaGFkIHRpbWUgdG8gdXBkYXRlIGl0LCBzbyB0aGF0IGlzIHRoZSBvbmx5IGRyaXZlciB0
aGF0Cj4gSSB0aGluayByZXF1aXJlIHNvbWUgZml4dXAuCgpUaGlzIHdpbGwgb25seSBuZWVkIGFu
IHVwZGF0ZSBpbiB0aGUgYWJzdHJhY3Rpb24gYXQKcnVzdC9rZXJuZWwvbmV0L3BoeS5ycywgcm91
Z2hseSAodW50ZXN0ZWQpCgpAQCAtNSwxNSArNSwyMiBAQCBwdWIgY29uc3QgZm4gY3JlYXRlX3Bo
eV9kcml2ZXI8VDogRHJpdmVyPigpIC0+IERyaXZlclYKICAgICAgICAgZmxhZ3M6IFQ6OkZMQUdT
LAogICAgICAgICBwaHlfaWQ6IFQ6OlBIWV9ERVZJQ0VfSUQuaWQsCiAgICAgICAgIHBoeV9pZF9t
YXNrOiBUOjpQSFlfREVWSUNFX0lELm1hc2tfYXNfaW50KCksCi0gICAgICAgIHNvZnRfcmVzZXQ6
IGlmIFQ6OkhBU19TT0ZUX1JFU0VUIHsKLSAgICAgICAgICAgIFNvbWUoQWRhcHRlcjo6PFQ+Ojpz
b2Z0X3Jlc2V0X2NhbGxiYWNrKQotICAgICAgICB9IGVsc2UgewotICAgICAgICAgICAgTm9uZQor
ICAgICAgICBwaHlfZHJpdmVyX29wczogJmJpbmRpbmdzOjpwaHlfZHJpdmVyX29wcyB7CisgICAg
ICAgICAgICBzb2Z0X3Jlc2V0OiBpZiBUOjpIQVNfU09GVF9SRVNFVCB7CisgICAgICAgICAgICAg
ICAgU29tZShBZGFwdGVyOjo8VD46OnNvZnRfcmVzZXRfY2FsbGJhY2spCisgICAgICAgICAgICB9
IGVsc2UgeworICAgICAgICAgICAgICAgIE5vbmUKKyAgICAgICAgICAgIH0sCisgICAgICAgICAg
ICBnZXRfZmVhdHVyZXM6IGlmIFQ6OkhBU19HRVRfRkVBVFVSRVMgeworICAgICAgICAgICAgICAg
IFNvbWUoQWRhcHRlcjo6PFQ+OjpnZXRfZmVhdHVyZXNfY2FsbGJhY2spCisgICAgICAgICAgICB9
IGVsc2UgeworICAgICAgICAgICAgICAgIE5vbmUKKyAgICAgICAgICAgIH0sCisgICAgICAgICAg
ICAvLyAuLi4gT3RoZXIgZmllbGRzIG5vdyBpbiBwaHlfZHJpdmVyX29wcworCisgICAgICAgICAg
ICAvLyBTQUZFVFk6IFRoZSByZXN0IGlzIHplcm9lZCBvdXQgdG8gZmluYWxpemUgYHN0cnVjdApw
aHlfZHJpdmVyX29wc2AsCisgICAgICAgICAgICAvLyB3aGljaCBleHBlY3RzIG51bGwgZnVuY3Rp
b24gcG9pbnRlcnMgZm9yIHVudXNlZCBmaWVsZHMKKyAgICAgICAgICAgIC4udW5zYWZlIHsKY29y
ZTo6bWVtOjpNYXliZVVuaW5pdDo6PGJpbmRpbmdzOjpwaHlfZHJpdmVyX29wcz46Onplcm9lZCgp
LmFzc3VtZV9pbml0KCkKfQogICAgICAgICB9LAotICAgICAgICBnZXRfZmVhdHVyZXM6IGlmIFQ6
OkhBU19HRVRfRkVBVFVSRVMgewotICAgICAgICAgICAgU29tZShBZGFwdGVyOjo8VD46OmdldF9m
ZWF0dXJlc19jYWxsYmFjaykKLSAgICAgICAgfSBlbHNlIHsKLSAgICAgICAgICAgIE5vbmUKLSAg
ICAgICAgfSwKICAgICB9KSkKIH0KCldlIGNhbiBzZW5kIGEgcGF0Y2ggaWYgbmVlZGVkIG9uY2Ug
dGhpcyBzZXJpZXMgbW92ZXMgb3V0IG9mIFJGQy4KCi0gVHJldm9yCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
