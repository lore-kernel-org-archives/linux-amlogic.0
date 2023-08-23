Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 044D2EE49A0
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Aug 2023 12:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oikkD/8zr8XgPqZX8Yl0uY9oR57aq5pqEA+IL7ONLqw=; b=c0PSQOrDQqv0Yy
	lraVhw4eNxWXA36Y1UaiKM6SYLbHmbJoOl9t69KcpyvS9pJFLnRCvfWllLY387n3g83nUgfyTvnhX
	76SAOt8nyPR5Quhw9pI/NRcYa1DU9BXPFbY2W/noERvR6kxRx92O/jXG50aQFQzvQW7QJfQ825DGb
	a+NVlI1JU9DJzjkqKkxcgQyBLGNxFTAU3H2iCsMWbau2yWIwCK+VEbicK4zaQ3DP4FDemTPIiVxsx
	uu27AznmdH7l9d6elSulotN9d0lhaYlIHK13Q/wOBfyoCHbNPOoho9jbHrsC+HHesNpQuwame4w4R
	Zy9KILwzDoNIYlkFBi8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYn2c-000YGB-1M;
	Wed, 23 Aug 2023 12:32:54 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYn2Z-000YFN-1V
	for linux-amlogic@lists.infradead.org;
	Wed, 23 Aug 2023 12:32:52 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-d62bdd1a97dso5477349276.3
        for <linux-amlogic@lists.infradead.org>; Wed, 23 Aug 2023 05:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692793969; x=1693398769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zRSbIumIVyFQkg0diWCyawrsRoPJk8+z2O3TSnqCb2U=;
        b=AGWjRcQm0x3IxZMlEk6xalXzphtnCaJT0mqn23RSti/hJnT3okeDjL32zQP5e0RPTm
         56VqKbC7d5J3isYruH+IVO29+A8KGjiaJ2mcSdMzbg5YUdH/Pyy+baUY0WPv+icCP0Yn
         GDXy1kXbHui6WPhwmNXRGDESkiwxBFk5JySiqTo4BoGWoXDCsTyLNbF9PeikGpkyfAhi
         ixfNU6lnX94EuZwdNmfejVRTHVewRBOn3ktulkBkFzrLu7hD+w2xeK9f+bY4zjlYTPTk
         I3p7/Ym173bBrLRsg4Xy34nXPLHlpwWLSxW2/oDNQdxXycgspMSZtxv7FRtJTuYWYsPQ
         kBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692793969; x=1693398769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zRSbIumIVyFQkg0diWCyawrsRoPJk8+z2O3TSnqCb2U=;
        b=k55bWL6AL4sJr4xxYgU7lZSkoL0vzO2KAaf8hwzADIPv0Si8MMU43Z25Sb82Ly5vVS
         H8EwdzzaRi0sdknv9ozaVzxtQswJO26e531eByBucO1ofwJcuU850rDW8hfBl894mb8o
         Ghp109SRf1dKwT9kYepvJZiPPSVx2a1h+RIzgkCNcancmc2YO2mg5FrIsv7UsZ4yVnRm
         P8IobHYvgaMXfkCwfLqoAIa+PL5lftm6m23UVzbgHVwB0KdAW8YOq1Y7htDYVZZq0/M0
         bR6e7Z1ypd/bCc15v0wB8D/Gf3G8ZQZT09MmNFez3hRvvtNUaA3USAXSdwxL2oLLNfVb
         YUiw==
X-Gm-Message-State: AOJu0YwJWff55oBkRsk8ZUjle+fzQuKcG+CjEBhAJpVx4L2gYua3flK2
	EDpllvtMI1oTU2IU5YfrvT7HN8nPtxmfODJMmbcb0w==
X-Google-Smtp-Source: AGHT+IF0EL2CJ3/gfudLsQq6LqoM8zX8eYj3Mmo1Ay9E8vhJrJLisKFjPSYJHobDXVopQ0kW7dKtcl4/L0rgXUboI1o=
X-Received: by 2002:a25:3622:0:b0:d12:d6e4:a08b with SMTP id
 d34-20020a253622000000b00d12d6e4a08bmr12334570yba.22.1692793969166; Wed, 23
 Aug 2023 05:32:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230823085546.116494-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230823085546.116494-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Aug 2023 14:32:37 +0200
Message-ID: <CACRpkdYp4Gviev7ccUFeK-Gmx_ZYKsMrm4KxWcy5_-q+DJ-Zeg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: use capital "OR" for multiple licenses in SPDX
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_053251_531134_50B4331C 
X-CRM114-Status: UNSURE (   8.69  )
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

T24gV2VkLCBBdWcgMjMsIDIwMjMgYXQgMTA6NTXigK9BTSBLcnp5c3p0b2YgS296bG93c2tpCjxr
cnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+IHdyb3RlOgoKPiBEb2N1bWVudGF0aW9uL3By
b2Nlc3MvbGljZW5zZS1ydWxlcy5yc3QgYW5kIGNoZWNrcGF0Y2ggZXhwZWN0IHRoZSBTUERYCj4g
aWRlbnRpZmllciBzeW50YXggZm9yIG11bHRpcGxlIGxpY2Vuc2VzIHRvIHVzZSBjYXBpdGFsICJP
UiIuICBDb3JyZWN0IGl0Cj4gdG8ga2VlcCBjb25zaXN0ZW50IGZvcm1hdCBhbmQgYXZvaWQgY29w
eS1wYXN0ZSBpc3N1ZXMuCj4KPiBDb3JyZWN0IGFsc28gdGhlIHBsYWNlbWVudCBvZiBTUERYIGlk
ZW50aWZpZXIgaW4gcGluY3RybC1tZXNvbi1heGcKPiBmaWxlczoKPgo+ICAgV0FSTklORzogTWlz
cGxhY2VkIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyIHRhZyAtIHVzZSBsaW5lIDEgaW5zdGVhZAo+
Cj4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3Nr
aUBsaW5hcm8ub3JnPgoKWWVhaC4uLiB0aGV5IGFyZSBkZXNpZ25lZCB0byBiZSBtYWNoaW5lIHJl
YWRhYmxlIHNvIHBhdGNoIGFwcGxpZWQuCgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWls
aW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
