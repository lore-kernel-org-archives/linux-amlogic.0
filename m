Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D66B9CFB45D
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2024 20:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QDRlhssthnmcSfG7JGjIWLlCGkwLHz4JCJU2VNkSLbk=; b=k6kdYqMkB4OutJ
	5epjnu7Kxwlrab7kBzzUCtS2Cz4cd+zguyDbPyK1cbfIUY65IrOim3dJC5mdwsL+aHbB65NmHyt/s
	q22A8GxTIuqTE6zt8TJ2KB87pTtOaFhmvs2dxnXkbQ2Po4aeS1cV5YWWFkkgPyJpEJIq3kPcxgFbV
	Ui3nXdEsVaCXbAA0dP3ZVjcMyQjxV6dU+yJFiTdxXdb+QiuHzTIpsFwwzRCU02gjfhUuFid8mTcfy
	kyHm445KtPG1HWtNn/00m5Y71XuIwnIplH/FgzNIjDJmLrtsodHng0i7XZdhWOQtvcEELx1+XBN2J
	Zh67Y3iaxrACah2JYf3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxtxW-00000003gn0-08A2;
	Mon, 07 Oct 2024 20:03:58 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxtx1-00000003giW-2lju;
	Mon, 07 Oct 2024 20:03:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 50929A42567;
	Mon,  7 Oct 2024 20:03:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 749E8C4CEC6;
	Mon,  7 Oct 2024 20:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728331406;
	bh=j5O+U2Wf5jb18mZI8EbjFq9ouQqcd6aUxhkEQ1mPLDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=snclByLytfWbUTtVvS7VlGB15vrmKyC+mg7Mm32cZ9vXSOHnJVdxe2a8Frq/zG5Vj
	 mVrR1Zey10eEIIIcXd5/WqxLH9QYCnzzUVriJ2pvxBOpECGNXzranBZnsGKr7e5kBD
	 pUWSTqwBgft79zEkhsMOjObRG/N58SdvEeCUkaW6AnqNXwkBq6dK1CcqjzcBhfgyBT
	 eMoWSydyHOiVQtrogPa0f1QUNVuQS8MKaigAFf/EjEEg3apjBCweUC8i+C5gz+QTtV
	 UqwGAZTSZy8L0GO73ebySTxNQ6R4/rUnTHi3lM5c7tnqhVRVpRXljEYSXRJu10y94l
	 +KowO5EZ5ceTg==
Date: Mon, 7 Oct 2024 15:03:25 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v3 3/3] dt-bindings: mmc: convert
 amlogic,meson-mx-sdio.txt to dtschema
Message-ID: <172833140518.2309838.18262028940515731701.robh@kernel.org>
References: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v3-0-ad4eb22c2a8d@linaro.org>
 <20241007-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v3-3-ad4eb22c2a8d@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v3-3-ad4eb22c2a8d@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_130327_781801_E1ABC04E 
X-CRM114-Status: UNSURE (   8.18  )
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


On Mon, 07 Oct 2024 16:03:39 +0200, Neil Armstrong wrote:
> Convert the Amlogic Meson6, Meson8 and Meson8b SDIO/MMC controller
> bindings to dt-schema.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/mmc/amlogic,meson-mx-sdio.txt         | 54 -------------
>  .../bindings/mmc/amlogic,meson-mx-sdio.yaml        | 94 ++++++++++++++++++++++
>  2 files changed, 94 insertions(+), 54 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
