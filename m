Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121E1D68BCD
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Nov 2024 17:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x7CnS5jav4KeBHymbnZ3UGppvZdZYIo64zNIXiLGxC4=; b=uBuk3o/wzts8bx
	T2abTaV2mSID2J+yLCp9edg/UfMUfgNRvO2v85pzWrXagTya22V+rpoOL5b0VH17TGUjkGocHu32l
	jQGEXALyNxSqVDqlmG32dkf3ePkxubkCjb6U/RBa5rG7YHqqDXqwY7Cr1flN5X5zWxyTcYI8Vk/b6
	O2T1fq3IVpjuXu58uxYNkAoE0yjRZio+HJ1jdG044rjRLnMGI6hA/N/iL0VZyRVW0iOJrbWBcZ/0A
	PpTKXf8oNRNMjO9BrTUEBeBK2gstzAXQLdSl0BAlXDauCfi04PYvGMWGopX+x3qaC8IHDPOpOFYPe
	NVO2bIMg9hMgZe3EA25g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBzp2-00000003Uf7-069K;
	Fri, 15 Nov 2024 17:09:28 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBzp0-00000003Ueb-0h0H;
	Fri, 15 Nov 2024 17:09:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8C6C9A42B60;
	Fri, 15 Nov 2024 17:07:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF2DDC4CECF;
	Fri, 15 Nov 2024 17:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731690565;
	bh=Kat0vAa0R0WH/hqaed0tTlbgXevMzDUhnZLBXcBEO8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tUkFj+1V4H5JGTNQNeKE4bp0/9yLPX11JH7rDNUBd59qfbrY9qhxOwyU0GyclUsqU
	 FNzzJimsDZSn+6yn/qxKa2ddEzagWoSkSqTvnx4WaW+t0LwO3Z4AaYik8wLx2n74q+
	 NpNKkVtN8tEz3F/TZhEoJzS3hmGeIbtWCZRzOJsiNihxb6aTIaoc6/WupAaaibGRBk
	 lNCBVlvVD/KMGu/LAEsVsIetmZWL3RPltmcGJAavsXyg5o0l4MXMzILTPAfq0o9q4o
	 pRoRUNKAHH5MexxRl8sHW9L7Imb4cyyTOw8FVeKJbOreurjMpNy8usapuVmgXNCPCb
	 OiU5TZf0qidPA==
Date: Fri, 15 Nov 2024 11:09:23 -0600
From: Rob Herring <robh@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/5] dt-bindings: pinctrl: move gpio-cells and
 gpio-controller property
Message-ID: <20241115170923.GA3356657-robh@kernel.org>
References: <20241113-a4_pinctrl-v7-0-0546a20c1c22@amlogic.com>
 <20241113-a4_pinctrl-v7-1-0546a20c1c22@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241113-a4_pinctrl-v7-1-0546a20c1c22@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_090926_265561_17A8E399 
X-CRM114-Status: UNSURE (   9.10  )
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

On Wed, Nov 13, 2024 at 05:37:28PM +0800, Xianwei Zhao wrote:
> Move #gpio-cells and gpio-controller properties from common yaml file
> to lower-level yaml files.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  .../devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml        | 5 +++++
>  .../devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml    | 5 -----
>  .../bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml           | 5 +++++
>  .../bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml         | 5 +++++
>  .../devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml    | 5 +++++
>  .../devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml     | 5 +++++
>  6 files changed, 25 insertions(+), 5 deletions(-)

Please don't send new versions when the prior version comments are not 
resolved.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
