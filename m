Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD48106F2F3
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2026 08:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aiEkhEvk6abx+7pe7U8HB+Er78VVIZpINu39PrqGCfs=; b=QZCjNl1bkAPwdH
	jMzFHvObRu+k4xQ5FaxU22jx7h3klE2G3gpYtmBruYdXaVETqUYfHCAzWMTfKRsijEL6ngxNQJwYT
	pJ2R+b+pOnHlY7S0HR0j1fRry5IThGMbuZP7dDHxv8ZHM/7++bNwc/agnWVccRF6eB1CNkc8bvPCE
	W4THtHgo8rRNeY2qzEEzkimCfkQOJS/+bKfAZwGg+yygL08HhoSqaFKogegTO6ULXoBmcC3s915E/
	9nkqXR9VZWaF95V/447+Xu7JBN5koXkKyL63YT2px7b0H3E6WOlAg0205FnwzfVDRt6DA8uVxIIjT
	VJ0zl2dnJ5XfIFuf3mcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5fwB-0000000518W-3oFw;
	Thu, 26 Mar 2026 08:19:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5fw9-0000000517Y-44fZ;
	Thu, 26 Mar 2026 08:19:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9C6B960121;
	Thu, 26 Mar 2026 08:19:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C37A3C116C6;
	Thu, 26 Mar 2026 08:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774513168;
	bh=j7dEXpshropQggUha1Yhid1uTd6fGFNzT/dBvVT5ZnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iWVQGp3OAxEx2usPa1FpmekCldyhV7PnB8HuiIJp20xt7ttCcihLz8Eo+seAkSeav
	 zgMWcwQoW61jIebj2W9FxY/C7Waxt7peP7iL8HrH991e3uRuLDsdbBmwRo0qxUu1fp
	 eLqimMZUaHD3OLKx3+falPd3RdsrbGHQUXbZluRIEvDbQWO0Ai7sXrThbX0r8AVou4
	 KMzqd85XQC+E0tKTkDbhPD7mLsyOlwxuZ3A71SAFB/RpUaqFu8QOc8KRFrkS/XWj4r
	 uoD28h85EqZkYP/11PJqjUyrJ2wFjwZliDGya31jSve24hcO/a6RenYbWXL2j3EgHe
	 bvVfVAreFfauA==
Date: Thu, 26 Mar 2026 09:19:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nick Xie <nick@khadas.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, 
	martin.blumenstingl@googlemail.com, jbrunet@baylibre.com, jic23@kernel.org, dlechner@baylibre.com, 
	andy@kernel.org, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: iio: adc: amlogic,meson-saradc: add
 S4 compatible
Message-ID: <20260326-secret-quartz-booby-3d3e61@quoll>
References: <20260325070618.81955-1-nick@khadas.com>
 <20260325070618.81955-2-nick@khadas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260325070618.81955-2-nick@khadas.com>
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

On Wed, Mar 25, 2026 at 03:06:15PM +0800, Nick Xie wrote:
> Add the compatible string for the SARADC (Successive Approximation
> Register ADC) IP block found in the Amlogic Meson S4 SoC.
> 
> There are no known differences between the SARADC on S4 and the one
> on G12A. Therefore, it uses "amlogic,meson-g12a-saradc" as a proper
> specific fallback.
> 
> Also add a comment indicating that "amlogic,meson-saradc" must not be
> used for new devices. It's a made up compatible string that does not
> correspond to a specific hardware generation and is not used to match
> any driver. For old devices we keep it as it's part of the ABI.
> 
> Signed-off-by: Nick Xie <nick@khadas.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
