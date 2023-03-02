Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB21C678D4
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Mar 2023 08:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hbi/n501M/k1WLCEyiOS6pLB4sOYRi/KObbda/RSgzg=; b=21ln2q5dQJXFcY
	HCf8rmLg9lyTpdjOLJHZ4cOLI4thwBJLwWUZIh+04q3bBAuRtLimeUVkHNK/unlGD7uU7p3hV8jfu
	J5nOXCyh1LPNEquMLRFtqdOsV8YhJfHP5OSx7f4CLTADAFJ48cjlDnDeFOfIkOEJocyb7AEAqW3CS
	UK/W2IWjvHX5Fw1Fvt4a3TUn1b+6pUUF9j2uReQMMMPkOFk+FRZmqNRUSdJzvrLpu8tRwodb/6lv3
	ULK2Lod8/ku63Zk/a55GVo4dfUhllJ4hxqQVh8UExXDsaJpzHHNRgR0oX2SwScyx6tHh6JwuRn5Dh
	UbFG2M+xhwhJUTpuDssA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXekK-001KyJ-Jj; Thu, 02 Mar 2023 08:57:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXekI-001Kxc-80
	for linux-amlogic@lists.infradead.org; Thu, 02 Mar 2023 08:57:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 903BC61540;
	Thu,  2 Mar 2023 08:57:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FDA6C433EF;
	Thu,  2 Mar 2023 08:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677747420;
	bh=pcKN3FLFDhgunSp72xFOL6crsVesd7YhlglC4BR/PPE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DoM1yUDwsaCDWoWBjXfAWsmp/hu0tXmmL1eKdEEdD/mvM8fJZsYNcgrTVzxFZvZMH
	 Hfe/4RM0wA+Eso3dNnyCb4ACQpTe3WiyhXKeYBdZMNkRRblmeWwqmLXz/hm78q7EaM
	 lYeDi9OKpuYfXAmvhz94WiCgXUeMTfBACSp+Cm+b/ePISEum+THIAoj2M8wOYgZTzL
	 4SOZ6GC78zClXKzlTcIkku/AMy+jpkFHERDe2+sf7pwtSpFtfNFO31Rqe6GsL/QuNn
	 VQmpSllaFy7yFK1fAW4inEoTI+tzBrXMcNCZzbyfza/RPiNLojqQtf7H5YP6Kgp0X2
	 P9yXMutNkSWRA==
Message-ID: <62ac6aba-76e5-a13c-1428-f14de69de6fb@kernel.org>
Date: Thu, 2 Mar 2023 09:56:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/3] arm64: dts: meson: add IR controller for Meson-S4 SoC
Content-Language: en-US
To: zelong dong <zelong.dong@amlogic.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sean Young <sean@mess.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20230302063402.42708-1-zelong.dong@amlogic.com>
 <20230302063402.42708-4-zelong.dong@amlogic.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230302063402.42708-4-zelong.dong@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_005702_373116_54987FCA 
X-CRM114-Status: GOOD (  15.00  )
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

On 02/03/2023 07:34, zelong dong wrote:
> From: Zelong Dong <zelong.dong@amlogic.com>
> 
> Add the IR controller device of Meson-S4 SoC family, and enable
> hardware IR decoder.
> 
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
> ---
>  .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts   |  6 ++++++
>  arch/arm64/boot/dts/amlogic/meson-s4.dtsi        | 16 ++++++++++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> index 8ffbcb2b1ac5..4d3a81b3b762 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
> @@ -28,3 +28,9 @@ memory@0 {
>  &uart_B {
>  	status = "okay";
>  };
> +
> +&ir {
> +	status = "disabled";
> +	pinctrl-0 = <&remote_pins>;
> +	pinctrl-names = "default";
> +};
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index ad50cba42d19..309352a83eda 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -106,6 +106,14 @@ gpio: bank@4000 {
>  					#gpio-cells = <2>;
>  					gpio-ranges = <&periphs_pinctrl 0 0 82>;
>  				};
> +
> +				remote_pins: remote_pin {

No underscores in node names,

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
