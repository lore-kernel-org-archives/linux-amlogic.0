Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F59CD1288
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2024 14:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Y+82+96feWO7sUhMq0dTUpdmfns2MwESQoQIY/5L4Y=; b=0djyC10y17UpfR
	LALnEiY3oPBCDYdWXsIuW81utbtDFTT0t4mSREsdj39f7JVLfrOB4o0cdKxAaWvRUvCWRGNJuojXy
	6ENmjNPZM0GPV3D+lTo0p8WxI/lGS1Nz4rxNsYhBSI45hQ9I9I+BV8+RLialfqLQ14tdCjYJ5pGLC
	zkJ+sdq5h0JSB9RCfN/vgTQLk92VQ5e+H9gY/swCXZW04UssU/SeFyxS+/kUqzQwFqCaIdcQV8764
	EfAqW1u+Zsm7PiZtSrsce9c781MknjY2Cb57m6gQG3n3XLxDfCrQycOaYd5/iusu48EdxKLAyKnL6
	DwhbMuwY3Su1YE/0XJ2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrIWn-000000082l8-0zkK;
	Mon, 01 Apr 2024 14:20:50 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrIWi-000000082fh-1NRn;
	Mon, 01 Apr 2024 14:20:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1263ECE10CE;
	Mon,  1 Apr 2024 14:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB911C433C7;
	Mon,  1 Apr 2024 14:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711981213;
	bh=fEhdWcLpquHd+lbmBESf9t4uPQfxYP1y6lxADCWgg04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FGcuh4kC3FqMSu3Uq5v5fPwJyGgS6OvrLis/rIIVu/1mjzDpwX0t1XVAN/PQmsJJ5
	 Bhe9RVKJ5TYugmplYfdT10kCa3bJ6hjWBHKQyZizuBTw5LHQtuVhpUFvuqTlvYT2wR
	 DLeUGWcWswLaBKPL4dZUh/ow7DsrVSLhDjgwLYE9igY41Vt8S3CfTKafIOazJriDtW
	 rehTntabbpsome92Qrs2Lnu1j8VFbrJMor+BrwdwzdQqAzp13MsL4EsMgDgpq3ijgS
	 kZmvJ5fkpMiwMhPFEF3wpzJFdElvwqJ55Fuz7ySHfyyQwRPC78Pyx5aUJjVBL/2Aht
	 0xae6bcv3LKmg==
Date: Mon, 1 Apr 2024 09:20:11 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com,
	mturquette@baylibre.com, sboyd@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
	martin.blumenstingl@googlemail.com, kernel@salutedevices.com,
	rockosov@gmail.com, linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 1/6] dt-bindings: clock: meson: a1: pll: introduce new
 syspll bindings
Message-ID: <20240401142011.GA537763-robh@kernel.org>
References: <20240329205904.25002-1-ddrokosov@salutedevices.com>
 <20240329205904.25002-2-ddrokosov@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240329205904.25002-2-ddrokosov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_072044_569974_3692D736 
X-CRM114-Status: GOOD (  13.18  )
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

On Fri, Mar 29, 2024 at 11:58:41PM +0300, Dmitry Rokosov wrote:
> The 'syspll' PLL is a general-purpose PLL designed specifically for the
> CPU clock. It is capable of producing output frequencies within the
> range of 768MHz to 1536MHz.
> 
> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> ---
>  .../devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml     | 7 +++++--
>  include/dt-bindings/clock/amlogic,a1-pll-clkc.h            | 2 ++
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
> index a59b188a8bf5..fbba57031278 100644
> --- a/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
> +++ b/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
> @@ -26,11 +26,13 @@ properties:
>      items:
>        - description: input fixpll_in
>        - description: input hifipll_in
> +      - description: input syspll_in
>  
>    clock-names:
>      items:
>        - const: fixpll_in
>        - const: hifipll_in
> +      - const: syspll_in

A new required entry is an ABI break. Please state why that's ok or make 
it optional (minItems: 2).

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
