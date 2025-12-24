Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943E1E7849A
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Dec 2025 23:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NuflTmKpAwLwjTLHTBTEq/NTxm0Mtnsk081ftw7ZUa4=; b=O1PJpX9tgf5lOu
	fg6b5AIKxCFp3kSb5ISbTX48kYTd3kVr2L713NIh52FKVIvp/RPCM5GekMDW5ybcdxHpxr1Kh5Ujx
	oY3Q8D9vo2WGlojHe8xcVFlBFano2zIj/3sgXW9R7yf06lyjDg22GIUFT7SjZmR1VQY0ugXibars+
	6KHis9oIDwN7583jXNr//QY8F/7R7iBYt/fMVdvviAolR+WMvlbnZAi2x5jZG782djzcN657SbBdU
	iAHPk8kThZdtQS7ImOh2z2y1r0iqoKjdhFHDV80k4P7pZrXACC3PAYrdx0WsS/4WPwNpcHiXVkxHp
	VtnAEsILR4UX1bE8zKBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYY3Z-0000000HU5I-3scJ;
	Wed, 24 Dec 2025 23:14:13 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYY3X-0000000HU4J-28cU
	for linux-amlogic@lists.infradead.org;
	Wed, 24 Dec 2025 23:14:13 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2a2ea96930cso71498955ad.2
        for <linux-amlogic@lists.infradead.org>; Wed, 24 Dec 2025 15:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1766618051; x=1767222851; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mnvkjgIQSMZ2fFgOTGmGi6iMTWpkoVAzbb+DAbZva44=;
        b=mAdJTpj3fntBD3onzRz0SiCkRshwfdj9VIQhdnjGOThSOtRFuHpXQjvR+aKP294mZd
         +L+Dmyi2sQEFMi3aGk/+hx7Vefquo9SwzLj/fmEjo3HSOMd8vOVSPOrFeDELJeWVQCAl
         R0djKoD046/8YPgCrF21nJrfmQtAavJRSoyuUzez0NfAFz+3/6yNDFmL9BSOmiQHk02O
         2jU53EzeS0kU7YKuk/I/A2F5RSQxhGiYDeFBjLogP8mb3ihYF4Xub9w+01gJWRuMnGNL
         BSvPqqTSQpLQbLzymQbK+VH6IroOfNjeFNCqSJv0aLNduNUSMiQyjmCmDgxHj0Mpql8N
         TP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766618051; x=1767222851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mnvkjgIQSMZ2fFgOTGmGi6iMTWpkoVAzbb+DAbZva44=;
        b=UgP8XLCAyuK0wO1swh86a3rBFGShse/G2yspDODKiPfed6Xg7acQ85z9pd8GiE3oJU
         hNyVGfn4/d++CwKcMj4vOqFJRGgU84bwNe27hYZEiXEhMGUkrtBqSr3icm+GOT7r7uV4
         mncgXOK1Hf1vsKtVLSEZOPIKjdVHqFmJb6Rc/wtnZ30E3tEQUwGoynP8rL1pPXAbVDXf
         AOw6c3H/byeJpDEdAIpkoKFB/IhpU7u0AW8vl4waC/XcUF56djtBiJKLb26yjipsgCcP
         8ylc51jWRGSi0g5KA5kA3zCFMasnaEmkcOR/JydAt8a5P1Y7vXW3hkf2SumbiYzB9NSv
         NDnw==
X-Forwarded-Encrypted: i=1; AJvYcCU03sLBHvTNbyUpBp0zhNDwihDcf9Y6/lMiKtEoYK0ZVQ+BwJILdEGEuD/2H4yGs0ZrPVpsfM++c5+g6i+n@lists.infradead.org
X-Gm-Message-State: AOJu0YxXp6CbLLGRBxWjWp8RKy6s/hMmhoWqnDC1ZiIeEEXrAPsZ3mIs
	5iXhCSPV8r43EXgfJ16wUg1dPupb4Wf0bzmXIwwE7GCZxLRWkU4joAYW9kFGPpJFFifom1CcTqr
	2C1ZCfLg2k+7LoverX36T41WM/Mn58hY=
X-Gm-Gg: AY/fxX7W36Lu6Y+EQfjtHzER6clPNI/qf0CxeAsRtetXSMYdvh4grBf3j78+x5oEBOE
	QUSnjWwcNPWaw4ZWrZvQPYuE+vsM6irO1krvyPeVJH6eVEK2LpSsTWRbBwpOkjjWPtqLToxg+XU
	c+sbTuuPXv6zzg42w9PFv+UFKNzk4mXEPGveDyNCH2x7M23AOCW4XZ+Fr8ZM4Jy2DGN3zADrsox
	Mfi2frSHmriZdYGSjtzu/E9RNuooPN4izgLbKrbx0xWZZH3UC0m0OQTXO5kZSzzDmefJmuAF7It
	zzcjBPSFpgQhOINMGv0GIiarSqux
X-Google-Smtp-Source: AGHT+IHthi3k+zDs3P+SAzII25k4eUepCwUdMrIiQFOSCpjScqeZekCj2A3iuJPwCzJEJ7RsstWKD7g+YL5nj1HOeaY=
X-Received: by 2002:a17:903:3d0b:b0:2a0:c58c:fdd2 with SMTP id
 d9443c01a7336-2a2f2425808mr216050425ad.26.1766618050651; Wed, 24 Dec 2025
 15:14:10 -0800 (PST)
MIME-Version: 1.0
References: <20251223-reset-s6-s7-s7d-v2-0-958f341449f1@amlogic.com> <20251223-reset-s6-s7-s7d-v2-2-958f341449f1@amlogic.com>
In-Reply-To: <20251223-reset-s6-s7-s7d-v2-2-958f341449f1@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 25 Dec 2025 00:13:59 +0100
X-Gm-Features: AQt7F2oZyQySwMduACSiQD0byJ5Z4QahdWpmskA1qiL1ybEip0B6Y600HDmvFRw
Message-ID: <CAFBinCAYWy_VFY8a=AAGpv1+7f5AkWnHk3KDH3fqRMTZfjuNsg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] arm64: dts: amlogic: Add S6 Reset Controller
To: xianwei.zhao@amlogic.com
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_151411_936828_621B3ADE 
X-CRM114-Status: UNSURE (   5.33  )
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

T24gVHVlLCBEZWMgMjMsIDIwMjUgYXQgNjozN+KAr0FNIFhpYW53ZWkgWmhhbyB2aWEgQjQgUmVs
YXkKPGRldm51bGwreGlhbndlaS56aGFvLmFtbG9naWMuY29tQGtlcm5lbC5vcmc+IHdyb3RlOgpb
Li4uXQo+ICsjZGVmaW5lIFJFU0VUX01JUF9EU0lfSE9TVCAgICAgICAgICAgICA5MwpzaG91bGQg
dGhpcyBiZSBSRVNFVF9NSVBJX0RTSV9IT1NUPwoKV2l0aCBlaXRoZXIgdGhlIHR5cG8gZml4ZWQs
IG9yIGFuIGV4cGxhbmF0aW9uIHdoeSBNSVBfRFNJX0hPU1QgaXMgY29ycmVjdDoKUmV2aWV3ZWQt
Ynk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5j
b20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2lj
Cg==
