Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C4BC3ABCB
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 May 2025 20:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X2FbJ8klv+NtRxdg5ncufOiomsHTvh8CO/fGSLdTvMk=; b=Hn0wSTa8tL8d6l
	Mj5bPGJkvotRzDTznVwg5eCMfiM6lzRs6No1UBpKyoruIxi/cZrAIb3ppwqhEItysxTLzo++cal8n
	QsBKTG9JR64OvdzfCQNW6YcxAvmdJbzxqBh8ROGymWjdXulK8Ss+iwWiGPzRnxtbitu2gHgXrJKfP
	fyl6E/IzNLw88r9aORMmbzHxveMRJFiS0uzwbAqafRhlHAtGz7Ig7Ko+dn4aDF/iWy7mCvLrUkbMX
	/naiTlSJSzcBhvxF+2qSxC+UXYqCC2BnemFOjerSGgaBoCU2p7Rb0kVJB43Y68+0gw3w++PNXd/Pn
	NtaWfnP9UbcF44SM7M1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEZQQ-0000000Abcz-24GK;
	Mon, 12 May 2025 20:06:58 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEZQN-0000000Abca-0bV2;
	Mon, 12 May 2025 20:06:56 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22fa47d6578so49288365ad.2;
        Mon, 12 May 2025 13:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1747080414; x=1747685214; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WSiW7p0aNjUIq3le4mLwbELe1ERLMvn/occVL3eCR/Q=;
        b=T8WPN1hPVnnqzFmVeTmzITbuTjZhppOamzS6jVwfterqJmJaqbQ9ubWXPZbSiSF5QV
         fR8hpz1X8i/zRart0YM6iZDDS/PXrVQlKiAYHbeU3t/3sjAspxeGeCMtEJPX+gBgDIl1
         fsbtDcZkKmYiZuECwZLJAtj5EMHu9a/kjxUL7cSI9qjfLuO9S3q3Mk1JlkiAorS5UZPQ
         rPhPId/+rweiwbykqL9c6w+EWMM/sVDvcY8lbqsp33GK9Pb2s+8VgR7iNYNLHLmmdssa
         PTKKGphX/LjDqfvdxK1xCp+s0gpfMA7yyfqym7RuCi4TCGA5tLWlnuqvxfgpqfKgz89Y
         PrVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747080414; x=1747685214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WSiW7p0aNjUIq3le4mLwbELe1ERLMvn/occVL3eCR/Q=;
        b=tgC+aXRB7wJk3+r6nat6x18rbSTp3zD9JPN9kS/fmFFWN2MQr1DeG/tczA7JGnjP8+
         jL5vc7EVWyDopAOm2v7qAhQ3WuyROipws2E08Dph7oJU/6dgFCIgBPXERU89jcWvkhsN
         eUZtDVhc3x7rsaLl+SLoaJ+x+ueQVsewlv92r480007IsyvE5g68Ni2uO6BnwEZR2vLe
         mg1w2l45e5U/nZX3UUZ5Thhjgwd2QE8DuGyPpQgT23CgL4wD4wLAplZ3ceW6HOis2zw4
         A7wiF3Qv9DMrD96Po17zuH9wlAVPgbFt7KirbDvY4aJSTsoa8I0nG1gcOVJFcdPFqc0Q
         KNcA==
X-Forwarded-Encrypted: i=1; AJvYcCVQnXf/IMh5ctIXieyVJRcubBGmz4kHKhK18uTG4ItV2pu4tCXSIaeGuJ/4GxyZbRkZWCqVKFcu4W6+mFrLhJXTbg==@lists.infradead.org, AJvYcCXnNMkWj+fzbCKH3uJDx5uIVs0sfvD1SP6E4tKgaedbT1C3rm9lh+YyNVRqv9NSy+aIGimxYX9RFWASsJdq@lists.infradead.org
X-Gm-Message-State: AOJu0YzPGK+y5xYRmm+eG48Ddy3nqe+DuqrBn/MpSLGkzwluVvtg3Xsm
	3Dr2/WBEcKCNC6gEjDG0iCuBg2pvhp0Bz8xIb450Vol5LO0Ae0TyQM4Hf5TgfAlucIkMA+vElOB
	PtjR8cTU8tGJcFPaLpAQLw7RqWS4=
X-Gm-Gg: ASbGncuRj5lMyc7XpLSx/8S3tNITtsUr9nfh4sjsFjvu2OTqP0ZkXUOVCrXJuzLqECO
	9zP+VCzLcRzqllOnQdDAJzH4qhPMQxha+rJQdl3ckI/b3ul3RjeiOVyQvAEie6cn2iamlq3aVmW
	2RttH1fJGvRNJLGKXVwcEiFFv2qG9pIU7YMlGukqNltRivQ3A=
X-Google-Smtp-Source: AGHT+IFBqbnUdLiitufbLXxaAIrV+TzMyJv1ak+Y8tA2k06O+SGSu05Ga70FrDqE5JlHGr/Uin8JRB6H8itaAnItfvE=
X-Received: by 2002:a17:902:ecc2:b0:223:4537:65b1 with SMTP id
 d9443c01a7336-22fc9185f13mr189423785ad.36.1747080413803; Mon, 12 May 2025
 13:06:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250512142617.2175291-1-da@libre.computer>
In-Reply-To: <20250512142617.2175291-1-da@libre.computer>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 12 May 2025 22:06:42 +0200
X-Gm-Features: AX0GCFvfd5bSiWturfPtggiMZTkGOscolWitajhj7zf65L0D-tJWKFL1VX0LLFs
Message-ID: <CAFBinCDJguJPfA+xpCqaeUTdTHqYHNNoZQXUdw6yy6o6UVvN3g@mail.gmail.com>
Subject: Re: [PATCH v3] clk: meson-g12a: add missing fclk_div2 to spicc
To: Da Xue <da@libre.computer>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, stable@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_130655_182797_50EB0196 
X-CRM114-Status: UNSURE (   8.41  )
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

T24gTW9uLCBNYXkgMTIsIDIwMjUgYXQgNDoyNuKAr1BNIERhIFh1ZSA8ZGFAbGlicmUuY29tcHV0
ZXI+IHdyb3RlOgo+Cj4gU1BJQ0MgaXMgbWlzc2luZyBmY2xrX2RpdjIgd2hpY2ggY2F1c2VzIHRo
ZSBzcGljYyBtb2R1bGUgdG8gb3V0cHV0IHNjbGsgYXQKPiAyLjV4IHRoZSBleHBlY3RlZCByYXRl
LiBBZGRpbmcgdGhlIG1pc3NpbmcgZmNsa19kaXYyIHJlc29sdmVzIHRoaXMuCj4KPiBGaXhlczog
YTE4YzhlMGI3Njk3ICgiY2xrOiBtZXNvbjogZzEyYTogYWRkIHN1cHBvcnQgZm9yIHRoZSBTUElD
QyBTQ0xLIFNvdXJjZSBjbG9ja3MiKQo+IENjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gIyA2
LjEKPiBTaWduZWQtb2ZmLWJ5OiBEYSBYdWUgPGRhQGxpYnJlLmNvbXB1dGVyPgpSZXZpZXdlZC1i
eTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNv
bT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
