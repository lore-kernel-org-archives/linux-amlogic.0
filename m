Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0565DCFB458
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2024 19:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YI0Bk11yvE0xScYAFEW9pftOABd753tTnk8fPr3xzP8=; b=UHlu1/DKaI7Tpg
	Kcoegunn4eR7P6c+aLkLkfClLAd4YE8Xde4jX9flF/zk6qTU1HFzXGM5I/FjdD34WAWCS+VWKjeWA
	9e9aJV+LamrvadKsZMxiM66Ox8i7XI5TeygGVexnkdhTNAUOhRSuJhc0HA3Gc2oOpVdJg4AqFlHiu
	q/RjR9C2e1ZkPEok9lNu54ytIGQJVoZdcc9vcOsYyDYl6bfqIdzYV/ZAuOQ4J8ugbrMgNfutYUr3G
	0DdcVZbHw/G8zEpY4zduHtOKaz7V3GgT5xNheHnxGgE6OcIq8sWSaAcEMyHZr9XJBetJ1CIH9IEG0
	SgZzyjEEuYJMx610TgFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxttY-00000003g9z-2FiS;
	Mon, 07 Oct 2024 19:59:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxtsi-00000003fxQ-3MUl;
	Mon, 07 Oct 2024 19:59:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 00EE35C5DB0;
	Mon,  7 Oct 2024 19:58:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF017C4CEC6;
	Mon,  7 Oct 2024 19:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728331139;
	bh=b9IArjcBH73LgeqlXwC/gNJ9v+KsPD1EO11b7+6s/FE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nzqYqRe820TLi+eUjLITpI7hydsAWt54StmQOxEzUYev5VOo4CogvBBMiyC4k0XD+
	 1Mk4B3wt7lMzB8q0ozAwwxSbfVV67UeyPWJ2qvgi7lHdgj9RS+2vWHR9HFx48MQNYB
	 JT/7VD4LYQbKVklfoOxJIr3Vj0I85tlqW1bUWoOm3F4lUBKN+Dc7o/WiYbsTG653Jn
	 89aHMhUmuD/DuAwsJS48nl1ASt2VoTa3S3422OCFOHlHCwRKkFgt+aUf2pr6lwLuw8
	 vKSEh2LK4rNirzUWg5lvjbQtpmqSh0Ha7XJaurvRVlG7zw1ZHW5zqjmHRKTkHQL74n
	 RKP1wmsTLgwUA==
Date: Mon, 7 Oct 2024 14:58:59 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-amlogic@lists.infradead.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: mmc: controller: move properties
 common with slot out to mmc-controller-common
Message-ID: <172833113823.2300723.18105672975796037901.robh@kernel.org>
References: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v3-0-ad4eb22c2a8d@linaro.org>
 <20241007-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v3-1-ad4eb22c2a8d@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v3-1-ad4eb22c2a8d@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_125900_902995_8BFA1B90 
X-CRM114-Status: UNSURE (   9.11  )
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


On Mon, 07 Oct 2024 16:03:37 +0200, Neil Armstrong wrote:
> Move the common MMC "slot" properties because they are shared by the
> single-slot or multi-slot controllers, and will help defining a simple
> mmc-slot bindings document with proper slot properties and nodename.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/mmc/mmc-controller-common.yaml        | 357 +++++++++++++++++++++
>  .../devicetree/bindings/mmc/mmc-controller.yaml    | 344 +-------------------
>  2 files changed, 360 insertions(+), 341 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
