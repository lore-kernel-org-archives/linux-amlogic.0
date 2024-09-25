Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69823CCF9E7
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Sep 2024 17:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+dxFsygmYJS5u64Rb1tnHWJ90zGOlj+R/yAOgji3X/w=; b=oC185lZhnxkNbL
	9icAxHV8jaxzjuLUQ/yyknbDQwkCafCWGUUNskvLJrWo8PpeLXlXtVsKe1qodCFLp2JdisYUPUyN7
	l0Sz75ishBWT86xdwNKvZhZz+R4ki62kTxYiSSPDJn8NsAU0m/Nludc3JNa+yw9npbfJFQAmbbPnb
	qidPVuPkkcNztcyCunzHEzgYCNjmrnqR29pGKhSTymHHgWwe6p7A7sHhn+OncscaYEVHbYCWjeA9A
	ijqiOR2a/wVrqzPzxhaogNH8zbY/7sW4hvWO+gbSEPbnWFN01TTmzrg90uyatgYPC0eXtF5r/RkY8
	yNyCSgtUfbmSPQ/ygFTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stVvQ-00000006CUg-1uuo;
	Wed, 25 Sep 2024 17:35:40 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stVuE-00000006CE9-3lyr;
	Wed, 25 Sep 2024 17:34:28 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2068a7c9286so457235ad.1;
        Wed, 25 Sep 2024 10:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1727285666; x=1727890466; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d1E4RT0H01/3XOdkjcXImvKyDWlOUp5njzyOvR7rg/4=;
        b=F8hkb4+sVoiiC48rc+DYAhP4T/s/TvwxlnRCluYuvI+O3E4hbwNVmDP1nfAHuWhq6i
         +zXaZP9TWiOE2EGGEC1WzHHIaOxBZytfbrUtsr43RVaG7TlAj1Ht6ygxHSwt6eE0tySz
         hh55XiOA1mVOA9gz21cMrMASW9YnkIUZLiC1neb/lnJxutxM2TDgpRo/UkUZ+fZ2GbMY
         3+qiC1P6QI3w/a9fSYURqH/F6McdC8uf1LpJWxMmk7OoGbQbqIa6SX5XGbcxerqarUwc
         NKzrUGJKNLgcmndMjIjtZGCWEV4k0au4EddeWfL2Xno0EsGeE3uHtt2DX3G/vuCzPQ8K
         mNMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727285666; x=1727890466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d1E4RT0H01/3XOdkjcXImvKyDWlOUp5njzyOvR7rg/4=;
        b=UrxbK6C5HyhZSH9nNFwI02BUjUULWzWSHBzUT7stUVuzQaR5lO2BZfetJCR694CGim
         Wh0vqSLZlr5sQ5cJzjh9jniw/ZF3rCryik+m1ClbSTuXVj37XyZrQL7mVut/G2hwDbzb
         LNUM96omh+upYrGBRzhG4fmsR47G+w20CR62LGK90WF54iTWHte87Smgz6s83M0grivp
         qRHCBNwN7uE+BNYnVRZhigSlaw2icqzrUm5t9knH6FCLGmiiQMKritsvMrwU9Jy3HJhs
         nFaYYOwzc2OS3C+qV7lcKvG1Cf34k4KFtdMGm5TBuGFU42jmbzZ1DT9LTP5vqcz8O/eN
         xeng==
X-Forwarded-Encrypted: i=1; AJvYcCVMkhIxQ29O5F1KUWxU2v3bXim9zOt1tPOdQDq7bN1IZwerlu4KlGPf0W2Eq0wqwcTT/lq5XbSg2VrkPhNQwYnzDw==@lists.infradead.org, AJvYcCVV23OKISBeqrPv9I6GCagFyL1R+9jjVmKHyQowN4WnRzMXibxBU20vSXkwPYkdIaeyHMn8DacnwI5Z0DEH@lists.infradead.org
X-Gm-Message-State: AOJu0YxcCPh3QaXQm4QlECs3TrhY50WMj6h1dJgE23cp4W4smF2oc5qw
	F/zQDG/lZWJQEVaaM+R/aU4yzb9bb2l0in3ZZYK5RpN2j/2ijd/tdBAJtpJrQpmUumvsPX6ANnx
	uN6PgXdAHTKxNY0J+YD6LdG8UN20=
X-Google-Smtp-Source: AGHT+IH694n5wEuALNHctrwi3lZcE5YKzgjYaWIr2csNfOXbQ94OBeuiNlhEeDltpC2ncyhruZFRzQqtChN0vurPm3g=
X-Received: by 2002:a17:902:f788:b0:205:5a3f:76b5 with SMTP id
 d9443c01a7336-20afc47d818mr43818595ad.28.1727285665891; Wed, 25 Sep 2024
 10:34:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-0-0b20ed4f0571@linaro.org>
 <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-11-0b20ed4f0571@linaro.org>
In-Reply-To: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-11-0b20ed4f0571@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 25 Sep 2024 19:34:15 +0200
Message-ID: <CAFBinCB7yv+RDNmAwXEspyaqXw9CkHhOq=bzFTU+QobZmz6pOQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/11] ARM: dts: amlogic: meson8b-ec100: add missing
 gpio-line-names entry
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_103426_960608_A978B0BF 
X-CRM114-Status: UNSURE (   9.36  )
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
cm1zdHJvbmdAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBUaGUgRUMxMDAgZ3Bpby1saW5lLW5hbWVz
IHRhYmxlIGlzIG5vdCB0aGUgcmlnaHQgc2l6ZSwgYWRkIHRoZSBtaXNzaW5nCj4gY2VsbCBhbmQg
Zml4Ogo+IG1lc29uOGItZWMxMDAuZHRiOiBwaW5jdHJsQDk4ODA6IGJhbmtAODBiMDpncGlvLWxp
bmUtbmFtZXM6IFsuLi5dIGlzIHRvbyBzaG9ydAo+Cj4gU2lnbmVkLW9mZi1ieTogTmVpbCBBcm1z
dHJvbmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+ClJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1
bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgoKSSd2ZSBiZWVu
IHN0YXJpbmcgYXQgdGhhdCB0YWJsZSBtdWx0aXBsZSB0aW1lcyBidXQgbmV2ZXIgbm90aWNlZCBh
bnkgaXNzdWUuCkdyZWF0IHRvIGhhdmUgY29kZSBpbiBwbGFjZSB0byB2YWxpZGF0ZSBpdCA6LSkK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
