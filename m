Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2393CD3430
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 May 2026 09:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KxIR/GW/D5NhlrKJETRphnQrwbWtqvvPx/aZkYWI94A=; b=zETVk0LJu0R14d
	le5l1J1zgYsrSNBnsIu9z4Fl9vfPwyPnjQV76k00CYcdmCyDJLx25SxDsTYR5IX4RBBG0alqaB1tp
	Ks/uS1yWTboIfmG+Bq41EHOqhPQzzn3do/HlfNZdWYYytjS3z2i4c8YUWEpRmfllLB2+OpuW0bHJs
	Llg1iyh+d3pyWokX7CqLfk+0uJ36BLk6+o04c5+QLF0ZEmM4GY7zraX3uYRHmLnniQoNFjj60r3u+
	XpwkaqoBOWjg2exKg/z7aDc59ZavbMiIjonEEHFZGG8B3dh3Y6i+sjX9Cmb4CNdrrh8+hV4Mu0Rim
	J4VzjxGYaXxysIh9nyiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKBy6-0000000Fdpd-0Pwh;
	Tue, 05 May 2026 09:21:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKBy4-0000000Fdoi-168w
	for linux-amlogic@lists.infradead.org;
	Tue, 05 May 2026 09:21:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6DD6744338
	for <linux-amlogic@lists.infradead.org>; Tue,  5 May 2026 09:21:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50B26C2BCFA
	for <linux-amlogic@lists.infradead.org>; Tue,  5 May 2026 09:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777972887;
	bh=fPgYO/h0P6jBglEJ/FzHxwNEaZtQJbUM8Z0qBsYUCYU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LnysTQjuZHQyFzRJFA0j8SG/R5gdS2CRSC3IY8xU6QwuPZNP5oZKQAqNMJmItNh29
	 1GJkhuXoRY/LyGyOgWwCkvnNtc/kSQ1h+PICY21XnG66/2utmiopUCNkojYZFirxBR
	 2cwOe7IL3YB1iroUlVrix/n4dXiQHT4iPhOfptAgYxa0VUuwGp7tU87NhK7C4guQ60
	 vDgMJZg0A3/OKf+7lyhGi3WBa/yLWyhR7kQM4H1Dx5D6asQnJ3skbCzdHCVGKp8+4n
	 sXUB+D6gBGIRDxvN7HLczCTh7RG5rMqM6VN0pAi51h2q/GRL7ss+uc66QXr3lKv+MJ
	 w5ef2BFtwxyXQ==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39397d63804so21787521fa.2
        for <linux-amlogic@lists.infradead.org>; Tue, 05 May 2026 02:21:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ92afBsCTtaeOxWH83giJPa1+zHtpqHwpgnLwpeUFom30r0Dh7BRMq4Nkmt8CmQrMMlHuoSDZmMudGkYp7J@lists.infradead.org
X-Gm-Message-State: AOJu0YxA1jllY2+Hvd3Lu39wyfU1V5GSRajoreAbsgCXWePNfi1BSYTO
	2ig4T2kf98zO7gNCyzQRLsObv4q53neCyH5QlOlH9za7cWte97l5MVupBOaoFDqhZGSZs9sa7xs
	3Ga0ODxmtkZjCY4mlZ+0tuVi89Tb7JO8=
X-Received: by 2002:a2e:360a:0:b0:393:903c:225c with SMTP id
 38308e7fff4ca-393903c23aamr29489301fa.9.1777972886000; Tue, 05 May 2026
 02:21:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260428-a9-pinctrl-v1-0-cd611bb5f52d@amlogic.com> <20260428-a9-pinctrl-v1-1-cd611bb5f52d@amlogic.com>
In-Reply-To: <20260428-a9-pinctrl-v1-1-cd611bb5f52d@amlogic.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 11:21:14 +0200
X-Gmail-Original-Message-ID: <CAD++jLkX27ceGQp4w9J=MDXmibo7h=Rzg4RdRJUGRvA67zj7vw@mail.gmail.com>
X-Gm-Features: AVHnY4JqgJJ_-DwBFHnVz-Fim1cfJYHsgLM7L9yfuud9N3SuTcVr04357vZ1UsE
Message-ID: <CAD++jLkX27ceGQp4w9J=MDXmibo7h=Rzg4RdRJUGRvA67zj7vw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for A9
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_022128_459111_B546F755 
X-CRM114-Status: UNSURE (   7.80  )
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

SGkgWGlhbndlaSwKCnRoYW5rcyBmb3IgeW91ciBwYXRjaCEKCk9uIFR1ZSwgQXByIDI4LCAyMDI2
IGF0IDEwOjIy4oCvQU0gWGlhbndlaSBaaGFvIHZpYSBCNCBSZWxheQo8ZGV2bnVsbCt4aWFud2Vp
LnpoYW8uYW1sb2dpYy5jb21Aa2VybmVsLm9yZz4gd3JvdGU6Cgo+IEZyb206IFhpYW53ZWkgWmhh
byA8eGlhbndlaS56aGFvQGFtbG9naWMuY29tPgo+Cj4gVXBkYXRlIGR0LWJpbmRpbmcgZG9jdW1l
bnQgZm9yIHBpbmN0cmwgb2YgQW1sb2dpYyBBOS4KPgo+IFNpZ25lZC1vZmYtYnk6IFhpYW53ZWkg
WmhhbyA8eGlhbndlaS56aGFvQGFtbG9naWMuY29tPgoKUGxlYXNlIHVwZGF0ZSB0aGUgY29tbWl0
IG1lc3NhZ2Ugd2l0aCB0aGUgaW5mb3JtYXRpb24gdGhlIERUCm1haW50YWluZXJzIG5lZWQgdG8g
ZGV0ZXJtaW5lIHRoYXQgYSBuZXcgY29tcGF0aWJsZSBpcyBuZWVkZWQsCmkuZS4gInJlZ2lzdGVy
cyBhcmUgYWxsb2NhdGVkIGRpZmZlcmVudGx5IiBvciAibmV3IGhhcmR3YXJlIHJlZ2lzdGVycwpl
eGlzdCIgZXRjLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
