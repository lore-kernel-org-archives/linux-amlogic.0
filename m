Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF37C00140
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 Jul 2022 07:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9//sXDuKtxRNyddvZPBkrJ+vde4/1HbIC6lnoDXcTVE=; b=uuzWmbEtBqmFEy
	nQOFdUBs75pQI97dWDpIaCLehXmLL/IamgQnP7CeDYPOMzijGZpSQ25PgCeO/05iQW/+wUkFecoLh
	NkMKQexFBlG82/FBlNFd1M/bXQxCDtGO2XqTVBNMkD6MHjEyrGdCp1O+aSVFXL/02UJ+pr5rY9mC0
	RDCniEkEno4KaolHjHZACLezMRs7JBaPrPuDzkEzKHoP1GQon3qVKhlwn5bpLzRMPOgmKBl3GmP8K
	JEoQ5LglDlU8IzzjO/5EMDGYM9/kknw1dPFfMMY673IBMO64PX9oDn7jWh6Z7VBzObfGh/aunD+Ba
	Ac6xk/Ge2xEEy5bWPB4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oI3DM-009LBu-Hd; Sun, 31 Jul 2022 07:18:16 +0000
Received: from marcansoft.com ([212.63.210.85] helo=mail.marcansoft.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oI3DJ-009L8y-Na; Sun, 31 Jul 2022 07:18:15 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 6236042597;
	Sun, 31 Jul 2022 07:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1659251891; bh=kfVzooG27qyJrlBGaONv8AvOhI3FVvCdLGwZwOKwhbo=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=kUVkwqCkA7rnHeP4k1RTrP9kUKae5GjVXCA9K8P0mUZ87H1IYM+rB1KP9mTd8qfJT
	 yz7D9vVK04L/HaxYwgX6BSjpnPVipbKQIBdGa8aVBCxJjyLl1Y/B5GCuRnqFVbumT2
	 Pv+3eTWXl8tGsVW5innkrciJCh+9vZPFqhL41seTPT58y/bt18KC88yqCaQ9wKUU6q
	 QBVLLjuP9X0XzxkFDynhihM7TfWnc6qv6z9UtaYZITIw0yKx1GidfScWmgp8fqifMn
	 6YRxXl8yaDbpWSpivbfrNg3vCEMMcvmKitr7uLVzXoopnlxV1lx4si9oUENXILUCK7
	 sv2v9iv8TJ4GQ==
Message-ID: <f3941493-de9d-1a5f-af74-ced4708dd6ce@marcan.st>
Date: Sun, 31 Jul 2022 16:17:59 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/3] dt-bindings: power: drop quotes when not needed
Content-Language: es-ES
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Sebastian Reichel <sre@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 David Lechner <david@lechnology.com>,
 Iskren Chernev <iskren.chernev@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Matheus Castello <matheus@castello.eng.br>,
 Hans de Goede <hdegoede@redhat.com>,
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
 Purism Kernel Team <kernel@puri.sm>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Jianxin Pan <jianxin.pan@amlogic.com>, =?UTF-8?Q?Fern=c3=a1ndez_Rojas?=
 <noltari@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Michael Klein <michael@fossekall.de>,
 Dan Murphy <dmurphy@ti.com>, Ricardo Rivera-Matos <r-rivera-matos@ti.com>,
 =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>, "Andrew F. Davis"
 <afd@ti.com>, Tony Lindgren <tony@atomide.com>,
 Artur Rojek <contact@artur-rojek.eu>,
 Mike Looijmans <mike.looijmans@topic.nl>,
 Stephan Gerhold <stephan@gerhold.net>, David Heidelberg <david@ixit.cz>,
 Dmitry Osipenko <digetx@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20220726115748.101015-1-krzysztof.kozlowski@linaro.org>
From: Hector Martin <marcan@marcan.st>
In-Reply-To: <20220726115748.101015-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220731_001813_969228_5EE2D102 
X-CRM114-Status: UNSURE (   9.13  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 26/07/2022 20.57, Krzysztof Kozlowski wrote:
> Id and schema fields do not need quotes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/power/amlogic,meson-ee-pwrc.yaml      | 4 ++--
>  .../devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml     | 4 ++--
>  .../devicetree/bindings/power/apple,pmgr-pwrstate.yaml        | 2 +-
>  .../devicetree/bindings/power/brcm,bcm63xx-power.yaml         | 4 ++--
>  Documentation/devicetree/bindings/power/renesas,apmu.yaml     | 4 ++--
>  .../devicetree/bindings/power/renesas,rcar-sysc.yaml          | 4 ++--
>  6 files changed, 11 insertions(+), 11 deletions(-)
> 

For apple,pmgr-pwrstate:

Reviewed-by: Hector Martin <marcan@marcan.st>

- Hector

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
