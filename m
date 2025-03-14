Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE04C282EC
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Mar 2025 08:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gnQRyrYhHC6V7P/yIgcygzUhA0UwXGcDNik/qIWCB7Y=; b=tWgCKDGvOb7ZAr
	mducUX5YV2xaSwqUpnzQHRez/Ll5U1mQoETXDF8K5ILr/Rlc1kZsWXS6+bpu1yyYvaSa5FPOp087f
	rDnqkimG44bQuDYJste6CiAsvrCh/Avc7TTwPVHrA7YQGUHtxzfs2Q7lP1YjMW8iS3OSo0QnpyP3n
	iYUr3PInFbZbs2gzKQc+vk/bD2u8Kag71PGXu1wYR4PbM+5sghweV6i6H+mTOn8uKJEL8mbb1azmI
	CapE0h87e+ajrin8AFrsQnqBmxRNtgbWK1aq2qH8V4NchMMt1fVZpwTwzcK2JCWRVorqIP7TEHb0x
	jcMVRw/MjYAt3ZhfGSCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt04T-0000000DOTW-0Z6Q;
	Fri, 14 Mar 2025 08:07:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tszz6-0000000DNdQ-3WYQ;
	Fri, 14 Mar 2025 08:01:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5C76F5C5759;
	Fri, 14 Mar 2025 07:59:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF472C4CEE3;
	Fri, 14 Mar 2025 08:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741939295;
	bh=70wuHHsetHGL0OD/EkgwP5SjrI60aviLDRUiNp6RteI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GxKlMpaYsSSO8B8lDQwLdpB4UzGrdvlyZaNxFnwda2QCfDMT/4INPK/1RBo3AuILi
	 zeC5XMIn3MnQPZ9hSulmieLPcg06jW5EG8sjcLJh0j4ffqf/o9bSoTR6mYc5p4GwH9
	 PVL/8Nmnm1rThXv3QxLDu/DmTbj54dAaVkrSslfex/4P/+q3bkjDgXfte9LQQREz0Q
	 wHOsUBtRK9ibP5gIzfxDYyd3X6Q/h7cBxPBi72NEn5oQSxYEEaNo8idK6kJu3UrZKH
	 Ioxw5voPBI0qaCa3gzwq4bVcWHkHkmBCKZhx9xs1l0a2FAcuzONsQ6av0YDlzDMZ+a
	 m4L3h6YbwIZ3w==
Date: Fri, 14 Mar 2025 09:01:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kelvin Zhang <kelvin.zhang@amlogic.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Zelong Dong <zelong.dong@amlogic.com>
Subject: Re: [PATCH v4 2/3] arm64: dts: amlogic: Add A4 Reset Controller
Message-ID: <20250314-tested-husky-of-force-1ccdca@krzk-bin>
References: <20250313-a4-a5-reset-v4-0-8076f684d6cf@amlogic.com>
 <20250313-a4-a5-reset-v4-2-8076f684d6cf@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250313-a4-a5-reset-v4-2-8076f684d6cf@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_010136_932098_B05D9BD9 
X-CRM114-Status: UNSURE (   7.20  )
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

On Thu, Mar 13, 2025 at 05:05:35PM +0800, Kelvin Zhang wrote:
>  &apb {
> +	reset: reset-controller@2000 {
> +		compatible = "amlogic,a4-reset",
> +			     "amlogic,meson-s4-reset";
> +		reg = <0x0 0x2000 0x0 0x98>;
> +		#reset-cells = <1>;
> +	};
> +

Why do you have on the bus devices with bus addressing and without it?
What sort of bus is it?

>  	periphs_pinctrl: pinctrl {
>  		compatible = "amlogic,pinctrl-a4";
>  		#address-cells = <2>;

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
