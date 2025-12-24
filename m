Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37EBDE78498
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Dec 2025 23:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lYm48Tj5H0D5MmMqOCTsXw9tilnJqwXj/HsTHqOGkpA=; b=GlSKHVzsI0eicb
	r4mEwGYQZtxrKl3o552bjmL+BeUmtIypGaQdwetzzNjVlrPyACPtPjtWTiXjbXLxkpINKlQfXV6O2
	ulnLt6Y9mTCtu8lQUz8qpWzWAS2ttHdj3/j7FnKgsNSipjl25gk+AKiHuM01GR1utxu2AFV7KIujT
	XNTBjM8fIMMdY+PUx/HIBElkKl+B1HbTdWCj0f5n7tOz+5m3E3zNjYQXlIA0cd2zcY52ghoaicme4
	8aHvxO4n9ezyz0FcHfaB9czRFTzmqNdTmsw8QivZOnku3nYis2k67EQYarVwZKsmkaUTjdU6eJ3Xl
	hLlb+uNkCftyfZ4B6jCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYY2k-0000000HTyi-4AkU;
	Wed, 24 Dec 2025 23:13:23 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYY2h-0000000HTy2-35mO
	for linux-amlogic@lists.infradead.org;
	Wed, 24 Dec 2025 23:13:22 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2a0d6f647e2so100581095ad.1
        for <linux-amlogic@lists.infradead.org>; Wed, 24 Dec 2025 15:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1766617998; x=1767222798; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39eKp0lre0iAcEwilAxe54iPna/jYDclKLk1A0GLHac=;
        b=nK7wuIQf9bHvNRjFgEVw6cp7Eu6IZC707/LqCOFT40eH5xkgtT9lrHlP/i7Cvn91sC
         HPirItszvqaBg90FquqZh5o1rZUlB3xMvQJsY7SreYyMlezLwf/fuLqaXchAeLwoqMjF
         2p7h0Z/VoOZ45IfcWT56zUkbH2JGvTY4mk+zgcZzhThhxzk19VhFt/XJXmL29OgBzXF1
         clnGn7YvogRghhP8/B4uo4fbleKUozY5BTjfvYD147pB4U96BRzWXobG+Wu0nxB1g81+
         ZpnQwhiHXxvOwgN7Z+nsLMc1QjmtkaD0U+BWPXd80Yk3URJN0zM2HfF/fkW6kKhQ8ydf
         7kMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766617998; x=1767222798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=39eKp0lre0iAcEwilAxe54iPna/jYDclKLk1A0GLHac=;
        b=ZyDaEkYDZiI6daotNgfYGQvxSP5kd6/m5PcXEB8s9AFeaqUVPpBj5HSOF8on8yJnjo
         an8ZWX9+ekMVuGDIaeBkFUMtiCIvSutLOD03UCo1N0/wP8fJ13V7Cj8Y5gFXg/+GE6/w
         JD4bIVxkjk5uDzWx8ExZpKLXOVJuk/I+KYMgHdnVRPVqrOwOoAYMknhKx4qaz4OsyvFC
         JJavqqAx42y/mifxPfseJqcpR2ox+J46u/uSK6RuirnjGPFE39+zK1+3tRtp+VCmmMPy
         /wfR5O6wk39HXlJVy9uOVmDpbsqPtcckEPPqsRh9nZ4Yfk0YMiukvJ41uDBepsZYseV3
         j+hg==
X-Forwarded-Encrypted: i=1; AJvYcCULjC75a6mh9a9X5DZoNGkTEQLRAD86e82XEeuSWK5svDtAlmhAxIHcPB5Ru3Ml5fzd7J71KvhJGFH72li3@lists.infradead.org
X-Gm-Message-State: AOJu0YxIuVHJsUSz1j2wst1JassfesrJvRRKN5ETJ8ozrBUkxp4129D1
	pPWaXZllaO2juXAFh21YyCjCvmtqcgI+Z3F80aU8O5pKVnCA5kjbqqSTjgaeaSMEb27e8bM8mO4
	IXMrY625pDCRauR2Xr2kbhsl09RRdWWk=
X-Gm-Gg: AY/fxX78vCUy3KqBhgV+FKs32T8iCuUCbjFWlz8zbhq5K/sqXO6ZuIcYiXl000tZGF+
	aJADHjTwiu/G3uXJKp91fHQ4GZtNYE2IWY4A//wI2tAOc4Y/biJNsRSjfarjbZDGQF+uKufy8QT
	i/0NDajaeGclgp/0QNC+d4Bor1UeLTFiKgo0AwMGgB6BPKf8a39BhC6LcjvZe3B0ga5KCoAqj7V
	hd/kcaI2ZbFheYT7vQ5SJuglSuO/qMqyrbtahA6y57KcWOsqcN3khy/YISpapBhqsajLhtdxP0p
	3c2qKqlc1HyK38V1s6NvXwAl7kuW
X-Google-Smtp-Source: AGHT+IHxaT5zaSwSg9D3PpaQ1GSF383GTh4mgURyIv7jV0U9GcfwlGrz4kymRBv4+EFCWY7j+PDxnjZVzSewttnmnpM=
X-Received: by 2002:a17:902:f542:b0:2a0:c20e:e4d6 with SMTP id
 d9443c01a7336-2a2f283de1amr175122085ad.39.1766617998054; Wed, 24 Dec 2025
 15:13:18 -0800 (PST)
MIME-Version: 1.0
References: <20251223-reset-s6-s7-s7d-v2-0-958f341449f1@amlogic.com> <20251223-reset-s6-s7-s7d-v2-1-958f341449f1@amlogic.com>
In-Reply-To: <20251223-reset-s6-s7-s7d-v2-1-958f341449f1@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 25 Dec 2025 00:13:07 +0100
X-Gm-Features: AQt7F2oLSwp7qGXw0Xpn9L9LA9q7ocHmFoWAO1mWuTnDqJHxHA-5n9rc1zIgydo
Message-ID: <CAFBinCDXppQNyadCJ0dbD9JQW=pRFkcJCKt8=etN+JrNdW--Mg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: reset: Add compatible for Amlogic S6/S7/S7D
To: xianwei.zhao@amlogic.com
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_151319_798639_60A0FAA0 
X-CRM114-Status: UNSURE (   6.27  )
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
YXkKPGRldm51bGwreGlhbndlaS56aGFvLmFtbG9naWMuY29tQGtlcm5lbC5vcmc+IHdyb3RlOgo+
Cj4gRnJvbTogWGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+Cj4KPiBBZGQg
Y29tcGF0aWJsZXMgZm9yIEFtbG9naWMgUzYvUzcvUzdEIHJlc2V0IGNvbnRyb2xsZXJzLAo+IHdo
aWNoIGZhbGwgYmFjayB0byAnYW1sb2dpYyxtZXNvbi1zNC1yZXNldCcuCj4KPiBBY2tlZC1ieTog
Q29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiBTaWduZWQtb2ZmLWJ5
OiBYaWFud2VpIFpoYW8gPHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNvbT4KUmV2aWV3ZWQtYnk6IE1h
cnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxv
Z2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
