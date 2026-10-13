Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FEACC6B0F
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Oct 2026 07:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=egxe+uIWexA+RFhVsWsO8tcg8529Gy4RCjSNh8iUWR0=; b=bjOOhG3HsK56+/
	wpwHJcRV8yLKpIO2eyfuJbO64qOtFjSQrjFQBu2yJW/Usga8R/vLWfspLuFrk3nGL/l4SyWEcVUjA
	EGHddzcKG2uzE2bRGmPgVvFao06mKC0WI35OfAajFl/v7fbGp53wWshfMREG8ds3mc8HnavzhWwqj
	LFnZUoWMKgcbGIYu5nY0j2PFfr6FF37g4DkAw5yTDCzTeDoA9tP/5slQFG+lpnIh/ZQqgast7xi3N
	9148Yh/2tVsYhWn1+0dVsnxF/1NK9Z9uLKyvIXgyeP0ALhAGNUtt9l3JhfC7CfdciCWmjHNyaS0Y3
	zfOgn6pukMoaFUA52Bxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGWin-0000000CCBY-0Z1E;
	Tue, 13 Oct 2026 07:14:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGWil-0000000CCAg-0h4a
	for linux-amlogic@bombadil.infradead.org;
	Tue, 13 Oct 2026 07:14:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=N/3uZKTyrNaRvsXwszDYWZ0D2uuc7O2dM/xJ/2Buikg=; b=drfQfciOiRh5fhoq7OhAlDG13i
	P35TARtpK6tMJ8ZpO1YFOyMjI4ER4ZKiyBQYbzij2wLuIB7V1b9FhLivsznBZKCYjYnwosavt1ViT
	3oqDApwYq84j3gN6iRHn06VRdM7fPnhXXLAix6sgljAynehoMLnNHgMgKH7CALoQ3IVebEDEWXOO/
	6jVDMXkbcEOMWR/1c43nNud3b7E1cvD6P557IzS3pWzedTDaN5Eyt2NfxnxiHOcSHKye3vCghtIc8
	Hq49pi8DYtDINHSRD8watL4T2ygFP4axa2JUWZ9BnuSuUW5jzH4YWpSVnoeWVu4Zvz6h8ol9b9OWE
	2tSjo8cA==;
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGWig-0000000FBts-19wM
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Oct 2026 07:14:45 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48b03f23305so2172478f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Oct 2026 00:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791875679; x=1792480479; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N/3uZKTyrNaRvsXwszDYWZ0D2uuc7O2dM/xJ/2Buikg=;
        b=laDxsnJNN4Nk1qCAFkWO+q0oHAMzGh7rsCVfmkZS4pVGrvT5xTOqgyE66Zppu/mArU
         WaTRji54ID7WpFvjp/P20MiZ8B+E/vl9ahy7fnquJUes8xVQROwafsHz8cNasEdObX+M
         wO1KNx41Dg3BYrwj2dh5EoiXe5TKFZbKpwlWJ6qwLw4XMeZvuWvgPK5F5QL0W8PFYvoB
         GP1yAQadVgPO0ugL+CCrYl0G4gPqNWaYGQrbQw657n+ELptsVKgd5FfNTVWUWC6h6Cb1
         XUA9xaZmStIONCyjj8+7PYxQDbMLDUPwlfwUb2oBwC6xd0rAgfLhDf4EpY0lWKnHm6Im
         dsDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791875679; x=1792480479;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N/3uZKTyrNaRvsXwszDYWZ0D2uuc7O2dM/xJ/2Buikg=;
        b=j8HNnDM9uoQzNbk4pAt1XfciNSGILVR4EvaY2xDAQt5iSR1kd6cn9lcTNsTWXS8Nf0
         7cAnA/J1gBLFSJz0Lk6FQkEBS3YVA5SP8CEeL8NSjzbovLT3gS/CqC31YNtB6fZ9ZIGA
         32SAxzgmiwsNpi8X4hVgvI371up0CWqYBjLQCYVOjOwhsA6M1QwEN9LqMf3ZArTgiYup
         0Rh0yXPv3J3zgTMIMK2wDo62+uiSZzAtsfPkmNUpbzvXvNyQe1Ki5RwJ0SoiXE5vWmNr
         49262aZsvzyXOrFpU5Bv/gv1WmyDhTz+/cZcu3oHY80ZdCmZW0Pe+6yaYA/fuBI7/mFb
         n+mA==
X-Forwarded-Encrypted: i=1; AKwUvByBZ0fbLP13i5pvUkthRCA+QuuQiM7AhfnVI5HvAA2du8JeVDHyjpdHijLa3db+okfvM/qUHKnE1JPKIagr@lists.infradead.org
X-Gm-Message-State: AFq9FYK3TVQOhR9ofg3W9z9OH+Ha+vyX6Au0JGlMO4G1VXpPamPVaMlb
	hDJP+gjttmw+LB37NXoPkQZYaHQptEa2uqoIFeFnn8UPv8mIQ+bgQidGHP6INg9wFtw=
X-Gm-Gg: AYBFou2wrgQWPnoaBFSPI08Tc+xUoSl6pryvKr1T/rgTbk3X5bW79klU+HSqJTiPSIz
	GnXQ9UENEyAbB+z48XTgKeEjC89iAsdjxayMju/6/UQe03UAJ631fQMZI8eHLJTfvZSCHiEKeKS
	8i7frSOeuf0ry20V8joKeswe08BJltcriM93Taa17C/f0Ia2on8JW69TCdvNJ+uK2WKK+AXefgJ
	WCXDhuMQRAWl9VYwZPH6EEuiTqUIAVEIEr7SOFJmYI+I3Ao1130zymPPy65Mo4f3/fmB8RvOV2X
	+seCWvqYn5JkKG9UnbsKQ6rKJw9YTsh+OgaD4O+ISjRU5QaEd63Leec1Mnu4DwBOcDMAYyd48uv
	gPtbIr+sgkqunHIgMdByioeum3q688uvMErZfHvKUa8uJgh4nkPJrReVGtuMpfp55fGEVVjrREP
	C7fxZwOt9Sw69JouL6O3LSDhTo/V7Vccpm5wZJ+hvtuyicacJRzYDKki02ueO1wBOrq5GUWKhEZ
	T2PI7KSL3Boi+6Q9Q==
X-Received: by 2002:a5d:5846:0:b0:48b:180:b900 with SMTP id ffacd0b85a97d-48dbaadb302mr21043691f8f.16.1791875679329;
        Tue, 13 Oct 2026 00:14:39 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab5b03sm3925157f8f.30.2026.10.13.00.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 00:14:38 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Lucas Tanure <tanure@linux.com>, xianwei.zhao@amlogic.com, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 8/8] dt-bindings: net: ethernet-controller: tabulate
 who adds the RGMII delays
In-Reply-To: <20261010105900.247342-9-tanure@linux.com>
References: <20261010105900.247342-1-tanure@linux.com>
 <20261010105900.247342-9-tanure@linux.com>
Date: Tue, 13 Oct 2026 09:14:38 +0200
Message-ID: <1jqzhu9in5.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_081442_854879_3C3E8FAE 
X-CRM114-Status: GOOD (  19.64  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On sam. 10 oct. 2026 at 11:59, Lucas Tanure <tanure@linux.com> wrote:

> The informative section explains in prose how phy-mode, the delay
> properties in the MAC node and the mode handed to the PHY fit together,
> and says itself that developers often get this wrong. A reader has to
> work through several paragraphs before answering the one question they
> usually have: for this phy-mode and these properties, which part adds
> which delay.
>
> Add a table that answers it at a glance, with one row for every
> combination the properties allow.
>
> Assisted-by: LLM
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>  .../bindings/net/ethernet-controller.yaml      | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> index 1bafd687dcb1..bba27a9feb61 100644
> --- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> +++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> @@ -339,6 +339,24 @@ additionalProperties: true
>  # has added. Failure to remove the delay will result in a
>  # non-functioning link.
>  #
> +# Put together, with the two properties in the MAC node, this is who
> +# adds each delay:
> +#
> +#   phy-mode    tx-internal-delay-ps  rx-internal-delay-ps  TX delay    RX delay
> +#   rgmii       -                     -                     PCB trace   PCB trace
> +#   rgmii-id    -                     -                     PHY         PHY
> +#   rgmii-id    present               -                     MAC         PHY
> +#   rgmii-id    -                     present               PHY         MAC
> +#   rgmii-id    present               present               MAC         MAC
> +#   rgmii-txid  -                     -                     PHY         PCB trace
> +#   rgmii-txid  present               -                     MAC         PCB trace
> +#   rgmii-rxid  -                     -                     PCB trace   PHY
> +#   rgmii-rxid  -                     present               PCB trace   MAC
> +#

That would match how the HW is working on the A733 Allwinner too but I'm
not entirely sure this is what Andrew had in mind from our previous
discussion [1]. Adding him to the thread

[1]: https://lore.kernel.org/linux-sunxi/491f043e-6dc6-4936-a490-31a3362c5b6e@lunn.ch/

> +# A property for a clock the PCB already delays is not in this table.
> +# It is either the fine tuning described next, or a mistake the MAC
> +# should report as a fatal error.
> +#
>  # Sometimes there is a need to fine tune the delays. Often the MAC or
>  # PHY can perform this fine tuning. In the MAC node, the Device Tree
>  # properties 'rx-internal-delay-ps' and 'tx-internal-delay-ps' should

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

> -- 
> 2.56.0
>

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
