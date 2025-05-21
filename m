Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D51C2D0CD
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 May 2025 09:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4prVR6syNR5drE0kk3XntyK0++jDsSkYhhnrcP/LdAo=; b=bfwO8cJK2LkU8H
	iiFPPZ9sYNHUO9PyRWijp9EYtK9AWUnUnILzjuFcuqWrvNE2zy6HGzpAVrjshKHk5CqL97s/Xz+C7
	J3ehwXbwEQWnh1vcwQ6TyP6vs8xtaLsDHKlpU2wwohED8t2xDXh4cJB9zyyJtfUVFTrEYXqw83656
	Y06kW+DS12G5bvrqYHq8+sEWTV2kDTmSYBHUqPqZd7jew9RgplEthrRhNrdi0pDdx5WIg/7tCy3TY
	f8ttizNYXSnx7wedEM2BnNDBtq0N+8x7S+iUa+l+hUSFP2sIFLeopfSyP6OE5sU/ZGL6gwb3k1FsZ
	2qejmJsZShIQQPehKVqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfiM-0000000FJ4b-2Sq5;
	Wed, 21 May 2025 09:26:18 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHfYl-0000000FHGx-06bQ;
	Wed, 21 May 2025 09:16:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 577A1A4E7DC;
	Wed, 21 May 2025 09:16:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F6FC4CEE4;
	Wed, 21 May 2025 09:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747818982;
	bh=YdZDRVKPRJnM6bMhkKAe136v5iLTjMpExrfXyqbjbXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lDC5FeBYzkfOTxctuEWJFzsysW85GdkXbucVPeAeFcT3r86V+qIe1Ey+ddKED3/2X
	 Pnj5fU78RgQifFoSa4aR0LcB/aLF6vstearUjI3Es7B8WG40PFOD/10z5GgGpXEFVl
	 BqqJnjgYX8YKNCzkG3SG8sV6mS9Zq5p2Uq23ThRJFlu9CQPl4hLavfafa2qwzA7kvM
	 3xhhaYkAZF1rNYXgUoKmXO0yHZnQV/9nrFcg9rzO0msicWQyuOObv14/sk+64sZ5Mo
	 KM0lu6ayEy2W1AOE3hYrZKUO7TRFpXZMsYF/ZvD4DjowKHvacKXS7ftCTiE45Qvmml
	 6L+CvnDxtOL6w==
Date: Wed, 21 May 2025 11:16:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/8] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for S6
Message-ID: <20250521-foamy-strict-tuna-3ffad7@kuoka>
References: <20250521-s6-s7-pinctrl-v2-0-0ce5e3728404@amlogic.com>
 <20250521-s6-s7-pinctrl-v2-3-0ce5e3728404@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250521-s6-s7-pinctrl-v2-3-0ce5e3728404@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_021623_128868_935916E0 
X-CRM114-Status: UNSURE (   7.39  )
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

On Wed, May 21, 2025 at 11:19:57AM GMT, Xianwei Zhao wrote:
> Update dt-binding document for pinctrl of Amlogic S6 SoC.


Just squash it. Three one-liners is pretty close to a churn.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
