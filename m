Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944EFCCF9E7
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Sep 2024 17:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KGcGJkIOolfYEUKhoqYZfFIuhQrUve8xRw2KRpKeQVo=; b=DQC7QwhsnMYbGB
	oNFWuTt2Dr/QiPhwsnruFYorkV3zFqgtDO/NQEdKTF5eruxBbPcIBtvEYpFZflGq9Pmce0AICpYxa
	eiitNHWot3Xo/ibAAJPTXBU7oWucDtrpsPupKbLNELUlG1Y9hEmEG3NurVYf65zX/CVGslQypGEyz
	ZjQthQONaajMthyA7x1tKxoGciMn3HWCHJ7R7JNeyOAhdgK9jiwk57YZh4BiXZvDpSxh7hRnoPhXT
	rpKb8KKR+1ZyfVbWS0e3xiYuD/sneaV0Fk+1c6/EhWFOXAhZ93yQ2fK5cXJ7cLuF7kkDiZulApHDV
	i06bPA5xM+rWeJCunqWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stW3k-00000006EF0-14D6;
	Wed, 25 Sep 2024 17:44:16 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stVzn-00000006DK4-0Qvn;
	Wed, 25 Sep 2024 17:40:13 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2059112f0a7so370725ad.3;
        Wed, 25 Sep 2024 10:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1727286010; x=1727890810; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0VwzsglwJddwnqfAajmvRAfcu2M8rj1kwdCIPhsr4Bw=;
        b=l/H0kZI0jf8I/GCcSEXuQV0PZVw9AmzLG7TGPGNZHD5TKX5JaCKw4Tv8CIiFgdU4PV
         Tk5SkZ7pHLYJyhtvxf+E1gnqXhWTEqBXOgk0CTJRxDjAUeQ0oESDnlXOSCci954v2/+k
         QDUrMk9qpoqhAzAUGbGJfl+H+KacO/f8E6300e+xxEAzoj7o3GS3tFZwYizojKwPKzXh
         fMZ0eFVrTzt6VvaMuVMwoPiNXP6W0/FaMXkEN+5q2rV37puMXnpFS5uT83TJU+0SZXAf
         +1/prQgPPZSGDTLogV9K4ZvGX8MzdJMLAcSzbOyc/ZIe7d90BE7bLYicAfXOBQjFv2Z0
         P9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727286010; x=1727890810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0VwzsglwJddwnqfAajmvRAfcu2M8rj1kwdCIPhsr4Bw=;
        b=nR4ULgymkwzaXfwGzuEp5/EfQQEydgTfl/wOXaZ5WSNs2msd37kKrflQlQeMWrpc9O
         91bnXKPZvGz1XdBJ8kUkoNZ3XSHW7pYvPhf/E5Y2rpGsSn+MVQS3EPZqTyiPnVGKW4IE
         KnShA5WWmYGBL3LKfwAtA0negdgSbRI8y/rqUWwNyiasSWYcSuh7NW8nAlYfn3kVdQlJ
         3x41OD/VXjadfWW0lqZhPKsPmpFrhv2kbG2ktjpD8WemLlOiTxebGvsXIUPB8Abcq5QV
         tvKs035zT0qWSEhbnHTcYxkSp0e0/ryJ6k2IvGaiUKMZ0phlk2Zot3DPACGAi4X6Gwdv
         K2IQ==
X-Forwarded-Encrypted: i=1; AJvYcCVx1oNGSmItLY0kphxzwRh96V1Pw15hEJTKhesnNLEgkIHRpOyuVn7AfbykEP67klEAQWUvDsFKZtbs8Jxt5H9FUQ==@lists.infradead.org, AJvYcCWuHNudH4GD52xdS7DGha9iD5/ZECCA7z1LtqyBB7L86sskj9mjnwryNF6G9nEvQ6pdxSzhNvTIl+mItbaV@lists.infradead.org
X-Gm-Message-State: AOJu0Ywef54qSF5MwNuD6z2/R+XqF/3rJpBApl7dGbAdpmfO2o0PTMqc
	2LhDncPWK4+H5t1bKPsSCEzVc12BMQ/CPKDjou7ON4SsOrFi+BpEZpwPUlNXRcNWryyr7FDrdZm
	uwjZl5+zmQg10UkVcRnHzMGjPnvE=
X-Google-Smtp-Source: AGHT+IHKglkLsmjgQaRMz8Yit0jGozmt/v+TqUhEdeU1yFm+1vrxYNAYbBr4RJVLnKVyf9xVT4d+iBDg713LPJjyPp0=
X-Received: by 2002:a17:903:244d:b0:202:4640:cc68 with SMTP id
 d9443c01a7336-20afc637fe9mr43820845ad.59.1727286010155; Wed, 25 Sep 2024
 10:40:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-0-0b20ed4f0571@linaro.org>
 <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-8-0b20ed4f0571@linaro.org>
In-Reply-To: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-8-0b20ed4f0571@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 25 Sep 2024 19:39:59 +0200
Message-ID: <CAFBinCDEDaj=fT3x0FszuqiBsXLA-4wRJvR0OJiXrGzLwJ9u1Q@mail.gmail.com>
Subject: Re: [PATCH v2 08/11] ARM: dts: amlogic: add missing phy-mode in
 ethmac node
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_104011_168042_9A7BDB9A 
X-CRM114-Status: UNSURE (   8.82  )
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

T24gTW9uLCBTZXAgMTYsIDIwMjQgYXQgMTA6MDjigK9BTSBOZWlsIEFybXN0cm9uZwo8bmVpbC5h
cm1zdHJvbmdAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBUaGUgcGh5LW5vZGUgcHJvcGVydHkgaXMg
cmVxdWlyZWQsIGFkZCBpdCBhbmQgZml4Ogo+IGV0aGVybmV0QGM5NDEwMDAwOiAncGh5LW1vZGUn
IGlzIGEgcmVxdWlyZWQgcHJvcGVydHkKPiAgICAgICAgIGZyb20gc2NoZW1hICRpZDogaHR0cDov
L2RldmljZXRyZWUub3JnL3NjaGVtYXMvbmV0L3NucHMsZHdtYWMueWFtbCMKPgo+IFNpZ25lZC1v
ZmYtYnk6IE5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPgpSZXZpZXdl
ZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWls
LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9n
aWMK
