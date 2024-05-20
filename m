Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6970C25B77
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2024 19:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZKGLuWCWRdqX4tYK8yqmcOkiSCbX3/lP+aHsj3YWWQk=; b=vaewDfWA4afVSA
	ssqcJVK1wf4TGHhRpMMXVU6VId2kpl+TMgAg8FPEiOs14T7BrjwQIBBpluuA4ynsoDsanjmTCpKld
	I3lPd+h0yFXu4BWvrQKzJEAzLi6EQRqqi82+/HU7MzAfx6jITdUr7/nKz6Ob0bw8Zt6OAtXeYXZ5w
	aX9BrBaCJRi5OFhBy2V+/ajILseTroBx/w9VmewvTiFGNG+cD2Zo6HGrEETNlIGRH0oXXaK6nMwYe
	9Qr5ttQxK+JjRsdi8rdGP492Uz+Yaurh3okpV0wLlnUaJclnbKVX3r1G1Dp/ZF9vfOJQq8P0QjJeI
	KH9Ha/XxrggBi/OOWyyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s98We-0000000FLpO-0C0B;
	Mon, 20 May 2024 19:18:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s98Wb-0000000FLoV-1hNl;
	Mon, 20 May 2024 19:18:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4F45D61E97;
	Mon, 20 May 2024 19:18:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA0ACC2BD10;
	Mon, 20 May 2024 19:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716232700;
	bh=NsdyDPhe9XNdTyGY6aXb+OutlJY67HHrwCd3VMvCSek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XHXdF8FMdVp7iBwZ9pPPBsDFyWzuWCSmStBF1zA2hnOFX16Qz1BLebp8ffvNRgpYv
	 CWvl0izIHD6g3m7biIYQ9L3mUKcnWT9I6Du0rFCL207sOjdaO3NRUMKenZkQvlHHA2
	 EpeV1duBfapg3dN0zNNDuKmAV0ZMvhjcG+bcPQJQ6iufIuZWdLfW5wKuWU9vvEkhpG
	 aRJkUu9wZRsIgEPKP9UMBNysC7md7qCTFsymg+MPZ2jsAz5d4DwwImWNxZ/2SpWBKU
	 1PbXJdu0/y9HGbsHc3ehjyoG85oY8wc2yLaE2PLTuwZvgzF4pZocg0OYwgkCSRuLka
	 lXj522wiktF9w==
Date: Mon, 20 May 2024 14:18:18 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: linux-arm-kernel@lists.infradead.org,
	martin.blumenstingl@googlemail.com, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
	jian.hu@amlogic.com, rockosov@gmail.com, devicetree@vger.kernel.org,
	linux-amlogic@lists.infradead.org, sboyd@kernel.org,
	robh+dt@kernel.org, neil.armstrong@linaro.org, jbrunet@baylibre.com,
	khilman@baylibre.com, kernel@sberdevices.ru,
	mturquette@baylibre.com
Subject: Re: [PATCH v3 4/7] dt-bindings: clock: meson: a1: peripherals:
 support sys_pll input
Message-ID: <171623269646.1341930.17315530317168492239.robh@kernel.org>
References: <20240515185103.20256-1-ddrokosov@salutedevices.com>
 <20240515185103.20256-5-ddrokosov@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240515185103.20256-5-ddrokosov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_121821_526348_071B125C 
X-CRM114-Status: UNSURE (   9.76  )
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


On Wed, 15 May 2024 21:47:27 +0300, Dmitry Rokosov wrote:
> The 'sys_pll' input is an optional clock that can be used to generate
> 'sys_pll_div16', which serves as one of the sources for the GEN clock.
> 
> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> ---
>  .../bindings/clock/amlogic,a1-peripherals-clkc.yaml      | 9 +++++++--
>  include/dt-bindings/clock/amlogic,a1-peripherals-clkc.h  | 1 +
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
