Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4926FCD98C5
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Jun 2026 00:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hWbVRK9N0uPDS+reWOoEo89xehdAYZ85/Oiv+yjulKk=; b=1Um12Egyc1JCRR
	ghdiusaYTw7RXdqg1wGGv6+49XphEQsKf7MUU/AGlOmwd2jZ69OpQInld5+jSAHchhfRmbhvjlDSU
	U4tcNRV8JGcg50rjkFK491XB3YiOlYLFOT3HtMoR7HZDvuw6ofm00CNHWw6um5/TKJcmOP8/2Gk0h
	6GXD/HUYqxAHjWiD/bnZ6JY/xxUUcJ0fDGPvAtXGS/Hqtl0sPcRvZcGUHp8Sri36JM7/HyvVmvBXk
	BZ0B7rZsqWVrmM1942pWusn+bE+9Il7fhZen42kcCU2qqgkId6FGq9lq/0GeFmICCEjf7l9ZZGJZ6
	MIO3b/+X1RSBvBVx1DoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXTYH-00000008V8O-2Bik;
	Thu, 11 Jun 2026 00:45:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXTYG-00000008V7y-0AH9;
	Thu, 11 Jun 2026 00:45:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5BAD640ADC;
	Thu, 11 Jun 2026 00:45:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 805811F00893;
	Thu, 11 Jun 2026 00:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781138743;
	bh=9uZbnvCSonpXGXR9vVuWodMYLgOTp+M2HsRiZcKEBSQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kvnQoi7XFldjN2BdBn0zt4ODPTH0Rziyc+P/OqBnV5fubj/PIn/MW96wZ1XZ+33iq
	 UJABwOpTLlgPcAux0C319hfvOJEhVks0l+CoOxSRnfhEIIoipa8ABb7DGQ3lHDrk5X
	 52wsqSD1JeyRcRk5WRFB5HIrvYCkkd0Xk87q5ph5KCuduNCe8NwvKsRvxZQtShLl0t
	 mX8yXPS1yZhl/bCm7Q5SfpEAUY1YBBNBDKTN7gEMXQYo3tNrvult/UVwwCfNgmxPqh
	 W13hzPkgteSo2H25Q8iZ2oSmRqbdJ/1/4AyyTIkujL7MfmMoUfpO/YADyWSoySokOu
	 vCgvknRSsOrXw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sasha Levin <sashal@kernel.org>,
	Alexey Panov <apanov@astralinux.ru>,
	Mark Brown <broonie@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Dongliang Mu <mudongliangabcd@gmail.com>,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	lvc-project@linuxtesting.org,
	Felix Gu <ustc.gu@gmail.com>,
	Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 5.10] spi: meson-spicc: Fix double-put in remove path
Date: Wed, 10 Jun 2026 20:45:24 -0400
Message-ID: <20260610-stable-reply-0008@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260610161129.7612-1-apanov@astralinux.ru>
References: <20260610161129.7612-1-apanov@astralinux.ru>
MIME-Version: 1.0
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

On Tue, Jun 10, 2026 at 07:11:29PM +0300, Alexey Panov wrote:
> [PATCH 5.10] spi: meson-spicc: Fix double-put in remove path

Queued for 5.10, thanks.

--
Thanks,
Sasha

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
