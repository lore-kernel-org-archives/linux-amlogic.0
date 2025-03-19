Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D65C36001
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Mar 2025 22:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8LJgA3+zEnshDpW+n7Bi9CEe/RbVArcnqksJIn7UXtA=; b=aeCVCclOB/jTa/
	ApTtw3J6GSfFczVo6e6aooB9pExqRnxo9/4/OvokAfhau3cfWugvVULbi2qjigGl2s6zVqY43LJ1X
	0gZT6cabz3YZ/gL8xxTM5cD1DtXBzIPcOYB9accVj7P6lq+36k33SeEwa1s50rqT64KHgMzuWYIa+
	erfTpGN6LCacNfuklI8W1OGsahy0KKcVihcurY58/DNtQg2dpls4m+rSSABJUm7l1xL3aXQhlJgCo
	5sMCiLUz+YC8ROLyVg/hwjDuTELrqbkrZ7uarhz1tXgJO7jRBUat9VxJDntiYu9z5F9toN/96DVSm
	/WEis6YKKMQn00shiwzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv1wG-0000000AIKS-3bJs;
	Wed, 19 Mar 2025 22:31:04 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv1sd-0000000AHkY-2SKO;
	Wed, 19 Mar 2025 22:27:20 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-225a28a511eso1277385ad.1;
        Wed, 19 Mar 2025 15:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1742423239; x=1743028039; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SNYERNhRSmEwITLfpZYCCLoI9bGljSTelP1WrYbn7WE=;
        b=Cdm+CF0EV3KmNrukhKIhn7uR8+GZd+r6fi8wDhsdB3FAm6r+amdrx07Y4IO84NKUHL
         W0LrK1vA+66SKCz3UrAvV2eQG4p6rfV+vz7PCwcSftVa4SP78l3PnUHlAJvtafB6DnY2
         jkZMLLPtNnHO9rizW+u4j889tEkUg+Lo+gdTAGCHtqNyxdLOhYxXZ02zaiVS1TK37Eq7
         sWPBmbNaj1+91RSh1ot1AQ4g8pCsaiY5SG2k5HTnc4Xixi94F3zIFaUrNkiHEvERr31v
         U8SbPaQ7JV92YmWV/wMT768hmQNo7ptCFiQ4b8XG6Kq76/BAS+yrgNCsekTU13rBXTdj
         bJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742423239; x=1743028039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SNYERNhRSmEwITLfpZYCCLoI9bGljSTelP1WrYbn7WE=;
        b=FRQIsawZGlMsJkrCGsDDwD4cAEwLQYT1w8vc/qhSPl9R76xkkXMHkvwFA6mngjvqEt
         c5J1o/00KGwkY3y+5YokNE6d91JnxV/wwpB3XLplCssNIYrhKFh8nVyDn873UKcgdILP
         MFoEYOVksFyMj2qrqFJa4rQH6V8f/Q5yDwOdXaxpLw6K/r45/53oHASZpq5/ZNBJbND6
         fZ3zU4Js2lUOapL+R0jAtoUM00ANJfhaSmUp1RKRjPTOikIIlU5wrJPGYOHX2/4EzwHS
         UEvjNEmBlkcmCFw6Hq6PxSQy2jZO5WtaUJC/ueFMh6cx8MVfc6IS3SkEZM0kyYNICsdV
         UDpA==
X-Forwarded-Encrypted: i=1; AJvYcCUBCpQFU/RgHgKwiguyJPR/mXkV0YcFV2yMKSNxWJcYmSlt5ehjbKsXm9i+7NnJL/yYm4rQ5XsHDEwaFwme@lists.infradead.org, AJvYcCUMfM5Uql7SjWqxPf0uL7jTPJbIyB+oR0yH5pAANcPVEOKOT91YD59BIjS/T9gsC/NI5vwT+GII/y9xDI4qlxry6Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxihl34ZRchLqhJTZ79v+X7GO4EgkYTArB6gAdHwcqA6jEGYuwo
	l4uo6fnkjT/I30OzEfjxleHO7VoX1Ta13BAJlYAiUw/nHPVH1d6EBJFFTHloRSXymGWj/6g6Iaq
	c0wTZbtt7fXeKX/y+RLPeoO8KPR0=
X-Gm-Gg: ASbGncv+JtHCHQwupacIIAG6HCu+KKL57N7xUC2XOAhaw1aUoNbmP7iTRttYwo9ydKj
	kE+0Q+zU6IRHXG+yPziD+Ol0N0RkYGCWLzQiJnUFNv798HPstJjDjbfJJAmrKrZA+YKkwhIEZlD
	v1eFmvmmMmodPc2ENl4w5t4OkxEf14ygMncYSJslv26TRngnqnvwL8sq610/E=
X-Google-Smtp-Source: AGHT+IFAWS2OHB1m+Vc2vxoZrF2uLP/QolfYKiuDmkj1RM7T3/ht3qZtnjLSYd3ujmhvShSgAjncLaYsLA0qAzPhp6U=
X-Received: by 2002:a17:902:f693:b0:21f:68ae:56e3 with SMTP id
 d9443c01a7336-22649c8e7e9mr52422045ad.39.1742423238640; Wed, 19 Mar 2025
 15:27:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250319190150.31529-2-funderscore@postmarketos.org> <20250319190150.31529-3-funderscore@postmarketos.org>
In-Reply-To: <20250319190150.31529-3-funderscore@postmarketos.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 19 Mar 2025 23:27:07 +0100
X-Gm-Features: AQ5f1Jq_ZECwLUjQyBqdaX25O07PIZ7e5glTPQT7D1by9iVmLwmBmJhYAj9-cEY
Message-ID: <CAFBinCC14dxYHWO1yMrGyvQigVR+h9qGaxUNjL49WXh-p5XMNg@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: arm: amlogic: add S805Y and Mi TV Stick
To: Ferass El Hafidi <funderscore@postmarketos.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_152719_624143_6B8D3542 
X-CRM114-Status: UNSURE (   8.29  )
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Artur Weber <aweber.kernel@gmail.com>, Rob Herring <robh@kernel.org>, Karl Chan <exxxxkc@getgoogleoff.me>, Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, linux-amlogic@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBNYXIgMTksIDIwMjUgYXQgODowMuKAr1BNIEZlcmFzcyBFbCBIYWZpZGkKPGZ1bmRl
cnNjb3JlQHBvc3RtYXJrZXRvcy5vcmc+IHdyb3RlOgo+Cj4gQWRkIHN1cHBvcnQgZm9yIHRoZSBB
bWxvZ2ljIFM4MDVZIFNvQyBhbmQgdGhlIFhpYW9taSBNaSBUViBTdGljayAoYWthLgo+IHhpYW9t
aS1hcXVhbWFuKS4gIFRoZSBTODA1WSBpcyB2ZXJ5IHNpbWlsYXIgdG8gdGhlIFM4MDVYLCB3aXRo
IGp1c3QgYQo+IGZldyBtaW5vciBkaWZmZXJlbmNlcy4KPgo+IFNpZ25lZC1vZmYtYnk6IEZlcmFz
cyBFbCBIYWZpZGkgPGZ1bmRlcnNjb3JlQHBvc3RtYXJrZXRvcy5vcmc+Cj4gQWNrZWQtYnk6IEty
enlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KUmV2aWV3
ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFp
bC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==
