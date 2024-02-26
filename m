Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEEDBC48BF6
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Feb 2024 22:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=np8c/D7Vty0vLKx07jNPEnG2Wpe0xXFR3pv+QtD5dw8=; b=VhP0QL7EvD4txm
	syuQrZ86XyU1HcEvroHzHf+OScCJVfux3uc7IIE5vC/LgTJ6jFLCtuetP2rF3wN5Y9ETUsYJnYw88
	ZXigtih+iJ0ckvjP4891mHwCsZhJY1Qbj7OOAZp51qE4IQkYl3vwkpQgqDFdcDZ9CU8H3mkuTIbtK
	E9nMUfWtlqetK/nz59L8g+Ag5bn0jF3XQ85Yvp1ojgAgBZdxldyaY6CY+39ES2ptOfIftznH6gdkf
	yfa3gtiT/9enKV2zzDwATB807wwmvLeHrP+R0fEOu9ya+3VKpuviim9STqeYUwVOtwpQ96EaOtQbF
	MvZIseHQv04f/rLG9BvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rej5i-00000002my7-3i7M;
	Mon, 26 Feb 2024 22:04:54 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rej5g-00000002mxk-0zZZ
	for linux-amlogic@lists.infradead.org;
	Mon, 26 Feb 2024 22:04:53 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1dca8b86ee7so11268745ad.2
        for <linux-amlogic@lists.infradead.org>; Mon, 26 Feb 2024 14:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1708985091; x=1709589891; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iYS44GJnUglVpw16XRePCj/31ios9ZoNG/L6JcUmnys=;
        b=WcXE44dxE4fErrDlW6y41cbkZ1pNvvpFuFcSsgZju5dSxOjob9hQEaHCjw4Hk23A9l
         XzFi0NMRgGXWP71X2u2QCDkcp0jeJk9lZ+8me78aFQFgZKLIXi0Cg/DM+7AcHThjIaiN
         SNuuBtz1QNXSnm3hmw/6aa0nQEpa93AuecwW3DhiDWzGbK893q5JAW/XPTKycKOykwhy
         hiTKC+iaR4EA9Mk4h2gtmgh4Wwzv/h7iOW94zByi8gGNXwms/Pk8ZD5+9g2YAbsPgKxW
         OxNnTevirtjthrwdTOisu0d9SiZzKrG/mIGiscrViFXuL8y5k/sZqURUzlmwmqOgrsiF
         K9ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708985091; x=1709589891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iYS44GJnUglVpw16XRePCj/31ios9ZoNG/L6JcUmnys=;
        b=fdqox9Rfj19k3O9JNj2lUH2gCdEWe+4120VOxwRgRGaqQbyo7Qtk3DVhaxkKXxd4xS
         kYQMFWJVoqrr/2n7OYlvgRfnLC5ZenZQ5HpCG5f5ldYRso+0wI+4cRCbF/f0oozqrfSz
         OxEj042lO4eD6vNF+LMtbP4wcJnIqr0HluxljvUAmuXtbPO1SdKbuCNxAwpTk6BXY6Bi
         70iXU5aUc1JN0+8Khfa1dJvenefC1rFnOrbiUw9pK2fKpXIWys/KqJkFNP+XG9AMAKAi
         w3aIETHA5cXMnfE2JESA8rGZ78PcVh232rOEIX1FhjI5eM+vQf/iluEzHckIHcbjoZkP
         PypQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvkTDCQAjwuh9lMdVe2wc8/uHqlnPY6N5Ot9sYa7LeNOow0EGTWlMZ2ZYfmOGYj9b4rI1gqouA0dK+cNEAbK2xqM7dXsnlwPFvLFjDEXAqJ0k=
X-Gm-Message-State: AOJu0Yzi7kick+3xcIR/QxY2HlTwLVIxFHfLa+RHiBlQ7DlLSirpus9U
	SVvPc/8zQawyGKoxNV34Agws83d6K7hAOTXLLc9vhsCqwFKi5vznntcHcksD83W7KhgRd49rH9N
	Lz0QEjWU5OzoyYVV98CxNlYB/DWg=
X-Google-Smtp-Source: AGHT+IH0mmWf21ud0BhhK6Inle4DUDOZf8NRaH5wh0RvBVjgneDT1DxKJRtsK51GZj3Mt43+iDf2MZKi7JEobZ0VZpM=
X-Received: by 2002:a17:902:bf49:b0:1dc:7bc:cb49 with SMTP id
 u9-20020a170902bf4900b001dc07bccb49mr7365633pls.60.1708985091116; Mon, 26 Feb
 2024 14:04:51 -0800 (PST)
MIME-Version: 1.0
References: <20240224084030.5867-1-krzysztof.kozlowski@linaro.org> <7d9221e0-8165-422b-abbb-e1566a7a733e@linaro.org>
In-Reply-To: <7d9221e0-8165-422b-abbb-e1566a7a733e@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 26 Feb 2024 23:04:40 +0100
Message-ID: <CAFBinCBRufbcoOvF23V0ObdJ_2tt-WjfkN=pPphTz_FiHpPvTQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: amlogic: remove unstable remark
To: neil.armstrong@linaro.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_140452_322396_AF161859 
X-CRM114-Status: UNSURE (   7.36  )
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

T24gTW9uLCBGZWIgMjYsIDIwMjQgYXQgOToyMOKAr0FNIE5laWwgQXJtc3Ryb25nCjxuZWlsLmFy
bXN0cm9uZ0BsaW5hcm8ub3JnPiB3cm90ZToKPgo+ICsgbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCj4KPiBPbiAyNC8wMi8yMDI0IDA5OjQwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOgo+ID4gQW1sb2dpYyBiaW5kaW5ncyB3ZXJlIG1hcmtlZCBhcyB3b3JrLWluLXByb2dyZXNz
IC8gdW5zdGFibGUgaW4gMjAxNyBpbgo+ID4gY29tbWl0IDdlODYzNGU4MjFlMSAoImR0LWJpbmRp
bmdzOiBhbWxvZ2ljOiBhZGQgdW5zdGFibGUgc3RhdGVtZW50IikuCj4gPiBBbG1vc3Qgc2V2ZW4g
eWVhcnMgaXMgZW5vdWdoLCBzbyBkcm9wIHRoZSAidW5zdGFibGUiIHJlbWFyayBhbmQgZXhwZWN0
Cj4gPiB1c3VhbCBBQkkgcnVsZXMuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtv
emxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgpBY2tlZC1ieTogTWFydGlu
IEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
