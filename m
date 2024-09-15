Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E58C1C3ABA0
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Sep 2024 19:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dr/6Vi+dB1ULN5KsOU2FKpckqL952DdPoWJZ3zzVpgM=; b=o6eu+8y6lb0UiN
	FL0Qor/vx4T+69Yw2z2kW+yaCaJRgEQY0V9MahdMwJ/f112rlhkyBN8wD+Poru14VYD+DEMaGJxx1
	xmY0ZzBFN+SP7v4lJnGMhCNXXNOjJUQa/ejwVLCQZsillIvkt3C6/NtJ2R99cULyS/R6qnxYrhXON
	3zcPIe+4qyiGximkevBp7fqx+VsD2C+XnG0vHncoJcm4jUanbAUkr2p2qRcuQ4cYsBd705K1ljwqM
	XRLozQudqOxuMM4EGRBoMioUf33MtAKKFbI7WGRABIUsYH1oy7lD2SKmkN9ngNYh9USvh75yj6oJE
	ILfCKscJ7nHk1t19UD7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spuXw-00000002X93-3uca;
	Sun, 15 Sep 2024 19:04:32 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spuW3-00000002WpB-1wNy;
	Sun, 15 Sep 2024 19:02:37 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2053616fa36so44648955ad.0;
        Sun, 15 Sep 2024 12:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1726426954; x=1727031754; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rl3JgxfsDEcMv93irGGWEQMK2kPdpMNmmbqbOCPjeeE=;
        b=YIRU9yXVHO5+2IaQ8RIhGRgz8vLk3GWR7UOgn8Ztv9k67JXU/Q9ua0SsUB0PwlY8er
         /gjJsETqYxD7D3ROZCXThAJXJgMhH+SK/WBkR9DKXeT+Ms5zLnukXwL0NqkYakZvkc3w
         4/sOZk3vDOrrTxHFl7BcoXjd66I9TLb7l7ld0JnAEu2942e3ruYkaCfZuKoBrKi0jH2h
         Nu3MSY7dXAXREbJq+MCKrPIQM9eHDmq26TJhit1pwl1jwIcyg1QN2UZf7FWNPIUiWLak
         GCLItvyGTAiSsUbtkXDl8emE5vg1KDtSGVuiPPOxFM9dirXFwt2RwN0nW//HjZ941RB3
         OAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726426954; x=1727031754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rl3JgxfsDEcMv93irGGWEQMK2kPdpMNmmbqbOCPjeeE=;
        b=ls82zGxFZL+kvySE7PUARvmjj+MU/h2Mp2nkgg34bpINuVGBAm8JJEnXO+5PO/N5uz
         1ZNThVclGKa+by9h8YmXEWlRFZ0oXoxUVByPnqHtn6ip3h2sv3ckyejCq4As1JMHzUio
         hvWpNbvjPsbEoX5mkMUfqySiBKXzXWkcUH7H/FseAP/1GR6e3OUkLU7qJDXYUDnLnJRg
         VeDSQjQ9Uzszram2VRgsI4X0c2ftCsSXiEtt36eRGQgv3riW/9fbe6sbqnFJCsfIiRbD
         D+rZIkiYQqEkO3IlFk4pc5L981a0VvyCahmKLz9QkCQmPqpfCmowpfuitstOeSWfrJKO
         pIzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUy7+NnMCNeeoAOPZNxByWuhj2uazoaV+N5futhgROO3vjI/Te+r9XlfUunPN/tRHn4aml1gZ4cc7A+aiHZx8kE/Q==@lists.infradead.org, AJvYcCWxeDnsS9KUCA0Mq+kQW/AOsbmnA1IUQn7kg16gkywnMTN9jEjR+j1Z9iEfSY1+d91j+gxaFE1gIBgRB8UK@lists.infradead.org
X-Gm-Message-State: AOJu0YwzORtgMvKfaqvFVdmSsHCjSJj41kaWT0X57XXABWIQjHfmZ52O
	BKsaeynWv3n0e6FAvyORlXcB+zrZ3PWeejz0kHcHfNKm/yQuMbpAlwfzUT9iSAmhENXxyxcqUUW
	xDdL8v5JiYhcpmyWvixBNUy/fp9g=
X-Google-Smtp-Source: AGHT+IHUhNgb5CY73OVQ923HMu5EESIjBPBxS3vs2jfupJZ1tMBLM2XnsxoP/DNupYRnYP+/+zH2b2BjxO/nsut89FE=
X-Received: by 2002:a17:902:e5c3:b0:205:709e:1949 with SMTP id
 d9443c01a7336-2076e421fd0mr213345945ad.57.1726426954359; Sun, 15 Sep 2024
 12:02:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-0-feaabb45916b@linaro.org>
 <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-3-feaabb45916b@linaro.org>
In-Reply-To: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-3-feaabb45916b@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Sep 2024 21:02:23 +0200
Message-ID: <CAFBinCBj5OoJ7DqwhfV0RGZjW681U3ELqm=LX13XY3RAO3S19Q@mail.gmail.com>
Subject: Re: [PATCH 3/7] ARM: dts: amlogic: meson8: fix ao_arc_sram node name
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240915_120235_519152_D9FE038E 
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

T24gV2VkLCBTZXAgMTEsIDIwMjQgYXQgMTI6MTnigK9QTSBOZWlsIEFybXN0cm9uZwo8bmVpbC5h
cm1zdHJvbmdAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBVc2UgdGhlIHByb3BlciBub2RlIG5hbWUg
Zm9yIHRoZSBzcmFtLCBmaXhpbmc6Cj4gc3JhbUBkOTAwMDAwMDogJ2FvLWFyYy1zcmFtQDAnIGRv
ZXMgbm90IG1hdGNoIGFueSBvZiB0aGUgcmVnZXhlczogJ14oW2EtejAtOV0qLSk/c3JhbSgtc2Vj
dGlvbik/QFthLWYwLTldKyQnLCAncGluY3RybC1bMC05XSsnCj4gICAgICAgICBmcm9tIHNjaGVt
YSAkaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3NyYW0vc3JhbS55YW1sIwo+Cj4g
U2lnbmVkLW9mZi1ieTogTmVpbCBBcm1zdHJvbmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+
ClJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdv
b2dsZW1haWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=
