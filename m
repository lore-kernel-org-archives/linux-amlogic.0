Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B652606A32A
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Nov 2026 13:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r6kogug1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PQIS3/CY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/gJrtGXl30LAyjGXqrc0Ncgz18YdkR8L9ZU6Qvt2BoQ=; b=r6kogug1kNvIBIoBGPf1a2Gzs9
	wRtPclh1PTvC/cURgPcOLuBzmv4uDzosWckhLjbU5zJciFkwm8RsX1DoIG482I42OfqH0/H15Q2vX
	6kJzVeGNwPjYEbCgCO5dJtCLchdIPs6s7pEynIF2OXMtVkyOzwHER4WQ9HUF1QOjACPZL26Lu/fV0
	+dta5YfgIst0ukr7sKx0e8ksKCzhZLo2lZUcoIZZcaNSWtgH//w0y9YoV4Kn03rWbvG1sq8PLtVfv
	T6mmXKpAm79zSh7GQPCff4STCnxi1hSdy1K8OsISQ5up4eHmtk1tRhfcP1BrV6+oHQERS5o8POmg3
	HLJfjMow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTfkI-00000008wqr-04bz;
	Wed, 18 Nov 2026 13:30:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTfkH-00000008wqV-0vp3
	for linux-amlogic@lists.infradead.org;
	Wed, 18 Nov 2026 13:30:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B403E42B86;
	Wed, 18 Nov 2026 13:30:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65CA61F000C8;
	Wed, 18 Nov 2026 13:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795008640;
	bh=+d0zKzun5vmll+RUQTrgzKXCdhy+HftmAWgEgD0v9CY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PQIS3/CYz0t2DnMknQrfrG2/ObHT+GwAnU1xkbf2+iBRTwe+FN/Vuh559pzQJzVuV
	 dVea3hya0kzY+Y7u/p0IxBgWw2Hb1go1cFJrfvHQJpWYLJuvqiCkt+6i263Z8VIXng
	 TKI/pILEW9JwxYgxulgPgXMZYwe34+JSat7FS6cdAYvfyDLWRH7fXgfxmnVosajSli
	 FNTEoMDpVTv4KM4FqtDM7qS6HcHZpHiCCqX8+QCvCGISLbplbEm1yvmyDnUatjb9Wv
	 XmktVsjCyj5FMg+/5lgyn/jy4fZIOad4sR9XLKyxC/ZQdnd8FEygjnA4Y2wU8Ba+Cs
	 4iViOEE33js7w==
Date: Wed, 18 Nov 2026 07:30:35 -0600
From: Rob Herring <robh@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Markus Elfring <Markus.Elfring@web.de>,
	Junyi Zhao <junyi.zhao@amlogic.com>,
	linux-amlogic@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 1/2] dt-bindings: i2c: add Amlogic A9 I2C controller
Message-ID: <20261118133035.GA546269-robh@kernel.org>
References: <20261117-a9-i2c-v9-0-7b303c894fea@amlogic.com>
 <20261117-a9-i2c-v9-1-7b303c894fea@amlogic.com>
 <78d4a042-d9e0-4b88-8788-30310462dbdb@web.de>
 <0f0f687a-83d0-4af9-b146-3d737ccac809@amlogic.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0f0f687a-83d0-4af9-b146-3d737ccac809@amlogic.com>
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 05:32:07PM +0800, Xianwei Zhao wrote:
> 
> 
> On 2026/11/17 17:05, Markus Elfring wrote:
> > > Add a Device Tree binding for the I2C controller found on the
> >          device tree?
> > 
> Will do s/Device Tree/device tree.

Devicetree actually. But feel free to ignore Markus and all of this.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
