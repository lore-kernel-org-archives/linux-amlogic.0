Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A57C27C55
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jun 2024 03:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JpWxz7WW5UapiPAtpYjaENvKdk29tOhpRyBgSgsCnRU=; b=Qes4ZQkHvLycNx
	hPYGoMOiAlGEwelvQ9hUwSHSgKl8Ro63M5Rvg+onHMxie0ImQ6Qy55Zk3Mc85L+KtqAZFkXF6X/Wy
	O6eaacN1bCBovr0PgEdORY/GH6eQBaNi617sqhKMNJek3ELN5RyVN40PW0Bs1nG/TWNQNIAYz58Kj
	MObpWy01q4/RXGZ2sDaEt8TRGwQbbemqKi4aXaVtNCg4OSHnysDVdAKEfnDDSbfUo5Th9srHb/zY3
	N3oOWBu951CtV6VT4heAIiUQY/Ct08wyLUsIwOx2pJrptlaNkEt8OCdNqPDr3PSe6UYBug+LvDrFN
	Gu4X959f4/wgl0UTdDCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEh8O-00000004WXX-3t5K;
	Wed, 05 Jun 2024 03:16:21 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEh8L-00000004WWx-0rNu;
	Wed, 05 Jun 2024 03:16:18 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2eabd22d404so18620481fa.2;
        Tue, 04 Jun 2024 20:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717557374; x=1718162174; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=04xAPzHHRLN22wGYvDSc+81bOug5t7dxgEN4MPJ3+BA=;
        b=TbfbeHhvmN7XrlpDUD2hwdgVfdgz0o4FlRe+bGgZOHHgWasTxhYjeP34ij0/MAWo00
         Mgimnj233NgOQ3rnD4UUsQqDljMZNT3VZhPeFjoJ0rl5nJCgeng/DojeSssge8YqgJAl
         6A/FN5btOsJKMeeR/d2anEVMTCrLUmhJw7HBUyUa934JR6O49I8UO21eo48GPdhgi7JW
         5vvTctd9pEH3hZXHnYhSWBvdx+qG36vMWCnYxrB939GMmP8rkrxRCYN7DyG4Htoc2pwB
         bzCUOEbn48EmNdBnrhgTE1/1zbUtpytUoE3C71i9uG28am8NnGa1r8Loe/x12hGMEr76
         TjbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717557374; x=1718162174;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=04xAPzHHRLN22wGYvDSc+81bOug5t7dxgEN4MPJ3+BA=;
        b=qSyG2R8x70jBCbeFDLfumWVVJaSVX0lqPn6aCtWJivvOtDL3xfkNFqhCb3tDkgGnS4
         6T3k7XulC+1wJzOS3Jc2XPWqaIBb5+guOaa+OQGu8nI3g/7Ww58fpZDXha0MaEzxVftT
         ji0Vn1boioBYpcgKjogaog+Gl8jtclrWdR9b9l1QVpiVh4HHOu4EvJRKRq+IBjSrJ+GI
         NAZ3Wf4rrmlds72hphK4pAhsSEfyNzG1diBbcXBPDoSjLY/VQK2gWHPTrKKZneljP/SB
         KRfjT2QFD4y2lgVjo8XMLi5itpiWsB2E7PD0zYHry2BeNpSkgY59APtsQrALkxQJar4I
         db7w==
X-Forwarded-Encrypted: i=1; AJvYcCXgwkcajgt5Y5Nx3onVwsjUo94xu7ZNtTYsu872Df/YISguUky5MrmPiSpw8w8UpKD+5AgDGc4uIwHsBfKz1pKKmnhSHUKAU7Pr2SesEM5KJGvCTL0RE/hQkHqeSTS4gmPI3bOwB/AIS+Vzh7GAj1rx1iLT8sTggQ==
X-Gm-Message-State: AOJu0Yx2YQhOF8T5tbUVDEAaDds3BxhcvrC7qR2DkrT1TuNlQexO/JV0
	TQY4BzfwQzYMobWqKP/wSlCd9n4LbphnwmZbQ3r4nEPqehnPMWDs
X-Google-Smtp-Source: AGHT+IEn3UnSfnLJLoh7YmAsbD4H23Zx0LdCCxW3cgnZIPOfTgWthOubw4aRXW/incMEXo938UnCzw==
X-Received: by 2002:a05:651c:208:b0:2e9:816b:da78 with SMTP id 38308e7fff4ca-2eac798b75cmr4930521fa.9.1717557373887;
        Tue, 04 Jun 2024 20:16:13 -0700 (PDT)
Received: from smtpclient.apple ([167.99.200.149])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215811d49esm4836265e9.27.2024.06.04.20.16.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jun 2024 20:16:13 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH 2/2] iio: adc: meson: add support for the GXLX SoC
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <202406041751.elQWr6cj-lkp@intel.com>
Date: Wed, 5 Jun 2024 07:15:58 +0400
Cc: Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-iio@vger.kernel.org,
 devicetree <devicetree@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AML <linux-amlogic@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev
Message-Id: <1E90764E-5D50-496A-B4DC-3D3982392183@gmail.com>
References: <20240604055431.3313961-2-christianshewitt@gmail.com>
 <202406041751.elQWr6cj-lkp@intel.com>
To: kernel test robot <lkp@intel.com>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_201617_270658_981B58F3 
X-CRM114-Status: UNSURE (   7.83  )
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

PiBPbiA0IEp1biAyMDI0LCBhdCAxOjEw4oCvUE0sIGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50
ZWwuY29tPiB3cm90ZToKPiAKPiBrZXJuZWwgdGVzdCByb2JvdCBub3RpY2VkIHRoZSBmb2xsb3dp
bmcgYnVpbGQgZXJyb3JzOgoKQXBvbG9naWVzLiBCdWlsZCBlcnJvcnMgYXJlIGJlY2F1c2UgSSB3
cm9uZ2x5IGltYWdpbmVkIHRoaXMgZGVwZW5kZW50IHNlcmllcyBmcm9tIE1hcnRpbiB0byBiZSBt
ZXJnZWQ6CgpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtYXJtLWtl
cm5lbC9jb3Zlci8yMDI0MDMyMzIzMTMwOS40MTU0MjUtMS1tYXJ0aW4uYmx1bWVuc3RpbmdsQGdv
b2dsZW1haWwuY29tLwoKVG8gYmUgY29udGludWVkIQoKQ2hyaXN0aWFuCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
