Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66232C64EC4
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Mar 2023 11:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fpdSeJ1arTI3/nHz/gOfv4VjwemWx7dyX+pCYZFQcTI=; b=UZAjNsnGfNgenR
	0gSZ36+iQdouUzRbzvkiPVz+uMyY7Sfk76zi+HYaUn/t5h/InAYG8DGKBm4fG+GOWtObVmXfrCWil
	8cEBWCT/sjvWQjfKN+Dr0my8JAp7lKYX0UjxszrZ/uhrRijkQ+nwxyR1hYZAFCH+cpaGmhq4HkzLk
	w4Bfl7sRmUtKyt/nPR9Pkpqa2uSErBdWciduRXmSmOLkfn7vBsHIKfKXtaDVjcWHCRmrmim8qDNCo
	RScZveOLuw9BAQ62R9bbCgwUb1Ijql4FRFBlCyLuJ0sCJXR/kgF8JrMN6oGtsBHf50Yo2OACJoP4Y
	d7vimyMt3avE1CyoC0SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paaTi-00EHC5-1U; Fri, 10 Mar 2023 11:00:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paaTe-00EHAw-Dj; Fri, 10 Mar 2023 10:59:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6465E61384;
	Fri, 10 Mar 2023 10:59:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8BA6C433D2;
	Fri, 10 Mar 2023 10:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678445996;
	bh=6HNYmPSJ53e5recOteBLDrR//Q6H9ztqrpDz+ZdxIZs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TY2mrrC7snf0967lhtOTrr7oHSkmUs/i2L8OHTR4PL1rwC8tGZwq+dYYUy1IDCt/V
	 OHbDHluEC8J/Dc9AZvJw4tlAslf4BgA/xSxj6CFTxBx7cVeq9FQNTcDvruU5YHsqKe
	 sshXjlE85gxIBTi67mtZxDlZ8B78w8ubqR2WzVVxoh0/Et/cSvNA59yPEpraHRK3YE
	 +mEitmB3TWdU/+OvcuJu7tRXqNGpDe6x1nqGcOV9TY4PhBHEIOeVTkHpP0s4D6Nt3Q
	 MNrMSyrfGKYy2RyL33Pb84ya8EJ8HSM4oFGpEN8eEmJ4cNMnrLrxO4dN/DZO0inXhS
	 SmeqWBLn1yfPw==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v4 0/5] dt-bindings: first batch of dt-schema conversions for Amlogic Meson bindings
Date: Fri, 10 Mar 2023 11:59:47 +0100
Message-Id: <167844597212.1217818.3420848199619883504.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20221117-b4-amlogic-bindings-convert-v4-0-34e623dbf789@linaro.org>
References: <20221117-b4-amlogic-bindings-convert-v4-0-34e623dbf789@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_025958_534415_58BC208E 
X-CRM114-Status: UNSURE (   8.49  )
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

On Wed, 08 Mar 2023 14:27:28 +0100, Neil Armstrong wrote:
> Batch conversion of the following bindings:
> - amlogic-efuse.txt
> - amlogic-meson-mx-efuse.txt
> - meson-wdt.txt
> - meson-ir.txt
> - rtc-meson.txt
> - amlogic,meson6-timer.txt
> - amlogic,meson-pcie.txt
> 
> [...]

Applied to controller/dt, thanks!

[5/5] dt-bindings: PCI: convert amlogic,meson-pcie.txt to dt-schema
      https://git.kernel.org/pci/pci/c/b80b848bdf56

Thanks,
Lorenzo

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
