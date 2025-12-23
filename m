Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA56E74900
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Dec 2025 23:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=htIDoEKcr88ZNNabZ3pPjBsqJWeBRY3d/zSCGBYeHYU=; b=wfvVxS3wTNkC/R
	NCdmnG4Sw6Xs49t6FfgmyY7QS8HZwXxhtCYGXFo+pKh3w0m5R3qoTqlchhu2r+PO6mCH+S05THldm
	wKdX+daiz0jCRvhYuKCJWM5KOPIfpPkO/3h7HtVgKa462cG/coUnow/1W9GWACHXvAtiJcKkYaJ+/
	5bgbhK3yWjNwFPaM57rkNNp//icDKjWdGcQD9PFZ6fI5t4CMj+ipOkY29cKjzcNa4FRCwwTIQsG4Z
	J8PgRDzzWk9Q3cz3ZEKJSw/X5M2FaGhQwwuTKWzgrWHPVPq0a1c/ILtPAKGHtd3O0tgI6Trwr6LHd
	tNuOi0G42upOHRuXXSzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYBV6-0000000GAYL-3SW6;
	Tue, 23 Dec 2025 23:09:08 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYBV4-0000000GAXh-3v8z
	for linux-amlogic@lists.infradead.org;
	Tue, 23 Dec 2025 23:09:07 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2a110548cdeso76241685ad.0
        for <linux-amlogic@lists.infradead.org>; Tue, 23 Dec 2025 15:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1766531346; x=1767136146; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s5HLf0q/HBK2oOHSdb4C+e4jou+vH5BBgCwzF7L7zWA=;
        b=kXHiZoDrJfQ47oVnFVohl4oJwiF9/3YyR/QI6+Kb94E97Ek/HnteoiqqCRENdjq3zT
         NZ0Qe8f2aw9Riu/U5bNqG5+C/aV5Q0hKbutN4PpJ2Yx0dQOxnS/wsD2k3kWgXBtx3SGk
         rD2Dx5d7OvjNy83ZXmZdZQPF/N8Fdxf/4ASvcCNor8OjT2lvQpa+PJow6MDsylVEM/Dz
         QKi5agIyOTOn7cZMXsa27/da8Zd/SuKJu6fWY2EJqqkmXhpV5NK4fL+EEu9JmMlmEh2D
         gK84KxV9nFB8PFmRIZw+quv38N95tkGR12ehG10e7ydjowSeiNpXIHBbZWg03V9DH/sa
         4Psg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766531346; x=1767136146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s5HLf0q/HBK2oOHSdb4C+e4jou+vH5BBgCwzF7L7zWA=;
        b=TytqT5sAXpoHrF8QjtWSEdKzPmHemUtUCSFjdUTvJKWDMRFk/sIgTXIVtKmMAkKMgM
         jXjfBvj/piFliNrGm+Enw7qpyrhOyT6x8SZQJBaPH6XusLa8r3IZcJb3GDloqmGktjAP
         jt5GAIVaSlWoKoParvirOlB/U87P5zsCiv6ScCy1ymOxvq9M4bC2ZD0y53L6PzPc0Rmb
         poI3qwmjw9RCK/Smm4Zp5LYAjBPsZ8yv6lpRdERiA+8rXWEqOTxV16S8nTUxO1qZhTIz
         qBN8PrGTjJarGlWzJON1BC5c/jVyyY1nwdMDwyUBk/fPH+vFdBgZE1LtrjkzDmux3fWM
         A0jw==
X-Forwarded-Encrypted: i=1; AJvYcCWKjnGNBl2af6W+JeL5dk7SYgAU9M3zviI1eelYokNfmm/8ByBtgxifXQBRS6awKPWenbiVDZ/7LA5E7E6/@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1ox8Jnr/h+9FglmGm0EVoqp1S1yrGAxJQIbIRJJmy5VYWkuCh
	7Ih4ftFJuGy1YrnRqwY7gIqoEttM8Ut5q/51ZQeYOEupnk7U/bGHW3hcJI6OltJm30Eyc/yA5CA
	pIwg3Ve7ymtak9TQnieB9v+zzlmjSY7Q=
X-Gm-Gg: AY/fxX5MB0ZDcWa3i8eTXAIzhi55efwRIhgKcmHunitMbtpzq7GKoE4DS/rjvUmFTxA
	9jrJhP7N/X9b++ly1BDlMmVpNFQlP7Kb4NLtXuqs3jmOCEFfDj+WLluYP0Fktac06CFemXRFi4P
	aopC5hI4I/b8EqvoxJ9rAuOgqy/ktofb4zRJArp/cMV9JmrS9VRnIw7oWV2GdV1p9XE1qqjXKMT
	oBYl5JGwwa1IMzDJiRSXA1+dn57oUq1mUYk7COeXCe/Uu98A0CuhrcC4GotuEGl8rorQ8GpqdfL
	GqTo5UvQ4XdeUl+4dhsS3SSozMfR
X-Google-Smtp-Source: AGHT+IGBrwwKbPhbobxkI6bshU6oq1etWG3LvLOZghvlBp/QMqJduCm7VfQs3SMLxHPscaSzyW9EW2Lww4cnklC427s=
X-Received: by 2002:a17:903:40cb:b0:2a0:f0e5:3f5c with SMTP id
 d9443c01a7336-2a2f283109dmr150600085ad.34.1766531345642; Tue, 23 Dec 2025
 15:09:05 -0800 (PST)
MIME-Version: 1.0
References: <20251223152510.155463-3-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251223152510.155463-3-krzysztof.kozlowski@oss.qualcomm.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 24 Dec 2025 00:08:54 +0100
X-Gm-Features: AQt7F2ohr65ds1Igq3hU6u6MsL2NTAZeKeUfhxNv0PkSbOldUx4jDRZ3zotUZaM
Message-ID: <CAFBinCBt-Ra__iNTPP2wqbo00VThDQrs-sUWvBR_FisgNwc2kg@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: amlogic: Use hyphen in node names
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_150906_975939_C5F56008 
X-CRM114-Status: UNSURE (   6.65  )
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

T24gVHVlLCBEZWMgMjMsIDIwMjUgYXQgNDoyNeKAr1BNIEtyenlzenRvZiBLb3psb3dza2kKPGty
enlzenRvZi5rb3psb3dza2lAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBEVFMgY29kaW5n
IHN0eWxlIHByZWZlcnMgaHlwaGVucyBpbnN0ZWFkIG9mIHVuZGVyc2NvcmVzIGluIHRoZSBub2Rl
Cj4gbmFtZXMuICBDaGFuZ2Ugc2hvdWxkIGJlIHNhZmUsIGJlY2F1c2Ugbm9kZSBuYW1lcyBhcmUg
bm90IGNvbnNpZGVyZWQgYW4KPiBBQkkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296
bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQG9zcy5xdWFsY29tbS5jb20+ClJldmlld2VkLWJ5
OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29t
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
