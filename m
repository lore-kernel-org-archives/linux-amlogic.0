Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F83C54EBE
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Jan 2023 07:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EBozHD3AdUoUt4kLghHlvPtYk6fZtAp6ocCSV4YgHOY=; b=e9lujvpOE2OepT
	vi1t93ZRRZAmW/dewnpMgqoq3OWtkuNmm8DfsuQ2xghfC9ejLLhMk2sxJQ7nezma9Ufa9aaCmPYth
	QhYMqxit+EqCAFYfNc1FFGgOqhD/j29ICxkfy7M8GwOgSKiZkKf3fnd82d64ocji28ehyaWx6RrUo
	Ugc/HbMQOxz4xOTWsKpCk4PeGgJ0E6IYg+DQtB1oEOYfO5UL5SP87LdKCuwEbtBgmTIiK/P4H8IGI
	19sZFzc7u5IPeIiDpGeV2LP+27Abs7wyzHM4L5jxHZhipVEJrSWr3XIUa1blfj2FS3991X6OIxejI
	j0hHebIRHWqCmZEGx2pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFVNE-00A19I-Py; Wed, 11 Jan 2023 07:18:12 +0000
Received: from mx.msync.work ([185.250.0.168])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFVNA-00A15k-IB; Wed, 11 Jan 2023 07:18:10 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9654D31D6E;
	Wed, 11 Jan 2023 07:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
	t=1673421480; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ScS9I1WkTHrH68wa+bjFz7/gI6rsGdF7W9IQ42fA5kU=;
	b=T/COVboRlNrM8ORuqTLZsuNs7D1v04epZKPZeQV6Ap73BtxIZbarNhuMRDGudMO72U/EdV
	+UH+UonqRxtrj3oq1DJGG9U3/EzIELITMOwuPmJJhEJ2xKquluMLmgRHfvEO630mdiC25J
	7mGjGUBBBUdJfKnZVa7+ls6dzJpdo1RJarDgeXnBSxoYXTndKJ5kiRe+9Rkjy3I+NwxSFm
	dxy1U+AhNCfNXQTHwc4W5K0krXo+aZxUS7oho19m3uOIiX2ayKNXbjneKni8UIGe/giGjP
	IDOkVEyryxl0bIlYL6FL0vrgPjQ6ZlD0i9uHpdIcCv8NJGsYrC43wj3cPkN0Ng==
Message-ID: <e1213533-a0d7-5af5-b655-c30509a00f04@lexina.in>
Date: Wed, 11 Jan 2023 10:17:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] arm64: dts: meson-gxl: jethub-j80: Fix WiFi MAC unit
 address
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com, neil.armstrong@linaro.org, jbrunet@baylibre.com,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
References: <20230110215926.1296650-1-martin.blumenstingl@googlemail.com>
Content-Language: en-US, ru, ru-RU
From: Vyacheslav <adeep@lexina.in>
In-Reply-To: <20230110215926.1296650-1-martin.blumenstingl@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_231809_185566_40436DF9 
X-CRM114-Status: GOOD (  14.34  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On 11/01/2023 00.59, Martin Blumenstingl wrote:
> Unit addresses should be written using lower-case hex characters. Use
> wifi_mac@c to fix a yaml schema validation error once the eFuse
> dt-bindings have been converted to a yaml schema:
>    efuse: Unevaluated properties are not allowed ('wifi_mac@C' was
>    unexpected)
>
> Fixes: abfaae24ecf3 ("arm64: dts: meson-gxl: add support for JetHub H1")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>   .../boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts     | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
> index 6831137c5c10..4f742e1b9301 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
> @@ -90,7 +90,7 @@ bt_mac: bt_mac@6 {
>   		reg = <0x6 0x6>;
>   	};
>   
> -	wifi_mac: wifi_mac@C {
> +	wifi_mac: wifi_mac@c {
>   		reg = <0xc 0x6>;
>   	};
>   };


Acked-by: Vyachesav Bocharov <adeep@lexina.in>




_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
