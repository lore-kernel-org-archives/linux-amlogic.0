Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0140C282EC
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Mar 2025 16:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TjV+eAAZNBFBAz4yX9wY4H/16H25VkfmFs1LnvuEXrU=; b=zJQinyCijB8xqe
	LBAS0SBX/Jn4TYT3E8Et+/BQfrE8zNHryhMkg2pok9PfV+X2FJwJ/3yxKur2IIet/OfLPV15k9VQ9
	Ud+L2RzfWoiyectW6q4ZCI5DEy9t3Vq7KZ71Nkubi2KnjSTc+FgPaRlNkM6UwldB96/QjDrylibLW
	YRJjiHOUzIQeQfsPhq+8pZE2WtvlcSDrcZRyMA+lcnCUx8U2cDaG14NTYvK2TiJsoa1bhnsW7MIWX
	yWGqxzqQf/j3cqMeAbdFFSzASYDevT19j0VR4qe2NsTbt4gON46VqVJwukFGAmyaqitunQjhK0Pvj
	XLIjokDQuKEzy09oEFew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDNN-00000003L0D-39dV;
	Mon, 17 Mar 2025 16:31:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDKR-00000003Kdz-1Q5Z;
	Mon, 17 Mar 2025 16:28:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0B69DA46053;
	Mon, 17 Mar 2025 16:23:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A8A5C4CEE3;
	Mon, 17 Mar 2025 16:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742228918;
	bh=zsvLH0eJBggR1J2XUJcBl3DUBqw/nGArkQrX+Pud1z8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ouNz4fssuiTv4iAiNiC4IiiXc4eYdaM5Ds5MtbMhp2BjG3IWc6/pOP+cmzRRVKBCF
	 kIaM0bNkYXkFg9ShihT5vfCRsAMop5iMe8BE1VmzjfhM66vH9HGZNwLGqSv4zWbKbb
	 a2GBsSvUAU8q1zKFGZ6UvQMDwRcPE9eOyHQp/SWQmr7tMkUundsIrpD+6LlJWPLbXA
	 QFMsMRlUtBJtJUNFddYIaO2p8aZoCgmYorxnZrjSVYXoq5LgvbjQDehdnGbho2XJl5
	 dwFZlSgGr6+WT0TNVMFm6euKytuoR5SpbBebBruu++YcP5AFJXXUaKuYszHvEBkC6O
	 nMQU7JeBxgwXQ==
Date: Mon, 17 Mar 2025 11:28:37 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-serial@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH 3/7] dt-bindings: arm: amlogic: add S7D support
Message-ID: <174222891679.175685.18314787347681123484.robh@kernel.org>
References: <20250317-s6-s7-basic-v1-0-d653384e41f3@amlogic.com>
 <20250317-s6-s7-basic-v1-3-d653384e41f3@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250317-s6-s7-basic-v1-3-d653384e41f3@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_092839_436768_F0A67216 
X-CRM114-Status: UNSURE (   8.06  )
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


On Mon, 17 Mar 2025 15:16:54 +0800, Xianwei Zhao wrote:
> Document the new S7D SoC/board device tree bindings.
> 
> Amlogic S7D is an advanced application processor designed for
> hybrid OTT/IP Set Top Box and high-end media box applications.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
